import 'dart:math' as math;

/// Use case for validating if a location is within a geofence
class ValidateLocationUseCase {
  /// Check if current location is within geofence radius
  /// Returns distance in meters
  double call({
    required double currentLat,
    required double currentLon,
    required double centerLat,
    required double centerLon,
    required double radiusMeters,
  }) {
    final distance = _calculateDistance(
      currentLat,
      currentLon,
      centerLat,
      centerLon,
    );

    return distance;
  }

  /// Check if within geofence
  bool isWithinGeofence({
    required double currentLat,
    required double currentLon,
    required double centerLat,
    required double centerLon,
    required double radiusMeters,
  }) {
    final distance = call(
      currentLat: currentLat,
      currentLon: currentLon,
      centerLat: centerLat,
      centerLon: centerLon,
      radiusMeters: radiusMeters,
    );

    return distance <= radiusMeters;
  }

  /// Calculate distance between two coordinates using Haversine formula
  /// Returns distance in meters
  double _calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const earthRadiusKm = 6371.0;

    final dLat = _degreesToRadians(lat2 - lat1);
    final dLon = _degreesToRadians(lon2 - lon1);

    final lat1Rad = _degreesToRadians(lat1);
    final lat2Rad = _degreesToRadians(lat2);

    final a =
        math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.sin(dLon / 2) *
            math.sin(dLon / 2) *
            math.cos(lat1Rad) *
            math.cos(lat2Rad);

    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    final distanceKm = earthRadiusKm * c;
    return distanceKm * 1000; // Convert to meters
  }

  double _degreesToRadians(double degrees) {
    return degrees * math.pi / 180;
  }
}
