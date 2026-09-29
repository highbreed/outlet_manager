import 'package:isar_community/isar.dart';

import '../../../../core/database/isar_database.dart';
import '../../domain/entities/mapping_enums.dart';
import '../../domain/entities/mapping_sample.dart';
import '../models/mapping_sample_model.dart';

/// Local persistence for individual mapping samples (spec §22). Mirrors
/// `LocationPingLocalDataSource`'s shape exactly — see that class's doc
/// comments for the pending/syncing/synced(/failed) convention this
/// follows.
class MappingSampleLocalDataSource {
  Future<Isar> get _isar => IsarDatabase.getInstance();

  /// Persist-before-network (spec §10/§67) — the only way a sample enters
  /// this table.
  Future<void> save(MappingSample sample) async {
    final isar = await _isar;
    await isar.writeTxn(() => isar.mappingSampleModels.put(_toModel(sample)));
  }

  /// The source of truth for sequence recovery (spec §9/§24, Option B):
  /// the highest persisted sequence for this footprint, or -1 if none
  /// exist yet — callers add 1. Always re-derived on session
  /// recovery/resume, never trusted from a separately-persisted counter
  /// alone (see `MappingSession.nextSequence`'s doc comment).
  Future<int> getHighestSequence(int footprintId) async {
    final isar = await _isar;
    final model = await isar.mappingSampleModels
        .where()
        .footprintIdEqualTo(footprintId)
        .sortBySequenceDesc()
        .findFirst();
    return model?.sequence ?? -1;
  }

  /// Oldest-first drain query (spec §28/§O), scoped to one footprint so a
  /// concurrently-active second session (shouldn't exist per §33, but
  /// defensive) never has its rows mixed into another's batch.
  Future<List<MappingSample>> getPendingForFootprint(
    int footprintId, {
    required int limit,
  }) async {
    final isar = await _isar;
    final models = await isar.mappingSampleModels
        .where()
        .footprintIdEqualTo(footprintId)
        .filter()
        .syncStateEqualTo(MappingSampleSyncStateModel.pending)
        .or()
        .syncStateEqualTo(MappingSampleSyncStateModel.failed)
        .sortByRecordedAt()
        .limit(limit)
        .findAll();
    return models.map(_toEntity).toList();
  }

  /// Oldest-first, every sync state — used only by the capture screen's
  /// live trail visualization (spec §26/§78's "reasonable enhancement").
  /// Never used for upload/finish/retry logic — those all go through
  /// [getPendingForFootprint] instead.
  Future<List<MappingSample>> getAllForFootprint(int footprintId) async {
    final isar = await _isar;
    final models = await isar.mappingSampleModels
        .where()
        .footprintIdEqualTo(footprintId)
        .sortBySequence()
        .findAll();
    return models.map(_toEntity).toList();
  }

  Future<int> countPendingForFootprint(int footprintId) async {
    final isar = await _isar;
    return isar.mappingSampleModels
        .where()
        .footprintIdEqualTo(footprintId)
        .filter()
        .syncStateEqualTo(MappingSampleSyncStateModel.pending)
        .or()
        .syncStateEqualTo(MappingSampleSyncStateModel.failed)
        .count();
  }

  /// Server-synced + still-local count for a footprint — used to enforce
  /// `max_samples` client-side without waiting for a 413 (spec §28/§77).
  /// `syncedServerTotal` is the backend's own `total_samples`
  /// (`accepted_new` accumulated), passed in by the caller after the last
  /// successful upload rather than re-derived here.
  Future<int> countAllForFootprint(int footprintId) async {
    final isar = await _isar;
    return isar.mappingSampleModels.where().footprintIdEqualTo(footprintId).count();
  }

  Future<void> markBatchSyncing(List<String> localIds) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      for (final localId in localIds) {
        final model =
            await isar.mappingSampleModels.where().localIdEqualTo(localId).findFirst();
        if (model == null) continue;
        model.syncState = MappingSampleSyncStateModel.syncing;
        model.attemptCount += 1;
        model.lastAttemptAt = DateTime.now();
        await isar.mappingSampleModels.put(model);
      }
    });
  }

  Future<void> markBatchSynced(List<String> localIds) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      for (final localId in localIds) {
        final model =
            await isar.mappingSampleModels.where().localIdEqualTo(localId).findFirst();
        if (model == null) continue;
        model.syncState = MappingSampleSyncStateModel.synced;
        await isar.mappingSampleModels.put(model);
      }
    });
  }

  Future<void> markBatchFailed(List<String> localIds, String error) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      for (final localId in localIds) {
        final model =
            await isar.mappingSampleModels.where().localIdEqualTo(localId).findFirst();
        if (model == null) continue;
        model.syncState = MappingSampleSyncStateModel.failed;
        model.lastError = error;
        await isar.mappingSampleModels.put(model);
      }
    });
  }

  /// Data-retention cleanup (spec §40/§68) — only ever called once a
  /// session's backend state is terminal.
  Future<void> deleteAllForFootprint(int footprintId) async {
    final isar = await _isar;
    await isar.writeTxn(
      () => isar.mappingSampleModels.filter().footprintIdEqualTo(footprintId).deleteAll(),
    );
  }

  /// Discards unsent rows for a footprint being abandoned (spec §58) —
  /// synced rows stay as server-side audit evidence, only local
  /// not-yet-uploaded rows are removed.
  Future<void> deleteUnsentForFootprint(int footprintId) async {
    final isar = await _isar;
    await isar.writeTxn(
      () => isar.mappingSampleModels
          .filter()
          .footprintIdEqualTo(footprintId)
          .not()
          .syncStateEqualTo(MappingSampleSyncStateModel.synced)
          .deleteAll(),
    );
  }

  MappingSampleModel _toModel(MappingSample s) {
    return MappingSampleModel()
      ..localId = s.localId
      ..footprintId = s.footprintId
      ..clientSampleId = s.clientSampleId
      ..sequence = s.sequence
      ..latitude = s.latitude
      ..longitude = s.longitude
      ..accuracyM = s.accuracyM
      ..recordedAt = s.recordedAt
      ..altitudeM = s.altitudeM
      ..verticalAccuracyM = s.verticalAccuracyM
      ..floorLabel = s.floorLabel
      ..speedMps = s.speedMps
      ..headingDeg = s.headingDeg
      ..provider = s.provider
      ..isMock = s.isMock
      ..syncState = MappingSampleSyncStateModel.values.byName(s.syncState.name)
      ..attemptCount = s.attemptCount
      ..lastAttemptAt = s.lastAttemptAt
      ..lastError = s.lastError
      ..createdAt = s.createdAt;
  }

  MappingSample _toEntity(MappingSampleModel m) {
    return MappingSample(
      localId: m.localId,
      footprintId: m.footprintId,
      clientSampleId: m.clientSampleId,
      sequence: m.sequence,
      latitude: m.latitude,
      longitude: m.longitude,
      accuracyM: m.accuracyM,
      recordedAt: m.recordedAt,
      altitudeM: m.altitudeM,
      verticalAccuracyM: m.verticalAccuracyM,
      floorLabel: m.floorLabel,
      speedMps: m.speedMps,
      headingDeg: m.headingDeg,
      provider: m.provider,
      isMock: m.isMock,
      syncState: MappingSampleSyncState.values.byName(m.syncState.name),
      attemptCount: m.attemptCount,
      lastAttemptAt: m.lastAttemptAt,
      lastError: m.lastError,
      createdAt: m.createdAt,
    );
  }
}
