import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/daily_route.dart';
import '../entities/outlet_visit.dart';
import '../repositories/daily_route_repository.dart';

/// Use case for getting today's route with visits.
///
/// Returns the current day's route if it exists, with all visits.
/// Used for displaying the agent's daily work screen.
class GetTodaysRouteUseCase {
  final DailyRouteRepository _repository;

  GetTodaysRouteUseCase(this._repository);

  /// Get today's route.
  ///
  /// Returns [DailyRoute] if activated, or null if no route for today.
  Future<Either<Failure, DailyRouteWithVisits?>> call() async {
    final routeResult = await _repository.getTodaysRoute();

    return routeResult.fold((failure) => Left(failure), (route) async {
      if (route == null) {
        return const Right(null);
      }

      // Fetch visits for this route
      final visitsResult = await _repository.getVisitsForRoute(route.localId);

      return visitsResult.fold(
        (failure) => Left(failure),
        (visits) => Right(DailyRouteWithVisits(route: route, visits: visits)),
      );
    });
  }
}

/// Combined route and visits for convenience.
class DailyRouteWithVisits {
  final DailyRoute route;
  final List<OutletVisit> visits;

  const DailyRouteWithVisits({required this.route, required this.visits});

  /// Get visits sorted by visit order.
  List<OutletVisit> get sortedVisits =>
      [...visits]..sort((a, b) => a.visitOrder.compareTo(b.visitOrder));

  /// Get pending visits.
  List<OutletVisit> get pendingVisits =>
      visits.where((v) => v.status == VisitStatus.pending).toList();

  /// Get the currently active visit (if any).
  OutletVisit? get activeVisit =>
      visits.where((v) => v.status == VisitStatus.inProgress).firstOrNull;

  /// Get completed visits.
  List<OutletVisit> get completedVisits =>
      visits.where((v) => v.status == VisitStatus.completed).toList();

  /// Get skipped visits.
  List<OutletVisit> get skippedVisits =>
      visits.where((v) => v.status == VisitStatus.skipped).toList();

  /// Whether all visits have outcomes (completed or skipped).
  bool get allVisitsResolved => pendingVisits.isEmpty && activeVisit == null;

  /// Progress percentage (0.0 to 1.0).
  double get progressPercentage {
    if (visits.isEmpty) return 0.0;
    return (completedVisits.length + skippedVisits.length) / visits.length;
  }
}
