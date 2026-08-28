import 'package:isar_community/isar.dart';

part 'outlet_visit_model.g.dart';

/// Isar collection for outlet visits.
///
/// Local mirror of backend `outlet_visits` table.
/// Each visit tracks clock-in/out, geofence validation, and completion status.
@collection
class OutletVisitModel {
  Id? id;

  /// Local UUID for offline-first operations
  @Index(unique: true)
  late String localId;

  /// Backend visit ID (null until synced)
  @Index()
  String? serverId;

  // === Route Linkage ===

  /// Local ID of the parent daily route
  @Index()
  late String dailyRouteLocalId;

  /// Server ID of the parent daily route (null until route synced)
  String? dailyRouteServerId;

  // === Outlet Information ===

  /// Customer/Outlet ID from backend
  @Index()
  late String outletId;

  /// Outlet code (e.g., "CL000001")
  late String outletCode;

  /// Outlet display name
  late String outletName;

  /// Outlet GPS latitude
  late double outletLatitude;

  /// Outlet GPS longitude
  late double outletLongitude;

  /// Geofence radius for this outlet (meters)
  late double geofenceRadiusMeters;

  // === Schedule Information ===

  /// Server ID of the schedule this visit was generated from
  String? scheduleServerId;

  /// Order in the route (1, 2, 3, ...)
  late int visitOrder;

  /// Scheduled clock-in time (time of day as string "HH:mm:ss")
  String? scheduledClockIn;

  /// Scheduled clock-out time (time of day as string "HH:mm:ss")
  String? scheduledClockOut;

  /// Allocated time for this visit (minutes)
  late int allocatedMinutes;

  /// Visit priority (1=must visit, 2=important, 3=flexible)
  late int visitPriority;

  // === Visit Type ===

  @Enumerated(EnumType.name)
  late VisitTypeModel visitType;

  // === Status & Timing ===

  @Enumerated(EnumType.name)
  @Index()
  late VisitStatusModel status;

  DateTime? actualClockIn;
  DateTime? actualClockOut;
  int? visitDurationMins;

  // === Location Data ===

  double? clockInLatitude;
  double? clockInLongitude;
  double? clockInAccuracyMeters;
  double? clockInDistanceMeters;

  double? clockOutLatitude;
  double? clockOutLongitude;
  double? clockOutAccuracyMeters;
  double? clockOutDistanceMeters;

  // === Geofence Override ===

  late bool geofenceOverride;
  String? overrideRequestId;

  // === Skip Information ===

  int? skipReasonId;
  String? skipReasonCode;
  String? skipNotes;

  // === Notes ===

  String? clockInNotes;
  String? clockOutNotes;
  String? visitNotes;

  // === Sync State ===

  @Enumerated(EnumType.name)
  late SyncStateModel syncState;

  String? syncError;
  DateTime? lastSyncedAt;

  // === Timestamps ===
  late DateTime createdAt;
  late DateTime updatedAt;
}

/// Status of an outlet visit (Isar enum)
enum VisitStatusModel { pending, inProgress, completed, skipped }

/// Type of visit (Isar enum)
enum VisitTypeModel { scheduled, adHoc }

/// Sync state (reused from daily_route_model)
enum SyncStateModel { localOnly, syncing, synced, syncFailed, needsAttention }
