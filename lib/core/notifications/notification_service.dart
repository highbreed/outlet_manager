import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'notification_channels.dart';

/// Notification callback type for handling notification taps
typedef NotificationTapCallback = void Function(NotificationPayload? payload);

/// Background notification handler
@pragma('vm:entry-point')
void notificationBackgroundHandler(NotificationResponse response) {
  // Handle notification tapped in background
  // Navigation will be handled by the callback
}

/// Service for managing all app notifications
/// Comprehensive notification system supporting all app notification types
class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin;
  bool _initialized = false;
  Timer? _countdownTimer;
  DateTime? _gracePeriodStartTime;
  NotificationTapCallback? _onNotificationTapCallback;

  NotificationService() : _plugin = FlutterLocalNotificationsPlugin();

  /// Set callback for notification taps
  void setNotificationCallback(NotificationTapCallback callback) {
    _onNotificationTapCallback = callback;
  }

  /// Initialize the notification service
  Future<void> initialize() async {
    if (_initialized) return;

    // Note: Timezone support can be added later if needed
    // by importing 'package:timezone/timezone.dart' and calling tz.initializeTimeZones()

    const androidInitSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosInitSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const linuxInitSettings = LinuxInitializationSettings(
      defaultActionName: 'Open notification',
    );

    const initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iosInitSettings,
      linux: linuxInitSettings,
    );

    final initialized = await _plugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    if (initialized != true) {
      throw Exception('Failed to initialize notifications');
    }

    // Create notification channels (Android)
    if (Platform.isAndroid) {
      await _createNotificationChannels();
    }

    _initialized = true;
  }

  /// Create notification channels for Android
  Future<void> _createNotificationChannels() async {
    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    if (androidPlugin == null) return;

    final channels = [
      // Geofence alerts channel
      const AndroidNotificationChannel(
        NotificationChannels.geofence,
        NotificationChannels.geofenceName,
        description: 'Alerts when you exit or approach geofence boundaries',
        importance: Importance.high,
        playSound: true,
        enableVibration: true,
      ),
      // Sync alerts channel
      const AndroidNotificationChannel(
        NotificationChannels.sync,
        NotificationChannels.syncName,
        description: 'Alerts about sync failures and issues',
        importance: Importance.defaultImportance,
        playSound: true,
      ),
      // Location alerts channel
      const AndroidNotificationChannel(
        NotificationChannels.location,
        NotificationChannels.locationName,
        description: 'Warnings about location accuracy or availability',
        importance: Importance.high,
        playSound: true,
      ),
      // Persistent notification channel
      const AndroidNotificationChannel(
        NotificationChannels.persistent,
        NotificationChannels.persistentName,
        description: 'Shows current active session status',
        importance: Importance.low,
        playSound: false,
        showBadge: false,
      ),
      // General notifications channel
      const AndroidNotificationChannel(
        NotificationChannels.general,
        NotificationChannels.generalName,
        description: 'General app notifications and announcements',
        importance: Importance.defaultImportance,
        playSound: true,
      ),
      // Task notifications channel
      const AndroidNotificationChannel(
        NotificationChannels.tasks,
        NotificationChannels.tasksName,
        description: 'Task reminders and deadlines',
        importance: Importance.high,
        playSound: true,
        enableVibration: true,
      ),
      // Order notifications channel
      const AndroidNotificationChannel(
        NotificationChannels.orders,
        NotificationChannels.ordersName,
        description: 'Order status updates and confirmations',
        importance: Importance.high,
        playSound: true,
      ),
      // Route notifications channel
      const AndroidNotificationChannel(
        NotificationChannels.routes,
        NotificationChannels.routesName,
        description: 'Route assignments and updates',
        importance: Importance.defaultImportance,
        playSound: true,
      ),
      // Reminder notifications channel
      const AndroidNotificationChannel(
        NotificationChannels.reminders,
        NotificationChannels.remindersName,
        description: 'Time-based reminders and alerts',
        importance: Importance.high,
        playSound: true,
        enableVibration: true,
      ),
    ];

    for (final channel in channels) {
      await androidPlugin.createNotificationChannel(channel);
    }
  }

  /// Handle notification tap
  void _onNotificationTapped(NotificationResponse response) {
    developer.log(
      '[NotifService] Tap received — raw payload: "${response.payload}"',
      name: 'NotifService',
    );
    final payload = NotificationPayload.fromJson(response.payload);
    developer.log(
      '[NotifService] Parsed payload — type: ${payload?.type} | data: ${payload?.data} | '
      'callback set: ${_onNotificationTapCallback != null}',
      name: 'NotifService',
    );
    _onNotificationTapCallback?.call(payload);
  }

  // ==================== GEOFENCE NOTIFICATIONS ====================

  /// Show notification when user exits geofence
  Future<void> showGeofenceExitDetected({
    required String outletName,
    required double distanceMeters,
  }) async {
    await _showNotification(
      id: NotificationIds.geofenceExit,
      channelId: NotificationChannels.geofence,
      title: '⚠️ Geofence Exit Detected',
      body:
          'You are ${distanceMeters.toStringAsFixed(0)}m away from $outletName. '
          'Please return to avoid auto clock-out.',
      priority: Priority.high,
      importance: Importance.high,
      playSound: true,
      payload: NotificationPayload(
        type: NotificationTypes.geofenceExit,
        data: {'outlet': outletName},
      ),
    );
  }

  /// Show 5-minute warning
  Future<void> showGeofence5MinuteWarning({required String outletName}) async {
    await _showNotification(
      id: NotificationIds.geofence5MinWarning,
      channelId: NotificationChannels.geofence,
      title: '⏰ 5 Minutes Until Auto Clock-Out',
      body: 'Return to $outletName within 5 minutes to remain clocked in.',
      priority: Priority.high,
      importance: Importance.high,
      playSound: true,
      payload: NotificationPayload(
        type: NotificationTypes.geofenceExit,
        data: {'outlet': outletName},
      ),
    );
  }

  /// Show 9-minute warning (1 minute remaining)
  Future<void> showGeofence9MinuteWarning({required String outletName}) async {
    await _showNotification(
      id: NotificationIds.geofence9MinWarning,
      channelId: NotificationChannels.geofence,
      title: '🚨 1 Minute Until Auto Clock-Out',
      body:
          'URGENT: Return to $outletName immediately or you will be automatically clocked out.',
      priority: Priority.max,
      importance: Importance.max,
      playSound: true,
      payload: NotificationPayload(
        type: NotificationTypes.geofenceExit,
        data: {'outlet': outletName},
      ),
    );
  }

  /// Show auto clock-out notification
  Future<void> showGeofenceAutoClockOut({
    required String outletName,
    required DateTime clockOutTime,
  }) async {
    await _showNotification(
      id: NotificationIds.geofenceAutoClockout,
      channelId: NotificationChannels.geofence,
      title: '✓ Auto Clock-Out Complete',
      body:
          'You have been automatically clocked out from $outletName at '
          '${_formatTime(clockOutTime)} due to geofence exit.',
      priority: Priority.high,
      importance: Importance.high,
      playSound: true,
      payload: NotificationPayload(
        type: NotificationTypes.clockSession,
        data: {'outlet': outletName},
      ),
    );
  }

  // ==================== PERSISTENT NOTIFICATIONS ====================

  /// Start countdown timer for grace period
  void startCountdownTimer({
    required String outletName,
    required Duration totalDuration,
  }) {
    _gracePeriodStartTime = DateTime.now();
    _countdownTimer?.cancel();

    // Update notification every 5 seconds
    _countdownTimer = Timer.periodic(const Duration(seconds: 5), (_) async {
      final elapsed = DateTime.now().difference(_gracePeriodStartTime!);
      final remaining = totalDuration - elapsed;

      if (remaining.isNegative) {
        _stopCountdownTimer();
        return;
      }

      await showPersistentCountdown(
        outletName: outletName,
        remainingTime: remaining,
      );
    });
  }

  /// Stop countdown timer
  void _stopCountdownTimer() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    _gracePeriodStartTime = null;
  }

  /// Show persistent notification with countdown timer
  /// Used during geofence grace period
  Future<void> showPersistentCountdown({
    required String outletName,
    required Duration remainingTime,
  }) async {
    final minutes = remainingTime.inMinutes;
    final seconds = remainingTime.inSeconds % 60;
    final timeString = '$minutes:${seconds.toString().padLeft(2, '0')}';

    await _showNotification(
      id: NotificationIds.persistentSession,
      channelId: NotificationChannels.persistent,
      title: 'Active Session - Grace Period',
      body: '$outletName • Auto clock-out in $timeString',
      priority: Priority.low,
      importance: Importance.low,
      playSound: false,
      ongoing: true,
      autoCancel: false,
      payload: NotificationPayload(
        type: NotificationTypes.clockSession,
        data: {'outlet': outletName},
      ),
    );
  }

  /// Show persistent notification for normal session
  Future<void> showPersistentSession({
    required String outletName,
    required DateTime clockInTime,
  }) async {
    final duration = DateTime.now().difference(clockInTime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final timeString = '${hours}h ${minutes}m';

    await _showNotification(
      id: NotificationIds.persistentSession,
      channelId: NotificationChannels.persistent,
      title: 'Active Session',
      body: '$outletName • Duration: $timeString',
      priority: Priority.low,
      importance: Importance.low,
      playSound: false,
      ongoing: true,
      autoCancel: false,
      payload: NotificationPayload(
        type: NotificationTypes.clockSession,
        data: {'outlet': outletName},
      ),
    );
  }

  /// Clear persistent notification
  Future<void> clearPersistentNotification() async {
    _stopCountdownTimer();
    await _cancel(NotificationIds.persistentSession);
  }

  /// Clear all geofence notifications
  Future<void> clearGeofenceNotifications() async {
    await _cancel(NotificationIds.geofenceExit);
    await _cancel(NotificationIds.geofence5MinWarning);
    await _cancel(NotificationIds.geofence9MinWarning);
    await _cancel(NotificationIds.geofenceAutoClockout);
  }

  /// Every cancel goes through here. The plugin's native cancel path can
  /// throw (the R8/Gson TypeToken crash this week — see proguard-rules.pro),
  /// and these are all purely cosmetic cleanups fired from location and
  /// sync listeners: a failed dismissal must never take down the app.
  Future<void> _cancel(int id) async {
    try {
      await _plugin.cancel(id);
    } catch (e, st) {
      developer.log(
        '[NotificationService] cancel($id) failed: $e',
        name: 'NotificationService',
        error: e,
        stackTrace: st,
      );
    }
  }

  // ==================== SYNC NOTIFICATIONS ====================

  /// Show sync failure notification
  Future<void> showSyncFailure({
    required String operationType,
    required int failedCount,
    required int retryCount,
  }) async {
    String body = '$failedCount $operationType operation(s) failed to sync. ';
    if (retryCount > 0) {
      body += 'Retry attempt $retryCount. ';
    }
    body += 'Will retry automatically.';

    await _showNotification(
      id: NotificationIds.syncFailure,
      channelId: NotificationChannels.sync,
      title: '⚠️ Sync Issue',
      body: body,
      priority: Priority.defaultPriority,
      importance: Importance.defaultImportance,
      playSound: true,
      payload: NotificationPayload(
        type: NotificationTypes.sync,
        data: {'operationType': operationType},
      ),
    );
  }

  /// Show sync success notification (for critical operations)
  Future<void> showSyncSuccess({required String operationType}) async {
    await _showNotification(
      id: NotificationIds.syncSuccess,
      channelId: NotificationChannels.sync,
      title: '✓ Sync Complete',
      body: '$operationType synced successfully.',
      priority: Priority.low,
      importance: Importance.low,
      playSound: false,
      payload: NotificationPayload(
        type: NotificationTypes.sync,
        data: {'operationType': operationType},
      ),
    );
  }

  /// Clear sync notifications
  Future<void> clearSyncNotifications() async {
    await _cancel(NotificationIds.syncFailure);
    await _cancel(NotificationIds.syncSuccess);
  }

  // ==================== LOCATION NOTIFICATIONS ====================

  /// Show location accuracy warning
  Future<void> showLocationAccuracyWarning({
    required double currentAccuracy,
    required double requiredAccuracy,
  }) async {
    await _showNotification(
      id: NotificationIds.locationAccuracy,
      channelId: NotificationChannels.location,
      title: '⚠️ Low Location Accuracy',
      body:
          'Current accuracy: ${currentAccuracy.toStringAsFixed(0)}m. '
          'Required: ${requiredAccuracy.toStringAsFixed(0)}m. '
          'Move to an area with better GPS signal.',
      priority: Priority.high,
      importance: Importance.high,
      playSound: true,
      payload: const NotificationPayload(type: NotificationTypes.location),
    );
  }

  /// Show location disabled warning
  Future<void> showLocationDisabledWarning() async {
    await _showNotification(
      id: NotificationIds.locationDisabled,
      channelId: NotificationChannels.location,
      title: '❌ Location Services Disabled',
      body: 'Please enable location services to continue using the app.',
      priority: Priority.max,
      importance: Importance.max,
      playSound: true,
      payload: const NotificationPayload(type: NotificationTypes.settings),
    );
  }

  /// Show location permission denied warning
  Future<void> showLocationPermissionDenied() async {
    await _showNotification(
      id: NotificationIds.locationPermission,
      channelId: NotificationChannels.location,
      title: '❌ Location Permission Required',
      body: 'Please grant location permission in app settings.',
      priority: Priority.max,
      importance: Importance.max,
      playSound: true,
      payload: const NotificationPayload(type: NotificationTypes.settings),
    );
  }

  /// Clear location notifications
  Future<void> clearLocationNotifications() async {
    await _cancel(NotificationIds.locationWarning);
    await _cancel(NotificationIds.locationDisabled);
    await _cancel(NotificationIds.locationPermission);
    await _cancel(NotificationIds.locationAccuracy);
  }

  // ==================== GENERAL NOTIFICATIONS ====================

  /// Show generic notification
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String channelId = NotificationChannels.general,
    Priority priority = Priority.defaultPriority,
    Importance importance = Importance.defaultImportance,
    bool playSound = true,
    NotificationPayload? payload,
  }) async {
    await _showNotification(
      id: id,
      channelId: channelId,
      title: title,
      body: body,
      priority: priority,
      importance: importance,
      playSound: playSound,
      payload: payload,
    );
  }

  // ==================== TASK NOTIFICATIONS ====================

  /// Show task reminder
  Future<void> showTaskReminder({
    required String taskTitle,
    required String outletName,
  }) async {
    await _showNotification(
      id: NotificationIds.taskReminder,
      channelId: NotificationChannels.tasks,
      title: '📋 Task Reminder',
      body: '$taskTitle at $outletName',
      priority: Priority.high,
      importance: Importance.high,
      playSound: true,
      payload: NotificationPayload(
        type: NotificationTypes.task,
        data: {'task': taskTitle, 'outlet': outletName},
      ),
    );
  }

  /// Show task deadline approaching
  Future<void> showTaskDeadline({
    required String taskTitle,
    required Duration remaining,
  }) async {
    final hours = remaining.inHours;
    final timeText = hours > 0
        ? '$hours hours'
        : '${remaining.inMinutes} minutes';

    await _showNotification(
      id: NotificationIds.taskDeadline,
      channelId: NotificationChannels.tasks,
      title: '⏰ Task Deadline Approaching',
      body: '$taskTitle is due in $timeText',
      priority: Priority.high,
      importance: Importance.high,
      playSound: true,
      payload: NotificationPayload(
        type: NotificationTypes.task,
        data: {'task': taskTitle},
      ),
    );
  }

  // ==================== ORDER NOTIFICATIONS ====================

  /// Show order confirmation
  Future<void> showOrderConfirmed({
    required String orderNumber,
    required String outletName,
  }) async {
    await _showNotification(
      id: NotificationIds.getNextId(NotificationIds.orderConfirmed),
      channelId: NotificationChannels.orders,
      title: '✓ Order Confirmed',
      body: 'Order #$orderNumber for $outletName has been confirmed',
      priority: Priority.high,
      importance: Importance.high,
      playSound: true,
      payload: NotificationPayload(
        type: NotificationTypes.order,
        data: {'orderNumber': orderNumber},
      ),
    );
  }

  /// Show order rejection
  Future<void> showOrderRejected({
    required String orderNumber,
    required String reason,
  }) async {
    await _showNotification(
      id: NotificationIds.getNextId(NotificationIds.orderRejected),
      channelId: NotificationChannels.orders,
      title: '❌ Order Rejected',
      body: 'Order #$orderNumber: $reason',
      priority: Priority.high,
      importance: Importance.high,
      playSound: true,
      payload: NotificationPayload(
        type: NotificationTypes.order,
        data: {'orderNumber': orderNumber},
      ),
    );
  }

  // ==================== ROUTE NOTIFICATIONS ====================

  /// Show route assigned
  Future<void> showRouteAssigned({
    required String routeName,
    required int outletCount,
  }) async {
    await _showNotification(
      id: NotificationIds.routeAssigned,
      channelId: NotificationChannels.routes,
      title: '🗺️ New Route Assigned',
      body: '$routeName with $outletCount outlets',
      priority: Priority.high,
      importance: Importance.high,
      playSound: true,
      payload: NotificationPayload(
        type: NotificationTypes.route,
        data: {'route': routeName},
      ),
    );
  }

  /// Show route deviation alert
  Future<void> showRouteDeviation({
    required String currentOutlet,
    required String nextOutlet,
  }) async {
    await _showNotification(
      id: NotificationIds.routeDeviation,
      channelId: NotificationChannels.routes,
      title: '⚠️ Route Deviation',
      body: 'Expected: $nextOutlet. Current: $currentOutlet',
      priority: Priority.high,
      importance: Importance.high,
      playSound: true,
      payload: const NotificationPayload(type: NotificationTypes.route),
    );
  }

  // ==================== TIME-BASED REMINDERS ====================

  /// Show time exceeded at outlet
  Future<void> showTimeExceeded({
    required String outletName,
    required Duration allocatedTime,
    required Duration actualTime,
  }) async {
    final overBy = actualTime - allocatedTime;
    final overMinutes = overBy.inMinutes;

    await _showNotification(
      id: NotificationIds.timeExceeded,
      channelId: NotificationChannels.reminders,
      title: '⏱️ Time Exceeded',
      body:
          'You\'ve exceeded allocated time at $outletName by $overMinutes minutes',
      priority: Priority.high,
      importance: Importance.high,
      playSound: true,
      payload: NotificationPayload(
        type: NotificationTypes.clockSession,
        data: {'outlet': outletName},
      ),
    );
  }

  /// Show a foreground-only "lunch is over" nudge. Fired by the lunch
  /// countdown widget once it reconciles with the server that the break
  /// actually expired (never a blind local-timer guess) and only within a
  /// short freshness window — see `LunchBreakBanner`. Not a scheduled
  /// notification: it never fires while the app is backgrounded/killed.
  Future<void> showLunchOver() async {
    await _showNotification(
      id: NotificationIds.lunchOver,
      channelId: NotificationChannels.reminders,
      title: 'Lunch is over',
      body: 'Please return to your outlet.',
      priority: Priority.defaultPriority,
      importance: Importance.defaultImportance,
      playSound: true,
      payload: const NotificationPayload(type: NotificationTypes.home),
    );
  }

  /// Show break reminder
  Future<void> showBreakReminder() async {
    await _showNotification(
      id: NotificationIds.breakReminder,
      channelId: NotificationChannels.reminders,
      title: '☕ Break Reminder',
      body: 'You\'ve been working for a while. Consider taking a break.',
      priority: Priority.defaultPriority,
      importance: Importance.defaultImportance,
      playSound: true,
      payload: const NotificationPayload(type: NotificationTypes.home),
    );
  }

  /// Show end of day reminder
  Future<void> showEndOfDayReminder({
    required int pendingTasks,
    required int visitedOutlets,
  }) async {
    await _showNotification(
      id: NotificationIds.endOfDay,
      channelId: NotificationChannels.reminders,
      title: '🌅 End of Day Summary',
      body: 'Visited $visitedOutlets outlets. $pendingTasks tasks remaining.',
      priority: Priority.defaultPriority,
      importance: Importance.defaultImportance,
      playSound: true,
      payload: const NotificationPayload(type: NotificationTypes.home),
    );
  }

  // ==================== HELPER METHODS ====================

  /// Generic notification display method
  Future<void> _showNotification({
    required int id,
    required String channelId,
    required String title,
    required String body,
    Priority priority = Priority.defaultPriority,
    Importance importance = Importance.defaultImportance,
    bool playSound = true,
    bool ongoing = false,
    bool autoCancel = true,
    NotificationPayload? payload,
  }) async {
    final androidDetails = AndroidNotificationDetails(
      channelId,
      _getChannelName(channelId),
      channelDescription: _getChannelDescription(channelId),
      icon: '@mipmap/ic_launcher',
      importance: importance,
      priority: priority,
      playSound: playSound,
      ongoing: ongoing,
      autoCancel: autoCancel,
      showWhen: true,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // A failure to display a notification (e.g. a platform-side icon
    // resource lookup glitch) must never take the app down with it — it's
    // reported to Sentry as a handled error instead of being allowed to
    // propagate into whatever caller triggered it (timers, geofence
    // callbacks, etc).
    try {
      await _plugin.show(
        id,
        title,
        body,
        notificationDetails,
        payload: payload?.toJson(),
      );
    } catch (e, stackTrace) {
      developer.log(
        'Failed to show notification (id: $id, channel: $channelId): $e',
        name: 'NotificationService',
        error: e,
        stackTrace: stackTrace,
      );
      await Sentry.captureException(e, stackTrace: stackTrace);
    }
  }

  /// Get channel name from channel ID
  String _getChannelName(String channelId) {
    switch (channelId) {
      case NotificationChannels.geofence:
        return NotificationChannels.geofenceName;
      case NotificationChannels.sync:
        return NotificationChannels.syncName;
      case NotificationChannels.location:
        return NotificationChannels.locationName;
      case NotificationChannels.persistent:
        return NotificationChannels.persistentName;
      case NotificationChannels.general:
        return NotificationChannels.generalName;
      case NotificationChannels.tasks:
        return NotificationChannels.tasksName;
      case NotificationChannels.orders:
        return NotificationChannels.ordersName;
      case NotificationChannels.routes:
        return NotificationChannels.routesName;
      case NotificationChannels.reminders:
        return NotificationChannels.remindersName;
      default:
        return 'Notifications';
    }
  }

  /// Get channel description
  String _getChannelDescription(String channelId) {
    return 'Notification from ${_getChannelName(channelId)}';
  }

  /// Format time as HH:MM
  String _formatTime(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  /// Cancel specific notification by ID
  Future<void> cancelNotification(int id) async {
    await _cancel(id);
  }

  /// Cancel all notifications
  Future<void> cancelAllNotifications() async {
    try {
      await _plugin.cancelAll();
    } catch (e, st) {
      developer.log(
        '[NotificationService] cancelAll failed: $e',
        name: 'NotificationService',
        error: e,
        stackTrace: st,
      );
    }
  }

  /// Dispose resources
  void dispose() {
    _stopCountdownTimer();
  }
}
