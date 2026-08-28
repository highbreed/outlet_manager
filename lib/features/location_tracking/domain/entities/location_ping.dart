import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_ping.freezed.dart';
part 'location_ping.g.dart';

/// Represents a location ping sent to the server for agent tracking.
///
/// Pings are sent continuously whether the agent is clocked in or not,
/// providing fleet visibility, route optimization data, and safety tracking.
@freezed
class LocationPing with _$LocationPing {
  const factory LocationPing({
    /// Local UUID for deduplication
    required String localId,

    /// Backend ping_id after sync (null until synced)
    int? serverId,

    // === Location Data ===
    required double latitude,
    required double longitude,
    required double accuracyMeters,
    double? altitudeMeters,
    double? speedMps,
    double? headingDegrees,

    // === Device Context ===
    /// Battery level 0-100
    int? batteryLevel,
    bool? isCharging,

    /// Network type: wifi, cellular, none
    String? networkType,

    // === Tracking Metadata ===
    required PingSource pingSource,

    /// Device time when captured
    required DateTime recordedAt,

    /// When successfully sent to server
    DateTime? syncedAt,

    // === Server Response ===
    /// Server-suggested interval for next ping
    int? nextPingSeconds,

    @Default(LocationPingSyncState.pending) LocationPingSyncState syncState,
  }) = _LocationPing;

  factory LocationPing.fromJson(Map<String, dynamic> json) =>
      _$LocationPingFromJson(json);
}

/// Source of the location ping
enum PingSource {
  /// App is active and in foreground
  @JsonValue('foreground')
  foreground,

  /// WorkManager/background task
  @JsonValue('background')
  background,

  /// Triggered by geofence entry/exit
  @JsonValue('geofence_event')
  geofenceEvent,

  /// User-initiated manual ping
  @JsonValue('manual')
  manual,
}

/// Sync state for location pings
enum LocationPingSyncState {
  /// Not yet synced to server
  pending,

  /// Currently being synced
  syncing,

  /// Successfully synced
  synced,

  /// Sync failed
  failed,
}

/// Response from location ping API
@freezed
class LocationPingResponse with _$LocationPingResponse {
  const factory LocationPingResponse({
    required bool success,
    required int pingId,
    int? nextPingSeconds,
    required DateTime serverTime,
    required bool isDuplicate,
  }) = _LocationPingResponse;

  factory LocationPingResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationPingResponseFromJson(json);
}
