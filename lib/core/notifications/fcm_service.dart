import 'dart:developer' as developer;
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';

import '../database/isar_database.dart';
import '../../features/location_tracking/services/location_ping_request_handler.dart';
import '../../features/stock_take/services/device_cache_dump_handler.dart';
import 'notification_channels.dart';
import 'notification_service.dart';

/// Top-level handler for FCM messages received while the app is in the
/// background or terminated.  Must be a top-level (non-class) function and
/// annotated with @pragma so the AOT compiler keeps it.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If the app was fully terminated, FCM spawns a fresh headless isolate
  // for this call that never ran main() - nothing here can assume Firebase
  // (or any other plugin) is already initialised. Firebase.initializeApp()
  // is safe to call again when main() already did (same isolate, app still
  // alive): it just returns the existing default app.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  developer.log('[FCM] Background message: ${message.messageId}');
  try {
    await _dispatchDataMessage(message.data);
    // flutter_local_notifications can show a local notification here if
    // needed. For most cases the system tray notification shown by FCM
    // itself is enough.
  } finally {
    // _dispatchDataMessage can route to handleCacheDumpRequest, which opens
    // this isolate's OWN IsarDatabase._instance (Dart statics are
    // per-isolate) to read local stock-take data — the exact same cross-
    // isolate mdbx lock-contention bug class already fixed for the
    // headless location heartbeat (see HeadlessPingStagingStore's doc
    // comment): if this headless isolate still held that lock when the
    // user opened the app, the foreground app's own Isar.open() could
    // block past AppInitializationService's 45s database-phase timeout,
    // reproducing the exact "TimeoutException ... database" failure.
    // Closing here is safe ONLY because this function is the genuinely
    // headless entry point — `_setupForegroundHandler`'s own call to
    // _dispatchDataMessage (fcm_service.dart, foreground listener) runs in
    // the main app's own isolate, where IsarDatabase._instance IS the live
    // app's shared database; this close must never be added there. A
    // no-op if this isolate never opened an instance in the first place
    // (IsarDatabase.close() is null-safe).
    await IsarDatabase.close();
  }
}

/// Routes a data-only push to its handler based on `data.action`/`data.type`
/// - shared between the background handler above and [FcmService]'s
/// foreground listener, since neither surfaces a visible notification for
/// these and both need the same dispatch.
Future<void> _dispatchDataMessage(Map<String, dynamic> data) async {
  final action = data['action'] as String? ?? data['type'] as String?;
  switch (action) {
    case NotificationTypes.cacheDumpRequest:
      await handleCacheDumpRequest(data);
    case NotificationTypes.locationPingRequest:
      await handleLocationPingRequest(data);
    default:
      break;
  }
}

/// Wraps [FirebaseMessaging] and wires it into [NotificationService].
///
/// Responsibilities:
/// - Request notification permission (Android 13+ / iOS)
/// - Retrieve & refresh the device FCM token
/// - Forward foreground FCM messages to [NotificationService] as local notifications
/// - Expose a stream of tapped notifications for navigation
class FcmService {
  final FirebaseMessaging _fcm;
  final NotificationService _localNotifications;

  /// Called with the FCM token whenever it is first obtained or refreshed.
  /// Register this to upload the token to your backend.
  void Function(String token)? onTokenRefresh;

  /// Called when the user taps a notification (foreground or background).
  /// [data] is the `data` map from the [RemoteMessage].
  ///
  /// Setting this property replays any initial (cold-start) message that
  /// arrived before the callback was wired.
  Map<String, dynamic>? _pendingInitialTap;

  void Function(Map<String, dynamic> data)? _onNotificationTap;
  void Function(Map<String, dynamic> data)? get onNotificationTap =>
      _onNotificationTap;
  set onNotificationTap(void Function(Map<String, dynamic> data)? cb) {
    _onNotificationTap = cb;
    if (cb != null && _pendingInitialTap != null) {
      developer.log(
        '[FCM] Replaying cached cold-start tap: $_pendingInitialTap',
        name: 'FcmService',
      );
      final pending = _pendingInitialTap!;
      _pendingInitialTap = null;
      cb(pending);
    }
  }

  FcmService({
    FirebaseMessaging? messaging,
    required NotificationService localNotifications,
  })  : _fcm = messaging ?? FirebaseMessaging.instance,
        _localNotifications = localNotifications;

  // ── Initialise ──────────────────────────────────────────────────────────────

  Future<void> initialize() async {
    await _requestPermission();
    await _setupToken();
    _setupForegroundHandler();
    _setupInteractionHandlers();
    developer.log('[FCM] Initialized');
  }

  // ── Permission ──────────────────────────────────────────────────────────────

  Future<void> _requestPermission() async {
    final settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );
    developer.log('[FCM] Permission: ${settings.authorizationStatus}');
  }

  // ── Token management ────────────────────────────────────────────────────────

  Future<void> _setupToken() async {
    // On iOS the APNs token must be obtained before the FCM token.
    if (Platform.isIOS) {
      final apns = await _fcm.getAPNSToken();
      developer.log('[FCM] APNs token: $apns');
    }

    final token = await _fcm.getToken();
    if (token != null) {
      developer.log('[FCM] Token: $token');
      onTokenRefresh?.call(token);
    }

    _fcm.onTokenRefresh.listen((newToken) {
      developer.log('[FCM] Token refreshed');
      onTokenRefresh?.call(newToken);
    });
  }

  /// Returns the current FCM registration token, or null if unavailable.
  Future<String?> getToken() => _fcm.getToken();

  // ── Message handlers ────────────────────────────────────────────────────────

  void _setupForegroundHandler() {
    FirebaseMessaging.onMessage.listen((message) {
      developer.log('[FCM] Foreground message: ${message.messageId}');
      // Foreground messages never go through firebaseMessagingBackgroundHandler
      // (FCM only invokes that while backgrounded/terminated), so data-only
      // pushes like the cache-dump request need their own dispatch here too.
      _dispatchDataMessage(message.data);
      _showLocalNotification(message);
    });
  }

  void _setupInteractionHandlers() {
    // Notification tapped while app was in background (brought to foreground).
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      developer.log(
        '[FCM] Opened from background — id: ${message.messageId} | '
        'data: ${message.data}',
        name: 'FcmService',
      );
      _onNotificationTap?.call(message.data);
    });

    // Notification tapped when app was terminated (cold start).
    // onNotificationTap may not be wired yet — cache and replay.
    _fcm.getInitialMessage().then((message) {
      if (message == null) return;
      developer.log(
        '[FCM] Opened from terminated — id: ${message.messageId} | '
        'data: ${message.data}',
        name: 'FcmService',
      );
      if (_onNotificationTap != null) {
        _onNotificationTap!(message.data);
      } else {
        developer.log(
          '[FCM] onNotificationTap not yet set — caching cold-start tap',
          name: 'FcmService',
        );
        _pendingInitialTap = message.data;
      }
    });
  }

  // ── Local notification display for foreground messages ──────────────────────

  void _showLocalNotification(RemoteMessage message) {
    final notification = message.notification;
    developer.log(
      '[FCM] _showLocalNotification — notification field present: ${notification != null} | '
      'data: ${message.data}',
      name: 'FcmService',
    );
    if (notification == null) {
      developer.log(
        '[FCM] No notification field — data-only message, no local notification shown',
        name: 'FcmService',
      );
      return;
    }

    final title = notification.title ?? '';
    final body = notification.body ?? '';
    if (title.isEmpty && body.isEmpty) return;

    final payloadType = message.data['action'] as String?
        ?? message.data['type'] as String?
        ?? NotificationTypes.home;
    final payloadData = Map<String, dynamic>.from(message.data);
    final payload = NotificationPayload(type: payloadType, data: payloadData);
    developer.log(
      '[FCM] Showing local notification — title: "$title" | '
      'payloadType: $payloadType | serialized: ${payload.toJson()}',
      name: 'FcmService',
    );

    _localNotifications.showNotification(
      id: NotificationIds.getNextId(NotificationIds.announcement),
      title: title,
      body: body,
      channelId: _channelFromData(message.data),
      payload: payload,
    );
  }

  /// Pick the right local channel based on the FCM `data.action` or `data.type` field.
  String _channelFromData(Map<String, dynamic> data) {
    final key = data['action'] as String? ?? data['type'] as String?;
    switch (key) {
      case NotificationTypes.locationOverride:
      case NotificationTypes.geofenceOverride:
      case NotificationTypes.geofenceExit:
        return NotificationChannels.geofence;
      case 'order':
        return NotificationChannels.orders;
      case 'route':
        return NotificationChannels.routes;
      case 'sync':
        return NotificationChannels.sync;
      default:
        return NotificationChannels.general;
    }
  }
}
