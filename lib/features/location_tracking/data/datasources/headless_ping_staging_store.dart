import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/entities/location_ping.dart';
import '../models/location_ping_mapper.dart';
import '../models/location_ping_model.dart';

/// A second, independently-opened Isar instance — same on-disk directory as
/// `IsarDatabase` (`lib/core/database/isar_database.dart`), different
/// `name:`, therefore a physically separate `<name>.isar`/`<name>.isar-lck`
/// file pair. Contains ONLY [LocationPingModelSchema] — reused as-is, no
/// new `@collection` class.
///
/// Exists so [backgroundGeolocationHeadlessTask]'s isolate never has to
/// open the SAME file the foreground app's `IsarDatabase` opens at startup.
/// Two isolates independently opening one mdbx-backed file can make the
/// loser block until the winner closes — confirmed root cause of a field-
/// reported "TimeoutException ... database" app-init failure (the
/// foreground app's own `Isar.open()` blocking past
/// `AppInitializationService`'s 45s database-phase budget on a heartbeat's
/// held lock). With two separate files, there's nothing left to contend
/// over on the one the user is actually waiting on at app startup.
///
/// **Ownership rule**: the headless engine must never open the main
/// `outlet_manager.isar` file. The main engine may open this staging file,
/// but only ever to drain it (see [drainInto]).
///
/// Deliberately NOT built on `IsarDatabase` and does not share its retry
/// logic — that class's 4-attempt backoff + stale-lock-file deletion is
/// hard-won, already battle-tested, and sized for a continuously-open,
/// heavily-contended database. This store is opened fleetingly (one small
/// write per heartbeat, or one short drain pass on resume/connectivity-
/// restore/cold-start), so a much shorter retry is enough; losing one
/// staged ping after that is an acceptable, already-precedented failure
/// mode (every `_handleLocation` call in `background_geolocation_service.dart`
/// is already best-effort/log-and-continue).
class HeadlessPingStagingStore {
  static Isar? _instance;
  static Future<Isar>? _openingFuture;
  static Future<void>? _drainingFuture;

  static const _dbName = 'outlet_manager_headless_staging';
  static const _lockRetryAttempts = 3;
  static const _lockRetryBaseDelay = Duration(milliseconds: 200);

  /// Hard cap on staged rows — an uninstalled/never-reopened app would
  /// otherwise accumulate one row every heartbeat (5 min) indefinitely.
  /// Enforced in [stage]: oldest rows beyond this count are dropped.
  /// Overridable only so tests can exercise the cap without staging 2000+
  /// rows; production code must never touch this.
  @visibleForTesting
  static int maxStagedRows = 2000;

  /// A staged row older than this that's still failing to drain is
  /// dropped rather than retried forever — a deliberate "lose very old
  /// location history rather than let this file grow forever" trade-off,
  /// consistent with the rest of this pipeline already treating location
  /// pings as best-effort.
  static const _maxStagedAge = Duration(days: 14);

  static bool _isTransientLockError(Object e) =>
      e.toString().contains('Cannot open Environment') ||
      e.toString().contains('MdbxError');

  static Future<Isar> _open() {
    if (_instance != null) return Future.value(_instance!);
    return _openingFuture ??= _doOpen();
  }

  static Future<Isar> _doOpen() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      Isar isar;
      var attempt = 0;
      while (true) {
        try {
          isar = await Isar.open(
            [LocationPingModelSchema],
            directory: dir.path,
            name: _dbName,
          );
          break;
        } catch (e) {
          attempt++;
          if (!_isTransientLockError(e) || attempt >= _lockRetryAttempts) {
            rethrow;
          }
          await Future.delayed(_lockRetryBaseDelay * attempt);
        }
      }
      _instance = isar;
      return isar;
    } finally {
      _openingFuture = null;
    }
  }

  /// Stages one heartbeat ping. Called from the headless isolate only.
  static Future<void> stage(LocationPing ping) async {
    try {
      final isar = await _open();
      final model = ping.toModel();
      await isar.writeTxn(() => isar.locationPingModels.putByLocalId(model));
      await _enforceRowCap(isar);
      developer.log(
        'headless_stage_success localId=${ping.localId}',
        name: 'HeadlessPingStagingStore',
      );
    } catch (e, st) {
      developer.log(
        'headless_stage_failure: $e',
        name: 'HeadlessPingStagingStore',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  static Future<void> _enforceRowCap(Isar isar) async {
    final count = await isar.locationPingModels.count();
    if (count <= maxStagedRows) return;

    final overflow = count - maxStagedRows;
    final oldest = await isar.locationPingModels
        .where()
        .sortByRecordedAt()
        .limit(overflow)
        .findAll();
    if (oldest.isEmpty) return;

    await isar.writeTxn(
      () => isar.locationPingModels.deleteAllByLocalId(
        oldest.map((m) => m.localId).toList(),
      ),
    );
  }

  /// Drains every staged row, oldest-captured-first, into [consume] —
  /// expected to upsert it into the main pending-ping pool via
  /// `LocationPingLocalDataSource.savePing` (a true upsert on `localId`,
  /// see that method's doc comment). A row is deleted from staging ONLY
  /// after its own [consume] call completes without throwing — never the
  /// reverse, and the delete is its own short transaction, never held
  /// open across the `await consume(...)` call (which writes to a
  /// DIFFERENT Isar instance and may do other async work). This ordering
  /// is what makes an interrupted drain safe to just re-run: a row
  /// [consume] hasn't reached yet stays staged and is retried next time; a
  /// row whose main-db write already landed just gets harmlessly
  /// re-upserted if [consume] is called on it again.
  ///
  /// Concurrent calls share one in-flight drain, so two overlapping
  /// `syncPendingPings()` triggers (e.g. cold-start and connectivity-
  /// restored firing close together) can't both read the same staged rows
  /// before either deletes them.
  static Future<void> drainInto(
    Future<void> Function(LocationPing ping) consume,
  ) {
    return _drainingFuture ??= _doDrain(
      consume,
    ).whenComplete(() => _drainingFuture = null);
  }

  static Future<void> _doDrain(
    Future<void> Function(LocationPing ping) consume,
  ) async {
    final isar = await _open();
    final models = await isar.locationPingModels
        .where()
        .sortByRecordedAt()
        .findAll();
    if (models.isEmpty) return;

    final cutoff = DateTime.now().subtract(_maxStagedAge);
    var drained = 0;
    for (final model in models) {
      if (model.recordedAt.isBefore(cutoff)) {
        developer.log(
          'headless_drain_dropped_stale localId=${model.localId} '
          'recordedAt=${model.recordedAt}',
          name: 'HeadlessPingStagingStore',
        );
        await isar.writeTxn(
          () => isar.locationPingModels.deleteByLocalId(model.localId),
        );
        continue;
      }

      try {
        await consume(model.toEntity());
      } catch (e, st) {
        developer.log(
          'headless_drain_failure localId=${model.localId}: $e',
          name: 'HeadlessPingStagingStore',
          error: e,
          stackTrace: st,
        );
        continue;
      }
      await isar.writeTxn(
        () => isar.locationPingModels.deleteByLocalId(model.localId),
      );
      drained++;
    }
    developer.log(
      'headless_staged_count drained=$drained ofTotal=${models.length}',
      name: 'HeadlessPingStagingStore',
    );
  }

  static Future<void> close() async {
    await _instance?.close();
    _instance = null;
    _openingFuture = null;
  }
}
