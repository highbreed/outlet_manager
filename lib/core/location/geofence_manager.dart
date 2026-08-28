import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:isar_community/isar.dart';

import '../database/models/clock_in_session_model.dart';
import '../database/models/clock_session_event_model.dart';
import '../notifications/notification_service.dart';
import 'location_service.dart';

/// Manages geofence monitoring for active clock-in sessions
/// with exit confirmation logic (2 consecutive readings OR 3 minutes continuous)
class GeofenceManager {
  final LocationService locationService;
  final Isar isar;
  final NotificationService notificationService;

  StreamSubscription<Position>? _locationSubscription;
  Timer? _exitConfirmationTimer;

  // Geofence configuration (from session)
  double? _centerLat;
  double? _centerLon;
  double? _radiusMeters;
  int? _graceMinutes;

  // Exit tracking state
  DateTime? _firstOutsideReading;
  int _consecutiveOutsideReadings = 0;
  int _consecutiveInsideReadings = 0;
  bool _isConfirmedOutside = false;

  // Session context
  String? _outletName;

  GeofenceManager({
    required this.locationService,
    required this.isar,
    required this.notificationService,
  });

  /// Start monitoring geofence for active session
  Future<void> startMonitoring(
    ClockInSessionModel session, {
    String? outletName,
  }) async {
    _centerLat = session.clockInLatitude;
    _centerLon = session.clockInLongitude;
    _radiusMeters = session.geofenceRadiusMeters;
    _graceMinutes = session.autoClockoutGraceMinutes;
    _outletName = outletName ?? 'Outlet';

    // Reset state
    _firstOutsideReading = session.firstOutsideReadingAt;
    _consecutiveOutsideReadings = session.consecutiveOutsideReadings;
    _consecutiveInsideReadings = session.consecutiveInsideReadings;
    _isConfirmedOutside = session.confirmedExitAt != null;

    // Show persistent notification for active session
    await notificationService.showPersistentSession(
      outletName: _outletName!,
      clockInTime: session.clockedInAt,
    );

    // Start location tracking with normal interval (2 minutes)
    await locationService.startTracking();

    // Subscribe to position updates
    _locationSubscription = locationService.positionStream.listen(
      (position) => _handleLocationUpdate(position, session),
    );
  }

  /// Stop monitoring
  Future<void> stopMonitoring() async {
    await _locationSubscription?.cancel();
    _locationSubscription = null;
    _exitConfirmationTimer?.cancel();
    _exitConfirmationTimer = null;
    await locationService.stopTracking();

    // Clear all notifications
    await notificationService.clearPersistentNotification();
    await notificationService.clearGeofenceNotifications();
  }

  /// Handle location update and check geofence status
  Future<void> _handleLocationUpdate(
    Position position,
    ClockInSessionModel session,
  ) async {
    if (_centerLat == null || _centerLon == null || _radiusMeters == null) {
      return;
    }

    // Check if position is accurate enough
    if (position.accuracy > LocationService.accuracyThreshold) {
      // Log accuracy degraded event
      await _logEvent(
        session.localId,
        ClockSessionEventType.accuracyDegraded,
        position,
        {'accuracy': position.accuracy},
      );
      return; // Skip this reading
    }

    // Calculate distance with buffer zone (10m)
    final distance = locationService.calculateDistance(
      position.latitude,
      position.longitude,
      _centerLat!,
      _centerLon!,
    );

    final isInside = distance <= (_radiusMeters! + 10); // 10m buffer

    if (isInside) {
      await _handleInsideGeofence(position, session);
    } else {
      await _handleOutsideGeofence(position, session);
    }
  }

  /// Handle position inside geofence
  Future<void> _handleInsideGeofence(
    Position position,
    ClockInSessionModel session,
  ) async {
    _consecutiveInsideReadings++;
    _consecutiveOutsideReadings = 0;

    // If we were confirmed outside, check for re-entry
    if (_isConfirmedOutside && _consecutiveInsideReadings >= 2) {
      // Confirmed re-entry!
      _isConfirmedOutside = false;
      _firstOutsideReading = null;

      // Cancel any pending auto-clockout
      _exitConfirmationTimer?.cancel();
      _exitConfirmationTimer = null;

      // Switch back to normal polling
      locationService.enableNormalPolling();

      // Log re-entry
      await _logEvent(
        session.localId,
        ClockSessionEventType.geofenceReentryConfirmed,
        position,
        {'consecutiveReadings': _consecutiveInsideReadings},
      );

      // Update session
      await _updateSession(session, position, isInside: true);

      // Clear all geofence warnings and show normal session
      await notificationService.clearGeofenceNotifications();
      await notificationService.showPersistentSession(
        outletName: _outletName!,
        clockInTime: session.clockedInAt,
      );
    } else if (_consecutiveInsideReadings == 1 &&
        _firstOutsideReading != null) {
      // First inside reading after being outside
      await _logEvent(
        session.localId,
        ClockSessionEventType.firstInsideReading,
        position,
        {},
      );

      await _updateSession(session, position, isInside: true);
    }

    // If we're stable inside, ensure normal polling
    if (_consecutiveInsideReadings >= 2) {
      locationService.enableNormalPolling();

      await _logEvent(
        session.localId,
        ClockSessionEventType.pollingIntervalChanged,
        position,
        {'interval': '2 minutes'},
      );
    }
  }

  /// Handle position outside geofence
  Future<void> _handleOutsideGeofence(
    Position position,
    ClockInSessionModel session,
  ) async {
    _consecutiveOutsideReadings++;
    _consecutiveInsideReadings = 0;

    // Track first outside reading
    if (_consecutiveOutsideReadings == 1) {
      _firstOutsideReading = DateTime.now();

      await _logEvent(
        session.localId,
        ClockSessionEventType.firstOutsideReading,
        position,
        {},
      );

      await _updateSession(session, position, isInside: false);

      // Switch to fast polling (30 seconds)
      locationService.enableFastPolling();

      await _logEvent(
        session.localId,
        ClockSessionEventType.pollingIntervalChanged,
        position,
        {'interval': '30 seconds'},
      );
    }

    // Check for confirmed exit (2 consecutive readings OR 3 minutes continuous)
    if (!_isConfirmedOutside) {
      final timeSinceFirst = DateTime.now().difference(_firstOutsideReading!);

      if (_consecutiveOutsideReadings >= 2 || timeSinceFirst.inMinutes >= 3) {
        // Exit confirmed!
        _isConfirmedOutside = true;

        await _logEvent(
          session.localId,
          ClockSessionEventType.geofenceExitConfirmed,
          position,
          {
            'consecutiveReadings': _consecutiveOutsideReadings,
            'minutesOutside': timeSinceFirst.inMinutes,
          },
        );

        await _updateSession(
          session,
          position,
          isInside: false,
          confirmed: true,
        );

        // Calculate distance for notification
        final distance = locationService.calculateDistance(
          position.latitude,
          position.longitude,
          _centerLat!,
          _centerLon!,
        );

        // Show exit notification
        await notificationService.showGeofenceExitDetected(
          outletName: _outletName!,
          distanceMeters: distance,
        );

        // Start grace period countdown with persistent notification
        _startGracePeriodCountdown(session, position);
      }
    }
  }

  /// Start grace period countdown with strategic notifications
  void _startGracePeriodCountdown(
    ClockInSessionModel session,
    Position position,
  ) {
    final graceMinutes = _graceMinutes ?? 10;

    // Start countdown timer for persistent notification
    notificationService.startCountdownTimer(
      outletName: _outletName!,
      totalDuration: Duration(minutes: graceMinutes),
    );

    // Schedule notifications:
    // 1. Immediate: Exit detected (already sent)
    // 2. At 5 minutes: Mid warning
    // 3. At 9 minutes: Final warning
    // 4. At 10 minutes: Auto clock-out

    // 5-minute warning
    Timer(Duration(minutes: 5), () async {
      if (_isConfirmedOutside) {
        await notificationService.showGeofence5MinuteWarning(
          outletName: _outletName!,
        );
        await _logEvent(
          session.localId,
          ClockSessionEventType.notificationSent,
          position,
          {'type': 'mid_warning', 'minutesRemaining': graceMinutes - 5},
        );
      }
    });

    // 9-minute warning (1 minute left)
    Timer(Duration(minutes: graceMinutes - 1), () async {
      if (_isConfirmedOutside) {
        await notificationService.showGeofence9MinuteWarning(
          outletName: _outletName!,
        );
        await _logEvent(
          session.localId,
          ClockSessionEventType.notificationSent,
          position,
          {'type': 'final_warning', 'minutesRemaining': 1},
        );
      }
    });

    // Auto clock-out at grace period end
    _exitConfirmationTimer = Timer(Duration(minutes: graceMinutes), () async {
      if (_isConfirmedOutside) {
        await _performAutoClockOut(session, position);
      }
    });
  }

  /// Perform automatic clock-out
  Future<void> _performAutoClockOut(
    ClockInSessionModel session,
    Position position,
  ) async {
    await _logEvent(
      session.localId,
      ClockSessionEventType.autoClockOut,
      position,
      {'reason': 'geofence_exit', 'graceMinutes': _graceMinutes},
    );

    // Update session to auto-clocked out
    await isar.writeTxn(() async {
      session.status = ClockInStatus.autoClockOut;
      session.clockedOutAt = DateTime.now();
      session.clockOutLatitude = position.latitude;
      session.clockOutLongitude = position.longitude;
      session.clockOutAccuracy = position.accuracy;
      session.clockOutReason = ClockOutReason.geofenceExit;
      await isar.clockInSessionModels.put(session);
    });

    // Show auto clock-out notification
    await notificationService.showGeofenceAutoClockOut(
      outletName: _outletName!,
      clockOutTime: DateTime.now(),
    );

    // Stop monitoring (this will clear notifications)
    await stopMonitoring();
  }

  /// Update session with latest geofence status
  Future<void> _updateSession(
    ClockInSessionModel session,
    Position position, {
    required bool isInside,
    bool confirmed = false,
  }) async {
    await isar.writeTxn(() async {
      session.consecutiveOutsideReadings = _consecutiveOutsideReadings;
      session.consecutiveInsideReadings = _consecutiveInsideReadings;

      if (!isInside && _firstOutsideReading != null) {
        session.firstOutsideReadingAt = _firstOutsideReading;
      }

      if (confirmed) {
        session.confirmedExitAt = DateTime.now();
      }

      if (isInside && _consecutiveInsideReadings >= 2) {
        // Reset exit tracking on confirmed re-entry
        session.firstOutsideReadingAt = null;
        session.confirmedExitAt = null;
        session.consecutiveOutsideReadings = 0;
      }

      await isar.clockInSessionModels.put(session);
    });
  }

  /// Log session event for audit trail
  Future<void> _logEvent(
    String sessionId,
    ClockSessionEventType type,
    Position position,
    Map<String, dynamic> metadata,
  ) async {
    final event = ClockSessionEventModel()
      ..sessionId = sessionId
      ..type = type
      ..latitude = position.latitude
      ..longitude = position.longitude
      ..accuracy = position.accuracy
      ..timestamp = DateTime.now()
      ..metadataJson = metadata.isNotEmpty ? metadata.toString() : null;

    await isar.writeTxn(() async {
      await isar.clockSessionEventModels.put(event);
    });
  }
}
