import 'dart:developer' as developer;
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'notification_channels.dart';
import 'notification_service.dart';

/// Top-level handler for FCM messages received while the app is in the
/// background or terminated.  Must be a top-level (non-class) function and
/// annotated with @pragma so the AOT compiler keeps it.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Firebase is already initialised by main() before this runs.
  developer.log('[FCM] Background message: ${message.messageId}');
  // flutter_local_notifications can show a local notification here if needed.
  // For most cases the system tray notification shown by FCM itself is enough.
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
