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

  const LocationData({
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.altitude,
    required this.speed,
    required this.heading,
    required this.timestamp,
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
    );
  }

  @override
  String toString() {
    return 'LocationData(lat: ${latitude.toStringAsFixed(6)}, lng: ${longitude.toStringAsFixed(6)})';
  }
}

/// Permission status for location access
enum LocationPermissionStatus { granted, denied, deniedForever, notDetermined }
