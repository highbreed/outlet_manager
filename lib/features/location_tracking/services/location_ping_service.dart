import 'dart:async';
import 'dart:math';

import 'package:battery_plus/battery_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:uuid/uuid.dart';

import '../../../core/location/location_data.dart';
import '../../../core/location/location_service.dart';
import '../domain/entities/location_ping.dart';
import '../domain/repositories/location_ping_repository.dart';

/// Tracking mode determines the sensitivity and frequency of location pings.
enum TrackingMode {
  /// Normal mode: heartbeat every 5 minutes, 50-100m distance trigger
  normal,

  /// High precision mode: for active visits/navigation
  /// 20-30m distance filter, 10-20s interval
  highPrecision,

  /// Low power mode: heartbeat every 15-30 minutes
  lowPower,
}

/// Service for managing location ping tracking.
///
/// Implements a three-trigger strategy:
/// 1. **Significant change** - Posts when moved ≥50-100m with good accuracy
/// 2. **Heartbeat** - Posts "still here" pings at regular intervals
/// 3. **High-precision mode** - During visits/navigation with tighter thresholds
class LocationPingService {
  final LocationService _locationService;
  final LocationPingRepository _repository;
  final Connectivity _connectivity;
  final Battery _battery;

  Timer? _foregroundTimer;
  StreamSubscription<LocationData>? _significantChangeSubscription;
  Timer? _syncTimer;
  DateTime? _lastPingTime;
  LocationData? _lastPingLocation;
  bool _isTracking = false;
  TrackingMode _currentMode = TrackingMode.normal;

  // === Mode-specific Configuration ===

  // Normal mode (on-duty, clocked-in)
  static const int normalHeartbeatSeconds = 300; // 5 minutes
  static const double normalDistanceMeters = 75.0; // 50-100m range
  static const double normalAccuracyThreshold = 50.0; // Good accuracy required
  static const int normalMinIntervalSeconds = 45; // ~30-60s rate limit

  // High-precision mode (active visit or en-route)
  static const int highPrecisionIntervalSeconds = 15; // 10-20s
  static const double highPrecisionDistanceMeters = 25.0; // 20-30m
  static const double highPrecisionAccuracyThreshold = 30.0; // Tighter accuracy
  static const int highPrecisionMinIntervalSeconds = 10;

  // Low-power mode (off-duty or ultra-low usage)
  static const int lowPowerHeartbeatSeconds = 1200; // 20 minutes (15-30 range)
  static const double lowPowerDistanceMeters = 150.0; // Wider distance
  static const double lowPowerAccuracyThreshold = 100.0; // Relaxed accuracy
  static const int lowPowerMinIntervalSeconds = 120;

  // Global limits
  static const double maxAccuracyMeters =
      200.0; // Reject very inaccurate readings

  // Sync pending pings every 2 minutes
  static const int syncIntervalSeconds = 120;

  LocationPingService({
    required LocationService locationService,
    required LocationPingRepository repository,
    Connectivity? connectivity,
    Battery? battery,
  }) : _locationService = locationService,
       _repository = repository,
       _connectivity = connectivity ?? Connectivity(),
       _battery = battery ?? Battery();

  /// Whether foreground tracking is currently active.
  bool get isTracking => _isTracking;

  /// Current tracking mode.
  TrackingMode get currentMode => _currentMode;

  /// Current heartbeat interval based on mode.
  int get currentHeartbeatSeconds => switch (_currentMode) {
    TrackingMode.normal => normalHeartbeatSeconds,
    TrackingMode.highPrecision => highPrecisionIntervalSeconds,
    TrackingMode.lowPower => lowPowerHeartbeatSeconds,
  };

  /// Current distance threshold based on mode.
  double get currentDistanceThreshold => switch (_currentMode) {
    TrackingMode.normal => normalDistanceMeters,
    TrackingMode.highPrecision => highPrecisionDistanceMeters,
    TrackingMode.lowPower => lowPowerDistanceMeters,
  };

  /// Time of last successful ping.
  DateTime? get lastPingTime => _lastPingTime;

  /// Location of last successful ping.
  LocationData? get lastPingLocation => _lastPingLocation;

  /// Start foreground tracking (when app is active).
  ///
  /// Sends an immediate ping, then monitors for significant changes
  /// and sends heartbeat pings at regular intervals.
  void startForegroundTracking({TrackingMode mode = TrackingMode.normal}) {
    if (_isTracking) {
      // If already tracking, just switch mode
      if (_currentMode != mode) {
        setTrackingMode(mode);
      }
      return;
    }

    _isTracking = true;
    _currentMode = mode;

    // Send immediate ping on start
    _captureAndSendPing(PingSource.foreground, isHeartbeat: true);

    // Start heartbeat timer (Trigger B)
    _startHeartbeatTimer();

    // Start significant change monitoring (Trigger A)
    _startSignificantChangeMonitoring();

    // Start periodic sync timer
    _startPeriodicSync();
  }

  /// Stop foreground tracking.
  ///
  /// Returns a Future (existing callers that don't await it are
  /// unaffected) so a caller that specifically needs the underlying
  /// Geolocator stream fully released before opening its own — e.g.
  /// VisitDetailScreen, avoiding the same geolocator_android
  /// single-native-engine conflict LocationService.pauseForegroundAnchor's
  /// doc comment describes — actually can wait for it.
  Future<void> stopForegroundTracking() async {
    _isTracking = false;
    _foregroundTimer?.cancel();
    _foregroundTimer = null;
    await _significantChangeSubscription?.cancel();
    _significantChangeSubscription = null;
    _syncTimer?.cancel();
    _syncTimer = null;
  }

  /// Switch tracking mode (e.g., entering a visit).
  void setTrackingMode(TrackingMode mode) {
    if (_currentMode == mode) return;

    _currentMode = mode;

    if (_isTracking) {
      // Restart timers with new intervals
      _foregroundTimer?.cancel();
      _significantChangeSubscription?.cancel();
      _syncTimer?.cancel();
      _startHeartbeatTimer();
      _startSignificantChangeMonitoring();
      _startPeriodicSync();
    }
  }

  /// Enter high-precision mode (for active visits/navigation).
  void enterHighPrecisionMode() => setTrackingMode(TrackingMode.highPrecision);

  /// Exit high-precision mode, return to normal.
  void exitHighPrecisionMode() => setTrackingMode(TrackingMode.normal);

  /// Enter low-power mode.
  void enterLowPowerMode() => setTrackingMode(TrackingMode.lowPower);

  /// Send a manual ping (user-triggered, bypasses rate limits).
  Future<void> sendManualPing() async {
    await _captureAndSendPing(PingSource.manual, bypassRateLimit: true);
  }

  /// Send a geofence event ping.
  Future<void> sendGeofenceEventPing() async {
    await _captureAndSendPing(PingSource.geofenceEvent);
  }

  // === Private Methods ===

  /// Start the heartbeat timer (Trigger B).
  void _startHeartbeatTimer() {
    _foregroundTimer?.cancel();
    _foregroundTimer = Timer.periodic(
      Duration(seconds: currentHeartbeatSeconds),
      (_) => _captureAndSendPing(PingSource.foreground, isHeartbeat: true),
    );
  }

  /// Start significant change monitoring (Trigger A).
  ///
  /// One continuous position stream for as long as tracking is active,
  /// rather than a Timer repeatedly opening/closing a one-shot fetch every
  /// 5-15 seconds — the latter is what made Android's location-in-use
  /// indicator blink continuously on every screen except visit-detail
  /// (which got the same fix earlier), since this runs app-wide for the
  /// whole time tracking is on, independent of whatever screen is showing.
  /// See LocationService.watchLocation. The distanceFilter also means the
  /// OS itself only emits events once the mode's movement threshold is
  /// crossed, instead of Dart re-checking distance on every poll.
  void _startSignificantChangeMonitoring() {
    _significantChangeSubscription?.cancel();
    _significantChangeSubscription = _locationService
        .watchLocation(distanceFilter: currentDistanceThreshold.round())
        .listen(
          _evaluateSignificantChange,
          onError: (_) {}, // Location not available — try again on the next update.
        );
  }

  /// Start periodic sync timer to send pending pings.
  void _startPeriodicSync() {
    _syncTimer?.cancel();
    _syncTimer = Timer.periodic(
      const Duration(seconds: syncIntervalSeconds),
      (_) => _syncPendingInBackground(),
    );
  }

  /// Sync pending pings in the background without blocking.
  Future<void> _syncPendingInBackground() async {
    try {
      await syncPendingPings();
    } catch (_) {
      // Silently fail, will retry on next interval
    }
  }

  /// Evaluate a position-stream update against the significant-change
  /// conditions (Trigger A) — called for every event from the continuous
  /// stream [_startSignificantChangeMonitoring] opens, not a poll.
  Future<void> _evaluateSignificantChange(LocationData currentLocation) async {
    if (!_isTracking) return;

    // Get mode-specific thresholds
    final accuracyThreshold = switch (_currentMode) {
      TrackingMode.normal => normalAccuracyThreshold,
      TrackingMode.highPrecision => highPrecisionAccuracyThreshold,
      TrackingMode.lowPower => lowPowerAccuracyThreshold,
    };

    // Accuracy check (Trigger A condition: accuracy must be good)
    if (currentLocation.accuracy > accuracyThreshold) {
      return; // Not accurate enough for significant change detection
    }

    // Rate limit check
    final minInterval = switch (_currentMode) {
      TrackingMode.normal => normalMinIntervalSeconds,
      TrackingMode.highPrecision => highPrecisionMinIntervalSeconds,
      TrackingMode.lowPower => lowPowerMinIntervalSeconds,
    };

    if (_lastPingTime != null) {
      final elapsed = DateTime.now().difference(_lastPingTime!).inSeconds;
      if (elapsed < minInterval) {
        return; // Too soon since last ping
      }
    }

    // Distance check (Trigger A main condition)
    if (_lastPingLocation != null) {
      final distance = _calculateDistance(
        _lastPingLocation!.latitude,
        _lastPingLocation!.longitude,
        currentLocation.latitude,
        currentLocation.longitude,
      );

      if (distance < currentDistanceThreshold) {
        return; // Haven't moved significantly
      }
    }

    // All conditions met - send significant change ping
    await _captureAndSendPing(
      PingSource.foreground,
      preloadedLocation: currentLocation,
    );
  }

  /// Capture location and send/queue ping.
  Future<void> _captureAndSendPing(
    PingSource source, {
    bool isHeartbeat = false,
    bool bypassRateLimit = false,
    LocationData? preloadedLocation,
  }) async {
    // Rate limiting check (skip for manual pings and bypasses)
    if (!bypassRateLimit &&
        source != PingSource.manual &&
        _lastPingTime != null) {
      final minInterval = switch (_currentMode) {
        TrackingMode.normal => normalMinIntervalSeconds,
        TrackingMode.highPrecision => highPrecisionMinIntervalSeconds,
        TrackingMode.lowPower => lowPowerMinIntervalSeconds,
      };

      final elapsed = DateTime.now().difference(_lastPingTime!).inSeconds;
      if (elapsed < minInterval) {
        return; // Too soon, skip
      }
    }

    // Get current location (or use preloaded)
    late final LocationData locationData;
    if (preloadedLocation != null) {
      locationData = preloadedLocation;
    } else {
      try {
        locationData = await _locationService.getCurrentLocation();
      } catch (_) {
        return; // Location not available (permission denied or service disabled)
      }
    }

    // Accuracy check (skip for geofence events which may be less accurate)
    if (source != PingSource.geofenceEvent &&
        locationData.accuracy > maxAccuracyMeters) {
      return; // Too inaccurate, skip
    }

    // Get device context
    final batteryLevel = await _getBatteryLevel();
    final isCharging = await _isCharging();
    final networkType = await _getNetworkType();

    // Build ping
    final ping = LocationPing(
      localId: const Uuid().v4(),
      latitude: locationData.latitude,
      longitude: locationData.longitude,
      accuracyMeters: locationData.accuracy,
      altitudeMeters: locationData.altitude,
      speedMps: locationData.speed,
      headingDegrees: locationData.heading,
      batteryLevel: batteryLevel,
      isCharging: isCharging,
      networkType: networkType,
      pingSource: source,
      recordedAt: DateTime.now(),
    );

    // Update last ping info
    _lastPingTime = DateTime.now();
    _lastPingLocation = locationData;

    // Save locally first (always)
    await _repository.savePingLocally(ping);

    // Try to send immediately if online
    final connectivityResult = await _connectivity.checkConnectivity();
    final isOnline =
        connectivityResult.isNotEmpty &&
        !connectivityResult.contains(ConnectivityResult.none);

    if (isOnline) {
      final result = await _repository.sendPing(ping);
      result.fold(
        (failure) {
          // Already saved locally, will be synced later
        },
        (response) {
          // Server can override heartbeat interval if needed
          // but we don't change distance thresholds from server
        },
      );
    }
  }

  /// Calculate distance between two points in meters (Haversine formula).
  double _calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double earthRadius = 6371000; // meters

    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);

    final a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  double _toRadians(double degrees) => degrees * pi / 180;

  /// Sync all pending pings (called when coming online).
  Future<SyncResult> syncPendingPings() async {
    final pendingPings = await _repository.getPendingPings();

    if (pendingPings.isEmpty) {
      return SyncResult(total: 0, synced: 0, failed: 0);
    }

    int synced = 0;
    int failed = 0;

    for (final ping in pendingPings) {
      final result = await _repository.sendPing(ping);
      result.fold((failure) => failed++, (response) => synced++);
    }

    return SyncResult(
      total: pendingPings.length,
      synced: synced,
      failed: failed,
    );
  }

  /// Clean up old synced pings.
  Future<int> cleanup({Duration retention = const Duration(days: 7)}) async {
    return _repository.cleanupOldPings(retention: retention);
  }

  /// Get ping statistics.
  Future<Map<LocationPingSyncState, int>> getStats() async {
    return _repository.getPingStats();
  }

  /// Get last ping info.
  Future<LocationPing?> getLastPing() async {
    return _repository.getLastPing();
  }

  // === Device Context Helpers ===

  Future<int?> _getBatteryLevel() async {
    try {
      return await _battery.batteryLevel;
    } catch (_) {
      return null;
    }
  }

  Future<bool?> _isCharging() async {
    try {
      final state = await _battery.batteryState;
      return state == BatteryState.charging || state == BatteryState.full;
    } catch (_) {
      return null;
    }
  }

  Future<String?> _getNetworkType() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result.contains(ConnectivityResult.wifi)) {
        return 'wifi';
      } else if (result.contains(ConnectivityResult.mobile)) {
        return 'cellular';
      } else if (result.contains(ConnectivityResult.none)) {
        return 'none';
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  /// Dispose resources.
  void dispose() {
    stopForegroundTracking();
  }
}

/// Result of sync operation.
class SyncResult {
  final int total;
  final int synced;
  final int failed;

  const SyncResult({
    required this.total,
    required this.synced,
    required this.failed,
  });

  bool get hasFailures => failed > 0;
  bool get allSynced => synced == total;
}
