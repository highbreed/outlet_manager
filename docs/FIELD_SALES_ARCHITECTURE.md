# Field Sales Management System - Architecture

## Overview
This document outlines the architecture for migrating and modernizing the field sales management system with offline-first capabilities, GPS tracking, and modular feature organization.

## System Requirements

### Functional Requirements
1. **Clock In/Out Management**
   - One outlet active at a time, multiple outlets per day
   - GPS validation (geofence) - prevent clock-in outside location
   - Auto clock-out when leaving outlet location
   - Offline clock-in support with background sync
   - Capture: transport expense, route covered, order confirmation on clock-out

2. **Route Management**
   - Manager assigns routes (backend)
   - Users activate/deactivate routes daily
   - Route deviation tracking (non-assigned outlets)
   - Offline route data access

3. **Stock Take Module** (Consolidated)
   - Merges: Stock Count + Shelf Share + Facings
   - Requires active clock-in
   - Barcode scanning
   - Offline data capture with background sync

4. **Orders Module**
   - Proposed Orders → Sales Orders conversion
   - Independent sales order creation
   - Product selection, quantities, pricing
   - Offline order creation

5. **Sales & Warranty**
   - Requires active clock-in
   - Sales transaction recording
   - Warranty registration
   - Offline support

6. **After Sales (Complaints)**
   - Issue logging and tracking
   - Photo attachments
   - Offline support

7. **Daily Summary**
   - Activity dashboard
   - Outlets visited, orders, stock counts
   - Time tracking and sync status

### Non-Functional Requirements
- **Offline-first**: All features work without internet
- **Background sync**: Automatic when connectivity restored
- **GPS tracking**: Continuous location monitoring
- **Battery optimization**: Efficient location tracking
- **Role-based access**: Permission-controlled features
- **Persistent notifications**: Time alerts, sync status

## Architecture Layers

```
lib/
├── core/
│   ├── config/
│   ├── network/
│   ├── storage/
│   ├── location/         # GPS & Geofencing
│   ├── sync/             # Offline sync infrastructure
│   │   ├── sync_service.dart
│   │   ├── sync_queue.dart
│   │   └── models/
│   ├── notifications/    # Local notifications
│   ├── permissions/      # Role-based access
│   ├── providers/
│   ├── theme/
│   ├── utils/
│   └── widgets/
│
├── features/
│   ├── auth/
│   │
│   ├── clock_in/         # Priority 1
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── clock_in_session.dart
│   │   │   │   └── outlet.dart
│   │   │   ├── repositories/
│   │   │   │   └── clock_in_repository.dart
│   │   │   └── usecases/
│   │   │       ├── clock_in_outlet.dart
│   │   │       ├── clock_out_outlet.dart
│   │   │       └── validate_location.dart
│   │   ├── data/
│   │   │   ├── models/
│   │   │   ├── datasources/
│   │   │   │   ├── clock_in_remote_datasource.dart
│   │   │   │   └── clock_in_local_datasource.dart
│   │   │   └── repositories/
│   │   │       └── clock_in_repository_impl.dart
│   │   └── presentation/
│   │       ├── screens/
│   │       │   ├── clock_in_screen.dart
│   │       │   └── clock_out_dialog.dart
│   │       ├── widgets/
│   │       └── providers/
│   │           └── clock_in_provider.dart
│   │
│   ├── routes/           # Priority 1
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── route.dart
│   │   │   │   └── route_activation.dart
│   │   │   └── usecases/
│   │   │       ├── activate_route.dart
│   │   │       ├── deactivate_route.dart
│   │   │       └── get_assigned_routes.dart
│   │   ├── data/
│   │   └── presentation/
│   │
│   ├── stock_take/       # Priority 2 (Consolidated)
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── stock_count.dart
│   │   │   │   ├── shelf_share.dart
│   │   │   │   └── facings.dart
│   │   │   └── usecases/
│   │   │       ├── record_stock_count.dart
│   │   │       ├── record_shelf_share.dart
│   │   │       └── record_facings.dart
│   │   ├── data/
│   │   └── presentation/
│   │       ├── screens/
│   │       │   └── stock_take_screen.dart
│   │       └── widgets/
│   │           ├── stock_count_tab.dart
│   │           ├── shelf_share_tab.dart
│   │           └── facings_tab.dart
│   │
│   ├── orders/           # Priority 3
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── proposed_order.dart
│   │   │   │   └── sales_order.dart
│   │   │   └── usecases/
│   │   │       ├── create_proposed_order.dart
│   │   │       ├── convert_to_sales_order.dart
│   │   │       └── create_sales_order.dart
│   │   ├── data/
│   │   └── presentation/
│   │
│   ├── sales_warranty/   # Priority 4
│   │   ├── domain/
│   │   ├── data/
│   │   └── presentation/
│   │
│   ├── complaints/       # Priority 5
│   │   ├── domain/
│   │   ├── data/
│   │   └── presentation/
│   │
│   ├── daily_summary/    # Priority 6
│   │   ├── domain/
│   │   ├── data/
│   │   └── presentation/
│   │
│   └── home/
│       └── presentation/
│           ├── screens/
│           │   └── home_screen.dart
│           └── widgets/
│               └── dashboard_card.dart
```

## Core Infrastructure

### 1. Offline Sync System

```dart
// core/sync/sync_service.dart
class SyncService {
  - Manages sync queue
  - Handles conflict resolution
  - Retry logic with exponential backoff
  - Priority-based sync (clock-in/out highest priority)
}

// core/sync/sync_queue.dart
class SyncQueue {
  - Stores pending operations locally
  - FIFO with priority override
  - Tracks sync status
}

// core/sync/models/sync_operation.dart
enum SyncOperationType {
  clockIn,
  clockOut,
  stockCount,
  order,
  complaint,
  routeActivation,
  routeDeactivation,
  // ...
}

class SyncOperation {
  String id;
  String clientOperationId; // UUID for idempotency
  SyncOperationType type;
  String entityType;        // 'clock_session', 'stock_count', etc.
  String entityId;          // Local ID of the entity
  Map<String, dynamic> data;
  int priority;             // 1 = highest (clock in/out), 5 = lowest
  DateTime timestamp;
  int retryCount;
  DateTime? nextRetryAt;    // Exponential backoff
  List<String> dependsOn;   // Operation IDs that must succeed first
  SyncStatus status;
  String? errorMessage;
  DateTime? lastAttemptAt;
}

// Better retry policy: don't give up after 5
enum SyncStatus {
  pending,
  retrying,
  synced,
  needsAttention, // After 5 retries, flag but keep trying
  blocked,        // Waiting for dependencies
}
```

### 2. Location Service with Geofencing

```dart
// core/location/location_service.dart
class LocationService {
  - Continuous location tracking
  - Geofence validation
  - Auto clock-out on location exit
  - Battery-optimized tracking
  - Permission handling
}

// core/location/geofence_manager.dart
class GeofenceManager {
  - Create geofences for outlets (50m radius + 10m buffer)
  - Accuracy gating: Allow clock-in only if GPS accuracy <= 50m
  - Exit confirmation: Require 2 consecutive outside readings OR 3 min continuous
  - Dynamic polling: Switch to 30s intervals when outside geofence
  - Track time outside geofence with confirmed exit timestamp
  - Send 4 strategic notifications (exit, 5min, 9min, auto-clockout)
  - Update persistent notification silently during grace period
  - Trigger auto clock-out after 10 minutes confirmed outside
}

// Configuration
const double GEOFENCE_RADIUS_METERS = 50.0;
const double GEOFENCE_BUFFER_METERS = 10.0; // Additional buffer for GPS drift
const double MAX_ACCURACY_FOR_CLOCKIN = 50.0; // Reject clock-in if GPS accuracy > 50m
const Duration LOCATION_UPDATE_INTERVAL = Duration(minutes: 2); // Normal tracking
const Duration LOCATION_UPDATE_INTERVAL_OUTSIDE = Duration(seconds: 30); // When outside geofence

// Auto Clock-Out Configuration
const Duration AUTO_CLOCKOUT_GRACE_PERIOD = Duration(minutes: 10);
const int EXIT_CONFIRMATION_READINGS = 2; // Require 2 consecutive outside readings
const Duration EXIT_CONFIRMATION_MIN_DURATION = Duration(minutes: 3); // Or 3 min continuous outside

// Notification Strategy (4 notifications instead of 10)
enum GeofenceNotificationTiming {
  exitDetected,    // Immediately on confirmed exit
  midWarning,      // At 5 minutes
  finalWarning,    // At 9 minutes
  autoClockOut,    // After 10 minutes
}
```

### 3. Permission System

```dart
// core/permissions/permission_service.dart
class PermissionService {
  - Check feature access
  - Cache permissions locally
  - Role-based access control
}

enum UserPermission {
  clockIn,
  stockTake,
  createOrder,
  salesWarranty,
  viewReports,
  routeDeviation,
  // ...
}
```

### 4. Notification System

```dart
// core/notifications/notification_service.dart
class NotificationService {
  - Time exceeded alerts
  - Pending clock-out reminder
  - Sync status notifications
  - Location issues
}

enum NotificationType {
  timeExceeded,
  pendingClockOut,
  syncFailed,
  locationDisabled,
  locationAccuracyPoor,        // GPS accuracy > 50m
  geofenceExitDetected,        // Initial exit (1st notification)
  geofenceMidWarning,          // At 5 minutes (2nd notification)
  geofenceFinalWarning,        // At 9 minutes (3rd notification)
  autoClockOutTriggered,       // After 10 minutes (4th notification)
  geofenceReEntered,           // User returned, warnings cancelled
}
```

## Feature Implementation Details

### Clock In/Out Flow

**States:**
- No active session
- Clocked in (location validated)
- Clocked in (outside location - auto clock-out triggered)
- Clock out in progress

**Data Flow:**
1. User selects outlet (assigned or deviation)
2. **Accuracy Gate:** Check GPS accuracy
   - If accuracy > 50m → Show "Improve GPS accuracy" error, reject clock-in
   - If accuracy <= 50m → Proceed
3. **Distance Check:** Validate location against outlet coordinates
   - Must be within (50m radius + 10m buffer)
   - If outside → Reject clock-in with distance message
4. If within geofence AND accuracy good → Allow clock in
5. If offline → Queue sync operation
6. Start location monitoring (every 2 minutes - normal mode)
7. Monitor geofence with exit confirmation:
   - **Single outside reading** → Flag but don't start warnings (GPS drift)
   - **2 consecutive outside readings OR 3 min continuous** → Confirmed exit
   - **Confirmed exit detected:**
     * Switch to 30-second location updates (dynamic polling)
     * Start 10-minute countdown timer
     * Send Notification #1: "You left outlet zone. Return within 10 min."
     * Update persistent notification with countdown
   - **At 5 minutes:** Send Notification #2: "5 minutes remaining"
   - **At 9 minutes:** Send Notification #3: "1 minute until auto clock-out"
   - **At 10 minutes:** Send Notification #4 + Auto clock-out
   - **If user returns (confirmed by 2 consecutive inside readings):**
     * Cancel all warnings and countdown
     * Resume 2-minute polling interval
     * Send confirmation: "Welcome back! Clock-in resumed"
8. On manual clock-out → Capture transport/route data
9. Submit/queue clock-out operation

**Models:**
```dart
class ClockInSession {
  String id;
  String outletId;
  String outletName;
  String outletCode;
  bool isDeviation;
  String? routeId; // Link to assigned route
  DateTime clockedInAt;
  double clockInLatitude;
  double clockInLongitude;
  double clockInAccuracy;
  int allocatedMinutes;
  ClockInStatus status; // active, completed, autoClockOut
  
  // Configuration snapshot (for audit)
  double geofenceRadiusMeters; // Config value at time of clock-in
  int autoClockoutGraceMinutes; // Config value at time of clock-in
  
  // Exit tracking with confirmation
  DateTime? firstOutsideReadingAt;
  DateTime? confirmedExitAt; // Only set after 2 readings OR 3 min
  int consecutiveOutsideReadings;
  
  // Clock-out details
  DateTime? clockedOutAt;
  double? clockOutLatitude;
  double? clockOutLongitude;
  double? clockOutAccuracy;
  ClockOutReason? clockOutReason;
  SyncState syncState;
}

enum ClockOutReason {
  manual,
  geofenceExit,      // Auto clock-out after confirmed 10 min outside
  forcedTimeout,     // Exceeded max time at outlet (8 hours)
  serverAutoClose,   // Backend detected another session
  routeDeactivation, // End of day route deactivation
}

enum SyncState {
  localOnly,
  syncing,
  synced,
  syncFailed,
}

// Audit trail for disputes
class ClockSessionEvent {
  String id;
  String sessionId;
  ClockSessionEventType type;
  double latitude;
  double longitude;
  double accuracy;
  DateTime timestamp;
  Map<String, dynamic> metadata; // Additional context
}

enum ClockSessionEventType {
  clockIn,
  geofenceExit,          // First outside reading
  geofenceExitConfirmed, // After 2 readings or 3 min
  warningSent,           // Each of the 4 notifications
  geofenceReenter,       // User returned
  autoClockOut,
  manualClockOut,
  accuracyImproved,
  accuracyDegraded,
}

class ClockOutData {
  String sessionId;
  double transportExpense;
  String routeCovered; // "Location A - Location B"
  bool hasOrder;
  DateTime clockedOutAt;
  double clockOutLatitude;
  double clockOutLongitude;
  double clockOutAccuracy;
  ClockOutReason reason;
}
```

### Route Management

**Models:**
```dart
class Route {
  String id;
  String name;
  int dayOfWeek; // 1-7 (Monday-Sunday)
  List<RouteOutlet> outlets;
  bool isActive;
}

class RouteOutlet {
  String outletId;
  String outletName;
  String outletCode;
  double latitude;
  double longitude;
  int allocatedMinutes;
  int sequenceNumber;
}

class RouteActivation {
  String id;
  String routeId;
  String userId;
  DateTime activatedAt;
  DateTime? deactivatedAt;
  RouteActivationStatus status;
}
```

### Stock Take (Consolidated)

**Module Structure:**
- Tabbed interface: Stock Count | Shelf Share | Facings
- Requires active clock-in
- Product search with barcode scanning
- Offline data capture
- **Unified storage model** for easier syncing and queries

**Models:**
```dart
// Unified storage: one table/collection for all stock take types
class StockTakeEntry {
  String id;
  String sessionId;         // Link to ClockInSession for audit
  String outletId;          // Denormalized for local queries
  StockTakeType type;       // stockCount | shelfShare | facings
  String productId;
  String productName;
  String productCode;
  
  // Values (use based on type)
  int? valueInt;           // For: quantity, facingCount
  double? valueDouble;     // For: shelfSpaceCm, competitorSpaceCm
  String? valueText;       // For: shelfPosition, notes
  
  // Metadata
  DateTime recordedAt;
  double? latitude;
  double? longitude;
  bool synced;
  SyncState syncState;
}

enum StockTakeType {
  stockCount,    // valueInt = quantity
  shelfShare,    // valueDouble = own space, metadata stores competitor space
  facings,       // valueInt = facing count, valueText = shelf position
}

// For shelf share calculation
class ShelfShareData {
  double ownSpaceCm;
  double competitorSpaceCm;
  double get sharePercentage => (ownSpaceCm / (ownSpaceCm + competitorSpaceCm)) * 100;
}
```

### Orders Module

**Flow:**
1. Create Proposed Order (draft mode)
2. Convert to Sales Order (requires approval logic?)
3. OR Create Sales Order directly

**Models:**
```dart
class ProposedOrder {
  String id;
  String outletId;
  List<OrderLine> items;
  double totalAmount;
  DateTime createdAt;
  bool convertedToSalesOrder;
  String? salesOrderId;
  bool synced;
}

class SalesOrder {
  String id;
  String outletId;
  String? proposedOrderId;
  List<OrderLine> items;
  double totalAmount;
  OrderType type; // order, quotation
  DateTime createdAt;
  bool synced;
}

class OrderLine {
  String productId;
  String productName;
  int quantity;
  double unitPrice;
  double totalPrice;
}
```

## Technology Stack

### State Management
- **Riverpod 2.5+** with code generation
- Providers for each feature module
- Shared core providers (auth, location, sync)

### Local Storage
- **Hive/Isar** for offline data (high performance)
- **flutter_secure_storage** for sensitive data (tokens)
- **shared_preferences** for app settings

### Network
- **Dio** with retry interceptors
- **connectivity_plus** for network status

### Location & Geofencing
- **geolocator** for GPS tracking
- **geofence_service** for geofencing (or custom implementation)

### Notifications
- **flutter_local_notifications** for persistent notifications

### Background Tasks
- **workmanager** (Android) / **background_fetch** (iOS)

### Scanning
- **mobile_scanner** for barcode scanning

## Implementation Priority

### Phase 1: Foundation (Week 1-2)
- ✅ Auth system (existing)
- Offline sync infrastructure
- Location service with geofencing
- Notification system
- Permission system

### Phase 2: Core Features (Week 3-4)
- Clock In/Out with GPS validation
- Route Management (activation/deactivation)
- Home dashboard with feature cards

### Phase 3: Stock Take (Week 5)
- Consolidated Stock Take module
- Barcode scanning
- Offline data capture

### Phase 4: Orders (Week 6-7)
- Proposed Orders
- Sales Orders/Quotations
- Order conversion flow

### Phase 5: Additional Features (Week 8-9)
- Sales & Warranty
- Complaints/After Sales
- Daily Summary dashboard

### Phase 6: Polish & Testing (Week 10)
- End-to-end testing
- Performance optimization
- Bug fixes
- Documentation

## Key Design Decisions

1. **Offline-First**: All data captured locally first, synced in background
2. **GPS Validation with Accuracy Gating**: Strict geofencing + accuracy checks prevent abuse and GPS drift false positives
3. **Exit Confirmation**: 2 consecutive readings or 3-minute duration prevents false auto clock-outs
4. **Dynamic Polling**: Switch to 30s intervals when outside geofence for faster re-entry detection
5. **Smart Notifications**: 4 strategic alerts instead of 10 (reduces spam, avoids OS throttling)
6. **Audit Trail**: Complete event log for every session (dispute resolution, compliance)
7. **Infinite Retry with Attention Flagging**: Never give up syncing, but flag problems after 5 failures
8. **One Active Session**: Enforced at DB, UI, and backend levels
9. **Module Consolidation**: Unified Stock Take reduces complexity and simplifies syncing
10. **Local-First Daily Summary**: All data queryable locally without backend
11. **Clean Architecture**: Testable, maintainable, scalable
12. **Riverpod**: Type-safe state management with code generation
13. **Sync Dependencies**: Operations respect dependencies (clock-in before stocktake)
14. **Idempotency**: UUID-based operation IDs prevent duplicate syncs

## Next Steps

1. Review and approve architecture
2. Set up development branches
3. Begin Phase 1 implementation
4. Create API contracts with backend team
5. Set up offline storage schema
6. Implement core infrastructure

## Configuration Values (Confirmed)

### Geofencing & Location
1. ✅ **Geofence radius:** 50 meters (+ 10m buffer for GPS drift)
2. ✅ **Location update frequency:** 
   - 2 minutes when inside geofence (normal mode)
   - 30 seconds when outside geofence (confirmation mode)
3. ✅ **GPS accuracy gate:** Clock-in only allowed if accuracy <= 50m
4. ✅ **Exit confirmation:** Require 2 consecutive outside readings OR 3 min continuous
5. ✅ **Auto clock-out sequence:**
   - Grace period: **10 minutes** after confirmed exit
   - Notifications: **4 strategic alerts** (exit, 5min, 9min, auto-clockout)
   - Persistent notification updated silently with countdown

### Session Management
6. ✅ **One active session enforcement:**
   - Local DB constraint: Only one `ClockInSession.status=active`
   - UI guard: Features require active session
   - Backend enforcement: Reject multiple active sessions
7. ✅ Maximum time at outlet: **8 hours** (forced timeout)
8. ✅ Users cannot edit outlet after clock-in

### Sync & Retry
9. ✅ **Retry policy (improved):**
   - Exponential backoff: 1m, 2m, 5m, 15m, 30m, 1h, 2h, 4h, 8h, 12h, 24h
   - Flag as "Needs Attention" after 5 failures (but keep retrying)
   - Manual "Retry Now" option
   - Sync Center screen shows failed operations
   - No hard limit on retries
10. ✅ Background sync interval: **15 minutes** (when app backgrounded)
11. ✅ **Idempotency:** All operations have `clientOperationId` UUID
12. ✅ **Dependencies:** Sync queue respects operation dependencies (e.g., clock-in before stock take)

## Backend Development Notes

- Backend API is being developed in parallel with mobile app
- API contracts will be defined as features are built
- Mock data/local-first approach during development
- Offline-first architecture ensures app works independently
