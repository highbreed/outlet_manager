import '../../domain/entities/location_ping.dart';
import 'location_ping_model.dart';

/// Extension to convert LocationPingModel to domain entity.
extension LocationPingModelMapper on LocationPingModel {
  /// Converts Isar model to domain entity.
  LocationPing toEntity() {
    return LocationPing(
      localId: localId,
      serverId: serverId,
      latitude: latitude,
      longitude: longitude,
      accuracyMeters: accuracyMeters,
      altitudeMeters: altitudeMeters,
      speedMps: speedMps,
      headingDegrees: headingDegrees,
      batteryLevel: batteryLevel,
      isCharging: isCharging,
      networkType: networkType,
      pingSource: pingSource.toEntity(),
      recordedAt: recordedAt,
      syncedAt: syncedAt,
      nextPingSeconds: nextPingSeconds,
      syncState: syncState.toEntity(),
    );
  }
}

/// Extension to convert domain entity to Isar model.
extension LocationPingEntityMapper on LocationPing {
  /// Converts domain entity to Isar model.
  LocationPingModel toModel() {
    return LocationPingModel()
      ..localId = localId
      ..serverId = serverId
      ..latitude = latitude
      ..longitude = longitude
      ..accuracyMeters = accuracyMeters
      ..altitudeMeters = altitudeMeters
      ..speedMps = speedMps
      ..headingDegrees = headingDegrees
      ..batteryLevel = batteryLevel
      ..isCharging = isCharging
      ..networkType = networkType
      ..pingSource = pingSource.toModel()
      ..recordedAt = recordedAt
      ..syncedAt = syncedAt
      ..nextPingSeconds = nextPingSeconds
      ..syncState = syncState.toModel();
  }
}

extension PingSourceModelMapper on PingSourceModel {
  PingSource toEntity() {
    switch (this) {
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
}

extension PingSourceEntityMapper on PingSource {
  PingSourceModel toModel() {
    switch (this) {
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
}

extension LocationPingSyncStateModelMapper on LocationPingSyncStateModel {
  LocationPingSyncState toEntity() {
    switch (this) {
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

extension LocationPingSyncStateEntityMapper on LocationPingSyncState {
  LocationPingSyncStateModel toModel() {
    switch (this) {
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
}
