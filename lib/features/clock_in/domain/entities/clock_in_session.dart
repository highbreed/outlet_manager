import 'package:freezed_annotation/freezed_annotation.dart';

part 'clock_in_session.freezed.dart';
part 'clock_in_session.g.dart';

/// Session state for an agent's clock in at an outlet
@freezed
abstract class ClockInSession with _$ClockInSession {
  const factory ClockInSession({
    required String id,
    required String outletId,
    required String outletName,
    required String outletCode,
    required bool isDeviation,
    String? routeId, // Link to assigned route
    required DateTime clockedInAt,
    required double clockInLatitude,
    required double clockInLongitude,
    required double clockInAccuracy, // GPS accuracy at clock-in
    required int allocatedMinutes,
    required ClockInStatus status,

    // Configuration snapshot (for audit trail)
    @Default(200.0) double geofenceRadiusMeters,
    @Default(10) int autoClockoutGraceMinutes,

    // Exit tracking with confirmation
    DateTime? firstOutsideReadingAt, // Initial outside detection
    DateTime? confirmedExitAt, // After 2 readings OR 3 min
    @Default(0) int consecutiveOutsideReadings, // Counter for confirmation
    @Default(0) int consecutiveInsideReadings, // Counter for re-entry
    // Clock-out details
    DateTime? clockedOutAt,
    double? clockOutLatitude,
    double? clockOutLongitude,
    double? clockOutAccuracy, // GPS accuracy at clock-out
    double? transportExpense,
    String? routeCovered,
    bool? hasOrder,
    ClockOutReason? clockOutReason,
    @Default(SyncState.localOnly) SyncState syncState,
  }) = _ClockInSession;

  factory ClockInSession.fromJson(Map<String, dynamic> json) =>
      _$ClockInSessionFromJson(json);
}

/// Status of a clock-in session
enum ClockInStatus { active, completed, autoClockOut }

/// Reason for clocking out
enum ClockOutReason {
  manual, // User manually clocked out
  geofenceExit, // Left geofence for 10 minutes
  forcedTimeout, // Exceeded allocated time
  serverAutoClose, // Backend detected another session
  routeDeactivation, // End of day
}

/// Sync state for offline-first operations
enum SyncState {
  localOnly, // Not yet synced to server
  syncing, // Currently syncing
  synced, // Successfully synced
  syncFailed, // Sync failed, will retry
  needsAttention, // Requires manual intervention
}
