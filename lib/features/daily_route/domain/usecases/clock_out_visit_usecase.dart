import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/outlet_visit.dart';
import '../repositories/outlet_visit_repository.dart';

/// Use case for clocking out from an outlet visit.
///
/// Validates geofence (more lenient - 100m) before allowing clock-out.
/// Updates local state immediately (optimistic) and queues sync.
///
/// **Preconditions:**
/// - Visit must be in progress (clocked in)
/// - Agent should be within 100m of outlet (warning only, not blocking)
///
/// **Errors:**
/// - [InvalidVisitStateFailure] if visit not in progress
/// - [GeofenceViolationFailure] if outside 100m radius (optional warning)
class ClockOutVisitUseCase {
  final OutletVisitRepository _repository;

  ClockOutVisitUseCase(this._repository);

  /// Clock out from a visit.
  ///
  /// [visitLocalId] - Local ID of the visit
  /// [latitude] - Current GPS latitude
  /// [longitude] - Current GPS longitude
  /// [accuracyMeters] - GPS accuracy in meters
  /// [notes] - Optional notes for clock-out
  /// [forceClockOut] - If true, clock out even if outside geofence
  Future<Either<Failure, OutletVisit>> call({
    required String visitLocalId,
    required double latitude,
    required double longitude,
    required double accuracyMeters,
    String? notes,
    bool forceClockOut = false,
  }) async {
    // Get the visit to validate state
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

      // Validate visit is in progress
      if (!visit.canClockOut) {
        return Left(
          InvalidVisitStateFailure(
            currentStatus: visit.status.name,
            operation: 'clock out',
          ),
        );
      }

      // Validate geofence (100m - more lenient than clock-in)
      // This is a warning, not blocking, unless forceClockOut is false
      final distance = _calculateDistance(
        latitude,
        longitude,
        visit.outletLatitude,
        visit.outletLongitude,
      );

      const clockOutRadius = 100.0; // More lenient than clock-in

      if (distance > clockOutRadius && !forceClockOut) {
        return Left(
          GeofenceViolationFailure(
            userLatitude: latitude,
            userLongitude: longitude,
            outletLatitude: visit.outletLatitude,
            outletLongitude: visit.outletLongitude,
            distanceMeters: distance,
            requiredRadiusMeters: clockOutRadius,
            canRequestOverride: false, // No override for clock-out, just force
          ),
        );
      }

      // Clock out
      return _repository.clockOut(
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

  double _taylorSin(double x) {
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

  double _newtonSqrt(double x) {
    if (x == 0) return 0;
    double guess = x / 2;
    for (int i = 0; i < 20; i++) {
      guess = (guess + x / guess) / 2;
    }
    return guess;
  }

  double _approximateAtan2(double y, double x) {
    const double pi = 3.141592653589793;
    if (x > 0) return _atan(y / x);
    if (x < 0 && y >= 0) return _atan(y / x) + pi;
    if (x < 0 && y < 0) return _atan(y / x) - pi;
    if (x == 0 && y > 0) return pi / 2;
    if (x == 0 && y < 0) return -pi / 2;
    return 0;
  }

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
