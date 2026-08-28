import 'package:isar_community/isar.dart';

part 'clock_in_session_model.g.dart';

@collection
class ClockInSessionModel {
  Id? id;

  @Index()
  late String localId; // UUID for offline-first

  String? serverId; // Backend ID after sync

  @Index()
  late String outletId;

  late String outletName;
  late String outletCode;
  late bool isDeviation;

  String? routeId;

  @Index()
  late DateTime clockedInAt;

  late double clockInLatitude;
  late double clockInLongitude;
  late double clockInAccuracy;

  late int allocatedMinutes;

  @Enumerated(EnumType.name)
  late ClockInStatus status;

  // Configuration snapshot
  late double geofenceRadiusMeters;
  late int autoClockoutGraceMinutes;

  // Exit tracking
  DateTime? firstOutsideReadingAt;
  DateTime? confirmedExitAt;
  late int consecutiveOutsideReadings;
  late int consecutiveInsideReadings;

  // Clock-out details
  DateTime? clockedOutAt;
  double? clockOutLatitude;
  double? clockOutLongitude;
  double? clockOutAccuracy;
  double? transportExpense;
  String? routeCovered;
  bool? hasOrder;

  @Enumerated(EnumType.name)
  ClockOutReason? clockOutReason;

  @Enumerated(EnumType.name)
  late SyncState syncState;

  DateTime? syncedAt;
}

enum ClockInStatus { active, completed, autoClockOut }

enum ClockOutReason {
  manual,
  geofenceExit,
  forcedTimeout,
  serverAutoClose,
  routeDeactivation,
}

enum SyncState { localOnly, syncing, synced, syncFailed, needsAttention }
