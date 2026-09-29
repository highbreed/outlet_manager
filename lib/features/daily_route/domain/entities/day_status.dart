import '../usecases/get_todays_route_usecase.dart';
import 'daily_route.dart';
import 'lunch_break.dart';

/// Single-call snapshot of the agent's day, from
/// `GET /visits/routes/day-status`. Meant to be polled: an admin can close,
/// force-close, or otherwise change route/visit state on the server at any
/// time, and polling this is how the app notices without the agent having
/// to take an action first.
enum DayStatus {
  /// An earlier day's route was never closed — today cannot be started.
  blocked,

  /// Nothing is scheduled for the agent today.
  notScheduled,

  /// Outlets are scheduled today, but the agent hasn't activated the route.
  notActivated,

  /// Route activated, no visit started yet.
  active,

  /// Currently clocked in to a visit.
  atOutlet,

  /// Route in progress; between visits (none currently in progress).
  inTransit,

  /// Today's route is closed (or force-closed). Nothing left to do.
  completed,
}

/// Summary of a previous day's unclosed route that is blocking today's
/// activation (present only when [DayStatusInfo.status] is
/// [DayStatus.blocked]).
class BlockedRouteSummary {
  final String id;
  final DateTime routeDate;
  final DailyRouteStatus status;
  final int totalScheduled;
  final int completedCount;
  final int skippedCount;

  const BlockedRouteSummary({
    required this.id,
    required this.routeDate,
    required this.status,
    required this.totalScheduled,
    required this.completedCount,
    required this.skippedCount,
  });
}

/// A schedule-derived stop for today, before the route has been activated
/// (no [OutletVisit] exists yet — those are only created on activation).
/// Present only when [DayStatusInfo.status] is [DayStatus.notActivated].
class ScheduledStop {
  final int id;
  final String customerId;
  final String outletCode;
  final String outletName;
  final int visitOrder;
  final int visitPriority;
  final String? scheduledClockIn;
  final String? scheduledClockOut;

  const ScheduledStop({
    required this.id,
    required this.customerId,
    required this.outletCode,
    required this.outletName,
    required this.visitOrder,
    required this.visitPriority,
    this.scheduledClockIn,
    this.scheduledClockOut,
  });
}

class DayStatusInfo {
  final DayStatus status;
  final String message;
  final DateTime routeDate;
  final bool canActivate;
  final BlockedRouteSummary? blockedRoute;
  final List<ScheduledStop> scheduledStops;
  final DailyRouteWithVisits? route;
  final LunchBreak lunchBreak;

  const DayStatusInfo({
    required this.status,
    required this.message,
    required this.routeDate,
    required this.canActivate,
    this.blockedRoute,
    this.scheduledStops = const [],
    this.route,
    required this.lunchBreak,
  });
}
