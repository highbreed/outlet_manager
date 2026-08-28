import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/daily_route.dart';
import '../entities/outlet_visit.dart';

/// Repository interface for daily route operations.
///
/// Implementations handle the data layer (local DB + remote API).
/// All methods return Either for functional error handling.
abstract class DailyRouteRepository {
  // === Route Lifecycle ===

  /// Activate today's route for the current agent.
  ///
  /// - Calls `POST /api/v1/visits/routes/activate`
  /// - Creates local DailyRoute + OutletVisit records
  /// - Returns the activated route with visits populated
  ///
  /// **Errors:**
  /// - [RouteBlockedFailure] if previous route not closed
  /// - [NetworkFailure] if offline and no cached route
  Future<Either<Failure, DailyRoute>> activateRoute({DateTime? routeDate});

  /// Get today's route for the current agent.
  ///
  /// - First checks local DB
  /// - If online and stale, fetches from `GET /api/v1/visits/routes/today`
  /// - Returns null if no route exists for today
  Future<Either<Failure, DailyRoute?>> getTodaysRoute();

  /// Get a route by its local ID.
  Future<Either<Failure, DailyRoute?>> getRouteByLocalId(String localId);

  /// Get a route by its server ID.
  Future<Either<Failure, DailyRoute?>> getRouteByServerId(String serverId);

  /// Fetch a route by its server ID from the API and save locally.
  /// Used for routes that exist on server but not in local DB (e.g., after reinstall).
  /// GET /routes/{route_id}
  Future<Either<Failure, DailyRoute>> fetchAndSaveRouteById(String serverId);

  /// Close the route normally.
  ///
  /// - All visits must be in terminal state (completed/skipped)
  /// - Calls `POST /api/v1/visits/routes/{id}/close`
  /// - Queues sync operation if offline
  ///
  /// [skippedVisits] allows skipping remaining pending visits in one call.
  Future<Either<Failure, DailyRoute>> closeRoute({
    required String routeLocalId,
    String? closingNotes,
    List<SkipVisitParams>? skippedVisits,
  });

  /// Force-close a route (supervisor/manager action).
  ///
  /// - Online-only operation
  /// - Calls `POST /api/v1/visits/routes/{id}/force-close`
  Future<Either<Failure, DailyRoute>> forceCloseRoute({
    required String routeServerId,
    required String reason,
    bool skipAllPending = true,
    int? defaultSkipReasonId,
  });

  // === Route Queries ===

  /// Get routes for a date range.
  Future<Either<Failure, List<DailyRoute>>> getRoutesByDateRange({
    required DateTime startDate,
    required DateTime endDate,
  });

  /// Get the most recent unclosed route (for ROUTE_BLOCKED handling).
  Future<Either<Failure, DailyRoute?>> getUnclosedRoute();

  /// Check if a route exists for a specific date.
  Future<bool> hasRouteForDate(DateTime date);

  // === Route Status Updates ===

  /// Update route status locally (called by visit operations).
  Future<Either<Failure, DailyRoute>> updateRouteStatus({
    required String routeLocalId,
    required DailyRouteStatus status,
    DateTime? firstClockInAt,
    DateTime? lastClockOutAt,
  });

  /// Update route progress counters locally.
  Future<Either<Failure, DailyRoute>> updateRouteProgress({
    required String routeLocalId,
    int? completedCount,
    int? skippedCount,
    int? inProgressCount,
    int? totalVisitTimeMins,
  });

  // === Sync Operations ===

  /// Sync pending route operations with backend.
  Future<Either<Failure, void>> syncPendingOperations();

  /// Refresh route data from backend.
  Future<Either<Failure, DailyRoute>> refreshFromServer(String routeServerId);

  // === Visits (delegated from OutletVisitRepository for convenience) ===

  /// Get all visits for a route.
  Future<Either<Failure, List<OutletVisit>>> getVisitsForRoute(
    String routeLocalId,
  );
}

/// Parameters for skipping a visit during route close.
class SkipVisitParams {
  final String visitLocalId;
  final int skipReasonId;
  final String? skipNotes;

  const SkipVisitParams({
    required this.visitLocalId,
    required this.skipReasonId,
    this.skipNotes,
  });

  Map<String, dynamic> toJson() => {
    'visit_id': visitLocalId,
    'skip_reason_id': skipReasonId,
    if (skipNotes != null) 'skip_notes': skipNotes,
  };
}
