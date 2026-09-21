import 'dart:async';
import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

import 'location_data.dart';

/// Service for handling location tracking and permissions
/// with dynamic polling intervals for battery optimization
class LocationService {
  StreamSubscription<Position>? _positionStreamSubscription;
  final _locationController = StreamController<LocationData>.broadcast();
  Timer? _pollingTimer;

  // Anchors geolocator_android's bundled foreground service for the
  // duration of an active tracking session (see _startAndroidForegroundService).
  // Not used as a data source — _pollingTimer/getCurrentLocation() remain
  // the actual source of readings; this subscription's only job is to keep
  // itself open so Android treats the app as running a genuine foreground
  // service (with its own required notification) instead of an ordinary
  // backgrounded process, which Doze/App Standby/OEM battery managers are
  // free to throttle or kill. Per geolocator_android's own docs this raises
  // priority and makes the process less likely to be killed — it does not
  // guarantee background execution the way it would for iOS.
  StreamSubscription<Position>? _foregroundServiceSubscription;

  // Sticky, not just "was there a subscription to cancel". Confirmed
  // on-device: LocationService.startTracking() runs from main.dart at app
  // launch, and a screen's pauseForegroundAnchor() call can race it — if
  // the anchor's own _startAndroidForegroundService() call hasn't reached
  // the point of assigning _foregroundServiceSubscription yet when pause
  // runs, there's nothing to cancel, and the anchor opens moments later
  // regardless, undoing the pause and recreating the exact conflict this
  // exists to avoid. Guarding _startAndroidForegroundService itself on this
  // flag closes that window, however the two calls interleave.
  bool _isAnchorPaused = false;

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

  /// Continuous location updates for a caller that needs to keep watching
  /// position over time (e.g. a screen showing live distance-to-outlet) —
  /// unlike [getCurrentLocation], which opens and closes its own stream on
  /// every call, this keeps a single native location request open for as
  /// long as the returned stream has a listener. Opening/closing a fresh
  /// request repeatedly (a screen re-polling via [getCurrentLocation] on a
  /// timer, say) is what makes Android's location-in-use indicator blink
  /// on and off — a real signal, not cosmetic, that the request pattern is
  /// wasteful. Callers should keep the subscription open, not call this
  /// again on a timer.
  ///
  /// Independent of [startTracking]/[stopTracking] and [locationStream] —
  /// those drive the app-wide clocked-in tracking session; this is a
  /// separate, screen-scoped stream a caller owns and cancels itself.
  Stream<LocationData> watchLocation({
    LocationAccuracy accuracy = LocationAccuracy.best,
    int distanceFilter = 0,
  }) {
    return Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: accuracy,
        distanceFilter: distanceFilter,
      ),
    ).map(LocationData.fromPosition);
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

    // Android only: keep geolocator_android's bundled foreground service
    // alive for the session so the OS is less likely to throttle/kill the
    // polling above once the screen locks or the app is backgrounded.
    if (Platform.isAndroid) {
      await _startAndroidForegroundService();
    }
  }

  /// Temporarily releases the app-wide foreground-anchor stream's
  /// underlying Geolocator request. geolocator_android shares a single
  /// native engine across every concurrent stream request from this app —
  /// with two requests open at once (this anchor, plus e.g. a screen's own
  /// [watchLocation]), the *newer* one can simply never receive a callback
  /// even though the OS is actively producing fixes. Confirmed live: the
  /// anchor stream (medium accuracy, always-on since app launch) was
  /// silently starving `visit_detail_screen`'s `watchLocation()` stream —
  /// GPS locked with 17+ satellites, but zero deliveries to the second
  /// listener, matching Android's own `FusedLocation: ... blocked` log
  /// lines for a starved concurrent listener.
  ///
  /// Callers that need their own continuous stream should pause this
  /// first and call [resumeForegroundAnchor] when done (e.g. in a
  /// `dispose()`). The "Active Session" notification/wake lock this
  /// anchors doesn't disappear in between — Android just doesn't tear the
  /// foreground service down immediately, and it's re-requested as soon as
  /// [resumeForegroundAnchor] runs.
  Future<void> pauseForegroundAnchor() async {
    _isAnchorPaused = true;
    await _foregroundServiceSubscription?.cancel();
    _foregroundServiceSubscription = null;
  }

  /// Restores the foreground-anchor stream after [pauseForegroundAnchor].
  /// A no-op if tracking isn't currently active — nothing to anchor for.
  Future<void> resumeForegroundAnchor() async {
    _isAnchorPaused = false;
    if (_isTracking && Platform.isAndroid) {
      await _startAndroidForegroundService();
    }
  }

  /// Stop tracking location
  Future<void> stopTracking() async {
    _isTracking = false;
    _pollingTimer?.cancel();
    _pollingTimer = null;
    await _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
    await _foregroundServiceSubscription?.cancel();
    _foregroundServiceSubscription = null;
  }

  /// Opens a long-lived position stream configured with
  /// [ForegroundNotificationConfig], which is what tells geolocator_android
  /// to run its bundled `GeolocatorLocationService` as a real Android
  /// foreground service (with its own required notification) instead of
  /// running as an ordinary background process. The stream stays open for
  /// the whole tracking session — [stopTracking] cancels it — since the
  /// service stops as soon as the subscription does.
  ///
  /// Deliberately not wired into [_locationController]: readings still
  /// come from [_pollLocation]'s timer, which keeps the existing
  /// wait-for-best-fix behavior in [getCurrentLocation] unchanged. This
  /// subscription's only job is keeping itself open.
  Future<void> _startAndroidForegroundService() async {
    // A pause that's raced by a concurrent startTracking()/resume must
    // win — see _isAnchorPaused's doc comment. Whichever of the two calls
    // reaches this method second is the one that actually decides whether
    // the stream opens, since both just set state and call this.
    if (_isAnchorPaused) return;
    await _foregroundServiceSubscription?.cancel();
    // Re-check: pauseForegroundAnchor() may have run during the await
    // above — it's the only suspension point between here and the
    // synchronous Geolocator call below that actually opens the stream.
    if (_isAnchorPaused) return;
    _foregroundServiceSubscription = Geolocator.getPositionStream(
      locationSettings: AndroidSettings(
        accuracy: LocationAccuracy.medium,
        distanceFilter: 0,
        intervalDuration: _currentInterval,
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationTitle: 'Active Session',
          notificationText: 'Tracking your location for this outlet visit',
          notificationChannelName: 'Location Tracking',
          setOngoing: true,
          // Without this the CPU can still fully sleep once the screen
          // locks, so the polling timer's location events just batch up
          // and arrive whenever something next wakes the device instead of
          // on schedule. Held for the whole clocked-in session — a real,
          // deliberate battery cost in exchange for pings actually keeping
          // their normal cadence while locked.
          enableWakeLock: true,
        ),
      ),
    ).listen(
      (_) {},
      // Best-effort keep-alive — a stream error here shouldn't take down
      // the polling-based tracking that's doing the actual work.
      onError: (_) {},
    );
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
    _foregroundServiceSubscription?.cancel();
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
