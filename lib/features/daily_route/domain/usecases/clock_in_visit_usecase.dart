import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/outlet_visit.dart';
import '../repositories/outlet_visit_repository.dart';

/// Use case for clocking in to an outlet visit.
///
/// Validates geofence and GPS accuracy before allowing clock-in.
/// Updates local state immediately (optimistic) and queues sync.
///
/// **Preconditions:**
/// - Visit must be pending or previously skipped (see [OutletVisit.canClockIn])
/// - No other visit can be in progress
/// - Agent must be within geofence (50m) OR have approved override
/// - GPS accuracy must be ≤ 200m
///
/// **Errors:**
/// - [GeofenceViolationFailure] if outside radius (can request override)
/// - [GpsAccuracyFailure] if accuracy > 200m
/// - [VisitInProgressFailure] if another visit is active
/// - [InvalidVisitStateFailure] if visit not pending
class ClockInVisitUseCase {
  final OutletVisitRepository _repository;

  ClockInVisitUseCase(this._repository);

  /// Clock in to a visit.
  ///
  /// [visitLocalId] - Local ID of the visit
  /// [latitude] - Current GPS latitude
  /// [longitude] - Current GPS longitude
  /// [accuracyMeters] - GPS accuracy in meters
  /// [notes] - Optional notes for clock-in
  Future<Either<Failure, OutletVisit>> call({
    required String visitLocalId,
    required double latitude,
    required double longitude,
    required double accuracyMeters,
    String? notes,
  }) async {
    // Validate GPS accuracy (must be ≤ 200m)
    if (accuracyMeters > 200.0) {
      return Left(
        GpsAccuracyFailure(
          currentAccuracy: accuracyMeters,
          requiredAccuracy: 200.0,
        ),
      );
    }

    // Check no other visit is in progress
    final activeVisitResult = await _repository.getActiveVisit();
    final hasActiveVisit = activeVisitResult.fold(
      (_) => false,
      (visit) => visit != null,
    );

    if (hasActiveVisit) {
      final activeVisit = activeVisitResult.getRight().toNullable()!;
      return Left(
        VisitInProgressFailure(
          activeVisitLocalId: activeVisit.localId,
          activeOutletName: activeVisit.outletName,
        ),
      );
    }

    // Get the visit to validate state and geofence
    final visitResult = await _repository.getVisitByLocalId(visitLocalId);

    return visitResult.fold((failure) => Left(failure), (visit) async {
      if (visit == null) {
        return Left(
          const NotFoundFailure(
            resourceType: 'OutletVisit',
            resourceId: '',
            message: 'Visit not found',
          ),
        );
      }

      // Validate visit status
      if (!visit.canClockIn) {
        return Left(
          InvalidVisitStateFailure(
            currentStatus: visit.status.name,
            operation: 'clock in',
          ),
        );
      }

      // Validate geofence (50m radius)
      final distance = _calculateDistance(
        latitude,
        longitude,
        visit.outletLatitude,
        visit.outletLongitude,
      );

      final requiredRadius = visit.geofenceRadiusMeters;

      if (distance > requiredRadius) {
        return Left(
          GeofenceViolationFailure(
            userLatitude: latitude,
            userLongitude: longitude,
            outletLatitude: visit.outletLatitude,
            outletLongitude: visit.outletLongitude,
            distanceMeters: distance,
            requiredRadiusMeters: requiredRadius,
            canRequestOverride: true,
          ),
        );
      }

      // All validations passed - clock in
      return _repository.clockIn(
        visitLocalId: visitLocalId,
        latitude: latitude,
        longitude: longitude,
        accuracyMeters: accuracyMeters,
        notes: notes,
      );
    });
  }

  /// Calculate distance between two points using Haversine formula.
  double _calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double earthRadius = 6371000; // meters
    final double dLat = _toRadians(lat2 - lat1);
    final double dLon = _toRadians(lon2 - lon1);

    final double a =
        _sin(dLat / 2) * _sin(dLat / 2) +
        _cos(_toRadians(lat1)) *
            _cos(_toRadians(lat2)) *
            _sin(dLon / 2) *
            _sin(dLon / 2);

    final double c = 2 * _atan2(_sqrt(a), _sqrt(1 - a));

    return earthRadius * c;
  }

  double _toRadians(double degrees) => degrees * 3.141592653589793 / 180;
  double _sin(double x) => _taylorSin(x);
  double _cos(double x) => _taylorSin(x + 3.141592653589793 / 2);
  double _sqrt(double x) => x < 0 ? 0 : _newtonSqrt(x);
  double _atan2(double y, double x) => _approximateAtan2(y, x);

  // Taylor series approximation for sin
  double _taylorSin(double x) {
    // Normalize to [-π, π]
    const double pi = 3.141592653589793;
    while (x > pi) {
      x -= 2 * pi;
    }
    while (x < -pi) {
      x += 2 * pi;
    }
    double result = x;
    double term = x;
    for (int i = 1; i <= 10; i++) {
      term *= -x * x / ((2 * i) * (2 * i + 1));
      result += term;
    }
    return result;
  }

  // Newton's method for sqrt
  double _newtonSqrt(double x) {
    if (x == 0) return 0;
    double guess = x / 2;
    for (int i = 0; i < 20; i++) {
      guess = (guess + x / guess) / 2;
    }
    return guess;
  }

  // Approximate atan2
  double _approximateAtan2(double y, double x) {
    const double pi = 3.141592653589793;
    if (x > 0) return _atan(y / x);
    if (x < 0 && y >= 0) return _atan(y / x) + pi;
    if (x < 0 && y < 0) return _atan(y / x) - pi;
    if (x == 0 && y > 0) return pi / 2;
    if (x == 0 && y < 0) return -pi / 2;
    return 0; // x == 0 && y == 0
  }

  // Approximate atan using Taylor series
  double _atan(double x) {
    if (x.abs() > 1) {
      const double pi = 3.141592653589793;
      return (x > 0 ? pi / 2 : -pi / 2) - _atan(1 / x);
    }
    double result = x;
    double term = x;
    for (int i = 1; i <= 20; i++) {
      term *= -x * x;
      result += term / (2 * i + 1);
    }
    return result;
  }
}
