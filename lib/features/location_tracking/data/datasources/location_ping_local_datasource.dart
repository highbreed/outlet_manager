import 'package:isar_community/isar.dart';

import '../../../../core/database/isar_database.dart';
import '../../domain/entities/location_ping.dart';
import '../models/location_ping_model.dart';

/// Local data source for storing location pings using Isar.
class LocationPingLocalDataSource {
  Future<Isar> get _isar => IsarDatabase.getInstance();

  /// Save a ping locally.
  Future<int> savePing(LocationPing ping) async {
    final isar = await _isar;
    final model = _toModel(ping);

    return isar.writeTxn(() => isar.locationPingModels.put(model));
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

    return models.map(_toEntity).toList();
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

    return model != null ? _toEntity(model) : null;
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

    return model != null ? _toEntity(model) : null;
  }

  // === Mappers ===

  LocationPingModel _toModel(LocationPing ping) {
    return LocationPingModel()
      ..localId = ping.localId
      ..serverId = ping.serverId
      ..latitude = ping.latitude
      ..longitude = ping.longitude
      ..accuracyMeters = ping.accuracyMeters
      ..altitudeMeters = ping.altitudeMeters
      ..speedMps = ping.speedMps
      ..headingDegrees = ping.headingDegrees
      ..batteryLevel = ping.batteryLevel
      ..isCharging = ping.isCharging
      ..networkType = ping.networkType
      ..pingSource = _toModelPingSource(ping.pingSource)
      ..recordedAt = ping.recordedAt
      ..syncedAt = ping.syncedAt
      ..nextPingSeconds = ping.nextPingSeconds
      ..syncState = _toModelSyncState(ping.syncState);
  }

  LocationPing _toEntity(LocationPingModel model) {
    return LocationPing(
      localId: model.localId,
      serverId: model.serverId,
      latitude: model.latitude,
      longitude: model.longitude,
      accuracyMeters: model.accuracyMeters,
      altitudeMeters: model.altitudeMeters,
      speedMps: model.speedMps,
      headingDegrees: model.headingDegrees,
      batteryLevel: model.batteryLevel,
      isCharging: model.isCharging,
      networkType: model.networkType,
      pingSource: _toEntityPingSource(model.pingSource),
      recordedAt: model.recordedAt,
      syncedAt: model.syncedAt,
      nextPingSeconds: model.nextPingSeconds,
      syncState: _toEntitySyncState(model.syncState),
    );
  }

  PingSourceModel _toModelPingSource(PingSource source) {
    switch (source) {
      case PingSource.foreground:
        return PingSourceModel.foreground;
      case PingSource.background:
        return PingSourceModel.background;
      case PingSource.geofenceEvent:
        return PingSourceModel.geofenceEvent;
      case PingSource.manual:
        return PingSourceModel.manual;
    }
  }

  PingSource _toEntityPingSource(PingSourceModel source) {
    switch (source) {
      case PingSourceModel.foreground:
        return PingSource.foreground;
      case PingSourceModel.background:
        return PingSource.background;
      case PingSourceModel.geofenceEvent:
        return PingSource.geofenceEvent;
      case PingSourceModel.manual:
        return PingSource.manual;
    }
  }

  LocationPingSyncStateModel _toModelSyncState(LocationPingSyncState state) {
    switch (state) {
      case LocationPingSyncState.pending:
        return LocationPingSyncStateModel.pending;
      case LocationPingSyncState.syncing:
        return LocationPingSyncStateModel.syncing;
      case LocationPingSyncState.synced:
        return LocationPingSyncStateModel.synced;
      case LocationPingSyncState.failed:
        return LocationPingSyncStateModel.failed;
    }
  }

  LocationPingSyncState _toEntitySyncState(LocationPingSyncStateModel state) {
    switch (state) {
      case LocationPingSyncStateModel.pending:
        return LocationPingSyncState.pending;
      case LocationPingSyncStateModel.syncing:
        return LocationPingSyncState.syncing;
      case LocationPingSyncStateModel.synced:
        return LocationPingSyncState.synced;
      case LocationPingSyncStateModel.failed:
        return LocationPingSyncState.failed;
    }
  }
}
