# Geofence & Location Tracking Configuration (Production-Ready)

## Core Parameters

| Parameter | Value | Description |
|-----------|-------|-------------|
| **Geofence Radius** | 50 meters | Distance from outlet coordinates |
| **Geofence Buffer** | 10 meters | Additional buffer for GPS drift tolerance |
| **Max Clock-In Accuracy** | 50 meters | Reject clock-in if GPS accuracy worse than this |
| **Location Update (Normal)** | 2 minutes | Frequency when inside geofence |
| **Location Update (Outside)** | 30 seconds | Frequency when outside geofence (faster re-entry detection) |
| **Exit Confirmation** | 2 consecutive readings OR 3 min | Prevent false exits from GPS drift |
| **Grace Period** | 10 minutes | Time allowed outside after confirmed exit |
| **Notifications** | 4 strategic | Exit, 5min, 9min, auto-clockout |

## Production Improvements

### 1. Accuracy Gating (prevents GPS drift issues)
- Clock-in **rejected** if GPS accuracy > 50m
- Show "Improve GPS accuracy" message
- User must wait for better signal

### 2. Exit Confirmation (prevents false positives)
- Single "outside" reading = **flagged but not confirmed**
- Confirmed exit requires:
  * **2 consecutive outside readings** (4 minutes apart)
  * OR **3 minutes continuous outside**
- Prevents GPS drift false alarms

### 3. Dynamic Polling (faster re-entry detection)
- **Inside geofence**: 2-minute updates (battery efficient)
- **Outside geofence**: 30-second updates (catch return quickly)
- Automatically switches based on location

### 4. Smart Notifications (reduced spam)
- **4 critical alerts** instead of 10
- Avoids OS notification throttling
- Reduces user annoyance
- Persistent notification updates silently with countdown

## Auto Clock-Out Sequence (Production-Ready)

When user exits the 50m geofence around clocked-in outlet:

```
Time 0:00 - First outside reading detected
         ↓
         Check GPS accuracy
         ↓
Time 2:00 - Second location update
         ↓
         Still outside? → CONFIRMED EXIT
         ↓
Time 2:00 - Switch to 30-second updates
         ↓
         Start 10-minute countdown
         ↓
         📱 NOTIFICATION #1: "You left outlet zone. Return within 10 min."
         ↓
         Update persistent notification with countdown
         ↓
         [30-second location checks continue]
         ↓
Time 5:00 - Halfway point reached
         ↓
         📱 NOTIFICATION #2: "5 minutes remaining before auto clock-out"
         ↓
Time 9:00 - Final warning threshold
         ↓
         📱 NOTIFICATION #3: "1 minute until auto clock-out"
         ↓
Time 10:00 - Grace period expired
          ↓
          📱 NOTIFICATION #4: "You have been auto clocked-out"
          ↓
          AUTO CLOCK-OUT TRIGGERED
          ↓
          Save clock-out record with reason: geofenceExit
          ↓
          Log session event for audit
          ↓
          Resume 2-minute polling (no active session)
```

**Total: 4 notifications** instead of 10 (reduces spam, prevents OS throttling)

## Re-Entry Behavior (With Confirmation)

If user returns to geofence **before 10 minutes**:

```
User location update (30-second interval)
         ↓
         Inside geofence detected
         ↓
         Wait for next reading (30 seconds)
         ↓
         Still inside? → CONFIRMED RE-ENTRY
         ↓
Cancel countdown timer
         ↓
Cancel all pending notifications
         ↓
Clear exit timestamp
         ↓
Reset consecutive outside counter
         ↓
Switch back to 2-minute polling
         ↓
📱 Success notification: "Welcome back! Clock-in resumed"
         ↓
Resume normal tracking
```

**Note:** Requires 2 consecutive "inside" readings to confirm re-entry (prevents GPS drift false positives)

## Implementation Constants

```dart
// lib/core/location/location_config.dart

class LocationConfig {
  // Geofence
  static const double geofenceRadiusMeters = 50.0;
  static const double geofenceBufferMeters = 10.0;
  static const double maxAccuracyForClockIn = 50.0; // Reject if worse
  
  // Location tracking intervals
  static const Duration locationUpdateInterval = Duration(minutes: 2); // Normal mode
  static const Duration locationUpdateIntervalOutside = Duration(seconds: 30); // Outside geofence
  
  // Exit confirmation (prevent GPS drift false positives)
  static const int exitConfirmationReadings = 2; // Require 2 consecutive outside
  static const Duration exitConfirmationMinDuration = Duration(minutes: 3); // OR 3 min continuous
  
  // Re-entry confirmation
  static const int reentryConfirmationReadings = 2; // Require 2 consecutive inside
  
  // Auto clock-out
  static const Duration autoClockOutGracePeriod = Duration(minutes: 10);
  
  // Notification timings (4 strategic alerts)
  static const Duration midWarningTime = Duration(minutes: 5);
  static const Duration finalWarningTime = Duration(minutes: 9);
  
  // Battery optimization
  static const double locationAccuracyMeters = 20.0; // Desired accuracy
  static const Duration locationTimeout = Duration(seconds: 30);
  
  // Geofence validation with buffer
  static bool isWithinGeofence({
    required double userLat,
    required double userLon,
    required double outletLat,
    required double outletLon,
    bool includeBuffer = true,
  }) {
    final distance = Geolocator.distanceBetween(
      userLat,
      userLon,
      outletLat,
      outletLon,
    );
    final threshold = geofenceRadiusMeters + (includeBuffer ? geofenceBufferMeters : 0);
    return distance <= threshold;
  }
  
  // Accuracy check for clock-in
  static bool hasAcceptableAccuracy(double accuracy) {
    return accuracy <= maxAccuracyForClockIn;
  }
}
```

## Database Schema Updates

```dart
// Add to ClockInSession entity

@freezed
class ClockInSession with _$ClockInSession {
  factory ClockInSession({
    required String id,
    required String outletId,
    required String outletName,
    required String outletCode,
    required bool isDeviation,
    String? routeId,
    required DateTime clockedInAt,
    required double clockInLatitude,
    required double clockInLongitude,
    required double clockInAccuracy, // Store accuracy for audit
    required int allocatedMinutes,
    required ClockInStatus status,
    
    // Configuration snapshot (for audit trail)
    @Default(50.0) double geofenceRadiusMeters,
    @Default(10) int autoClockoutGraceMinutes,
    
    // Geofence exit tracking with confirmation
    DateTime? firstOutsideReadingAt,      // Initial outside detection
    DateTime? confirmedExitAt,            // After 2 readings OR 3 min
    @Default(0) int consecutiveOutsideReadings,  // Counter for confirmation
    @Default(0) int consecutiveInsideReadings,   // Counter for re-entry
    
    // Clock-out details
    DateTime? clockedOutAt,
    double? clockOutLatitude,
    double? clockOutLongitude,
    double? clockOutAccuracy,
    ClockOutReason? clockOutReason,
    @Default(SyncState.localOnly) SyncState syncState,
  }) = _ClockInSession;
}

// Audit trail for disputes and compliance
@freezed
class ClockSessionEvent with _$ClockSessionEvent {
  factory ClockSessionEvent({
    required String id,
    required String sessionId,
    required ClockSessionEventType type,
    required double latitude,
    required double longitude,
    required double accuracy,
    required DateTime timestamp,
    Map<String, dynamic>? metadata,
  }) = _ClockSessionEvent;
}

enum ClockSessionEventType {
  clockIn,
  firstOutsideReading,       // Not confirmed yet
  geofenceExitConfirmed,     // After 2 readings or 3 min
  notificationSent,          // Each of the 4 notifications
  firstInsideReading,        // Not confirmed yet
  geofenceReentryConfirmed,  // After 2 readings
  autoClockOut,
  manualClockOut,
  accuracyImproved,
  accuracyDegraded,
  pollingIntervalChanged,    // Switched between 2min/30s
}

enum ClockOutReason {
  manual,
  geofenceExit,      // Left geofence for 10 min
  forcedTimeout,     // Exceeded max time (8 hours)
  serverAutoClose,   // Backend detected another session
  routeDeactivation, // End of day
}
```

## Notification Messages

```dart
// lib/core/notifications/notification_messages.dart

class NotificationMessages {
  // Clock-in validation
  static const String poorAccuracy = 
    'GPS accuracy too low. Move to open area for better signal.';
  
  static const String outsideGeofence = 
    'You are too far from the outlet. Move closer to clock in.';
  
  // Geofence exit sequence (4 notifications)
  static const String exitDetected = 
    '⚠️ You left outlet zone. Return within 10 minutes to avoid auto clock-out.';
  
  static const String midWarning = 
    '⏰ 5 minutes remaining before auto clock-out. Please return to outlet.';
  
  static const String finalWarning = 
    '🚨 1 MINUTE until auto clock-out! Return to outlet immediately.';
  
  static const String autoClockOut = 
    '❌ You have been automatically clocked out due to being away for 10 minutes.';
  
  // Re-entry
  static const String reEntered = 
    '✅ Welcome back! Clock-in resumed. You are back in the outlet zone.';
  
  // Persistent notification (updated silently)
  static String getCountdownMessage(Duration remaining) {
    final minutes = remaining.inMinutes;
    final seconds = remaining.inSeconds % 60;
    return 'Auto clock-out in $minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
```

## State Machine (Production-Ready)

```
┌──────────────────────┐
│   Not Clocked In     │
└──────────┬───────────┘
           │ Check accuracy & distance
           │ (accuracy <= 50m AND within 50m+10m)
           ↓
┌──────────────────────┐
│   Clocked In         │
│  (Inside Geofence)   │◄──────────────┐
│  2-min polling       │               │
└──────────┬───────────┘               │
           │ First outside reading     │
           ↓                           │
┌──────────────────────┐               │
│  Outside (Flagged)   │               │ 2 consecutive
│  Wait for confirm    │───────────────┘ inside readings
│  2-min polling       │   Inside again  (re-entry confirmed)
└──────────┬───────────┘
           │ 2nd outside reading
           │ OR 3 min continuous
           ↓
┌──────────────────────┐
│  Exit Confirmed      │
│  30-sec polling      │◄──────────────┐
│  10-min countdown    │               │ Still inside
│  Notification #1     │───────────────┘ on confirmation
└──────────┬───────────┘
           │
           ├─── At 5 min → Notification #2
           │
           ├─── At 9 min → Notification #3
           │
           ↓ 10 minutes elapsed
┌──────────────────────┐
│  Auto Clocked Out    │
│  Notification #4     │
│  Log event + reason  │
└──────────────────────┘
```

**Key Production Improvements:**
- Accuracy gating before clock-in
- Exit requires confirmation (2 readings OR 3 min)
- Dynamic polling (2 min → 30 sec when outside)
- Re-entry requires confirmation (2 readings)
- Only 4 notifications (avoids spam)
- Complete audit trail via ClockSessionEvent

## Battery Optimization Strategy

1. **Normal Tracking** (Inside Geofence):
   - Update location every 2 minutes
   - Low accuracy (20-50m)
   - Balanced power mode

2. **Warning Mode** (Outside Geofence):
   - Increase to every 30 seconds (to detect re-entry faster)
   - Medium accuracy (10-20m)
   - Higher power consumption acceptable (temporary)

3. **Background Mode** (App not active):
   - Use WorkManager for periodic checks
   - Wake app if geofence exit detected
   - Send notifications even if app closed

## Testing Scenarios

### Scenario 1: Normal Operation
- ✅ Clock in within geofence
- ✅ Stay inside geofence
- ✅ Manual clock out

### Scenario 2: Temporary Exit
- ✅ Clock in within geofence
- ✅ Exit geofence (triggers warnings)
- ✅ Return within 10 minutes
- ✅ Warnings cancelled

### Scenario 3: Extended Exit
- ✅ Clock in within geofence
- ✅ Exit geofence
- ✅ Receive 10 warnings
- ✅ Auto clock-out triggered

### Scenario 4: Offline Mode
- ✅ Clock in while online
- ✅ Go offline
- ✅ Exit geofence (warnings queued)
- ✅ Come back online (sync warnings)

### Scenario 5: Battery Saver
- ✅ Location accuracy degraded
- ✅ Geofence validation still works
- ✅ Warnings still delivered

## Questions & Answers

**Q: What if GPS is disabled?**
A: Send immediate notification, prevent clock-in, show error screen

**Q: What if user force-closes the app?**
A: Background service continues tracking, notifications still sent

**Q: What if battery dies while outside geofence?**
A: Last known state saved, auto clock-out triggered on next app start

**Q: Can user disable notifications?**
A: Critical notifications (geofence warnings) should request "Do Not Disturb" override permission

**Q: What if outlet location is inaccurate?**
A: Admin panel to update outlet coordinates, user can report location issues
