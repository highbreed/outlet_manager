import 'package:isar_community/isar.dart';

part 'clock_session_event_model.g.dart';

@collection
class ClockSessionEventModel {
  Id? id;

  @Index()
  late String sessionId; // Links to ClockInSessionModel.localId

  @Index()
  @Enumerated(EnumType.name)
  late ClockSessionEventType type;

  late double latitude;
  late double longitude;
  late double accuracy;

  @Index()
  late DateTime timestamp;

  String? metadataJson; // Serialized Map<String, dynamic>
}

enum ClockSessionEventType {
  clockIn,
  firstOutsideReading,
  geofenceExitConfirmed,
  notificationSent,
  firstInsideReading,
  geofenceReentryConfirmed,
  autoClockOut,
  manualClockOut,
  accuracyImproved,
  accuracyDegraded,
  pollingIntervalChanged,
}
