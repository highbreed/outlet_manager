import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

import 'location_data.dart';

/// Service for handling location tracking and permissions
/// with dynamic polling intervals for battery optimization
class LocationService {
  StreamSubscription<Position>? _positionStreamSubscription;
  final _locationController = StreamController<LocationData>.broadcast();
  Timer? _pollingTimer;

  bool _isTracking = false;
  Duration _currentInterval = const Duration(
    minutes: 2,
  ); // Default: inside geofence

  // Configuration
  static const Duration normalInterval = Duration(
    minutes: 2,
  ); // Inside geofence
  static const Duration outsideInterval = Duration(
    seconds: 30,
  ); // Outside geofence
  static const double accuracyThreshold = 200.0; // meters

  /// Stream of real-time location updates
  Stream<LocationData> get locationStream => _locationController.stream;

  /// Stream of Position updates (for geofence manager)
  Stream<Position> get positionStream => locationStream.map(
    (loc) => Position(
      latitude: loc.latitude,
      longitude: loc.longitude,
      timestamp: DateTime.now(),
      accuracy: loc.accuracy,
      altitude: 0.0,
      altitudeAccuracy: 0.0,
      heading: 0.0,
      headingAccuracy: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
    ),
  );

  /// Check if currently tracking
  bool get isTracking => _isTracking;

  /// Check if location services are enabled on the device
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  /// Get current permission status
  Future<LocationPermissionStatus> checkPermission() async {
    final permission = await Geolocator.checkPermission();
    return _convertPermission(permission);
  }

  /// Request location permission
  Future<LocationPermissionStatus> requestPermission() async {
    // First check if location service is enabled
    final serviceEnabled = await isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationServiceDisabledException(
        'Location services are disabled. Please enable location services.',
      );
    }

    // Request permission
    final permission = await Geolocator.requestPermission();
    return _convertPermission(permission);
  }

  /// Open app settings for manual permission grant
  Future<bool> openAppSettings() async {
    return await ph.openAppSettings();
  }

  /// Open location settings
  Future<bool> openLocationSettings() async {
    return await Geolocator.openLocationSettings();
  }

  /// Get current location, acquiring the best fix available within [timeout].
  ///
  /// A single quick reading is unreliable (especially indoors, where the
  /// device often reports a network/cell-based fix of 1000m+ before GPS
  /// locks on). Instead this listens to a position stream, keeps the most
  /// accurate reading seen, and resolves early once it clears
  /// [accuracyThreshold]. If the timeout elapses first, it returns the best
  /// reading found so far rather than failing outright.
  ///
  /// [onUpdate] is invoked with each improved reading, so callers can show
  /// live "acquiring GPS…" progress instead of a blocking spinner.
  Future<LocationData> getCurrentLocation({
    Duration timeout = const Duration(seconds: 15),
    void Function(LocationData location)? onUpdate,
  }) async {
    final permission = await checkPermission();
    if (permission != LocationPermissionStatus.granted) {
      throw PermissionDeniedException('Location permission not granted');
    }

    final serviceEnabled = await isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationServiceDisabledException('Location services are disabled');
    }

    Position? best;
    final completer = Completer<Position>();
    final subscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 0,
      ),
    ).listen(
      (position) {
        if (best == null || position.accuracy < best!.accuracy) {
          best = position;
          onUpdate?.call(LocationData.fromPosition(position));
        }
        if (position.accuracy <= accuracyThreshold && !completer.isCompleted) {
          completer.complete(position);
        }
      },
      onError: (Object e) {
        if (!completer.isCompleted) completer.completeError(e);
      },
    );

    try {
      final position = await completer.future.timeout(
        timeout,
        onTimeout: () {
          final fallback = best;
          if (fallback != null) return fallback;
          throw LocationFetchException('Timed out acquiring GPS fix');
        },
      );
      return LocationData.fromPosition(position);
    } catch (e) {
      final fallback = best;
      if (fallback != null) return LocationData.fromPosition(fallback);
      throw LocationFetchException('Failed to get current location: $e');
    } finally {
      await subscription.cancel();
    }
  }

  /// Start tracking location in real-time with dynamic polling
  Future<void> startTracking({Duration? interval}) async {
    if (_isTracking) return;

    _currentInterval = interval ?? normalInterval;

    // Check permission
    final permission = await checkPermission();
    if (permission != LocationPermissionStatus.granted) {
      throw PermissionDeniedException('Location permission not granted');
    }

    _isTracking = true;

    // Use polling for better battery management
    _startPolling();
  }

  /// Stop tracking location
  Future<void> stopTracking() async {
    _isTracking = false;
    _pollingTimer?.cancel();
    _pollingTimer = null;
    await _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
  }

  /// Start polling for location updates
  void _startPolling() {
    // Get initial position immediately
    _pollLocation();

    // Schedule periodic updates
    _pollingTimer = Timer.periodic(_currentInterval, (_) {
      _pollLocation();
    });
  }

  /// Poll for single location update
  Future<void> _pollLocation() async {
    if (!_isTracking) return;

    try {
      final position = await getCurrentLocation();
      _locationController.add(position);
    } catch (e) {
      // Silent fail, will retry on next poll
    }
  }

  /// Change polling interval (e.g., when outside geofence)
  void setPollingInterval(Duration interval) {
    if (_currentInterval == interval) return;

    _currentInterval = interval;

    if (_isTracking) {
      _pollingTimer?.cancel();
      _startPolling();
    }
  }

  /// Switch to fast polling (30 seconds)
  void enableFastPolling() {
    setPollingInterval(outsideInterval);
  }

  /// Switch to normal polling (2 minutes)
  void enableNormalPolling() {
    setPollingInterval(normalInterval);
  }

  /// Calculate distance between two points in meters
  double calculateDistance(
    double startLat,
    double startLng,
    double endLat,
    double endLng,
  ) {
    return Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
  }

  /// Clean up resources
  void dispose() {
    _pollingTimer?.cancel();
    _positionStreamSubscription?.cancel();
    _locationController.close();
  }

  LocationPermissionStatus _convertPermission(LocationPermission permission) {
    switch (permission) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        return LocationPermissionStatus.granted;
      case LocationPermission.denied:
        return LocationPermissionStatus.denied;
      case LocationPermission.deniedForever:
        return LocationPermissionStatus.deniedForever;
      case LocationPermission.unableToDetermine:
        return LocationPermissionStatus.notDetermined;
    }
  }
}

/// Exception thrown when location permission is denied
class PermissionDeniedException implements Exception {
  final String message;
  PermissionDeniedException(this.message);

  @override
  String toString() => message;
}

/// Exception thrown when location services are disabled
class LocationServiceDisabledException implements Exception {
  final String message;
  LocationServiceDisabledException(this.message);

  @override
  String toString() => message;
}

/// Exception thrown when fetching location fails
class LocationFetchException implements Exception {
  final String message;
  LocationFetchException(this.message);

  @override
  String toString() => message;
}
