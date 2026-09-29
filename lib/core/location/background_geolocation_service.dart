import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show MethodChannel;
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:geolocator/geolocator.dart' show Geolocator;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:uuid/uuid.dart';

import '../device/device_fingerprint.dart';
import '../network/isolate_auth_context.dart';
import '../storage/device_location_token_storage.dart';
import 'location_data.dart';
import '../../features/location_tracking/data/datasources/location_ping_local_datasource.dart';
import '../../features/location_tracking/data/datasources/location_ping_remote_datasource.dart';
import '../../features/location_tracking/data/repositories/location_ping_repository_impl.dart';
import '../../features/location_tracking/domain/entities/location_ping.dart';
import '../../features/outlet_mapping/data/datasources/mapping_sample_local_datasource.dart';
import '../../features/outlet_mapping/domain/entities/mapping_sample.dart';

/// Snapshot of the plugin's tracking state — same shape as the old native
/// engine's `BackgroundTrackingStatus` so callers (the debug screen,
/// provider wiring) change minimally when cutting over.
class BackgroundTrackingStatus {
  final bool isTracking;
  final String? visitId;
  final String? outletName;
  final int pendingPingCount;

  const BackgroundTrackingStatus({
    required this.isTracking,
    this.visitId,
    this.outletName,
    required this.pendingPingCount,
  });
}

/// A geofence exit/re-entry the plugin's native OS-level geofencing
/// detected — same shape as the old engine's `GeofenceTransition`. Purely
/// informational: by the time this fires, the plugin has already captured
/// and queued the triggering fix independently of whether anything's
/// listening.
class GeofenceTransition {
  final bool isExit;
  final String visitId;
  final String outletName;
  final double distanceMeters;

  const GeofenceTransition({
    required this.isExit,
    required this.visitId,
    required this.outletName,
    required this.distanceMeters,
  });
}

/// Fired by [BackgroundGeolocationService.mappingSampleCapturedEvents]
/// every time a mapping observation is actually persisted (after the
/// density gate) — a lightweight UI-refresh signal, not the sample data
/// itself (the Isar row is already the source of truth).
class MappingSampleCapturedEvent {
  final int footprintId;
  final int sequence;
  final int totalLocalCount;
  final DateTime recordedAt;

  const MappingSampleCapturedEvent({
    required this.footprintId,
    required this.sequence,
    required this.totalLocalCount,
    required this.recordedAt,
  });
}

/// Dart wrapper around `flutter_background_geolocation` — the replacement
/// for the custom native Kotlin engine (`LocationTrackingService.kt` et al)
/// and `LocationService`'s continuous-stream usage. See the "Phase 3" plan
/// in `.claude/plans/enchanted-juggling-ocean.md` for why.
///
/// **Two independent posting paths, deliberately overlapping:**
///
/// 1. While the app's Dart engine is alive: [_onLocation]/[_onGeofence] →
///    [_handleLocation] → the *existing* backend pipeline
///    (`LocationPingLocalDataSource`/`LocationPingRemoteDataSource`,
///    `POST /visits/location/ping`), authenticated with the user's normal
///    rotating access token via `isolate_auth_context.dart`. Save-locally-
///    then-post, same as before.
/// 2. Always (including fully terminated — `stopOnTerminate: false`): the
///    plugin's own native `autoSync` HTTP layer posts directly to
///    `POST /visits/location/device-ping`, authenticated with a separate,
///    narrowly-scoped `device_location` JWT (24h TTL, no self-renewal,
///    revoked on logout/password change — minted via `POST
///    /auth/device-token`, see [ensureDeviceLocationToken]). This covers
///    `LOCATION`/geofence fixes without needing any Dart bridge, since
///    native captures and persists those on its own regardless of
///    headless dispatch.
///
/// [bg.Event.HEARTBEAT] is the one gap path 2 can't cover: the plugin
/// doesn't auto-request a position on heartbeat the way it auto-captures
/// LOCATION/geofence fixes (confirmed via the plugin's own doc comment on
/// `HeartbeatEvent.location`), so a terminated *and stationary* device
/// needs Dart code to actually run in response. [backgroundGeolocationHeadlessTask]
/// below handles exactly that, scoped to `HEARTBEAT` only, registered from
/// [startTracking] rather than unconditionally at app boot — registering
/// it at boot was confirmed on-device to break live foreground `onLocation`
/// delivery entirely in this plugin version (native fired events; nothing
/// reached Dart); this later registration point is the current experiment
/// to get heartbeat coverage back without reintroducing that regression.
/// If foreground `onLocation` breaks again, revert this immediately.
///
/// Running both concurrently while the app is alive means occasional
/// double-posts of the same fix — accepted deliberately: the backend
/// dedupes on `device_ping_id` (`is_duplicate` in the ping response), and
/// that's a far smaller cost than depending on the flaky Dart headless
/// bridge for the only copy of a terminated-app ping.
class BackgroundGeolocationService {
  static const _outletRadiusBufferMeters = 10.0;
  static const _notificationChannelId = 'outlet_manager_tracking';

  /// Backs [TrackingReminderScheduler] (native Kotlin) — told whether a
  /// visit is active so it knows whether to remind the user to reopen the
  /// app after a reboot. See that class's doc comment for why this has to
  /// be native, not Dart.
  static const _trackingReminderChannel = MethodChannel(
    'outlet_manager/tracking_reminder',
  );

  final LocationPingLocalDataSource _localDataSource =
      LocationPingLocalDataSource();
  final MappingSampleLocalDataSource _mappingLocalDataSource =
      MappingSampleLocalDataSource();
  final Connectivity _connectivity = Connectivity();
  final DeviceLocationTokenStorage _deviceLocationTokenStorage =
      DeviceLocationTokenStorage();

  bool _isReady = false;
  String? _visitId;
  String? _outletName;
  double? _outletLatitude;
  double? _outletLongitude;

  // === Outlet Mapping — second logical consumer of the same fixes ===
  //
  // Deliberately owned here, not by a separate service: there is exactly
  // ONE flutter_background_geolocation engine (see this class's own doc
  // comment above), and these fields are the whole of what "a second
  // consumer" needs — a footprint to write samples against, its own
  // density gate, and the snapshot to restore on exit. Nothing below
  // touches `_localDataSource`, `_visitId`, or any attendance field; the
  // attendance path (`_handleLocation`) is untouched code, called
  // unconditionally for every fix regardless of `_mappingActive` — see
  // `_handleNativeLocation`.
  bool _mappingActive = false;
  int? _mappingFootprintId;
  int _mappingNextSequence = 0;
  int _mappingMinSampleIntervalMs = 2000;
  double _mappingDuplicateSuppressionMeters = 1.0;
  int _mappingMaxSamples = 2000;
  int _mappingSampleCount = 0;
  DateTime? _mappingLastSampleAt;
  double? _mappingLastLatitude;
  double? _mappingLastLongitude;
  double? _preMappingDistanceFilter;
  double? _preMappingHeartbeatInterval;

  final _geofenceTransitionController =
      StreamController<GeofenceTransition>.broadcast();

  /// Fires whenever the plugin's native OS-level geofencing confirms an
  /// exit or re-entry for the currently-tracked visit's outlet geofence.
  Stream<GeofenceTransition> get geofenceTransitionEvents =>
      _geofenceTransitionController.stream;

  final _mappingSampleCapturedController =
      StreamController<MappingSampleCapturedEvent>.broadcast();

  /// Fires every time a mapping sample is actually persisted (after the
  /// density gate — not every native fix). Purely a UI-refresh signal for
  /// the capture screen/`MappingSessionNotifier`; the Isar row is already
  /// the source of truth by the time this fires.
  Stream<MappingSampleCapturedEvent> get mappingSampleCapturedEvents =>
      _mappingSampleCapturedController.stream;

  /// Configures the plugin and wires its event listeners. Call once at app
  /// startup, before `startTracking()`. Idempotent.
  Future<void> configure() async {
    if (_isReady) return;

    bg.BackgroundGeolocation.onLocation(_onLocation, _onLocationError);
    bg.BackgroundGeolocation.onGeofence(_onGeofence);
    // `onLocation` only fires for Event.LOCATION (movement/distanceFilter-
    // triggered fixes) — motionchange and heartbeat are dispatched through
    // their own separate listeners entirely, confirmed on-device: a real
    // motionchange fired natively with zero Dart-side activity because
    // neither of these was ever registered. Without them, "periodic ping
    // every heartbeatInterval regardless of movement" (the original ask —
    // see AppConfig.heartbeatInterval above) silently never worked, and
    // pings stopped outright the moment the device went stationary long
    // enough to stop generating Event.LOCATION fixes.
    bg.BackgroundGeolocation.onMotionChange(_onMotionChange);
    bg.BackgroundGeolocation.onHeartbeat(_onHeartbeat);

    await bg.BackgroundGeolocation.ready(
      bg.Config(
        geolocation: const bg.GeoConfig(
          desiredAccuracy: bg.DesiredAccuracy.high,
          distanceFilter: 10.0,
          // The team's original ask: a periodic ping regardless of
          // movement, not just a movement-triggered one. See
          // AppConfig.heartbeatInterval below — this is the field that
          // actually backs that requirement (the deprecated top-level
          // Config.heartbeatInterval does not).
          stopTimeout: 5,
          geofenceProximityRadius: 1000,
        ),
        app: bg.AppConfig(
          // 300s (5 minutes) — matches the old engine's default cadence.
          // Was temporarily set to 60 to field-test the onHeartbeat fix
          // (confirmed working); reverted back to the intended interval.
          heartbeatInterval: 300,
          stopOnTerminate: false,
          startOnBoot: true,
          // EXPERIMENT — re-enabling headless, scoped to HEARTBEAT only
          // (registered from startTracking, not unconditionally at app
          // boot — see registerBackgroundGeolocationHeadlessTask's doc
          // comment). Confirmed on-device: heartbeat is the one event
          // type native autoSync can't cover on its own (the plugin
          // doesn't auto-request a position on heartbeat the way it
          // auto-captures LOCATION/geofence fixes), so a terminated +
          // stationary device never got a ping without this. If this
          // breaks live foreground onLocation delivery again (the
          // reason headless was disabled before), revert immediately —
          // that's worse than a missing heartbeat ping.
          enableHeadless: true,
          backgroundPermissionRationale: bg.PermissionRationale(
            title:
                'Allow {applicationName} to access this device\'s location even when the app is closed or not in use.',
            message:
                'Outlet Manager collects location data to enable field '
                'representative location tracking even when the app is '
                'closed or not in use. Location is used during working '
                'hours to track movement between assigned outlets and '
                'verify field activities.',
            positiveAction: 'Change to "{backgroundPermissionOptionLabel}"',
            negativeAction: 'Cancel',
          ),
          notification: bg.Notification(
            title: 'Active Session',
            text: 'Tracking your location for this outlet visit',
            channelName: 'Location Tracking',
            channelId: _notificationChannelId,
            sticky: true,
          ),
        ),
        http: bg.HttpConfig(autoSync: false),
        // TEMPORARY — kept in while field-testing Stage 2 on-device.
        // Surfaces the plugin's own native TSLocationManager logcat
        // output, which is how the watchPosition event-bus bug was found.
        // Remove once Stage 2 field testing is complete.
        logger: bg.LoggerConfig(logLevel: bg.LogLevel.verbose, debug: false),
      ),
    );
    _isReady = true;
  }

  /// Serializes [startTracking]/[stopTracking] so they never run
  /// concurrently — confirmed on-device that they can otherwise race:
  /// ClockInNotifier's own startTracking() call and DayStatusPoll's 30s
  /// reconciliation poll (which can independently decide to stop then
  /// restart tracking) landed close enough together to overlap, and the
  /// second `bg.BackgroundGeolocation.start()` call threw an unhandled
  /// `PlatformException(Waiting for previous start action to complete)`.
  /// Every call now chains onto whatever's already pending instead of
  /// firing in parallel.
  Future<void> _lastOperation = Future.value();

  Future<void> _serialize(Future<void> Function() operation) {
    final result = _lastOperation.then((_) => operation());
    _lastOperation = result.then((_) {}, onError: (_) {});
    return result;
  }

  /// Starts tracking for a just-clocked-in visit: begins the plugin's
  /// location engine and registers a native OS-level geofence for the
  /// outlet, so exit/re-entry detection happens at the OS layer instead of
  /// the app polling and computing distance itself.
  Future<void> startTracking({
    required String visitId,
    required String outletName,
    required double outletLatitude,
    required double outletLongitude,
    required double geofenceRadiusMeters,
  }) => _serialize(() async {
    await configure();
    _visitId = visitId;
    _outletName = outletName;
    _outletLatitude = outletLatitude;
    _outletLongitude = outletLongitude;

    await _configureDeviceAutoSync();

    try {
      await registerBackgroundGeolocationHeadlessTask();
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] registerHeadlessTask failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
    }

    await _setTrackingReminderActive(true);

    try {
      await bg.BackgroundGeolocation.addGeofence(
        bg.Geofence(
          identifier: visitId,
          radius: geofenceRadiusMeters + _outletRadiusBufferMeters,
          latitude: outletLatitude,
          longitude: outletLongitude,
          notifyOnEntry: true,
          notifyOnExit: true,
          notifyOnDwell: false,
        ),
      );
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] addGeofence failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
    }

    try {
      await bg.BackgroundGeolocation.start();
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] start failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
    }
  });

  /// Stops tracking after clock-out: removes the outlet geofence and stops
  /// the plugin's location engine.
  Future<void> stopTracking() => _serialize(() async {
    final visitId = _visitId;
    if (visitId != null) {
      try {
        await bg.BackgroundGeolocation.removeGeofence(visitId);
      } catch (e, st) {
        developer.log(
          '[BackgroundGeolocationService] removeGeofence failed: $e',
          name: 'BackgroundGeolocationService',
          error: e,
          stackTrace: st,
        );
      }
    }
    await _setTrackingReminderActive(false);
    _visitId = null;
    _outletName = null;
    _outletLatitude = null;
    _outletLongitude = null;
    try {
      await bg.BackgroundGeolocation.stop();
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] stop failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
    }
  });

  /// Enters mapping-capture mode (spec §5/§36): snapshots the exact
  /// current `distanceFilter`/`heartbeatInterval` (never a hardcoded
  /// assumption — read live off `bg.BackgroundGeolocation.state`) then
  /// tightens `distanceFilter` for denser fixes while walking. Does NOT
  /// touch `http`/`autoSync` config at all — native attendance device-ping
  /// delivery (`_configureDeviceAutoSync`) is completely unaffected, per
  /// spec §37's "avoid modifying extras entirely unless genuinely
  /// necessary." Serialized through the same queue as
  /// `startTracking`/`stopTracking` (spec §66/§Q) so a concurrent
  /// clock-in/out can't race a mapping start/stop.
  ///
  /// [startSequence] is the session's already-recovered `nextSequence`
  /// (spec §24 — this class never invents its own sequence baseline);
  /// [currentSampleCount] is the session's already-known synced+local
  /// count, so the local `max_samples` guard (spec §28/§77) is accurate
  /// even resuming a session that already has samples.
  Future<void> startMappingCapture({
    required int footprintId,
    required int startSequence,
    required int currentSampleCount,
    required int maxSamples,
    int minSampleIntervalMs = 2000,
    double mappingDistanceFilterMeters = 3.0,
    double duplicateSuppressionMeters = 1.0,
  }) => _serialize(() async {
    await configure();
    if (_mappingActive && _mappingFootprintId == footprintId) {
      // Idempotent resume of the SAME footprint — don't re-snapshot over
      // an already-mapping-mode config (spec §16's start-idempotency
      // principle applies equally here).
      return;
    }

    final state = await bg.BackgroundGeolocation.state;
    _preMappingDistanceFilter = state.geolocation.distanceFilter;
    _preMappingHeartbeatInterval = state.app.heartbeatInterval;

    _mappingFootprintId = footprintId;
    _mappingNextSequence = startSequence;
    _mappingSampleCount = currentSampleCount;
    _mappingMaxSamples = maxSamples;
    _mappingMinSampleIntervalMs = minSampleIntervalMs;
    _mappingDuplicateSuppressionMeters = duplicateSuppressionMeters;
    _mappingLastSampleAt = null;
    _mappingLastLatitude = null;
    _mappingLastLongitude = null;

    try {
      await bg.BackgroundGeolocation.setConfig(
        bg.Config(
          geolocation: bg.GeoConfig(distanceFilter: mappingDistanceFilterMeters),
        ),
      );
      // Walking the outlet IS the moving state by definition — force it
      // immediately rather than waiting on native Activity Recognition to
      // independently notice motion. Confirmed on-device: without this, a
      // device the plugin currently has classified as stationary (common
      // right after standing still to tap "Start Mapping", especially
      // indoors with noisy accelerometer/poor GPS) never fires a single
      // onLocation/onMotionChange event — capture sits frozen at 0 samples
      // until AR eventually catches up on its own, which can take a while
      // or never clear its confidence threshold indoors.
      await bg.BackgroundGeolocation.changePace(true);
      _mappingActive = true;
      developer.log(
        '[BackgroundGeolocationService] mapping capture started footprint=$footprintId '
        'preDistanceFilter=$_preMappingDistanceFilter preHeartbeat=$_preMappingHeartbeatInterval',
        name: 'BackgroundGeolocationService',
      );
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] startMappingCapture setConfig failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
      // Config change didn't take — don't claim mapping mode is active.
      _mappingFootprintId = null;
    }
  });

  /// Exits mapping-capture mode: restores the EXACT snapshotted config
  /// (never a hardcoded default, spec §5/§6) and clears mapping state.
  /// Idempotent and safe to call from any exit path (Finish, Stop/abandon,
  /// server-side CAPTURE_ABANDONED, forced logout, recovery finding a
  /// server-terminal state, spec §97) — a call with no active mapping
  /// session is a no-op, not an error.
  Future<void> stopMappingCapture() => _serialize(() async {
    if (!_mappingActive) return;
    _mappingActive = false;
    final footprintId = _mappingFootprintId;
    _mappingFootprintId = null;

    try {
      final restoreFilter = _preMappingDistanceFilter;
      final restoreHeartbeat = _preMappingHeartbeatInterval;
      if (restoreFilter != null || restoreHeartbeat != null) {
        await bg.BackgroundGeolocation.setConfig(
          bg.Config(
            geolocation: bg.GeoConfig(
              distanceFilter: restoreFilter ?? 50.0,
            ),
          ),
        );
      }
      developer.log(
        '[BackgroundGeolocationService] mapping capture stopped footprint=$footprintId, '
        'config restored to distanceFilter=$restoreFilter',
        name: 'BackgroundGeolocationService',
      );
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] stopMappingCapture setConfig restore failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
    } finally {
      _preMappingDistanceFilter = null;
      _preMappingHeartbeatInterval = null;
    }
  });

  bool get isMappingActive => _mappingActive;

  /// Density gate (spec §33/§34): a native fix becomes a stored mapping
  /// sample only if enough time has passed since the last STORED sample
  /// (not the last native callback) and it isn't a near-duplicate of it.
  /// Never rejects on accuracy (spec §35) — quality is display-only
  /// guidance, decided authoritatively by the backend at `/finish`.
  Future<void> _handleMappingSample(bg.Location location) async {
    final footprintId = _mappingFootprintId;
    if (footprintId == null) return;

    if (_mappingSampleCount >= _mappingMaxSamples) {
      // Locally stop accepting new samples the moment the backend-provided
      // ceiling is reached — spec §28/§77 — without waiting for a 413.
      // Attendance is completely unaffected: this only returns from the
      // MAPPING half of the dispatcher.
      return;
    }

    final now = DateTime.now();
    if (_mappingLastSampleAt != null) {
      final elapsedMs = now.difference(_mappingLastSampleAt!).inMilliseconds;
      if (elapsedMs < _mappingMinSampleIntervalMs) return;
    }

    // Duplicate suppression — same cell (radius set by
    // _mappingDuplicateSuppressionMeters) as the last STORED sample and
    // still inside the interval gate above having just passed only because
    // of elapsed time, not real movement (spec §33's "optional duplicate
    // suppression"). Same flat degree-threshold approximation this check
    // has always used, not a real distance calculation — fine at this
    // scale, kept as-is rather than switching to Geolocator.distanceBetween
    // to avoid changing anything beyond the configured threshold.
    if (_mappingLastLatitude != null && _mappingLastLongitude != null) {
      final degreeThreshold = _mappingDuplicateSuppressionMeters / 111320.0;
      final sameSpot =
          (location.coords.latitude - _mappingLastLatitude!).abs() < degreeThreshold &&
              (location.coords.longitude - _mappingLastLongitude!).abs() < degreeThreshold;
      if (sameSpot) return;
    }

    final sequence = _mappingNextSequence;
    _mappingNextSequence += 1;
    _mappingSampleCount += 1;
    _mappingLastSampleAt = now;
    _mappingLastLatitude = location.coords.latitude;
    _mappingLastLongitude = location.coords.longitude;

    final sample = _toMappingSample(location, footprintId: footprintId, sequence: sequence);

    try {
      // Persist-before-network invariant (spec §10/§67) — this call is the
      // ONLY thing that happens here; upload is entirely the
      // MappingUploader's job, triggered separately.
      await _mappingLocalDataSource.save(sample);
      _mappingSampleCapturedController.add(
        MappingSampleCapturedEvent(
          footprintId: footprintId,
          sequence: sequence,
          totalLocalCount: _mappingSampleCount,
          recordedAt: sample.recordedAt,
        ),
      );
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] mapping sample persist failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
    }
  }

  MappingSample _toMappingSample(
    bg.Location location, {
    required int footprintId,
    required int sequence,
  }) {
    return MappingSample(
      localId: const Uuid().v4(),
      footprintId: footprintId,
      clientSampleId: const Uuid().v4(),
      sequence: sequence,
      latitude: location.coords.latitude,
      longitude: location.coords.longitude,
      accuracyM: location.coords.accuracy,
      recordedAt: DateTime.now(),
      // Diagnostic-only fields — only populated when the plugin actually
      // supplied a real value, never synthesized (spec §26/§6). Confirmed
      // via the installed plugin source: `Coords.altitude` itself has NO
      // "unavailable" sentinel — it silently defaults to 0.0, which would
      // be indistinguishable from a real ground-floor reading if sent
      // unconditionally. `altitudeAccuracy` DOES have one (-1 when
      // absent), so it's used here as the gate for BOTH fields — when the
      // device couldn't determine altitude accuracy, the co-reported
      // altitude value is not trustworthy either and both are omitted
      // rather than risk sending a fabricated 0.
      altitudeM: location.coords.altitudeAccuracy >= 0 ? location.coords.altitude : null,
      verticalAccuracyM:
          location.coords.altitudeAccuracy >= 0 ? location.coords.altitudeAccuracy : null,
      speedMps: location.coords.speed >= 0 ? location.coords.speed : null,
      headingDeg: location.coords.heading >= 0 ? location.coords.heading : null,
      provider: 'fused',
      isMock: location.mock,
      createdAt: DateTime.now(),
    );
  }

  /// Points the plugin's native `autoSync` HTTP layer at the device-ping
  /// endpoint with a fresh `device_location` token, so terminated-app
  /// delivery works independently of the Dart engine — see the class doc
  /// comment. Best-effort: on any failure (offline at clock-in, mint
  /// rejected, etc.) tracking still proceeds via the normal Dart pipeline;
  /// this only adds redundancy, it's never required for a single ping to
  /// go out.
  Future<void> _configureDeviceAutoSync() async {
    try {
      final deviceToken = await ensureDeviceLocationToken();
      if (deviceToken == null) return;

      final apiBaseUrl = resolveIsolateApiBaseUrl(resolveIsolateRegion());
      await bg.BackgroundGeolocation.setConfig(
        bg.Config(
          http: bg.HttpConfig(
            autoSync: true,
            url: '$apiBaseUrl/visits/location/device-ping',
            headers: {'Authorization': 'Bearer $deviceToken'},
          ),
          // Deliberately minimal — the ERB-style template has no
          // conditionals, so fields the Dart pipeline only sends when
          // meaningful (altitude/speed/heading) are left out here rather
          // than risk posting a raw sentinel (-1) as a real value.
          // `ping_source`/`network_type` have no native template tag, so
          // they're static; confirm with backend these are acceptable
          // defaults for this endpoint (or that the fields are optional).
          persistence: const bg.PersistenceConfig(
            locationTemplate:
                '{'
                '"latitude":<%= latitude %>,'
                '"longitude":<%= longitude %>,'
                '"accuracy_meters":<%= accuracy %>,'
                '"battery_level":<%= battery.level %>,'
                '"is_charging":<%= battery.is_charging %>,'
                '"ping_source":"background",'
                '"network_type":"unknown",'
                '"recorded_at":"<%= timestamp %>",'
                '"device_ping_id":"<%= uuid %>"'
                '}',
          ),
        ),
      );
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] configureDeviceAutoSync failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
    }
  }

  /// Returns a valid `device_location` token, minting a new one via
  /// `POST /auth/device-token` if none is cached or the cached one is
  /// within an hour of its 24h expiry. That endpoint requires the user's
  /// normal session, so this must run while the app is alive and
  /// authenticated — unlike the rest of this class, there is no
  /// isolate-safe path for this call, nor does it need one: the token is
  /// handed to *native* config once and persists there on its own after
  /// that.
  ///
  /// Called from two places: right after login/session-restore
  /// (`_DeviceRegistrationListener` in `main.dart`, alongside FCM device
  /// registration) so a fresh token is already cached well before any
  /// clock-in, and again from [_configureDeviceAutoSync] at
  /// [startTracking] time — which will almost always just hit the cache,
  /// but re-mints if a session somehow outlives the 24h TTL (per backend:
  /// shouldn't happen for a real shift, but cheap to be safe about).
  Future<String?> ensureDeviceLocationToken() async {
    final cached = await _deviceLocationTokenStorage.read();
    if (cached != null && !cached.isExpiredOrExpiringSoon) {
      return cached.token;
    }
    try {
      final apiBaseUrl = resolveIsolateApiBaseUrl(resolveIsolateRegion());
      final accessToken = await resolveIsolateAccessToken(apiBaseUrl);
      if (accessToken == null) return cached?.token;

      final fingerprint = await DeviceFingerprint.getOrCreate();
      final dio = Dio(
        BaseOptions(
          baseUrl: apiBaseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      final response = await dio.post(
        '/auth/device-token',
        data: {'device_fingerprint': fingerprint},
      );
      final data = response.data as Map<String, dynamic>;
      final token = data['device_token'] as String;
      final expiresAt = DateTime.parse(data['expires_at'] as String);
      await _deviceLocationTokenStorage.save(token: token, expiresAt: expiresAt);
      return token;
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] device-token mint failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
      return cached?.token; // Stale-but-present beats nothing.
    }
  }

  /// Retries whatever's still queued in the local ping store — engine-
  /// agnostic: it drains the shared Isar-backed queue regardless of which
  /// capture produced each row (a ping that failed to send when it was
  /// first captured, from any pipeline that used this same local
  /// datasource). Called on app resume and connectivity restore (see
  /// main.dart) — this is what used to be `LocationPingController.syncPending()`
  /// before that class (and the Dart-timer engine it drove) was deleted.
  Future<void> syncPendingPings() async {
    try {
      final pending = await _localDataSource.getPendingPings();
      if (pending.isEmpty) return;

      final connectivityResult = await _connectivity.checkConnectivity();
      final isOnline =
          connectivityResult.isNotEmpty &&
          !connectivityResult.contains(ConnectivityResult.none);
      if (!isOnline) return;

      // Isolate-safe resolution, not AppConfig.apiBaseUrl — this method is
      // also called from the headless task below, a fresh engine that
      // never ran main(), where AppConfig's static fields were never
      // initialized. See isolate_auth_context.dart's doc comment.
      final apiBaseUrl = resolveIsolateApiBaseUrl(resolveIsolateRegion());
      final accessToken = await resolveIsolateAccessToken(apiBaseUrl);
      if (accessToken == null) return;

      final packageInfo = await PackageInfo.fromPlatform();
      final dio = Dio(
        BaseOptions(
          baseUrl: apiBaseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'Authorization': 'Bearer $accessToken',
            'X-Client-Version': packageInfo.version,
          },
        ),
      );
      final repository = LocationPingRepositoryImpl(
        remoteDataSource: LocationPingRemoteDataSource(dio),
        localDataSource: _localDataSource,
      );
      for (final ping in pending) {
        await repository.sendPing(ping);
      }
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] syncPendingPings failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
    }
  }

  Future<BackgroundTrackingStatus> getTrackingStatus() async {
    try {
      final state = await bg.BackgroundGeolocation.state;
      final pending = await _localDataSource.getPendingPings();
      return BackgroundTrackingStatus(
        isTracking: state.enabled,
        visitId: _visitId,
        outletName: _outletName,
        pendingPingCount: pending.length,
      );
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] getTrackingStatus failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
      return const BackgroundTrackingStatus(
        isTracking: false,
        pendingPingCount: 0,
      );
    }
  }

  /// Requests location permission via the plugin's own flow (which also
  /// covers the "Allow all the time" background-location step on Android
  /// 11+, using `backgroundPermissionRationale` from [configure]) and, in
  /// the same call, motion/activity-recognition authorization
  /// (`ACTIVITY_RECOGNITION` on Android 10+) — see `Permission`'s doc
  /// comment: omitting an explicit permission requests everything the
  /// current config needs, location then motion. Throws the bare
  /// authorization status (an `int`) on denial, not a `PlatformException`
  /// — see the plugin's own `requestPermission` doc comment.
  ///
  /// [configure] must run first — confirmed on-device that without it the
  /// "Allow all the time" dialog falls back to the plugin's own default
  /// `[CHANGEME] This app collects location data for FEATURE X and FEATURE
  /// Y.` placeholder text instead of our configured
  /// `backgroundPermissionRationale`, since that rationale is only set once
  /// `ready()` has actually run.
  Future<int> requestPermission() async {
    await configure();
    return bg.BackgroundGeolocation.requestPermission();
  }

  /// Whether the OS currently exempts this app from Doze/App Standby.
  Future<bool> isIgnoringBatteryOptimizations() async {
    try {
      return await bg.DeviceSettings.isIgnoringBatteryOptimizations;
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] isIgnoringBatteryOptimizations failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
      return false;
    }
  }

  /// Opens the system's "Ignore battery optimizations" screen for this app,
  /// if the device/OEM implements one — best-effort, same as the rest of
  /// this class's system-dialog methods; some devices don't have this
  /// particular settings screen and `showIgnoreBatteryOptimizations` throws.
  Future<void> requestBatteryOptimizationExemption() async {
    try {
      final request = await bg.DeviceSettings.showIgnoreBatteryOptimizations();
      await bg.DeviceSettings.show(request);
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] requestBatteryOptimizationExemption failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
    }
  }

  /// Tells the native reboot-reminder (see TrackingReminderScheduler's doc
  /// comment) whether a visit is currently being tracked, so it knows
  /// whether to nag the user to reopen the app after a reboot. Best-effort
  /// — a failure here should never block a real clock-in/out.
  Future<void> _setTrackingReminderActive(bool active) async {
    try {
      await _trackingReminderChannel.invokeMethod('setActive', {
        'active': active,
      });
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] setTrackingReminderActive failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
    }
  }

  /// Android 14+ only (always `true` on older versions): whether the user
  /// has granted "Full screen intents" access. Without it, the reboot
  /// reminder's alarm-style notification silently downgrades to a normal
  /// heads-up one instead of taking over the screen.
  Future<bool> isFullScreenIntentPermissionGranted() async {
    try {
      final granted = await _trackingReminderChannel.invokeMethod<bool>(
        'isFullScreenIntentPermissionGranted',
      );
      return granted ?? true;
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] isFullScreenIntentPermissionGranted failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
      return true;
    }
  }

  /// Opens the system screen for granting "Full screen intents" access —
  /// same best-effort pattern as [requestBatteryOptimizationExemption].
  Future<void> requestFullScreenIntentPermission() async {
    try {
      await _trackingReminderChannel.invokeMethod(
        'requestFullScreenIntentPermission',
      );
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] requestFullScreenIntentPermission failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
    }
  }

  /// Starts a lightweight, tracking-independent continuous position watch —
  /// for live-distance UI (e.g. visit_detail_screen.dart's pre-clock-in
  /// proximity check), not persisted, not posted anywhere. Needs no active
  /// visit or geofence — unlike the old `LocationService.watchLocation()`
  /// this replaces, there's no separate "anchor stream" in this plugin to
  /// contend with, so no pause/resume coordination is needed around it.
  ///
  /// Implemented as a poll loop over [bg.BackgroundGeolocation.getCurrentPosition]
  /// rather than the plugin's own `watchPosition` API. Confirmed on-device
  /// (verbose native logger): `watchPosition` DOES obtain accurate fixes
  /// natively (`TSLocationManager` logs a successful `watchPosition
  /// LocationResult`), but delivery to Dart never arrives — immediately
  /// after each result, the native log shows `EventBus: No subscribers
  /// registered for event class ...TSLocation`, i.e. the native→Dart
  /// bridge for this specific API is broken in the installed plugin
  /// version. `getCurrentPosition` doesn't share that bridge path (it's
  /// the plugin's most exercised API — every bundled example uses it) and
  /// was confirmed to return a real fix directly.
  ///
  /// Returns a callback that stops the watch — call it once, typically from
  /// the caller's `dispose()`.
  Future<Future<void> Function()> watchPosition({
    required void Function(LocationData location) onLocation,
  }) async {
    await configure();
    var stopped = false;

    Future<void> poll() async {
      if (stopped) return;
      try {
        final location = await bg.BackgroundGeolocation.getCurrentPosition(
          samples: 1,
          timeout: 10,
          persist: false,
          // Plain meters threshold, not the OS-priority constant — see
          // the desiredAccuracy note on _toLocationData's caller history.
          // 200m matches the accuracy floor visit_detail_screen.dart
          // already enforces for canClockIn.
          desiredAccuracy: 200,
        );
        if (!stopped) onLocation(_toLocationData(location));
      } catch (e, st) {
        developer.log(
          '[BackgroundGeolocationService] watchPosition poll failed: $e',
          name: 'BackgroundGeolocationService',
          error: e,
          stackTrace: st,
        );
      }
      if (!stopped) {
        Timer(const Duration(seconds: 3), poll);
      }
    }

    unawaited(poll());
    return () async {
      stopped = true;
    };
  }

  void _onLocation(bg.Location location) {
    unawaited(_handleNativeLocation(location));
  }

  void _onLocationError(bg.LocationError error) {
    developer.log(
      '[BackgroundGeolocationService] location error: $error',
      name: 'BackgroundGeolocationService',
    );
  }

  void _onMotionChange(bg.Location location) {
    unawaited(_handleNativeLocation(location));
  }

  /// The dispatcher every native fix passes through (spec §4/§39). The
  /// attendance branch is UNCONDITIONAL — every fix reaches
  /// `_handleLocation` exactly as it always has, regardless of whether
  /// mapping is active. The mapping branch only runs additionally, when
  /// `_mappingActive`. This ordering (attendance first, always; mapping
  /// second, conditionally) is itself the guarantee that outlet mapping
  /// can never replace or suppress an attendance observation — there is
  /// no code path in this class where `_handleLocation` is skipped
  /// because mapping is running.
  Future<void> _handleNativeLocation(bg.Location location) async {
    await _handleLocation(location, pingSource: PingSource.background);
    if (_mappingActive) {
      await _handleMappingSample(location);
    }
  }

  /// [bg.HeartbeatEvent.location] is only the *last known* position — the
  /// plugin deliberately doesn't request a fresh fix for a heartbeat (see
  /// its own doc comment) — so this asks for one explicitly, same as
  /// [watchPosition]'s poll. This is what actually delivers the "periodic
  /// ping every heartbeatInterval even if not moving" requirement; without
  /// it a stationary device would only ever get geofence/motionchange-
  /// triggered pings, not a real regular cadence.
  Future<void> _onHeartbeat(bg.HeartbeatEvent event) async {
    try {
      final location = await bg.BackgroundGeolocation.getCurrentPosition(
        samples: 1,
        timeout: 10,
        persist: true,
        desiredAccuracy: 200,
      );
      await _handleNativeLocation(location);
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] onHeartbeat failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
    }
  }

  void _onGeofence(bg.GeofenceEvent event) {
    if (event.action == 'DWELL') return;
    final isExit = event.action == 'EXIT';
    final visitId = _visitId;
    final outletName = _outletName;
    final outletLatitude = _outletLatitude;
    final outletLongitude = _outletLongitude;
    if (visitId == null || event.identifier != visitId) return;

    final distanceMeters = (outletLatitude != null && outletLongitude != null)
        ? Geolocator.distanceBetween(
            event.location.coords.latitude,
            event.location.coords.longitude,
            outletLatitude,
            outletLongitude,
          )
        : 0.0;

    _geofenceTransitionController.add(
      GeofenceTransition(
        isExit: isExit,
        visitId: visitId,
        outletName: outletName ?? 'Outlet',
        distanceMeters: distanceMeters,
      ),
    );

    // Same principle the old engine's GeofenceHysteresisTracker used: fire
    // an immediate, distinctly-tagged ping on the transition itself rather
    // than waiting for the next scheduled fix, and let the backend's own
    // geofence violation detector (SMS reminders, grace period, auto-skip)
    // decide what to do about it — no client-side auto-clock-out.
    unawaited(
      _handleLocation(event.location, pingSource: PingSource.geofenceEvent),
    );
  }

  /// Always saves locally first, then attempts a send if online — same
  /// discipline the old `LocationPingService._captureAndSendPing` and the
  /// native engine's `LocationQueueDb` both guaranteed. A capture is never
  /// lost to a failed/absent network attempt; it just stays queued.
  Future<void> _handleLocation(
    bg.Location location, {
    required PingSource pingSource,
  }) async {
    try {
      final ping = await _toPing(location, pingSource);
      await _localDataSource.savePing(ping);

      final connectivityResult = await _connectivity.checkConnectivity();
      final isOnline =
          connectivityResult.isNotEmpty &&
          !connectivityResult.contains(ConnectivityResult.none);
      if (!isOnline) return;

      // Isolate-safe resolution — see the identical note in
      // syncPendingPings above; this method is called from both the
      // foreground onLocation listener and the headless task.
      final apiBaseUrl = resolveIsolateApiBaseUrl(resolveIsolateRegion());
      final accessToken = await resolveIsolateAccessToken(apiBaseUrl);
      if (accessToken == null) return; // Not logged in, or refresh rejected — drop silently.

      final packageInfo = await PackageInfo.fromPlatform();
      final dio = Dio(
        BaseOptions(
          baseUrl: apiBaseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'Authorization': 'Bearer $accessToken',
            'X-Client-Version': packageInfo.version,
          },
        ),
      );
      final repository = LocationPingRepositoryImpl(
        remoteDataSource: LocationPingRemoteDataSource(dio),
        localDataSource: _localDataSource,
      );
      await repository.sendPing(ping); // Marks synced/failed internally either way.
    } catch (e, st) {
      developer.log(
        '[BackgroundGeolocationService] handleLocation failed: $e',
        name: 'BackgroundGeolocationService',
        error: e,
        stackTrace: st,
      );
    }
  }

  LocationData _toLocationData(bg.Location location) {
    return LocationData(
      latitude: location.coords.latitude,
      longitude: location.coords.longitude,
      accuracy: location.coords.accuracy,
      altitude: location.coords.altitude,
      speed: location.coords.speed >= 0 ? location.coords.speed : 0,
      heading: location.coords.heading >= 0 ? location.coords.heading : 0,
      timestamp: DateTime.now(),
    );
  }

  Future<LocationPing> _toPing(
    bg.Location location,
    PingSource pingSource,
  ) async {
    int? batteryLevel;
    bool? isCharging;
    try {
      final level = location.battery.level;
      if (level >= 0) batteryLevel = (level * 100).round();
      isCharging = location.battery.isCharging;
    } catch (_) {
      // Battery info not always populated on every fix.
    }

    String? networkType;
    try {
      final result = await _connectivity.checkConnectivity();
      if (result.contains(ConnectivityResult.wifi)) {
        networkType = 'wifi';
      } else if (result.contains(ConnectivityResult.mobile)) {
        networkType = 'cellular';
      } else {
        networkType = 'none';
      }
    } catch (_) {
      // Connectivity info not available.
    }

    return LocationPing(
      localId: const Uuid().v4(),
      latitude: location.coords.latitude,
      longitude: location.coords.longitude,
      accuracyMeters: location.coords.accuracy,
      altitudeMeters: location.coords.altitude,
      speedMps: location.coords.speed >= 0 ? location.coords.speed : null,
      headingDegrees: location.coords.heading >= 0
          ? location.coords.heading
          : null,
      batteryLevel: batteryLevel,
      isCharging: isCharging,
      networkType: networkType,
      pingSource: pingSource,
      recordedAt: DateTime.now(),
    );
  }
}

/// Registers [backgroundGeolocationHeadlessTask] with the plugin. Called
/// from [BackgroundGeolocationService.startTracking] — deliberately NOT
/// unconditionally at app boot (the plugin's own docs recommend that
/// pattern). Registering it at boot was confirmed on-device to break live
/// foreground `onLocation` delivery entirely in this plugin version;
/// registration timing relative to `configure()`/`ready()` is the one
/// variable that differs with this later call site. The native side
/// persists the registered callback handle once this succeeds, so it
/// doesn't need to be re-called on every app start — only once per
/// install, in practice once per first clock-in.
Future<void> registerBackgroundGeolocationHeadlessTask() =>
    bg.BackgroundGeolocation.registerHeadlessTask(
      backgroundGeolocationHeadlessTask,
    );

/// Receives plugin events while the app is fully terminated. Deliberately
/// scoped to ONLY [bg.Event.HEARTBEAT] — [bg.Event.LOCATION]/`.GEOFENCE`
/// fixes are captured and persisted by the native side automatically
/// regardless of headless dispatch (native `autoSync` already covers
/// those, see the class doc comment), but a heartbeat is purely a "wake up
/// and decide" signal with no automatic native location capture (per the
/// plugin's own doc comment on `HeartbeatEvent.location`) — this is the
/// one gap native autoSync can't cover on its own. Runs in a fresh,
/// minimal engine that never ran this app's own `main()`/`_bootstrap()` —
/// see [BackgroundGeolocationService._onHeartbeat] for why a fresh
/// position is explicitly requested rather than using the stale
/// `event.location`.
///
/// Must be a top-level (or static) function, not a closure — the plugin
/// addresses it via `PluginUtilities.getCallbackHandle`, which only works
/// for one of those. `@pragma('vm:entry-point')` keeps AOT tree-shaking
/// from stripping it since nothing in this app calls it directly.
@pragma('vm:entry-point')
void backgroundGeolocationHeadlessTask(bg.HeadlessEvent headlessEvent) async {
  if (headlessEvent.name != bg.Event.HEARTBEAT) return;
  try {
    final location = await bg.BackgroundGeolocation.getCurrentPosition(
      samples: 1,
      timeout: 10,
      persist: true,
      desiredAccuracy: 200,
    );
    await BackgroundGeolocationService()._handleLocation(
      location,
      pingSource: PingSource.background,
    );
  } catch (e, st) {
    developer.log(
      '[BackgroundGeolocationService] headless heartbeat failed: $e',
      name: 'BackgroundGeolocationService',
      error: e,
      stackTrace: st,
    );
  }
}
