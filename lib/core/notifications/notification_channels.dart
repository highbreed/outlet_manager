/// Notification channel definitions for the app
class NotificationChannels {
  // Channel IDs
  static const String geofence = 'geofence_alerts';
  static const String sync = 'sync_alerts';
  static const String location = 'location_alerts';
  static const String persistent = 'persistent_notifications';
  static const String general = 'general_notifications';
  static const String tasks = 'task_notifications';
  static const String orders = 'order_notifications';
  static const String routes = 'route_notifications';
  static const String reminders = 'reminder_notifications';
  // FCM push channel — must match the default_notification_channel_id in AndroidManifest
  static const String fcm = 'general_notifications';

  // Channel Names
  static const String geofenceName = 'Geofence Alerts';
  static const String syncName = 'Sync Alerts';
  static const String locationName = 'Location Alerts';
  static const String persistentName = 'Active Session';
  static const String generalName = 'General Notifications';
  static const String tasksName = 'Task Notifications';
  static const String ordersName = 'Order Updates';
  static const String routesName = 'Route Updates';
  static const String remindersName = 'Reminders';
  static const String fcmName = 'Push Notifications';
}

/// Notification ID ranges for different categories
class NotificationIds {
  // Persistent notifications: 1000-1999
  static const int persistentSession = 1000;
  static const int persistentCountdown = 1001;

  // Geofence notifications: 2000-2999
  static const int geofenceExit = 2001;
  static const int geofence5MinWarning = 2002;
  static const int geofence9MinWarning = 2003;
  static const int geofenceAutoClockout = 2004;
  static const int geofenceReentry = 2005;

  // Sync notifications: 3000-3999
  static const int syncFailure = 3001;
  static const int syncSuccess = 3002;
  static const int syncComplete = 3003;
  static const int syncNeedsAttention = 3004;

  // Location notifications: 4000-4999
  static const int locationWarning = 4001;
  static const int locationDisabled = 4002;
  static const int locationPermission = 4003;
  static const int locationAccuracy = 4004;

  // General app notifications: 5000-5999
  static const int appUpdate = 5001;
  static const int maintenance = 5002;
  static const int announcement = 5003;

  // Task notifications: 6000-6999
  static const int taskReminder = 6001;
  static const int taskDeadline = 6002;
  static const int taskCompleted = 6003;
  static const int taskAssigned = 6004;

  // Order notifications: 7000-7999
  static const int orderConfirmed = 7001;
  static const int orderRejected = 7002;
  static const int orderModified = 7003;
  static const int orderDelivered = 7004;

  // Route notifications: 8000-8999
  static const int routeAssigned = 8001;
  static const int routeModified = 8002;
  static const int routeCompleted = 8003;
  static const int routeDeviation = 8004;

  // Time-based reminders: 9000-9999
  static const int timeExceeded = 9001;
  static const int breakReminder = 9002;
  static const int endOfDay = 9003;
  static const int lunchOver = 9004;

  /// Get next available ID in a range
  static int getNextId(int baseId) => baseId + DateTime.now().millisecond % 100;
}

/// Notification payload types for navigation
class NotificationPayload {
  final String type;
  final Map<String, dynamic>? data;

  const NotificationPayload({required this.type, this.data});

  String toJson() {
    if (data == null || data!.isEmpty) return type;
    return '$type|${data!.entries.map((e) => '${e.key}:${e.value}').join(',')}';
  }

  static NotificationPayload? fromJson(String? json) {
    if (json == null || json.isEmpty) return null;

    final parts = json.split('|');
    final type = parts[0];

    if (parts.length == 1) {
      return NotificationPayload(type: type);
    }

    final dataMap = <String, dynamic>{};
    final dataParts = parts[1].split(',');
    for (final part in dataParts) {
      final keyValue = part.split(':');
      if (keyValue.length == 2) {
        dataMap[keyValue[0]] = keyValue[1];
      }
    }

    return NotificationPayload(type: type, data: dataMap);
  }
}

/// Notification types for routing
class NotificationTypes {
  static const String geofenceExit = 'geofence_exit';
  static const String geofenceOverride = 'geofence_override';
  static const String locationOverride = 'route.location_override';
  static const String clockSession = 'clock_session';
  static const String sync = 'sync';
  static const String location = 'location';
  static const String order = 'order';
  static const String task = 'task';
  static const String route = 'route';
  static const String settings = 'settings';
  static const String home = 'home';

  /// Silent data-only push asking this device to report back what it has
  /// cached locally for a stock count session (support/ops debugging aid).
  /// Never carries a `notification` block, so it's handled purely in the
  /// data-message path — see [handleCacheDumpRequest].
  static const String cacheDumpRequest = 'cache_dump_request';

  /// Silent data-only push asking this device to send a location ping right
  /// now, sent when the backend notices a clocked-in agent's location has
  /// gone stale. The response isn't a bespoke reply — it's just a normal
  /// ping via the existing endpoint. Never carries a `notification` block,
  /// so it's handled purely in the data-message path — see
  /// [handleLocationPingRequest].
  static const String locationPingRequest = 'location_ping_request';
}
