import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/services.dart';

import '../config/app_config.dart';
import '../storage/token_storage.dart';

/// A token pair native's `SecureTokenStore` refreshed on its own — see
/// `BackgroundLocationService.tokenRefreshedEvents`.
class NativeTokenRefresh {
  final String accessToken;
  final String refreshToken;
  final DateTime accessExpiresAt;

  const NativeTokenRefresh({
    required this.accessToken,
    required this.refreshToken,
    required this.accessExpiresAt,
  });
}

/// A geofence exit/re-entry [GeofenceHysteresisTracker] confirmed natively —
/// see `LocationTrackingService.handleLocationResult` in Kotlin. Purely
/// informational on the Dart side (e.g. for a notification while the app
/// happens to be foregrounded); the native engine has already acted on it
/// independently by the time this arrives.
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

/// Snapshot of the native tracking engine's state — backs the temporary
/// `GeofenceDebugScreen` used for field testing (see
/// `TrackingMethodChannel.handleGetTrackingStatus`'s doc comment for why
/// this is sourced from persisted stores rather than a live service
/// reference).
class BackgroundTrackingStatus {
  final bool isTracking;
  final String? visitId;
  final String? outletName;
  final int pendingPingCount;
  final double? distanceMeters;
  final double? geofenceRadiusMeters;
  final int consecutiveOutside;
  final int consecutiveInside;
  final bool confirmedOutside;
  final bool isStill;
  final int? currentIntervalMs;

  const BackgroundTrackingStatus({
    required this.isTracking,
    this.visitId,
    this.outletName,
    required this.pendingPingCount,
    this.distanceMeters,
    this.geofenceRadiusMeters,
    this.consecutiveOutside = 0,
    this.consecutiveInside = 0,
    this.confirmedOutside = false,
    this.isStill = false,
    this.currentIntervalMs,
  });
}

/// One line from native's `TrackingEventBridge.emitDebugLog` — the live
/// feed on the geofence debug screen. Free text by design: this exists
/// purely so a field tester without a laptop can see *something*, not as a
/// stable machine-readable contract.
class DebugLogEntry {
  final String message;
  final DateTime timestamp;

  const DebugLogEntry({required this.message, required this.timestamp});
}

/// Dart-side wrapper around the native background location tracking engine
/// (see `android/app/src/main/kotlin/.../location/`). Once started, tracking
/// runs entirely in `LocationTrackingService` and survives the Flutter
/// Activity being backgrounded, locked, or destroyed — that's the whole
/// reason this exists instead of the Dart-timer-driven `LocationPingService`.
///
/// Android only for now — this is Phase 1 of the native engine; iOS isn't
/// implemented yet, so every method is a no-op there.
class BackgroundLocationService {
  static const _channel = MethodChannel('outlet_manager/tracking');
  static const _eventChannel = EventChannel('outlet_manager/tracking_events');

  // A platform EventChannel supports exactly one active `listen()` at a
  // time — calling `receiveBroadcastStream()` a second time re-registers
  // native's `onListen`/`onCancel` and silently steals events from whoever
  // was already listening. [tokenRefreshedEvents] and
  // [geofenceTransitionEvents] both need to be listened to concurrently
  // (see `main.dart`), so they share this single underlying broadcast
  // stream instead of each calling `receiveBroadcastStream()` themselves.
  Stream<Map<String, dynamic>>? _rawEvents;

  Stream<Map<String, dynamic>> get _events {
    return _rawEvents ??= _eventChannel.receiveBroadcastStream().map(
      (event) => Map<String, dynamic>.from(event as Map),
    );
  }

  /// Fires whenever native's `SecureTokenStore` refreshes the access token
  /// on its own — the other half of the token-sync loop alongside
  /// [syncTokens]. Without listening to this, a native-side refresh
  /// silently rotates the server's refresh token while Dart's own
  /// `TokenStorage` never finds out, so Dart's *next* refresh attempt gets
  /// rejected with a 401 it can't explain. See `main.dart` for the one
  /// place this is subscribed for the app's lifetime.
  ///
  /// Empty on iOS (no native engine there yet).
  Stream<NativeTokenRefresh> get tokenRefreshedEvents {
    if (!Platform.isAndroid) return const Stream.empty();

    return _events
        .where((map) => map['type'] == 'tokensRefreshed')
        .map(
          (map) => NativeTokenRefresh(
            accessToken: map['accessToken'] as String,
            refreshToken: map['refreshToken'] as String,
            accessExpiresAt: DateTime.fromMillisecondsSinceEpoch(
              map['accessExpiresAtEpochMillis'] as int,
            ),
          ),
        );
  }

  /// Fires whenever native's `GeofenceHysteresisTracker` confirms a geofence
  /// exit or re-entry — the other event type on the same channel as
  /// [tokenRefreshedEvents]. Empty on iOS (no native engine there yet).
  Stream<GeofenceTransition> get geofenceTransitionEvents {
    if (!Platform.isAndroid) return const Stream.empty();

    return _events
        .where((map) => map['type'] == 'geofenceTransition')
        .map(
          (map) => GeofenceTransition(
            isExit: map['transitionType'] == 'exit',
            visitId: map['visitId'] as String,
            outletName: map['outletName'] as String,
            distanceMeters: (map['distanceMeters'] as num).toDouble(),
          ),
        );
  }

  /// Live feed for the temporary geofence debug screen — see
  /// `TrackingEventBridge.emitDebugLog`'s doc comment. Only ever populated
  /// while the app happens to be foregrounded and listening; nothing else
  /// depends on these arriving. Empty on iOS.
  Stream<DebugLogEntry> get debugLogEvents {
    if (!Platform.isAndroid) return const Stream.empty();

    return _events
        .where((map) => map['type'] == 'debugLog')
        .map(
          (map) => DebugLogEntry(
            message: map['message'] as String,
            timestamp: DateTime.fromMillisecondsSinceEpoch(
              map['timestampEpochMillis'] as int,
            ),
          ),
        );
  }

  /// Starts native background tracking for a just-clocked-in visit. Seeds
  /// the native engine's own encrypted token copy (see `SecureTokenStore.kt`
  /// for why it needs its own copy rather than sharing Dart's) with the
  /// current tokens so it can refresh independently later, with no Flutter
  /// engine required to be alive.
  ///
  /// Best-effort: a failure here is logged, not thrown — it must not block
  /// the clock-in flow that triggers it.
  Future<void> startTracking({
    required String visitId,
    required String outletName,
    required double outletLatitude,
    required double outletLongitude,
    required double geofenceRadiusMeters,
  }) async {
    if (!Platform.isAndroid) return;

    try {
      final tokens = await TokenStorage().getTokens();
      if (tokens == null) {
        developer.log(
          '[BackgroundLocationService] No tokens available, not starting tracking',
          name: 'BackgroundLocationService',
        );
        return;
      }

      await _channel.invokeMethod('startTracking', {
        'visitId': visitId,
        'outletName': outletName,
        'outletLatitude': outletLatitude,
        'outletLongitude': outletLongitude,
        'geofenceRadiusMeters': geofenceRadiusMeters,
        'apiBaseUrl': AppConfig.apiBaseUrl,
        'accessToken': tokens.accessToken,
        'refreshToken': tokens.refreshToken,
        'accessExpiresAtEpochMillis': tokens.accessExpiresAt.millisecondsSinceEpoch,
      });
    } catch (e, st) {
      developer.log(
        '[BackgroundLocationService] startTracking failed: $e',
        name: 'BackgroundLocationService',
        error: e,
        stackTrace: st,
      );
    }
  }

  /// Stops native background tracking after clock-out. Best-effort, same as
  /// [startTracking] — a failure here shouldn't block the clock-out flow.
  Future<void> stopTracking() async {
    if (!Platform.isAndroid) return;

    try {
      await _channel.invokeMethod('stopTracking');
    } catch (e, st) {
      developer.log(
        '[BackgroundLocationService] stopTracking failed: $e',
        name: 'BackgroundLocationService',
        error: e,
        stackTrace: st,
      );
    }
  }

  /// Pushes a freshly-refreshed token to the native engine's own encrypted
  /// copy (`SecureTokenStore.kt`), so it doesn't drift out of sync with
  /// whatever `AuthInterceptor` is doing — see the call site in
  /// `auth_interceptor.dart` for why this matters (rotating refresh tokens
  /// can otherwise permanently strand the native copy after just one
  /// independent refresh on either side). A no-op if the native engine
  /// isn't currently tracking; harmless either way.
  Future<void> syncTokens({
    required String accessToken,
    required String refreshToken,
    required DateTime accessExpiresAt,
  }) async {
    if (!Platform.isAndroid) return;

    try {
      await _channel.invokeMethod('syncTokens', {
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'accessExpiresAtEpochMillis': accessExpiresAt.millisecondsSinceEpoch,
      });
    } catch (e, st) {
      developer.log(
        '[BackgroundLocationService] syncTokens failed: $e',
        name: 'BackgroundLocationService',
        error: e,
        stackTrace: st,
      );
    }
  }

  Future<BackgroundTrackingStatus> getTrackingStatus() async {
    if (!Platform.isAndroid) {
      return const BackgroundTrackingStatus(
        isTracking: false,
        pendingPingCount: 0,
      );
    }

    try {
      final result = await _channel.invokeMapMethod<String, dynamic>(
        'getTrackingStatus',
      );
      return BackgroundTrackingStatus(
        isTracking: result?['tracking'] as bool? ?? false,
        visitId: result?['visitId'] as String?,
        outletName: result?['outletName'] as String?,
        pendingPingCount: result?['pendingPingCount'] as int? ?? 0,
        distanceMeters: (result?['distanceMeters'] as num?)?.toDouble(),
        geofenceRadiusMeters: (result?['geofenceRadiusMeters'] as num?)
            ?.toDouble(),
        consecutiveOutside: result?['consecutiveOutside'] as int? ?? 0,
        consecutiveInside: result?['consecutiveInside'] as int? ?? 0,
        confirmedOutside: result?['confirmedOutside'] as bool? ?? false,
        isStill: result?['isStill'] as bool? ?? false,
        currentIntervalMs: result?['currentIntervalMs'] as int?,
      );
    } catch (e, st) {
      developer.log(
        '[BackgroundLocationService] getTrackingStatus failed: $e',
        name: 'BackgroundLocationService',
        error: e,
        stackTrace: st,
      );
      return const BackgroundTrackingStatus(
        isTracking: false,
        pendingPingCount: 0,
      );
    }
  }

  /// Whether the OS currently exempts this app from Doze/App Standby.
  /// Confirmed by device testing: without this, broadcast delivery
  /// (including BOOT_COMPLETED, blocking the reboot-recovery path) can be
  /// deferred or dropped outright, independent of anything else this app
  /// does correctly.
  Future<bool> isIgnoringBatteryOptimizations() async {
    if (!Platform.isAndroid) return true;

    try {
      final result = await _channel.invokeMethod<bool>(
        'isIgnoringBatteryOptimizations',
      );
      return result ?? false;
    } catch (e, st) {
      developer.log(
        '[BackgroundLocationService] isIgnoringBatteryOptimizations failed: $e',
        name: 'BackgroundLocationService',
        error: e,
        stackTrace: st,
      );
      return false;
    }
  }

  /// Opens the system dialog asking the user to exempt this app from
  /// battery optimization. Google Play restricts this permission to apps
  /// with genuine ongoing background work, so — same as the location
  /// permission disclosure on the same screen — only call this from a
  /// context that's already explained why, not unprompted.
  Future<void> requestBatteryOptimizationExemption() async {
    if (!Platform.isAndroid) return;

    try {
      await _channel.invokeMethod('requestBatteryOptimizationExemption');
    } catch (e, st) {
      developer.log(
        '[BackgroundLocationService] requestBatteryOptimizationExemption failed: $e',
        name: 'BackgroundLocationService',
        error: e,
        stackTrace: st,
      );
    }
  }
}
