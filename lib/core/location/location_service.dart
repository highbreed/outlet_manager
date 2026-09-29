import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

import 'location_data.dart';

/// Permission checks, one-shot location reads, and settings shortcuts —
/// the continuous-stream tracking this class used to own (foreground-
/// anchor service, dynamic polling, watchLocation) was removed once
/// flutter_background_geolocation became the sole continuous-tracking
/// engine (see the "Phase 3" plan, Stage 4). What remains here never held
/// a long-lived stream open, so it can't contend with that engine or with
/// itself — confirmed via design review, see the plan's "Verified via
/// exploration" section.
class LocationService {
  static const double accuracyThreshold = 200.0; // meters

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

  /// Calculate distance between two points in meters
  double calculateDistance(
    double startLat,
    double startLng,
    double endLat,
    double endLng,
  ) {
    return Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
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
