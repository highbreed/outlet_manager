import 'package:isar_community/isar.dart';

part 'location_ping_model.g.dart';

/// Isar model for storing location pings locally.
///
/// Pings are stored when offline and synced when connectivity is restored.
/// Old synced pings are cleaned up periodically to save storage.
@collection
class LocationPingModel {
  Id? id;

  /// Local UUID for deduplication
  @Index(unique: true)
  late String localId;

  /// Backend ping_id after sync (null until synced)
  int? serverId;

  // === Location Data ===
  late double latitude;
  late double longitude;
  late double accuracyMeters;
  double? altitudeMeters;
  double? speedMps;
  double? headingDegrees;

  // === Device Context ===
  /// Battery level 0-100
  int? batteryLevel;
  bool? isCharging;

  /// Network type: wifi, cellular, none
  String? networkType;

  // === Tracking Metadata ===
  @enumerated
  late PingSourceModel pingSource;

  /// Device time when captured
  @Index()
  late DateTime recordedAt;

  /// When successfully sent to server
  DateTime? syncedAt;

  // === Server Response ===
  /// Server-suggested interval for next ping
  int? nextPingSeconds;

  @Index()
  @enumerated
  late LocationPingSyncStateModel syncState;
}

/// Source of the location ping (Isar enum)
enum PingSourceModel { foreground, background, geofenceEvent, manual }

/// Sync state for location pings (Isar enum)
enum LocationPingSyncStateModel { pending, syncing, synced, failed }
