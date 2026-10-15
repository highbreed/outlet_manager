import 'package:geolocator/geolocator.dart';

/// Represents a location data point with timestamp
class LocationData {
  final double latitude;
  final double longitude;
  final double accuracy;
  final double altitude;
  final double speed;
  final double heading;
  final DateTime timestamp;

  /// Whether the OS reported this fix as coming from a mock location
  /// provider (Android: `Location.isFromMockProvider()`, surfaced by
  /// `geolocator` as `Position.isMocked`; the `flutter_background_geolocation`
  /// plugin surfaces the same signal as `Location.mock`). A field-confirmed
  /// fraud case (fake-GPS clock-ins passing geofence checks with a
  /// suspiciously exact 1.0m accuracy, zero altitude, and a nonzero
  /// "speed" on a perfectly stationary point) showed this flag was being
  /// read from the OS but silently dropped before ever reaching the
  /// clock-in request. Only catches the official Android mock-location
  /// mechanism (Developer Options → "Select mock location app") — a
  /// spoofer using root/Xposed to hook the location APIs directly can
  /// still evade this flag.
  final bool isMocked;

  const LocationData({
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.altitude,
    required this.speed,
    required this.heading,
    required this.timestamp,
    required this.isMocked,
  });

  /// Create LocationData from Geolocator Position
  factory LocationData.fromPosition(Position position) {
    return LocationData(
      latitude: position.latitude,
      longitude: position.longitude,
      accuracy: position.accuracy,
      altitude: position.altitude,
      speed: position.speed,
      heading: position.heading,
      timestamp: position.timestamp,
      isMocked: position.isMocked,
    );
  }

  @override
  String toString() {
    return 'LocationData(lat: ${latitude.toStringAsFixed(6)}, lng: ${longitude.toStringAsFixed(6)})';
  }
}

/// Permission status for location access
enum LocationPermissionStatus { granted, denied, deniedForever, notDetermined }
