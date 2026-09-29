import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_route.freezed.dart';
part 'daily_route.g.dart';

/// Daily route entity representing an agent's route for a specific date.
///
/// This is the LOCAL mirror of the backend `daily_routes` table.
/// One route per agent per date. Contains a list of visits to complete.
///
/// **Lifecycle:**
/// ```
/// pending → activated → in_progress → closed/force_closed
/// ```
///
/// **Backend Alignment:**
/// - Activating a route calls `POST /api/v1/visits/routes/activate`
/// - Backend generates visits from the agent's weekly schedule
/// - Route MUST be activated before any clock-in operations
/// - Previous unclosed route BLOCKS activation (ROUTE_BLOCKED error)
@freezed
abstract class DailyRoute with _$DailyRoute {
  const factory DailyRoute({
    /// Local UUID for offline-first operations
    required String localId,

    /// Backend route ID (null until synced)
    String? serverId,

    /// Agent this route belongs to
    required String salesAgentId,

    /// Date of the route (YYYY-MM-DD, no time component)
    required DateTime routeDate,

    /// Day of week (0=Monday, 6=Sunday)
    required int dayOfWeek,

    /// Current status of the route
    required DailyRouteStatus status,

    // === Timestamps ===

    /// When the route was activated by the agent
    DateTime? activatedAt,

    /// First clock-in time of the day
    DateTime? firstClockInAt,

    /// Last clock-out time of the day
    DateTime? lastClockOutAt,

    /// When the route was closed
    DateTime? closedAt,

    // === Progress Tracking ===

    /// Total number of scheduled visits
    @Default(0) int totalScheduled,

    /// Number of completed visits
    @Default(0) int completedCount,

    /// Number of skipped visits
    @Default(0) int skippedCount,

    /// Number of visits currently in progress (should be 0 or 1)
    @Default(0) int inProgressCount,

    /// Total time spent on visits (minutes)
    @Default(0) int totalVisitTimeMins,

    // === Closing Details ===

    /// Notes provided when closing the route
    String? closingNotes,

    /// User who closed the route (usually the agent)
    String? closedByUserId,

    // === Force Close (Supervisor/Manager action) ===

    /// Whether route was force-closed by supervisor/manager
    @Default(false) bool forceClosed,

    /// User who force-closed the route
    String? forceClosedByUserId,

    /// When the route was force-closed
    DateTime? forceClosedAt,

    /// Reason for force-closing
    String? forceCloseReason,

    // === Sync State ===

    /// Current sync state with backend
    @Default(SyncState.localOnly) SyncState syncState,

    /// Last sync error message (if any)
    String? syncError,

    /// Timestamp of last successful sync
    DateTime? lastSyncedAt,
  }) = _DailyRoute;

  factory DailyRoute.fromJson(Map<String, dynamic> json) =>
      _$DailyRouteFromJson(json);
}

/// Status of a daily route
enum DailyRouteStatus {
  /// Route created but not yet activated by agent
  pending,

  /// Route activated, agent ready to start visits
  activated,

  /// At least one visit is in progress
  inProgress,

  /// Route properly closed by agent (all visits have outcomes)
  closed,

  /// Route force-closed by supervisor/manager/system
  forceClosed,
}

/// Sync state for offline-first operations
enum SyncState {
  /// Created locally, not yet sent to server
  localOnly,

  /// Currently being synced to server
  syncing,

  /// Successfully synced with server
  synced,

  /// Sync failed, will retry automatically
  syncFailed,

  /// Sync failed repeatedly, needs manual attention
  needsAttention,
}

/// Extension methods for DailyRoute
extension DailyRouteX on DailyRoute {
  /// Whether the route can be activated
  bool get canActivate => status == DailyRouteStatus.pending;

  /// Whether visits can be started (clock-in allowed)
  bool get canStartVisits =>
      status == DailyRouteStatus.activated ||
      status == DailyRouteStatus.inProgress;

  /// Whether the route can be closed by the agent
  bool get canClose =>
      status == DailyRouteStatus.activated ||
      status == DailyRouteStatus.inProgress;

  /// Whether all visits have outcomes (completed or skipped)
  bool get allVisitsResolved =>
      (completedCount + skippedCount) == totalScheduled && inProgressCount == 0;

  /// Number of pending visits
  int get pendingCount =>
      totalScheduled - completedCount - skippedCount - inProgressCount;

  /// Progress percentage (0.0 to 1.0)
  double get progressPercentage =>
      totalScheduled > 0 ? (completedCount + skippedCount) / totalScheduled : 0;

  /// Whether the route is in a terminal state
  bool get isTerminal =>
      status == DailyRouteStatus.closed ||
      status == DailyRouteStatus.forceClosed;

  /// Human-readable status text
  String get statusText {
    switch (status) {
      case DailyRouteStatus.pending:
        return 'Not Started';
      case DailyRouteStatus.activated:
        return 'Ready';
      case DailyRouteStatus.inProgress:
        return 'In Progress';
      case DailyRouteStatus.closed:
        return 'Completed';
      case DailyRouteStatus.forceClosed:
        return 'Force Closed';
    }
  }
}
