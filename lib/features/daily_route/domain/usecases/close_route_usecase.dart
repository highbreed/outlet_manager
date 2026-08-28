import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/daily_route.dart';
import '../repositories/daily_route_repository.dart';

/// Use case for closing the agent's daily route.
///
/// Called at the end of the workday when all visits have outcomes.
/// Can optionally skip remaining pending visits in one operation.
///
/// **Preconditions:**
/// - Route must be activated or in_progress
/// - All visits must have outcomes OR skippedVisits must cover remaining
///
/// **Errors:**
/// - [InvalidRouteStateFailure] if route not closeable
/// - [ValidationFailure] if pending visits without skip params
class CloseRouteUseCase {
  final DailyRouteRepository _repository;

  CloseRouteUseCase(this._repository);

  /// Close the route.
  ///
  /// [routeLocalId] - Local ID of the route to close
  /// [closingNotes] - Optional notes for the day
  /// [skippedVisits] - Pending visits to skip during close
  Future<Either<Failure, DailyRoute>> call({
    required String routeLocalId,
    String? closingNotes,
    List<SkipVisitParams>? skippedVisits,
  }) async {
    // Get current route state
    final routeResult = await _repository.getRouteByLocalId(routeLocalId);

    return routeResult.fold((failure) => Left(failure), (route) async {
      if (route == null) {
        return Left(
          const NotFoundFailure(
            resourceType: 'DailyRoute',
            resourceId: '',
            message: 'Route not found',
          ),
        );
      }

      // Validate route can be closed
      if (!route.canClose) {
        return Left(
          InvalidRouteStateFailure(
            currentStatus: route.status.name,
            operation: 'close',
          ),
        );
      }

      // Check for unresolved visits
      final visitsResult = await _repository.getVisitsForRoute(routeLocalId);

      return visitsResult.fold((failure) => Left(failure), (visits) async {
        final pendingVisits = visits
            .where((v) => v.status.name == 'pending')
            .toList();
        final inProgressVisits = visits
            .where((v) => v.status.name == 'inProgress')
            .toList();

        // Cannot close if any visit is in progress
        if (inProgressVisits.isNotEmpty) {
          return Left(
            ValidationFailure(
              message: 'Cannot close route while a visit is in progress',
              fieldErrors: {
                'visits': [
                  'Clock out of ${inProgressVisits.first.outletName} first',
                ],
              },
            ),
          );
        }

        // Check all pending visits are covered by skippedVisits
        final skippedIds =
            skippedVisits?.map((s) => s.visitLocalId).toSet() ?? {};
        final uncoveredPending = pendingVisits
            .where((v) => !skippedIds.contains(v.localId))
            .toList();

        if (uncoveredPending.isNotEmpty) {
          return Left(
            ValidationFailure(
              message:
                  '${uncoveredPending.length} pending visits must be completed or skipped',
              fieldErrors: {
                'visits': uncoveredPending
                    .map((v) => '${v.outletName} is still pending')
                    .toList(),
              },
            ),
          );
        }

        // Close the route
        return _repository.closeRoute(
          routeLocalId: routeLocalId,
          closingNotes: closingNotes,
          skippedVisits: skippedVisits,
        );
      });
    });
  }
}
