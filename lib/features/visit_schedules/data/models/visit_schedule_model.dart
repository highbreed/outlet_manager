import 'package:isar_community/isar.dart';

part 'visit_schedule_model.g.dart';

/// Isar collection for visit schedules.
///
/// Local mirror of backend `outlet_visit_schedules` table.
/// Each row represents one outlet to visit on one specific day of the week.
@collection
class VisitScheduleModel {
  Id? id;

  /// Server ID from outlet_visit_schedules.id
  @Index(unique: true)
  late String serverId;

  /// Agent this schedule belongs to
  @Index()
  late String salesAgentServerId;

  // === Outlet Information (denormalized for offline display) ===

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

  /// Outlet address (optional)
  String? outletAddress;

  // === Schedule Details ===

  /// Day of week: 0=Monday, 1=Tuesday, ..., 6=Sunday
  @Index()
  late int dayOfWeek;

  /// Expected arrival time (HH:mm:ss or HH:mm format)
  String? scheduledClockIn;

  /// Expected departure time (HH:mm:ss or HH:mm format)
  String? scheduledClockOut;

  /// Sequence order for the day (1, 2, 3, ...)
  late int visitOrder;

  /// Visit priority: 1=must visit, 2=important, 3=flexible
  late int visitPriority;

  /// Allocated time for this visit (minutes)
  late int allocatedMinutes;

  // === Validity Period ===

  /// When this schedule becomes effective
  late DateTime effectiveFrom;

  /// When this schedule expires (null = indefinite)
  DateTime? effectiveTo;

  /// Whether this schedule is currently active
  late bool isActive;

  // === Sync Tracking ===

  /// Last time this record was synced from backend
  DateTime? lastSyncedAt;
}
