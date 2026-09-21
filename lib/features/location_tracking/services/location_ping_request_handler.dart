import 'dart:developer' as developer;

import 'package:battery_plus/battery_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';

import '../../../core/network/isolate_auth_context.dart';

/// Handles a silent "location ping request" FCM data push: the backend has
/// noticed a clocked-in agent's location has gone stale and is asking this
/// device to send a fresh ping right now. There's no bespoke "report back"
/// endpoint — a normal `POST /visits/location/ping` call *is* the response,
/// correlated server-side by timing rather than any special field.
///
/// Called from both `firebaseMessagingBackgroundHandler` (app
/// backgrounded/terminated) and `FcmService`'s foreground message listener,
/// so — same as [handleCacheDumpRequest] and `location_ping_worker.dart`'s
/// `_executeLocationPing` — it must be fully self-contained: no Riverpod
/// `Ref`, no `BuildContext`, only isolate-safe helpers
/// (`isolate_auth_context.dart`, a standalone `Dio`). In particular the
/// access token is resolved via [resolveIsolateAccessToken], which
/// refreshes it first if it's close to expiry — this isolate has no
/// `AuthInterceptor` to do that automatically.
///
/// [data] is the `data` map from the FCM `RemoteMessage`. `visit_id` is
/// informational only — logged for diagnostics, nothing else required.
Future<void> handleLocationPingRequest(Map<String, dynamic> data) async {
  final visitId = data['visit_id'];
  developer.log(
    '[LocationPingRequest] Received for visit_id=$visitId',
    name: 'LocationPingRequest',
  );

  final region = resolveIsolateRegion();
  if (!region.locationPingRequestEnabled) {
    // Phased rollout — Kenya-only for now. The backend still sends this
    // push to every active device regardless of region, so devices outside
    // the enabled region(s) just no-op; nothing to log as an error.
    developer.log(
      '[LocationPingRequest] Disabled for region ${region.code}, dropping',
      name: 'LocationPingRequest',
    );
    return;
  }

  try {
    // Location permission — if it's gone, there's nothing to send; let the
    // backend's retry/escalation handle it rather than raising an error
    // with no user-facing surface to show it on.
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      developer.log(
        '[LocationPingRequest] No location permission, dropping',
        name: 'LocationPingRequest',
      );
      return;
    }

    // Same accuracy/timeout behavior as a normal ping — no "hurry up" mode.
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 30),
      ),
    );

    final battery = Battery();
    int? batteryLevel;
    bool? isCharging;
    try {
      batteryLevel = await battery.batteryLevel;
      final state = await battery.batteryState;
      isCharging =
          state == BatteryState.charging || state == BatteryState.full;
    } catch (_) {
      // Battery info not available — omit, not fatal.
    }

    String? networkType;
    try {
      final result = await Connectivity().checkConnectivity();
      if (result.contains(ConnectivityResult.wifi)) {
        networkType = 'wifi';
      } else if (result.contains(ConnectivityResult.mobile)) {
        networkType = 'cellular';
      } else {
        networkType = 'none';
      }
    } catch (_) {
      // Connectivity info not available — omit, not fatal.
    }

    final apiBaseUrl = resolveIsolateApiBaseUrl(region);
    final accessToken = await resolveIsolateAccessToken(apiBaseUrl);
    if (accessToken == null || accessToken.isEmpty) {
      developer.log(
        '[LocationPingRequest] No usable access token, dropping',
        name: 'LocationPingRequest',
      );
      return;
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: apiBaseUrl,
        headers: {'Authorization': 'Bearer $accessToken'},
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    await dio.post(
      '/visits/location/ping',
      data: {
        'latitude': position.latitude,
        'longitude': position.longitude,
        'accuracy_meters': position.accuracy,
        if (position.altitude != 0) 'altitude_meters': position.altitude,
        if (position.speed >= 0) 'speed_mps': position.speed,
        if (position.heading >= 0) 'heading_degrees': position.heading,
        if (batteryLevel != null) 'battery_level': batteryLevel,
        if (isCharging != null) 'is_charging': isCharging,
        if (networkType != null) 'network_type': networkType,
        // Not a new "requested" source — the backend only accepts
        // foreground/background, and this is a silent, non-interactive
        // response, same as any other background-triggered ping.
        'ping_source': 'background',
        'recorded_at': DateTime.now().toUtc().toIso8601String(),
        'device_ping_id': const Uuid().v4(),
      },
    );

    developer.log(
      '[LocationPingRequest] Ping sent for visit_id=$visitId',
      name: 'LocationPingRequest',
    );
  } catch (e, st) {
    // Best-effort and silent by design — no user-facing surface to show an
    // error on. If this keeps failing the backend will retry, then
    // force-close the visit and revoke the session; that's the intended
    // enforcement path, not a bug to work around here.
    developer.log(
      '[LocationPingRequest] Failed for visit_id=$visitId: $e',
      name: 'LocationPingRequest',
      error: e,
      stackTrace: st,
    );
  }
}
