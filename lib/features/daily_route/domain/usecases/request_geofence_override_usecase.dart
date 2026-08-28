import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/geofence_override_request.dart';
import '../repositories/outlet_visit_repository.dart';

/// Use case for requesting a geofence override.
///
/// When an agent is outside the geofence but needs to clock in
/// (e.g., GPS inaccuracy in a mall), they can request an override.
/// A supervisor must approve before the agent can clock in.
///
/// **Preconditions:**
/// - Visit must be in pending status
/// - Agent must be outside geofence (otherwise just clock in normally)
/// - Reason must be provided
///
/// **Returns:**
/// - [GeofenceOverrideRequest] in pending status
/// - Agent should poll for status or wait for push notification
class RequestGeofenceOverrideUseCase {
  final OutletVisitRepository _repository;

  RequestGeofenceOverrideUseCase(this._repository);

  /// Request a geofence override.
  ///
  /// [visitLocalId] - Local ID of the visit
  /// [latitude] - Current GPS latitude
  /// [longitude] - Current GPS longitude
  /// [accuracyMeters] - GPS accuracy in meters
  /// [reason] - Why the agent needs to override geofence
  Future<Either<Failure, GeofenceOverrideRequest>> call({
    required String visitLocalId,
    required double latitude,
    required double longitude,
    required double accuracyMeters,
    required String reason,
  }) async {
    // Validate reason is provided
    if (reason.trim().isEmpty) {
      return Left(
        ValidationFailure(
          message: 'Please provide a reason for the override request',
          fieldErrors: {
            'reason': ['Reason is required'],
          },
        ),
      );
    }

    // Validate reason is meaningful (at least 10 characters)
    if (reason.trim().length < 10) {
      return Left(
        ValidationFailure(
          message: 'Please provide more detail about why you need an override',
          fieldErrors: {
            'reason': ['Reason must be at least 10 characters'],
          },
        ),
      );
    }

    // Get the visit to check for existing pending override
    final existingOverride = await _repository.getOverrideForVisit(
      visitLocalId,
    );

    final hasPendingOverride = existingOverride.fold(
      (_) => false,
      (override) => override != null && override.isPending,
    );

    if (hasPendingOverride) {
      // Return existing override instead of creating new one
      return existingOverride.map((o) => o!);
    }

    // Create the override request
    return _repository.requestGeofenceOverride(
      visitLocalId: visitLocalId,
      latitude: latitude,
      longitude: longitude,
      accuracyMeters: accuracyMeters,
      reason: reason.trim(),
    );
  }
}
