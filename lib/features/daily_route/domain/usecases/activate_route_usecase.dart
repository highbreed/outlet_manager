import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/daily_route.dart';
import '../repositories/daily_route_repository.dart';

/// Use case for activating the agent's daily route.
///
/// This is called when the agent starts their workday:
/// 1. Calls backend to activate route (generates visits from schedule)
/// 2. Creates local DailyRoute and OutletVisit records
/// 3. Returns the activated route with visits
///
/// **Errors:**
/// - [RouteBlockedFailure] if previous route is not closed
/// - [NetworkFailure] if offline and no cached route exists
/// - [InvalidRouteStateFailure] if route already activated for today
class ActivateRouteUseCase {
  final DailyRouteRepository _repository;

  ActivateRouteUseCase(this._repository);

  /// Activate route for today (or specified date).
  ///
  /// [routeDate] - Optional date to activate. Defaults to today.
  ///
  /// Returns the activated [DailyRoute] with visits populated.
  Future<Either<Failure, DailyRoute>> call({DateTime? routeDate}) async {
    final targetDate = routeDate ?? DateTime.now();

    // Check if route already exists for target date
    final existingRoute = await _repository.hasRouteForDate(targetDate);
    if (existingRoute) {
      // Return the existing route instead of error (idempotent behavior)
      final route = await _repository.getTodaysRoute();
      return route.fold((failure) => Left(failure), (route) {
        if (route != null) {
          return Right(route);
        }
        // Shouldn't happen, but handle gracefully
        return Left(
          const UnknownFailure(
            message: 'Route exists but could not be retrieved',
          ),
        );
      });
    }

    // Check for unclosed previous routes (will trigger ROUTE_BLOCKED from API)
    final unclosedRoute = await _repository.getUnclosedRoute();
    final hasUnclosed = unclosedRoute.fold(
      (_) => false, // Error checking = assume no unclosed
      (route) => route != null,
    );

    if (hasUnclosed) {
      final blockedRoute = unclosedRoute.getRight().toNullable()!;
      return Left(
        RouteBlockedFailure(
          blockedRouteId: blockedRoute.localId,
          blockedRouteDate: blockedRoute.routeDate,
          blockedRouteStatus: blockedRoute.status.name,
        ),
      );
    }

    // Activate the route via repository (calls API)
    return _repository.activateRoute(routeDate: routeDate);
  }
}
