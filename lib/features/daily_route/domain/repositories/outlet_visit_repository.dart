import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/geofence_override_request.dart';
import '../entities/outlet_visit.dart';

/// Repository interface for outlet visit operations.
///
/// Handles clock-in/out, skip, and geofence override flows.
/// All methods return Either for functional error handling.
abstract class OutletVisitRepository {
  // === Visit Queries ===

  /// Get a visit by its local ID.
  Future<Either<Failure, OutletVisit?>> getVisitByLocalId(String localId);

  /// Get a visit by its server ID.
  Future<Either<Failure, OutletVisit?>> getVisitByServerId(String serverId);

  /// Get all visits for a route.
  Future<Either<Failure, List<OutletVisit>>> getVisitsForRoute(
    String routeLocalId,
  );

  /// Get the currently active visit (status = inProgress).
  Future<Either<Failure, OutletVisit?>> getActiveVisit();

  /// Get visits by status.
  Future<Either<Failure, List<OutletVisit>>> getVisitsByStatus(
    String routeLocalId,
    VisitStatus status,
  );

  // === Clock In/Out ===

  /// Clock in to a visit.
  ///
  /// - Validates geofence (50m radius)
  /// - Validates GPS accuracy (≤200m)
  /// - Checks no other visit is in progress
  /// - Calls `POST /api/v1/visits/{id}/clock-in`
  /// - Updates local state immediately (optimistic)
  /// - Queues sync operation if offline
  ///
  /// **Errors:**
  /// - [GeofenceViolationFailure] if outside radius
  /// - [GpsAccuracyFailure] if accuracy > 200m
  /// - [VisitInProgressFailure] if another visit is active
  /// - [BiometricVerificationFailure.clockInRejected] if [verificationId]
  ///   is missing/expired/invalid/already-used and the backend enforces
  ///   verification for this employee
  ///
  /// [verificationId] is null for a legacy clock-in — normal when the
  /// backend reports `clock_in_verification_required: false`. [deviceId]
  /// is sent alongside a non-null [verificationId] for the backend's
  /// device-match check.
  Future<Either<Failure, OutletVisit>> clockIn({
    required String visitLocalId,
    required double latitude,
    required double longitude,
    required double accuracyMeters,
    String? verificationId,
    String? deviceId,
    String? notes,
  });

  /// Clock out from a visit.
  ///
  /// - Validates geofence (100m radius - more lenient)
  /// - Calls `POST /api/v1/visits/{id}/clock-out`
  /// - Updates local state immediately
  /// - Queues sync operation if offline
  ///
  /// **Errors:**
  /// - [GeofenceViolationFailure] if outside radius
  Future<Either<Failure, OutletVisit>> clockOut({
    required String visitLocalId,
    required double latitude,
    required double longitude,
    required double accuracyMeters,
    String? notes,
  });

  // === Skip Visit ===

  /// Skip a visit with a reason.
  ///
  /// - Visit must be in pending status
  /// - Calls `POST /api/v1/visits/{id}/skip`
  /// - Queues sync operation if offline
  ///
  /// **Errors:**
  /// - [InvalidVisitStateFailure] if not pending
  /// - [ValidationFailure] if reason requires notes and none provided
  Future<Either<Failure, OutletVisit>> skipVisit({
    required String visitLocalId,
    required int skipReasonId,
    String? skipNotes,
  });

  // === Ad-hoc Visits ===

  /// Add an ad-hoc (unscheduled) visit to the route.
  ///
  /// - Route must be activated
  /// - Calls `POST /api/v1/visits/ad-hoc`
  /// - Creates local visit record
  Future<Either<Failure, OutletVisit>> addAdHocVisit({
    required String routeLocalId,
    required String outletId,
    required String outletCode,
    required String outletName,
    required double outletLatitude,
    required double outletLongitude,
    String? notes,
  });

  // === Geofence Override ===

  /// Request a geofence override for a visit.
  ///
  /// - Called when agent is outside geofence but needs to clock in
  /// - Calls `POST /api/v1/visits/{id}/request-override`
  /// - Returns the pending override request
  Future<Either<Failure, GeofenceOverrideRequest>> requestGeofenceOverride({
    required String visitLocalId,
    required double latitude,
    required double longitude,
    required double accuracyMeters,
    required String reason,
  });

  /// Get the current pending override request for a visit.
  Future<Either<Failure, GeofenceOverrideRequest?>> getOverrideForVisit(
    String visitLocalId,
  );

  /// Get the most recent override for a visit regardless of status.
  Future<Either<Failure, GeofenceOverrideRequest?>> getLatestOverrideForVisit(
    String visitLocalId,
  );

  /// Poll for override request status update.
  ///
  /// - Fetches latest status from server
  /// - Updates local record
  Future<Either<Failure, GeofenceOverrideRequest>> refreshOverrideStatus(
    String overrideLocalId,
  );

  /// Clock in using an approved override.
  ///
  /// - Override must be approved
  /// - Uses the location from override request
  ///
  /// [verificationId]/[deviceId] follow the same optional-when-not-
  /// enforced rule as [clockIn].
  Future<Either<Failure, OutletVisit>> clockInWithOverride({
    required String visitLocalId,
    required String overrideLocalId,
    String? verificationId,
    String? deviceId,
    String? notes,
  });

  // === Status Updates ===

  /// Update visit status locally.
  Future<Either<Failure, OutletVisit>> updateVisitStatus({
    required String visitLocalId,
    required VisitStatus status,
    DateTime? actualClockIn,
    DateTime? actualClockOut,
    int? visitDurationMins,
  });

  // === Sync Operations ===

  /// Sync pending visit operations with backend.
  Future<Either<Failure, void>> syncPendingOperations();

  /// Refresh visit data from backend.
  Future<Either<Failure, OutletVisit>> refreshFromServer(String visitServerId);
}
