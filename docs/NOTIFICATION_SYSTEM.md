# Enhanced Notification System

## Overview
The NotificationService has been significantly enhanced to provide comprehensive notification support for all app operations, not just geofencing and location services.

## Features

### 📋 **9 Notification Channels**
1. **Geofence Alerts** (High priority) - Exit detection, warnings, auto clock-out
2. **Sync Alerts** (Default) - Sync failures and success notifications
3. **Location Alerts** (High) - Location accuracy and permission warnings
4. **Persistent Notifications** (Low) - Active session tracking with countdown
5. **General Notifications** (Default) - App-wide announcements and updates
6. **Task Notifications** (High) - Task reminders and deadlines
7. **Order Notifications** (High) - Order confirmations and rejections
8. **Route Notifications** (Default) - Route assignments and deviations
9. **Reminder Notifications** (High) - Time tracking, breaks, end-of-day

### 🎯 **Notification ID Ranges**
- **1000-1999**: Persistent notifications (session tracking)
- **2000-2999**: Geofence alerts
- **3000-3999**: Sync operations
- **4000-4999**: Location warnings
- **5000-5999**: General app notifications
- **6000-6999**: Task notifications
- **7000-7999**: Order notifications
- **8000-8999**: Route notifications
- **9000-9999**: Time-based reminders

### 🔔 **Notification Categories**

#### Geofence Notifications
- `showGeofenceExitDetected()` - User exits geofence boundary
- `showGeofence5MinuteWarning()` - 5 minutes until auto clock-out
- `showGeofence9MinuteWarning()` - Final 1-minute warning
- `showGeofenceAutoClockOut()` - Auto clock-out confirmation

#### Persistent Session Tracking
- `showPersistentSession()` - Active session with duration
- `showPersistentCountdown()` - Grace period countdown (updates every 5s)
- `startCountdownTimer()` - Manages countdown updates
- `clearPersistentNotification()` - Remove persistent notification

#### Sync Notifications
- `showSyncFailure()` - Sync operation failures with retry info
- `showSyncSuccess()` - Successful sync confirmation

#### Location Notifications
- `showLocationAccuracyWarning()` - GPS accuracy below threshold
- `showLocationDisabledWarning()` - Location services disabled
- `showLocationPermissionDenied()` - Location permission required

#### Task Notifications
- `showTaskReminder()` - Task reminder at specific outlet
- `showTaskDeadline()` - Task deadline approaching

#### Order Notifications
- `showOrderConfirmed()` - Order approved and confirmed
- `showOrderRejected()` - Order rejected with reason

#### Route Notifications
- `showRouteAssigned()` - New route assignment
- `showRouteDeviation()` - Deviation from planned route

#### Time-Based Reminders
- `showTimeExceeded()` - Exceeded allocated time at outlet
- `showBreakReminder()` - Break time reminder
- `showEndOfDayReminder()` - End of day summary

#### Generic Notification
- `showNotification()` - Show any custom notification with full control

### 🎨 **Notification Payloads**
All notifications support navigation payloads:
```dart
NotificationPayload(
  type: NotificationTypes.order,
  data: {'orderNumber': '12345'},
)
```

**Payload Types:**
- `NotificationTypes.geofenceExit` - Navigate to geofence/session screen
- `NotificationTypes.clockSession` - Navigate to active session
- `NotificationTypes.sync` - Navigate to sync status
- `NotificationTypes.location` - Navigate to location settings
- `NotificationTypes.order` - Navigate to order details
- `NotificationTypes.task` - Navigate to task details
- `NotificationTypes.route` - Navigate to route management
- `NotificationTypes.settings` - Open app settings
- `NotificationTypes.home` - Navigate to home screen

### 🔧 **Notification Callback**
Set a callback to handle notification taps:
```dart
notificationService.setNotificationCallback((payload) {
  if (payload == null) return;
  
  switch (payload.type) {
    case NotificationTypes.order:
      final orderNumber = payload.data?['orderNumber'];
      router.go('/orders/$orderNumber');
      break;
    // ... handle other types
  }
});
```

### 🎚️ **Priority Levels**
- **MAX**: Critical alerts (location disabled, final warnings)
- **HIGH**: Important notifications (task reminders, order updates, geofence exits)
- **DEFAULT**: Standard notifications (route assignments, general alerts)
- **LOW**: Background information (sync success, session tracking)

### 🧹 **Cleanup Methods**
- `clearGeofenceNotifications()` - Clear all geofence alerts
- `clearSyncNotifications()` - Clear sync alerts
- `clearLocationNotifications()` - Clear location warnings
- `clearPersistentNotification()` - Clear session tracking
- `cancelNotification(id)` - Cancel specific notification
- `cancelAllNotifications()` - Clear all notifications

## Usage Examples

### Basic Notification
```dart
await notificationService.showNotification(
  id: 5001,
  title: 'Welcome!',
  body: 'Thank you for using Outlet Manager',
  channelId: NotificationChannels.general,
  priority: Priority.high,
);
```

### Task Reminder
```dart
await notificationService.showTaskReminder(
  taskTitle: 'Stock Count',
  outletName: 'ABC Store',
);
```

### Order Notification
```dart
await notificationService.showOrderConfirmed(
  orderNumber: 'ORD-12345',
  outletName: 'XYZ Outlet',
);
```

### Route Assignment
```dart
await notificationService.showRouteAssigned(
  routeName: 'Route A - North',
  outletCount: 12,
);
```

### Time Management
```dart
await notificationService.showTimeExceeded(
  outletName: 'ABC Store',
  allocatedTime: Duration(hours: 1),
  actualTime: Duration(hours: 1, minutes: 15),
);
```

## Architecture

### Files
- **notification_channels.dart** - Channel definitions, ID ranges, payload types
- **notification_service.dart** - Complete notification service implementation
- **notifications.dart** - Barrel export file

### Providers
```dart
// Get notification service
final service = ref.read(notificationServiceProvider);

// Ensure initialized before use
await ref.read(initializedNotificationServiceProvider.future);

// Check if initialized
final isReady = ref.watch(notificationServiceInitializedProvider);
```

### Integration Points
- **GeofenceManager**: Uses notification service for all geofence alerts
- **SyncService**: Can use for sync status notifications
- **LocationService**: Can use for location warnings
- **Future Features**: Tasks, orders, routes, time management

## Platform Support
- ✅ Android (9 channels with custom importance levels)
- ✅ iOS (all notifications supported)
- ✅ Linux (basic notification support)
- ❌ Web (notifications plugin doesn't support web)
- ⚠️ macOS/Windows (untested but should work)

## Best Practices

1. **Use appropriate channels**: Each channel has a specific importance level
2. **Unique IDs**: Use `NotificationIds.getNextId()` for dynamic notifications
3. **Payloads**: Always include navigation payloads for interactive notifications
4. **Cleanup**: Clear notifications when no longer relevant
5. **Priority**: Use correct priority to avoid notification fatigue
6. **Testing**: Test on both Android and iOS for consistent behavior

## Future Enhancements

Potential additions:
- Scheduled notifications (using timezone support)
- Actionable notifications (buttons: "Approve", "Reject", etc.)
- Notification grouping (multiple similar notifications)
- Custom sound per notification type
- Vibration patterns per notification type
- LED color support for Android
- Badge count management for iOS
- Notification history/logs

## Migration from Old System

Old code:
```dart
// Old hardcoded approach
await _plugin.show(2001, 'Title', 'Body', details);
```

New code:
```dart
// New structured approach
await notificationService.showGeofenceExitDetected(
  outletName: 'ABC Store',
  distanceMeters: 150.0,
);
```

Benefits:
- ✅ Type-safe method calls
- ✅ Consistent notification IDs
- ✅ Built-in navigation payloads
- ✅ Channel management
- ✅ Reusable across app
- ✅ Easy to test and mock
