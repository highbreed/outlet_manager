import 'package:freezed_annotation/freezed_annotation.dart';

part 'visit_schedule.freezed.dart';
part 'visit_schedule.g.dart';

/// Visit schedule entity representing an agent's assigned outlet visit for a day.
///
/// This is a direct mirror of the backend `outlet_visit_schedules` table.
/// Each row represents ONE outlet to visit on ONE specific day of the week.
///
/// **Backend Alignment:**
/// - List schedules: `GET /api/v1/visits/schedules`
/// - Week schedule: `GET /api/v1/visits/schedules/agent/{agent_id}/week`
///
/// **UI Usage:**
/// Group by `dayOfWeek` to show "Monday's route", "Tuesday's route", etc.
@freezed
abstract class VisitSchedule with _$VisitSchedule {
  const VisitSchedule._();

  const factory VisitSchedule({
    /// Server ID from outlet_visit_schedules.id
    required String serverId,

    /// Agent this schedule belongs to
    required String salesAgentServerId,

    // === Outlet Information (denormalized for offline display) ===

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

    /// Outlet address
    String? outletAddress,

    // === Schedule Details ===

    /// Day of week: 0=Monday, 1=Tuesday, ..., 6=Sunday
    required int dayOfWeek,

    /// Expected arrival time (HH:mm:ss or HH:mm format from backend)
    String? scheduledClockIn,

    /// Expected departure time (HH:mm:ss or HH:mm format from backend)
    String? scheduledClockOut,

    /// Sequence order for the day (1, 2, 3, ...)
    required int visitOrder,

    /// Visit priority: 1=must visit, 2=important, 3=flexible
    @Default(2) int visitPriority,

    /// Allocated time for this visit (minutes)
    required int allocatedMinutes,

    // === Validity Period ===

    /// When this schedule becomes effective
    required DateTime effectiveFrom,

    /// When this schedule expires (null = indefinite)
    DateTime? effectiveTo,

    /// Whether this schedule is currently active
    @Default(true) bool isActive,

    // === Sync Tracking ===

    /// Last time this record was synced from backend
    DateTime? lastSyncedAt,
  }) = _VisitSchedule;

  factory VisitSchedule.fromJson(Map<String, dynamic> json) =>
      _$VisitScheduleFromJson(json);

  /// Returns the day name for this schedule
  String get dayName => _dayNames[dayOfWeek] ?? 'Unknown';

  /// Returns short day name (Mon, Tue, etc.)
  String get dayNameShort => _dayNamesShort[dayOfWeek] ?? '???';

  /// Whether this schedule is valid for the given date
  bool isValidFor(DateTime date) {
    if (!isActive) return false;
    if (date.isBefore(effectiveFrom)) return false;
    if (effectiveTo != null && date.isAfter(effectiveTo!)) return false;
    return true;
  }

  /// Whether this schedule applies to today
  bool get isValidToday => isValidFor(DateTime.now());

  /// Parses scheduled clock-in time to TimeOfDay-like values
  /// Returns null if not set
  ({int hour, int minute})? get clockInTime => _parseTime(scheduledClockIn);

  /// Parses scheduled clock-out time to TimeOfDay-like values
  /// Returns null if not set
  ({int hour, int minute})? get clockOutTime => _parseTime(scheduledClockOut);

  ({int hour, int minute})? _parseTime(String? timeStr) {
    if (timeStr == null || timeStr.isEmpty) return null;
    final parts = timeStr.split(':');
    if (parts.length < 2) return null;
    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);
    if (hour == null || minute == null) return null;
    return (hour: hour, minute: minute);
  }

  static const _dayNames = {
    0: 'Monday',
    1: 'Tuesday',
    2: 'Wednesday',
    3: 'Thursday',
    4: 'Friday',
    5: 'Saturday',
    6: 'Sunday',
  };

  static const _dayNamesShort = {
    0: 'Mon',
    1: 'Tue',
    2: 'Wed',
    3: 'Thu',
    4: 'Fri',
    5: 'Sat',
    6: 'Sun',
  };
}

/// Extension to group schedules by day of week
extension VisitScheduleListX on List<VisitSchedule> {
  /// Groups schedules by day of week (0-6)
  /// Each day's list is sorted by visitOrder
  Map<int, List<VisitSchedule>> groupByDayOfWeek() {
    final map = <int, List<VisitSchedule>>{};
    for (final schedule in this) {
      map.putIfAbsent(schedule.dayOfWeek, () => []).add(schedule);
    }
    // Sort each day's list by visitOrder
    for (final list in map.values) {
      list.sort((a, b) => a.visitOrder.compareTo(b.visitOrder));
    }
    return map;
  }

  /// Gets schedules for a specific day, sorted by visitOrder
  List<VisitSchedule> forDay(int dayOfWeek) {
    return where((s) => s.dayOfWeek == dayOfWeek).toList()
      ..sort((a, b) => a.visitOrder.compareTo(b.visitOrder));
  }

  /// Gets only active and currently valid schedules
  List<VisitSchedule> get activeOnly {
    final now = DateTime.now();
    return where((s) => s.isValidFor(now)).toList();
  }

  /// Total allocated minutes for a given day
  int totalMinutesForDay(int dayOfWeek) {
    return forDay(dayOfWeek).fold(0, (sum, s) => sum + s.allocatedMinutes);
  }
}
