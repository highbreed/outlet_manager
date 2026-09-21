import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:uuid/uuid.dart';
import 'package:workmanager/workmanager.dart';

import '../../../core/network/isolate_auth_context.dart';

/// Background task name for location ping.
const String locationPingTaskName = 'locationPingTask';

/// Unique name for periodic location ping task.
const String locationPingTaskUniqueName = 'outlet_manager_location_ping';

/// WorkManager callback dispatcher for background tasks.
///
/// This function must be a top-level function (not a class method).
@pragma('vm:entry-point')
void backgroundCallbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case locationPingTaskName:
        return await _executeLocationPing();
      default:
        return Future.value(false);
    }
  });
}

/// Execute a background location ping.
///
/// This runs in an isolate, so we need to initialize dependencies minimally.
Future<bool> _executeLocationPing() async {
  try {
    // Check location permission
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return true; // Can't get location, but don't fail the task
    }

    // Get location
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 30),
      ),
    );

    // Accuracy check
    if (position.accuracy > 200) {
      return true; // Too inaccurate, skip but don't fail
    }

    // Get device info
    final battery = Battery();
    int? batteryLevel;
    bool? isCharging;

    try {
      batteryLevel = await battery.batteryLevel;
      final state = await battery.batteryState;
      isCharging = state == BatteryState.charging || state == BatteryState.full;
    } catch (_) {
      // Battery info not available
    }

    // Get network type
    String? networkType;
    try {
      final connectivity = Connectivity();
      final result = await connectivity.checkConnectivity();
      if (result.contains(ConnectivityResult.wifi)) {
        networkType = 'wifi';
      } else if (result.contains(ConnectivityResult.mobile)) {
        networkType = 'cellular';
      } else {
        networkType = 'none';
      }
    } catch (_) {
      // Connectivity info not available
    }

    // Check if we're actually online
    if (networkType == 'none') {
      // Store locally for later sync - but we can't access Isar from isolate
      // The WorkManager constraint should prevent this, but just in case
      return true;
    }

    // Base URL — this isolate never ran main(), so AppConfig's static
    // fields are uninitialized; resolved independently instead. See
    // isolate_auth_context.dart.
    final region = resolveIsolateRegion();
    final apiBaseUrl = resolveIsolateApiBaseUrl(region);

    // Auth token — this isolate never ran main()/AuthController, so it's
    // read directly from secure storage rather than any in-memory state,
    // refreshing it first if it's close to expiry (this isolate has no
    // AuthInterceptor to do that automatically). A missing token, or a
    // refresh token that's been rejected, means there's nothing to ping
    // with — not a task failure to retry.
    final accessToken = await resolveIsolateAccessToken(apiBaseUrl);
    if (accessToken == null) {
      return true;
    }

    // App version — read via platform channel for the same reason the base
    // URL is resolved independently above: unlike the base URL this isn't a
    // compile-time constant, so it must be queried directly.
    final packageInfo = await PackageInfo.fromPlatform();

    // Create Dio instance for this isolate.
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

    // Send ping
    final response = await dio.post(
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
        'ping_source': 'background',
        'recorded_at': DateTime.now().toUtc().toIso8601String(),
        'device_ping_id': const Uuid().v4(),
      },
    );

    return response.statusCode == 200;
  } catch (e) {
    // Log error in debug mode
    if (kDebugMode) {
      // ignore: avoid_print
      print('Background location ping failed: $e');
    }
    // Return true to not retry immediately (WorkManager would retry failed tasks)
    return true;
  }
}

/// Initialize WorkManager for background location tracking.
///
/// Call this from main.dart after app initialization.
Future<void> initializeBackgroundLocationPing() async {
  await Workmanager().initialize(backgroundCallbackDispatcher);
}

/// Register periodic background location ping task.
///
/// On Android, minimum interval is 15 minutes due to WorkManager constraints.
Future<void> registerPeriodicLocationPing() async {
  await Workmanager().registerPeriodicTask(
    locationPingTaskUniqueName,
    locationPingTaskName,
    frequency: const Duration(minutes: 15), // Android minimum
    constraints: Constraints(
      networkType: NetworkType.connected,
      requiresBatteryNotLow: true,
    ),
    existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
    backoffPolicy: BackoffPolicy.exponential,
    initialDelay: const Duration(minutes: 1),
  );
}

/// Cancel periodic background location ping task.
Future<void> cancelPeriodicLocationPing() async {
  await Workmanager().cancelByUniqueName(locationPingTaskUniqueName);
}

/// Cancel all background tasks.
Future<void> cancelAllBackgroundTasks() async {
  await Workmanager().cancelAll();
}
