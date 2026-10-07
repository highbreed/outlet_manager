import 'package:isar_community/isar.dart';

import '../../../../core/database/isar_database.dart';
import '../../domain/entities/location_ping.dart';
import '../models/location_ping_mapper.dart';
import '../models/location_ping_model.dart';

/// Local data source for storing location pings using Isar.
class LocationPingLocalDataSource {
  Future<Isar> get _isar => IsarDatabase.getInstance();

  /// Save a ping locally. Upserts by [LocationPing.localId] — plain `put()`
  /// on a model with `id: null` would throw on a `localId` collision
  /// instead of replacing (the generated `localId` index is `unique: true,
  /// replace: false`). This matters once [HeadlessPingStagingStore] starts
  /// replaying drained pings through this method: a redundant re-drain
  /// (e.g. a crash between "wrote here" and "deleted from staging") must
  /// be a harmless no-op, not a thrown error.
  Future<int> savePing(LocationPing ping) async {
    final isar = await _isar;
    final model = ping.toModel();

    return isar.writeTxn(() => isar.locationPingModels.putByLocalId(model));
  }

  /// Get all pending pings that need to be synced.
  Future<List<LocationPing>> getPendingPings() async {
    final isar = await _isar;
    final models = await isar.locationPingModels
        .where()
        .syncStateEqualTo(LocationPingSyncStateModel.pending)
        .or()
        .syncStateEqualTo(LocationPingSyncStateModel.failed)
        .sortByRecordedAt()
        .findAll();

    return models.map((m) => m.toEntity()).toList();
  }

  /// Mark ping as synced with server ID.
  Future<void> markPingSynced(String localId, int serverId) async {
    final isar = await _isar;
    final model = await isar.locationPingModels
        .where()
        .localIdEqualTo(localId)
        .findFirst();

    if (model != null) {
      model.serverId = serverId;
      model.syncedAt = DateTime.now();
      model.syncState = LocationPingSyncStateModel.synced;

      await isar.writeTxn(() => isar.locationPingModels.put(model));
    }
  }

  /// Mark ping as failed.
  Future<void> markPingFailed(String localId) async {
    final isar = await _isar;
    final model = await isar.locationPingModels
        .where()
        .localIdEqualTo(localId)
        .findFirst();

    if (model != null) {
      model.syncState = LocationPingSyncStateModel.failed;

      await isar.writeTxn(() => isar.locationPingModels.put(model));
    }
  }

  /// Mark ping as syncing.
  Future<void> markPingSyncing(String localId) async {
    final isar = await _isar;
    final model = await isar.locationPingModels
        .where()
        .localIdEqualTo(localId)
        .findFirst();

    if (model != null) {
      model.syncState = LocationPingSyncStateModel.syncing;

      await isar.writeTxn(() => isar.locationPingModels.put(model));
    }
  }

  /// Clean up old synced pings to save storage.
  Future<int> cleanupOldPings(Duration retention) async {
    final isar = await _isar;
    final cutoff = DateTime.now().subtract(retention);

    return isar.writeTxn(() async {
      return isar.locationPingModels
          .where()
          .syncStateEqualTo(LocationPingSyncStateModel.synced)
          .filter()
          .syncedAtLessThan(cutoff)
          .deleteAll();
    });
  }

  /// Get the most recent ping.
  Future<LocationPing?> getLastPing() async {
    final isar = await _isar;
    final model = await isar.locationPingModels
        .where()
        .sortByRecordedAtDesc()
        .findFirst();

    return model?.toEntity();
  }

  /// Get ping count by sync state.
  Future<Map<LocationPingSyncState, int>> getPingStats() async {
    final isar = await _isar;

    final pending = await isar.locationPingModels
        .where()
        .syncStateEqualTo(LocationPingSyncStateModel.pending)
        .count();

    final syncing = await isar.locationPingModels
        .where()
        .syncStateEqualTo(LocationPingSyncStateModel.syncing)
        .count();

    final synced = await isar.locationPingModels
        .where()
        .syncStateEqualTo(LocationPingSyncStateModel.synced)
        .count();

    final failed = await isar.locationPingModels
        .where()
        .syncStateEqualTo(LocationPingSyncStateModel.failed)
        .count();

    return {
      LocationPingSyncState.pending: pending,
      LocationPingSyncState.syncing: syncing,
      LocationPingSyncState.synced: synced,
      LocationPingSyncState.failed: failed,
    };
  }

  /// Get a specific ping by localId.
  Future<LocationPing?> getPingByLocalId(String localId) async {
    final isar = await _isar;
    final model = await isar.locationPingModels
        .where()
        .localIdEqualTo(localId)
        .findFirst();

    return model?.toEntity();
  }
}
