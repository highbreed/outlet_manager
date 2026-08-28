import 'package:isar_community/isar.dart';

part 'geofence_override_model.g.dart';

/// Isar collection for geofence override requests.
///
/// When an agent is outside the geofence but needs to clock in,
/// they can request an override from their supervisor.
@collection
class GeofenceOverrideModel {
  Id? id;

  /// Local UUID for offline-first operations
  @Index(unique: true)
  late String localId;

  /// Backend override request ID (null until synced)
  @Index()
  String? serverId;

  // === Visit Reference ===

  /// Local ID of the visit this override is for
  @Index()
  late String outletVisitLocalId;

  /// Server ID of the visit (null until visit synced)
  String? outletVisitServerId;

  // === Request Details ===

  /// User who requested the override (agent)
  late String requestedByUserId;

  /// Agent's name (for display in supervisor UI)
  String? requestedByName;

  /// When the override was requested
  late DateTime requestedAt;

  /// Agent's reason for the request
  late String reason;

  // === Location at Request Time ===

  late double requestLatitude;
  late double requestLongitude;
  late double requestAccuracyMeters;
  late double distanceFromOutlet;

  // === Outlet Info (for supervisor display) ===

  String? outletName;
  String? outletCode;

  // === Status ===

  @Enumerated(EnumType.name)
  @Index()
  late GeofenceOverrideStatusModel status;

  /// When the request expires (default 15 min from request)
  late DateTime expiresAt;

  // === Decision Details ===

  String? decidedByUserId;
  String? decidedByName;
  DateTime? decidedAt;
  String? decisionNotes;

  // === Sync State ===

  @Enumerated(EnumType.name)
  late SyncStateModel syncState;

  String? syncError;

  // === Timestamps ===
  late DateTime createdAt;
  late DateTime updatedAt;
}

/// Status of a geofence override request (Isar enum)
enum GeofenceOverrideStatusModel { pending, approved, rejected, expired }

/// Sync state (reused)
enum SyncStateModel { localOnly, syncing, synced, syncFailed, needsAttention }
