import 'package:freezed_annotation/freezed_annotation.dart';

part 'clock_session_event.freezed.dart';
part 'clock_session_event.g.dart';

/// Audit trail event for clock-in sessions
/// Used for disputes, debugging, and analytics
@freezed
class ClockSessionEvent with _$ClockSessionEvent {
  const factory ClockSessionEvent({
    required String id,
    required String sessionId,
    required ClockSessionEventType type,
    required double latitude,
    required double longitude,
    required double accuracy,
    required DateTime timestamp,
    Map<String, dynamic>? metadata,
  }) = _ClockSessionEvent;

  factory ClockSessionEvent.fromJson(Map<String, dynamic> json) =>
      _$ClockSessionEventFromJson(json);
}

/// Types of events that can occur during a clock-in session
enum ClockSessionEventType {
  clockIn,
  firstOutsideReading, // Not confirmed yet
  geofenceExitConfirmed, // After 2 readings or 3 min
  notificationSent, // Each of the 4 notifications
  firstInsideReading, // Not confirmed yet
  geofenceReentryConfirmed, // After 2 readings
  autoClockOut,
  manualClockOut,
  accuracyImproved,
  accuracyDegraded,
  pollingIntervalChanged, // Switched between 2min/30s
}
