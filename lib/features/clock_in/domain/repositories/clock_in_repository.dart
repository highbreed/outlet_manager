import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/clock_in_session.dart';

/// Repository interface for clock-in/clock-out operations
/// Follows local-first approach with background sync
abstract class ClockInRepository {
  /// Clock in to an outlet
  /// Creates a new session and starts geofence monitoring
  Future<Either<Failure, ClockInSession>> clockIn({
    required String outletId,
    required String outletName,
    required String outletCode,
    required bool isDeviation,
    String? routeId,
    required double latitude,
    required double longitude,
    required double accuracy,
    required int allocatedMinutes,
  });

  /// Clock out from current session
  /// Ends the session and captures exit data
  Future<Either<Failure, void>> clockOut({
    required String sessionId,
    required double transportExpense,
    required String routeCovered,
    required bool hasOrder,
    required double latitude,
    required double longitude,
    required double accuracy,
  });

  /// Auto clock-out triggered by geofence exit
  /// Used when agent leaves geofence for extended period
  Future<Either<Failure, void>> autoClockOut({
    required String sessionId,
    required ClockOutReason reason,
    required double latitude,
    required double longitude,
    required double accuracy,
  });

  /// Get the currently active session if any
  Future<Either<Failure, ClockInSession?>> getActiveSession();

  /// Watch active session for real-time updates
  /// Returns null when no session is active
  Stream<ClockInSession?> watchActiveSession();

  /// Get session history for a specific date range
  Future<Either<Failure, List<ClockInSession>>> getSessionHistory({
    required DateTime startDate,
    required DateTime endDate,
  });

  /// Update session with new geofence reading
  /// Used to track exit/re-entry confirmations
  Future<Either<Failure, void>> updateSessionLocation({
    required String sessionId,
    required double latitude,
    required double longitude,
    required double accuracy,
    required bool isInsideGeofence,
  });

  /// Sync pending sessions to backend
  Future<Either<Failure, int>> syncPendingSessions();
}
