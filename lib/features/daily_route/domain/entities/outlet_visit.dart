import 'package:freezed_annotation/freezed_annotation.dart';

import 'daily_route.dart';

part 'outlet_visit.freezed.dart';
part 'outlet_visit.g.dart';

/// Outlet visit entity representing a single visit within a daily route.
///
/// This is the LOCAL mirror of the backend `outlet_visits` table.
/// Each visit tracks clock-in/out, geofence validation, and completion status.
///
/// **Lifecycle:**
/// ```
/// pending → in_progress → completed
///    ↓
/// skipped (with reason)
/// ```
///
/// **Backend Alignment:**
/// - Clock-in: `POST /api/v1/visits/{visit_id}/clock-in`
/// - Clock-out: `POST /api/v1/visits/{visit_id}/clock-out`
/// - Skip: `POST /api/v1/visits/{visit_id}/skip`
/// - Geofence validation: 50m for clock-in, 100m for clock-out
@freezed
class OutletVisit with _$OutletVisit {
  const factory OutletVisit({
    /// Local UUID for offline-first operations
    required String localId,

    /// Backend visit ID (null until synced)
    String? serverId,

    // === Route Linkage ===

    /// Local ID of the parent daily route
    required String dailyRouteLocalId,

    /// Server ID of the parent daily route (null until route synced)
    String? dailyRouteServerId,

    // === Outlet Information ===

    /// Customer/Outlet ID from backend
    required String outletId,

    /// Outlet code (e.g., "CL000001")
    required String outletCode,

    /// Outlet display name
    required String outletName,

    /// Outlet GPS latitude
    required double outletLatitude,

    /// Outlet GPS longitude
    required double outletLongitude,

    /// Geofence radius for this outlet (meters)
    @Default(200.0) double geofenceRadiusMeters,

    // === Schedule Information ===

    /// Server ID of the schedule this visit was generated from
    String? scheduleServerId,

    /// Order in the route (1, 2, 3, ...)
    required int visitOrder,

    /// Scheduled clock-in time (time of day)
    String? scheduledClockIn,

    /// Scheduled clock-out time (time of day)
    String? scheduledClockOut,

    /// Allocated time for this visit (minutes)
    required int allocatedMinutes,

    /// Visit priority (1=must visit, 2=important, 3=flexible)
    @Default(2) int visitPriority,

    // === Visit Type ===

    /// Whether this is a scheduled or ad-hoc visit
    required VisitType visitType,

    // === Status & Timing ===

    /// Current status of the visit
    required VisitStatus status,

    /// Actual clock-in timestamp
    DateTime? actualClockIn,

    /// Actual clock-out timestamp
    DateTime? actualClockOut,

    /// Calculated visit duration (minutes)
    int? visitDurationMins,

    // === Location Data ===

    /// GPS latitude at clock-in
    double? clockInLatitude,

    /// GPS longitude at clock-in
    double? clockInLongitude,

    /// GPS accuracy at clock-in (meters)
    double? clockInAccuracyMeters,

    /// Distance from outlet at clock-in (meters)
    double? clockInDistanceMeters,

    /// GPS latitude at clock-out
    double? clockOutLatitude,

    /// GPS longitude at clock-out
    double? clockOutLongitude,

    /// GPS accuracy at clock-out (meters)
    double? clockOutAccuracyMeters,

    /// Distance from outlet at clock-out (meters)
    double? clockOutDistanceMeters,

    // === Geofence Override ===

    /// Whether geofence was overridden for this visit
    @Default(false) bool geofenceOverride,

    /// ID of the approved override request (if any)
    String? overrideRequestId,

    // === Skip Information ===

    /// ID of the skip reason (from SkipReasonCache)
    int? skipReasonId,

    /// Skip reason code (e.g., "CLOSED", "OUT_OF_STOCK")
    String? skipReasonCode,

    /// Additional notes for skip
    String? skipNotes,

    // === Notes ===

    /// Notes entered at clock-in
    String? clockInNotes,

    /// Notes entered at clock-out
    String? clockOutNotes,

    /// General visit notes
    String? visitNotes,

    // === Sync State ===

    /// Current sync state with backend
    @Default(SyncState.localOnly) SyncState syncState,

    /// Last sync error message (if any)
    String? syncError,

    /// Timestamp of last successful sync
    DateTime? lastSyncedAt,
  }) = _OutletVisit;

  factory OutletVisit.fromJson(Map<String, dynamic> json) =>
      _$OutletVisitFromJson(json);
}

/// Status of an outlet visit
enum VisitStatus {
  /// Visit not yet started
  pending,

  /// Agent currently at outlet (clocked in)
  inProgress,

  /// Visit completed successfully
  completed,

  /// Visit skipped with reason
  skipped,
}

/// Type of visit
enum VisitType {
  /// Created from weekly schedule
  scheduled,

  /// Added manually during route
  adHoc,
}

/// Extension methods for OutletVisit
extension OutletVisitX on OutletVisit {
  /// Whether the visit can be clocked into. Skipped visits stay eligible —
  /// an agent who skips an outlet earlier in the day (e.g. it looked
  /// closed) can still clock in later if they end up actually visiting.
  bool get canClockIn =>
      status == VisitStatus.pending || status == VisitStatus.skipped;

  /// Whether the visit can be clocked out of
  bool get canClockOut => status == VisitStatus.inProgress;

  /// Whether the visit can be skipped
  bool get canSkip => status == VisitStatus.pending;

  /// Whether the visit is in a terminal state
  bool get isTerminal =>
      status == VisitStatus.completed || status == VisitStatus.skipped;

  /// Whether the visit is currently active (agent at outlet)
  bool get isActive => status == VisitStatus.inProgress;

  /// Human-readable status text
  String get statusText {
    switch (status) {
      case VisitStatus.pending:
        return 'Pending';
      case VisitStatus.inProgress:
        return 'In Progress';
      case VisitStatus.completed:
        return 'Completed';
      case VisitStatus.skipped:
        return 'Skipped';
    }
  }

  /// Priority display text
  String get priorityText {
    switch (visitPriority) {
      case 1:
        return 'Must Visit';
      case 2:
        return 'Important';
      case 3:
        return 'Flexible';
      default:
        return 'Normal';
    }
  }

  /// Whether this is a high priority visit
  bool get isHighPriority => visitPriority == 1;

  /// Formatted scheduled time range
  String? get scheduledTimeRange {
    if (scheduledClockIn == null || scheduledClockOut == null) return null;
    return '$scheduledClockIn - $scheduledClockOut';
  }

  /// Calculate if visit is overdue (past scheduled time and not started)
  bool isOverdue(DateTime now) {
    if (status != VisitStatus.pending) return false;
    if (scheduledClockOut == null) return false;

    // Parse scheduled time and compare with current time
    // This is a simplified check - in production, parse the time properly
    return false; // TODO: Implement proper time comparison
  }

  /// Time spent at outlet (if clocked out)
  Duration? get timeSpent {
    if (actualClockIn == null || actualClockOut == null) return null;
    return actualClockOut!.difference(actualClockIn!);
  }

  /// Whether the visit exceeded allocated time
  bool get exceededAllocatedTime {
    if (visitDurationMins == null) return false;
    return visitDurationMins! > allocatedMinutes;
  }
}
