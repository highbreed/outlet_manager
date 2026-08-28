# Implementation Plan - Field Sales Management System

## 🎯 Implementation Approach

> **Decision Date**: January 28, 2026  
> **Approach**: Depth-First with Real API Integration  
> **Current Phase**: Phase 2 - Daily Route & Visit Lifecycle

### Chosen Strategy: Depth-First

We are implementing features **depth-first** — completing each phase fully before moving to the next. This ensures:
- A working end-to-end agent workflow at each milestone
- Early detection of integration issues with the backend
- Testable increments that can be demoed/validated

### Real API Integration (No Mock Data)

All features will be built against the **real FastAPI backend** from day one:
- Base URL: `/api/v1/visits` (see Appendix A for full API reference)
- Authentication: JWT Bearer token (already implemented in auth feature)
- Error handling: Real API error codes (`GEOFENCE_VIOLATION`, `ROUTE_BLOCKED`, etc.)
- Offline-first: Queue operations locally, sync when online

**Why Real API?**
1. Backend is being developed in parallel and ready for integration
2. Avoids "mock data drift" where mocks diverge from real API
3. Forces us to handle real error cases immediately
4. Enables end-to-end testing sooner

### Implementation Milestones

| Milestone | Target | Deliverable |
|-----------|--------|-------------|
| **M1: Route Activation** | Week 1 | Agent can activate daily route, see visit list |
| **M2: Clock In/Out** | Week 2 | Agent can clock in/out of visits with geofence validation |
| **M3: Route Close** | Week 2 | Agent can close route, handle pending visits |
| **M4: Override Flow** | Week 3 | Agent can request geofence override, supervisor can approve |
| **M5: Location Tracking** | Week 3 | Background pings, trail recording |
| **M6: Schedules Cache** | Week 4 | Agent can view weekly schedule (read-only) |
| **M7: Stock Take** | Week 5 | Agent can perform stock counts at outlets |
| **M8: Orders** | Week 6 | Agent can create orders at outlets |
| **M9: Admin Actions** | Week 7+ | Supervisor/Manager quick actions (online-only) |

### Current Build Queue

**Phase 2 Implementation Order:**

```
┌─────────────────────────────────────────────────────────────┐
│  STEP 1: Domain Layer (Entities + Repositories)             │
│  ├── DailyRoute entity (freezed)                           │
│  ├── OutletVisit entity (freezed)                          │
│  ├── GeofenceOverrideRequest entity (freezed)              │
│  ├── DailyRouteRepository interface                        │
│  └── OutletVisitRepository interface                       │
├─────────────────────────────────────────────────────────────┤
│  STEP 2: Data Layer (Models + DataSources)                  │
│  ├── DailyRouteModel (Isar collection)                     │
│  ├── OutletVisitModel (Isar collection)                    │
│  ├── GeofenceOverrideModel (Isar collection)               │
│  ├── Update isar_database.dart with new collections        │
│  ├── DailyRouteLocalDataSource                             │
│  ├── DailyRouteRemoteDataSource (real API)                 │
│  └── Repository implementations                             │
├─────────────────────────────────────────────────────────────┤
│  STEP 3: Use Cases                                          │
│  ├── ActivateRouteUseCase                                  │
│  ├── GetTodaysRouteUseCase                                 │
│  ├── ClockInVisitUseCase                                   │
│  ├── ClockOutVisitUseCase                                  │
│  ├── SkipVisitUseCase                                      │
│  ├── CloseRouteUseCase                                     │
│  └── RequestGeofenceOverrideUseCase                        │
├─────────────────────────────────────────────────────────────┤
│  STEP 4: Refactor ClockInSession                            │
│  ├── Add outletVisitLocalId reference (required)           │
│  ├── Update existing use cases to work with OutletVisit    │
│  └── Ensure one active session = one in_progress visit     │
├─────────────────────────────────────────────────────────────┤
│  STEP 5: Providers (Riverpod)                               │
│  ├── dailyRouteProvider                                    │
│  ├── todaysRouteProvider                                   │
│  ├── activeVisitProvider                                   │
│  ├── visitListProvider                                     │
│  └── routeStatusProvider                                   │
├─────────────────────────────────────────────────────────────┤
│  STEP 6: Presentation Layer                                 │
│  ├── RouteActivationScreen                                 │
│  ├── VisitListScreen (today's visits)                      │
│  ├── VisitDetailScreen                                     │
│  ├── ClockInScreen (geofence check + clock in)             │
│  ├── ActiveVisitScreen (timer, clock out)                  │
│  ├── RouteCloseScreen                                      │
│  └── Widgets: VisitCard, RouteStatusBanner, etc.           │
├─────────────────────────────────────────────────────────────┤
│  STEP 7: Navigation Integration                             │
│  ├── Update router_provider.dart with new routes           │
│  ├── Home screen → Route activation CTA                    │
│  └── Deep linking for notifications                        │
├─────────────────────────────────────────────────────────────┤
│  STEP 8: Testing & Polish                                   │
│  ├── Unit tests for use cases                              │
│  ├── Widget tests for screens                              │
│  ├── Integration test: full route lifecycle                │
│  └── Error handling for all API error codes                │
└─────────────────────────────────────────────────────────────┘
```

### File Structure for Phase 2

```
lib/features/
├── daily_route/                    ← NEW FEATURE MODULE
│   ├── daily_route.dart            (barrel export)
│   ├── domain/
│   │   ├── domain.dart
│   │   ├── entities/
│   │   │   ├── daily_route.dart
│   │   │   ├── outlet_visit.dart
│   │   │   └── geofence_override_request.dart
│   │   ├── repositories/
│   │   │   ├── daily_route_repository.dart
│   │   │   └── outlet_visit_repository.dart
│   │   └── usecases/
│   │       ├── activate_route_usecase.dart
│   │       ├── get_todays_route_usecase.dart
│   │       ├── close_route_usecase.dart
│   │       ├── clock_in_visit_usecase.dart
│   │       ├── clock_out_visit_usecase.dart
│   │       ├── skip_visit_usecase.dart
│   │       └── request_override_usecase.dart
│   ├── data/
│   │   ├── data.dart
│   │   ├── models/
│   │   │   ├── daily_route_model.dart
│   │   │   ├── outlet_visit_model.dart
│   │   │   └── geofence_override_model.dart
│   │   ├── datasources/
│   │   │   ├── daily_route_local_datasource.dart
│   │   │   └── daily_route_remote_datasource.dart
│   │   └── repositories/
│   │       ├── daily_route_repository_impl.dart
│   │       └── outlet_visit_repository_impl.dart
│   ├── presentation/
│   │   ├── presentation.dart
│   │   ├── screens/
│   │   │   ├── route_activation_screen.dart
│   │   │   ├── visit_list_screen.dart
│   │   │   ├── visit_detail_screen.dart
│   │   │   ├── active_visit_screen.dart
│   │   │   └── route_close_screen.dart
│   │   └── widgets/
│   │       ├── visit_card.dart
│   │       ├── visit_status_chip.dart
│   │       ├── route_status_banner.dart
│   │       ├── route_progress_indicator.dart
│   │       ├── geofence_status_widget.dart
│   │       └── clock_in_button.dart
│   └── providers/
│       └── daily_route_providers.dart
│
├── clock_in/                       ← EXISTING (will be refactored)
│   └── ... (add outletVisitLocalId reference)
│
└── geofence_override/              ← NEW (Phase 2.3)
    ├── domain/
    ├── data/
    ├── presentation/
    └── providers/
```

### API Integration Pattern

All remote data sources follow this pattern:

```dart
class DailyRouteRemoteDataSource {
  final Dio _dio;
  final String _baseUrl = '/api/v1/visits';
  
  // Activate route - POST /routes/activate
  Future<DailyRouteDto> activateRoute({DateTime? routeDate}) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/routes/activate',
        data: routeDate != null ? {'route_date': routeDate.toIso8601String().split('T')[0]} : null,
      );
      return DailyRouteDto.fromJson(response.data);
    } on DioException catch (e) {
      throw _mapDioError(e);  // Maps to domain exceptions
    }
  }
  
  // Maps API errors to typed exceptions
  AppException _mapDioError(DioException e) {
    final data = e.response?.data;
    if (data is Map && data['error'] == 'ROUTE_BLOCKED') {
      return RouteBlockedException(
        blockedRouteId: data['blocked_route_id'],
        blockedRouteDate: data['blocked_route_date'],
      );
    }
    if (data is Map && data['error'] == 'GEOFENCE_VIOLATION') {
      return GeofenceViolationException(
        distanceMeters: data['distance_meters'],
        requiredRadiusMeters: data['required_radius_meters'],
        canRequestOverride: data['can_request_override'],
      );
    }
    // ... other error mappings
    return ApiException(message: e.message ?? 'Unknown error');
  }
}
```

### Offline-First Sync Pattern

Agent actions use the sync queue for offline support:

```dart
// In ClockInVisitUseCase
Future<Either<Failure, OutletVisit>> execute(ClockInParams params) async {
  // 1. Validate locally (geofence, accuracy)
  final validation = await _validateLocation(params);
  if (validation.isLeft()) return validation.cast();
  
  // 2. Update local state immediately (optimistic)
  final visit = await _visitRepo.updateVisitStatus(
    params.visitLocalId,
    VisitStatus.inProgress,
    actualClockIn: DateTime.now(),
  );
  
  // 3. Queue sync operation
  await _syncService.createOperation(
    type: SyncOperationType.clockIn,
    entityType: 'outlet_visit',
    entityId: params.visitLocalId,
    data: {
      'visit_server_id': visit.serverId,  // May be null if visit not synced yet
      'latitude': params.latitude,
      'longitude': params.longitude,
      'accuracy_meters': params.accuracy,
      'notes': params.notes,
    },
    priority: 1,  // High priority
    dependsOn: visit.serverId == null ? [visit.dailyRouteLocalId] : null,
  );
  
  // 4. Return success immediately (UI updates)
  return Right(visit);
}
```

### Progress Tracking

We'll track progress in this document:

| Phase | Step | Status | Notes |
|-------|------|--------|-------|
| **Phase 1** | Core Infrastructure | ✅ Complete | Sync, Location, Notifications, Permissions, DB |
| **Phase 2** | Step 1: Domain Layer | ✅ Complete | Entities, Repositories, Use Cases |
| **Phase 2** | Step 2: Data Layer | ✅ Complete | Models, Datasources, Repository Impl |
| **Phase 2** | Step 3: Use Cases | ✅ Complete | All route/visit use cases |
| **Phase 2** | Step 4: Refactor ClockInSession | ✅ Complete | Integrated with OutletVisit |
| **Phase 2** | Step 5: Providers | ✅ Complete | Riverpod providers |
| **Phase 2** | Step 6: Presentation | ✅ Complete | All screens and widgets |
| **Phase 2** | Step 7: Navigation | ✅ Complete | GoRouter integration |
| **Phase 2** | Step 8: Testing & Polish | ✅ Complete | UI/UX improvements, skip reasons |
| **Phase 3** | 3.0: Background Location Ping | ✅ Complete | Three-trigger strategy (significant change, heartbeat, high-precision) |
| **Phase 3** | 3.1: Visit Schedules | ✅ Complete | Schedule viewing - ScheduleListScreen, DayTabBar, offline-first Isar cache |
| **Phase 3** | 3.2: Outlet Management | ⏳ Not Started | Search, ad-hoc visits |
| **Phase 4** | Stock Take Module | ⏳ Not Started | |
| **Phase 5** | Orders Module | ⏳ Not Started | |
| **Phase 6** | Remaining Features | ⏳ Not Started | |
| **Phase 7** | Quick Admin Actions | ⏳ Not Started | |

**Completed Files (Step 1):**
```
lib/features/daily_route/
├── daily_route.dart                              ✅
├── domain/
│   ├── domain.dart                               ✅
│   ├── entities/
│   │   ├── daily_route.dart                      ✅ (+ .freezed.dart, .g.dart)
│   │   ├── outlet_visit.dart                     ✅ (+ .freezed.dart, .g.dart)
│   │   └── geofence_override_request.dart        ✅ (+ .freezed.dart, .g.dart)
│   └── repositories/
│       ├── daily_route_repository.dart           ✅
│       └── outlet_visit_repository.dart          ✅

lib/core/network/
├── failures.dart                                 ✅ (added domain-specific failures)
```

---

## ✅ Production-Ready Fixes Applied

This plan has been updated with critical production-ready improvements:

1. **✅ ClockInSession Entity**: Updated with accuracy fields, confirmed exit tracking, ClockOutReason, and SyncState
2. **✅ ClockSessionEvent**: Added persistent audit trail with DB schema and indexes
3. **✅ EntityIdMap**: Added localId → serverId mapping for offline-first sync
4. **✅ Payload Hashing**: SyncOperation includes SHA256 hash for duplicate detection
5. **✅ Foreground Service**: Added `flutter_foreground_task` for Android active session tracking
6. **✅ Geofence Implementation**: Clarified that `geolocator` distance checks are authoritative (geofence_service signals only)
7. **✅ Daily Summary**: Converted from SQL to Isar queries with proper repository pattern
8. **✅ Attachment Sync**: Two-step sync flow (create entity → upload files) with dependencies
9. **✅ Pricing Cache**: Offline price list with ETag/delta updates and backend validation
10. **✅ Permission Caching**: Added version/updatedAt for deterministic offline checks
11. **✅ Quick Admin Actions**: Phase 7 added for Supervisor/Manager/Admin mobile capabilities (online-only)

---

## Phase 1: Core Infrastructure (Priority: HIGH)

**STATUS: IN PROGRESS (4/6 complete)**

### 1.1 Offline Sync System ✅ COMPLETE

**Files to Create:**
```
lib/core/sync/
├── sync_service.dart
├── sync_queue.dart
├── sync_status.dart
├── sync_config.dart
├── models/
│   ├── sync_operation.dart
│   ├── sync_result.dart
│   └── sync_dependency.dart
└── providers/
    └── sync_providers.dart
```

**Key Classes:**
- `SyncService`: Orchestrates all sync operations with dependency resolution
- `SyncQueue`: Priority queue respecting operation dependencies
- `SyncOperation`: Individual sync task with:
  * `clientOperationId` UUID for idempotency
  * `payloadHash` (SHA256) to detect duplicates
  * `dependsOn` for dependency chains
  * `nextRetryAt` for exponential backoff
- Background worker integration
- **Exponential backoff**: 1m, 2m, 5m, 15m, 30m, 1h, 2h, 4h, 8h, 12h, 24h
- **Infinite retry**: Flag "Needs Attention" after 5 fails, but keep trying
- **Idempotency**: Duplicate detection via clientOperationId + payloadHash
- **Dependencies**: Stock take/orders wait for clock-in to sync first
- **Attachment uploads**: Two-step sync (create entity → upload files)

```dart
class SyncOperation {
  String id;
  String clientOperationId;  // UUID for idempotency
  String payloadHash;        // SHA256 of payload for duplicate detection
  SyncOperationType type;
  String entityType;
  String entityId;
  Map<String, dynamic> data;
  int priority;              // 1 = highest (clock in/out)
  DateTime timestamp;
  int retryCount;
  DateTime? nextRetryAt;
  List<String> dependsOn;    // Operation IDs that must succeed first
  SyncStatus status;
  String? errorMessage;
  DateTime? lastAttemptAt;
}
```

**Sync Center UI:**
- View pending operations
- See failed operations ("Needs Attention")
- Manual "Retry Now" button
- Sync progress and status

**Dependencies:**
- `workmanager: ^0.5.2` (Android background)
**Implementation Status:**
- ✅ `SyncService` created with all methods
- ✅ Idempotency via UUID + SHA256 payloadHash
- ✅ Exponential backoff (1m→24h)
- ✅ Dependency resolution
- ✅ Priority queue management
- ✅ Riverpod providers configured

### 1.2 Location & Geofencing ✅ COMPLETE

**Files Created:**
```
lib/core/location/
├── location_service.dart       ✅
├── geofence_manager.dart       ✅
├── location_data.dart          ✅
└── providers/
    └── location_providers.dart ✅
```

**Key Features:**
- Continuous location tracking with dynamic intervals:
  * 2 minutes when inside geofence (battery optimized)
  * 30 seconds when outside geofence (faster re-entry detection)
- Geofence creation and monitoring (50m radius + 10m buffer)
- **Implementation**: Use `geolocator` distance calculations as authoritative
  * `geofence_service` callbacks are signals only
  * Core logic: Our exit/re-entry confirmation rules
- **Accuracy gating**: Clock-in only allowed if GPS accuracy <= 50m
- **Exit confirmation**: Require 2 consecutive outside readings OR 3 min continuous
- Geofence exit detection with strategic notifications:
  * Exit detected (1st alert)
  * 5 minutes warning (2nd alert)
  * 9 minutes final warning (3rd alert)
  * Auto clock-out triggered (4th alert)
- Re-entry detection: Cancel warnings if user returns (confirmed by 2 inside readings)
- Distance calculation utilities
- **Foreground service for active sessions (Android)**
  * Keeps location tracking alive
  * Shows persistent notification
  * Prevents system kill

**Dependencies:**
- ✅ `geolocator: ^13.0.2` (already added)
- `geofence_service: ^5.2.0` (add - signals only, not authoritative)
- `flutter_foreground_task: ^8.0.0` (add - Android foreground service)

### 1.3 Notifications

**Files to Create:**
```
lib/core/notifications/
├── notification_service.dart
├── notification_types.dart
├── models/
│   └── notification_payload.dart
└── providers/
    └── notification_providers.dart
```

**Notification Types:**
- Time exceeded at outlet (allocated time used up)
- Pending clock-out reminder (end of day)
- Sync failure alert (when sync operations fail after 5 retries)
- Location disabled warning (GPS turned off)
- Location accuracy poor (GPS accuracy > 50m, preventing clock-in)
- **Geofence alerts (4 strategic notifications):**
  1. Exit detected: "You left outlet zone. Return within 10 min."
  2. Mid warning (5 min): "5 minutes remaining before auto clock-out"
  3. Final warning (9 min): "1 minute until auto clock-out"
  4. Auto clock-out: "You have been automatically clocked out"
- Geofence re-entered: "Welcome back! Clock-in resumed"
- **Persistent notification:** Silently updated with countdown during grace period

**Dependencies:**
- ✅ `flutter_local_notifications: ^20.0.0` (added)
- ✅ `timezone: ^0.10.1` (added for notification scheduling)

**Implementation Status:**
- ✅ NotificationService with 4 notification channels
- ✅ Geofence alert system (4 strategic notifications)
- ✅ Persistent notification with countdown timer
- ✅ Sync failure notifications
- ✅ Location warning notifications
- ✅ Integrated with GeofenceManager
- ✅ Riverpod providers configured

### 1.4 Permissions System

**Files to Create:**
```
lib/core/permissions/
├── permission_service.dart
├── user_permissions.dart
├── user_scope.dart
├── models/
│   ├── permission_config.dart
│   └── admin_scope.dart
└── providers/
    └── permission_providers.dart
```

**Feature Permissions (FeaturePermission enum):**
```dart
enum FeaturePermission {
  // Agent capabilities (existing)
  clockIn,
  clockOut,
  viewSchedule,
  createStockTake,
  createProposedOrder,
  createSalesOrder,
  salesWarranty,
  logComplaint,
  viewDailySummary,
  viewAssignedRoutes,
  
  // Quick Admin capabilities (NEW)
  approveGeofenceOverride,    // Supervisor+
  resolveRouteBlocked,        // Supervisor+ (view blocked routes in scope)
  closeRouteOnBehalf,         // Supervisor+ (close agent's route for them)
  forceCloseRoute,            // Manager/Admin only
  viewTeamLiveMonitor,        // Supervisor+
  sendAgentNudge,             // Supervisor+ (request agent to close)
  reassignVisit,              // Manager/Admin (Phase 2)
  editVisitAllocatedMinutes,  // Manager/Admin (Phase 2)
}
```

**User Scope (NEW):**
```dart
// Cached alongside permissions - determines which agents user can admin
@freezed
class AdminScope with _$AdminScope {
  factory AdminScope({
    required String userId,
    required UserRole role,
    required List<String> agentIds,        // Direct reports (Supervisor)
    required List<String> territoryIds,    // Territories in scope
    required List<String> regionIds,       // Regions in scope (Manager)
    @Default(false) bool isGlobalScope,    // Admin = true
    required int version,
    required DateTime updatedAt,
  }) = _AdminScope;
}

enum UserRole {
  agent,
  supervisor,
  manager,
  admin,
}
```
```

**Feature Permission Caching (Offline-First):**
- Cache permissions locally with version/timestamp
- Backend provides version number, user's allowed features
- App compares cached version to server version on sync
- If versions match → use cache (instant offline checks)
- If versions differ → fetch fresh permissions, update cache
- Cache fields:
  * `userId`
  * `permissionsJson` (serialized list)
  * `version` (int - server-provided)
  * `cachedAt` (DateTime)
  * `expiresAt` (DateTime - optional TTL)

**Admin Scope Caching (NEW):**
- Fetch scope on login and permission refresh
- Endpoint: `GET /api/v1/admin/my-scope`
- Cache locally with same version/TTL as permissions
- Scope determines which agents appear in admin UIs
- Scope enforcement is ALSO done server-side (mobile cache is convenience only)

**Runtime Permissions (System):**
- Location (always/when-in-use)
- Camera (photo uploads)
- Storage (file attachments)

### 1.5 Local Database Schema ✅ COMPLETE
  createProposedOrder,
  createSalesOrder, ✅ COMPLETE
  salesWarranty,
  logComplaint,
  viewDailySummary,
  viewAssignedRoutes,
}
```

### 1.5 Local Database Schema

**Storage Strategy:**
- **Isar** for high-performance offline storage
- **Collections**: 
  * ClockInSession
  * ClockSessionEvent (audit trail)
  * DailyRoute (NEW - local mirror of daily_routes)
  * OutletVisit (NEW - local mirror of outlet_visits)
  * GeofenceOverrideRequest (NEW)
  * RouteSchedule (template from outlet_visit_schedules)
  * StockTakeEntry
  * Order
  * EntityIdMap (localId → serverId mapping)
  * Attachment (for photos/files)
  * SyncOperation
  * PermissionCache
  * PriceCache
- **Indexes** on frequently queried fields

**Critical Collections:**

```dart
// Entity ID mapping for offline-first sync
// UPDATED: Added daily_route, outlet_visit, geofence_override_request
@collection
class EntityIdMap {
  Id? id;
  
  @Index()
  String entityType; 
  // Supported types:
  // - 'daily_route'
  // - 'outlet_visit'
  // - 'clock_session'
  // - 'geofence_override_request'
  // - 'order'
  // - 'complaint'
  // - 'stock_take'
  // - 'attachment'
  
  @Index(unique: true, composite: [CompositeIndex('localId')])
  String localId;    // Local UUID
  
  String? serverId;  // Backend ID (null until synced)
  DateTime? syncedAt;
}

// NEW: Daily route local state (mirrors backend daily_routes)
// NOTE: No scheduleServerId - backend routes are per-agent per-date, not per-schedule
@collection
class DailyRouteModel {
  Id? id;
  
  @Index(unique: true)
  String localId;
  
  @Index()
  String? serverId;
  
  @Index()
  String salesAgentId;  // Local convenience for filtering
  
  @Index()
  DateTime routeDate;
  
  int dayOfWeek;
  
  @enumerated
  DailyRouteStatus status;
  
  DateTime? activatedAt;
  DateTime? firstClockInAt;
  DateTime? lastClockOutAt;
  DateTime? closedAt;
  
  int totalScheduled;
  int completedCount;
  int skippedCount;
  int inProgressCount;
  
  String? closingNotes;
  String? closedByUserId;
  
  // Force close fields
  bool forceClosed;
  String? forceClosedByUserId;
  DateTime? forceClosedAt;
  String? forceCloseReason;
  
  @enumerated
  SyncState syncState;
}

// NEW: Outlet visit local state
@collection
class OutletVisitModel {
  Id? id;
  
  @Index(unique: true)
  String localId;
  
  @Index()
  String? serverId;
  
  @Index()
  String dailyRouteLocalId;
  String? dailyRouteServerId;
  
  @Index()
  String outletId;
  String outletCode;
  String outletName;
  double outletLatitude;
  double outletLongitude;
  
  String? scheduleServerId;
  int visitOrder;
  int allocatedMinutes;
  DateTime? scheduledClockIn;
  DateTime? scheduledClockOut;
  
  DateTime? actualClockIn;
  DateTime? actualClockOut;
  
  @enumerated
  OutletVisitStatus status;
  
  @enumerated
  OutletVisitType visitType;
  
  String? skipReasonServerId;
  String? skipReasonCode;
  String? skipNotes;
  
  double? clockInLatitude;
  double? clockInLongitude;
  double? clockInAccuracy;
  double? clockInDistanceMeters;
  
  double? clockOutLatitude;
  double? clockOutLongitude;
  double? clockOutAccuracy;
  double? clockOutDistanceMeters;
  
  bool geofenceOverrideUsed;
  String? geofenceOverrideRequestServerId;
  String? geofenceOverrideReason;
  String? geofenceOverrideApprovedBy;
  
  double? transportExpense;
  String? routeCovered;
  bool? hasOrder;
  
  @enumerated
  ClockOutReason? clockOutReason;
  
  @enumerated
  SyncState syncState;
}

// NEW: Geofence override request
@collection
class GeofenceOverrideRequestModel {
  Id? id;
  
  @Index(unique: true)
  String localId;
  
  @Index()
  String? serverId;
  
  @Index()
  String outletVisitLocalId;
  String? outletVisitServerId;
  
  String reason;
  double requestedAtLatitude;
  double requestedAtLongitude;
  double distanceFromOutletMeters;
  DateTime requestedAt;
  
  @enumerated
  GeofenceOverrideStatus status;
  
  String? approvedByUserId;
  DateTime? respondedAt;
  String? responseNotes;
  
  @enumerated
  SyncState syncState;
}

// Audit trail for clock-in sessions
@collection
class ClockSessionEventModel {
  Id? id;
  
  @Index()
  String sessionId;  // Link to ClockInSession
  
  @Index()
  @enumerated
  ClockSessionEventType type;
  
  double latitude;
  double longitude;
  double accuracy;
  
  @Index()
  DateTime timestamp;
  
  String? metadataJson; // Serialized Map<String, dynamic>
}

// Attachments for complaints, photos, etc.
@collection
class AttachmentModel {
  Id? id;
  
  @Index()
  String localId;        // UUID
  
  String? serverId;      // Backend ID after upload
  
  @Index()
  String entityType;     // 'complaint', 'order', etc.
  
  @Index()
  String entityId;       // Parent entity localId
  
  String localPath;      // File path on device
  String? remoteUrl;     // URL after upload
  String mimeType;       // image/jpeg, etc.
  int sizeBytes;
  String sha256;         // File hash for integrity
  
  @enumerated
  AttachmentStatus status;
  
  DateTime createdAt;
  DateTime? uploadedAt;
}

enum AttachmentStatus {
  pending,
  uploading,
  uploaded,
  failed,
}

// Visit schedule cache (mirrors backend outlet_visit_schedules rows)
@collection
class VisitScheduleModel {
  Id? id;
  
  @Index(unique: true)
  String serverId;
  
  @Index()
  String salesAgentServerId;
  
  @Index()
  String outletId;
  String outletCode;
  String outletName;
  double outletLatitude;
  double outletLongitude;
  
  @Index()
  int dayOfWeek;
  
  DateTime? scheduledClockIn;
  DateTime? scheduledClockOut;
  int visitOrder;
  int visitPriority;
  int allocatedMinutes;
  
  DateTime effectiveFrom;
  DateTime? effectiveTo;
  bool isActive;
  
  DateTime? lastSyncedAt;
}

// Agent location pings (mirrors backend agent_location_pings)
@collection
class AgentLocationPingModel {
  Id? id;
  
  @Index(unique: true)
  String localId;
  
  @Index()
  String? serverId;
  
  @Index()
  String? dailyRouteLocalId;
  String? dailyRouteServerId;
  
  double latitude;
  double longitude;
  double accuracyMeters;
  double? speedMps;
  double? headingDegrees;
  
  int? batteryLevel;
  bool? isCharging;
  String? networkType;
  
  @enumerated
  PingSource pingSource;
  
  @Index()
  DateTime recordedAt;
  DateTime? receivedAt;
  
  @enumerated
  SyncState syncState;
}

// Route events audit trail (mirrors backend route_events)
@collection
class RouteEventModel {
  Id? id;
  
  @Index(unique: true)
  String localId;
  
  @Index()
  String? serverId;
  
  @Index()
  String dailyRouteLocalId;
  String? dailyRouteServerId;
  
  @Index()
  @enumerated
  RouteEventType eventType;
  
  String? outletVisitLocalId;
  String? outletVisitServerId;
  
  String? metadataJson;
  
  @Index()
  DateTime createdAt;
  
  @enumerated
  SyncState syncState;
}

// Skip reason dictionary cache
@collection
class SkipReasonCacheModel {
  Id? id;
  
  @Index(unique: true)
  String serverId;
  
  String code;
  String name;
  bool requiresNotes;
  bool isActive;
  int displayOrder;
  DateTime updatedAt;
}

// Permission caching with versioning
@collection
class PermissionCacheModel {
  Id? id;
  
  @Index(unique: true)
  String userId;
  
  String permissionsJson; // Serialized List<FeaturePermission>
  int version;            // Server-provided version
  DateTime updatedAt;
  DateTime expiresAt;     // Cache expiry
}

// Admin scope caching (NEW - for Quick Admin features)
@collection
class AdminScopeCacheModel {
  Id? id;
  
  @Index(unique: true)
  String userId;
  
  @enumerated
  UserRole role;
  
  String agentIdsJson;      // Serialized List<String> - direct reports
  String territoryIdsJson;  // Serialized List<String>
  String regionIdsJson;     // Serialized List<String>
  bool isGlobalScope;       // true for Admin role
  
  int version;
  DateTime updatedAt;
  DateTime expiresAt;
}

// Price list caching for offline orders
@collection  
class PriceCacheModel {
  Id? id;
  
  @Index(unique: true)
  String productId;
  
  String productName;
  String productCode;
  double unitPrice;
  String currency;
  
  int version;        // Server-provided version
  DateTime updatedAt;
  DateTime expiresAt;
}
```

**Implementation Status:**
- ✅ All 10 Isar collection models created
- ✅ Indexes defined on all models
- ✅ IsarDatabase manager created
- ✅ Build runner schemas generated successfully
- ✅ Database providers configured

---

## Phase 2: Clock In/Out + Daily Route Lifecycle ⏳ IN PROGRESS

**Backend Alignment Notes:**
- `DailyRoute` = LOCAL mirror of backend `daily_routes` (one per agent per date)
- `OutletVisit` = LOCAL mirror of backend `outlet_visits` (canonical visit state)
- `ClockInSession` = EPHEMERAL runtime state for active visit (geofence tracking, timers, etc.)
  - Derived from `OutletVisit` + `GeofenceManager` state
  - MUST reference `outletVisitLocalId` always
  - Only ONE active `ClockInSession` at a time
  - When visit completes/skips: `ClockInSession` closed → `OutletVisitModel` updated
- All visit clock-in/out uses `/api/v1/visits/{visit_id}/clock-in` and `/api/v1/visits/{visit_id}/clock-out`
- Route must be activated before any clock-in; route must be closed at end of day
- Yesterday's unclosed route BLOCKS today's activation (ROUTE_BLOCKED error)

**Entity Lifecycle:**
```
Activate Route → DailyRoute(pending) + OutletVisit[](pending)
                      ↓
Clock In → OutletVisit(inProgress) + ClockInSession(active)
                      ↓
Clock Out → OutletVisit(completed) + ClockInSession(completed) → disposed
                      ↓
Close Route → DailyRoute(closed) [all visits must have outcomes]
```

**Dependencies to Add:**
- `crypto: ^3.0.3` (for sha256)

**Dev Dependencies:**
- `isar_generator: ^3.1.0+1`

---

### 2.1 Domain Layer

**Entities:**

```dart
// lib/features/daily_route/domain/entities/daily_route.dart
// LOCAL mirror of backend daily_routes
// NOTE: No scheduleServerId - backend routes are per-agent per-date, not per-schedule template
@freezed
class DailyRoute with _$DailyRoute {
  factory DailyRoute({
    required String localId,              // Local UUID
    String? serverId,                      // Backend daily_route_id (null until synced)
    required String salesAgentId,          // Local convenience for filtering
    required DateTime routeDate,           // YYYY-MM-DD
    required int dayOfWeek,                // 0=Mon, 6=Sun
    required DailyRouteStatus status,
    
    // Timestamps
    DateTime? activatedAt,
    DateTime? firstClockInAt,
    DateTime? lastClockOutAt,
    DateTime? closedAt,
    
    // Progress tracking
    @Default(0) int totalScheduled,
    @Default(0) int completedCount,
    @Default(0) int skippedCount,
    @Default(0) int inProgressCount,
    
    // Closing details
    String? closingNotes,
    String? closedByUserId,
    
    // Force close (by manager/supervisor)
    @Default(false) bool forceClosed,
    String? forceClosedByUserId,
    DateTime? forceClosedAt,
    String? forceCloseReason,
    
    @Default(SyncState.localOnly) SyncState syncState,
  }) = _DailyRoute;
}

enum DailyRouteStatus {
  pending,      // Not yet activated
  activated,    // Activated, no visits started
  inProgress,   // At least one visit in progress
  closed,       // Properly closed by agent
  forceClosed,  // Force closed by manager/system
}

// lib/features/daily_route/domain/entities/outlet_visit.dart
// LOCAL mirror of backend outlet_visits
@freezed
class OutletVisit with _$OutletVisit {
  factory OutletVisit({
    required String localId,              // Local UUID
    String? serverId,                      // Backend outlet_visit_id (null until synced)
    
    // Route linkage
    required String dailyRouteLocalId,
    String? dailyRouteServerId,
    
    // Outlet info (denormalized)
    required String outletId,
    required String outletCode,
    required String outletName,
    required double outletLatitude,
    required double outletLongitude,
    
    // Schedule info
    String? scheduleServerId,              // outlet_visit_schedules.id
    required int visitOrder,               // Sequence in route
    required int allocatedMinutes,
    DateTime? scheduledClockIn,
    DateTime? scheduledClockOut,
    
    // Actual visit
    DateTime? actualClockIn,
    DateTime? actualClockOut,
    required OutletVisitStatus status,
    required OutletVisitType visitType,
    
    // Skip details (if skipped)
    String? skipReasonServerId,
    String? skipReasonCode,
    String? skipNotes,
    
    // Location at clock-in/out
    double? clockInLatitude,
    double? clockInLongitude,
    double? clockInAccuracy,
    double? clockInDistanceMeters,         // Haversine to outlet
    
    double? clockOutLatitude,
    double? clockOutLongitude,
    double? clockOutAccuracy,
    double? clockOutDistanceMeters,
    
    // Geofence override
    @Default(false) bool geofenceOverrideUsed,
    String? geofenceOverrideRequestServerId,
    String? geofenceOverrideReason,
    String? geofenceOverrideApprovedBy,
    
    // Clock-out details
    double? transportExpense,
    String? routeCovered,
    bool? hasOrder,
    ClockOutReason? clockOutReason,
    
    @Default(SyncState.localOnly) SyncState syncState,
  }) = _OutletVisit;
}

enum OutletVisitStatus {
  pending,      // Not yet visited
  inProgress,   // Clocked in, not clocked out
  completed,    // Clocked out
  skipped,      // Skipped with reason
}

enum OutletVisitType {
  scheduled,    // From route schedule
  adHoc,        // Deviation/unplanned visit
}

// lib/features/clock_in/domain/entities/clock_in_session.dart
// LOCAL session tracking (extends OutletVisit with real-time geofence state)
@freezed
class ClockInSession with _$ClockInSession {
  factory ClockInSession({
    required String id,
    
    // === Backend alignment fields ===
    String? dailyRouteLocalId,
    String? dailyRouteServerId,
    String? outletVisitLocalId,            // Local OutletVisit UUID
    String? outletVisitServerId,           // Backend visit_id once synced
    String? scheduleServerId,              // outlet_visit_schedules.id
    required DateTime routeDate,           // Date of route (YYYY-MM-DD)
    required int dayOfWeek,                // Derived from routeDate
    
    // Outlet info
    required String outletId,
    required String outletName,
    required String outletCode,
    required double outletLatitude,
    required double outletLongitude,
    required bool isDeviation,             // true = ad-hoc visit
    
    // Clock-in details
    required DateTime clockedInAt,
    required double clockInLatitude,
    required double clockInLongitude,
    required double clockInAccuracy,
    double? clockInDistanceMeters,         // Haversine to outlet at clock-in
    required int allocatedMinutes,
    required ClockInStatus status,
    
    // Configuration snapshot
    @Default(50.0) double geofenceRadiusMeters,
    @Default(10) int autoClockoutGraceMinutes,
    
    // Exit tracking with confirmation
    DateTime? firstOutsideReadingAt,
    DateTime? confirmedExitAt,
    @Default(0) int consecutiveOutsideReadings,
    @Default(0) int consecutiveInsideReadings,
    
    // Clock-out details
    DateTime? clockedOutAt,
    double? clockOutLatitude,
    double? clockOutLongitude,
    double? clockOutAccuracy,
    double? clockOutDistanceMeters,        // Haversine to outlet at clock-out
    double? transportExpense,
    String? routeCovered,
    bool? hasOrder,
    ClockOutReason? clockOutReason,
    
    // Geofence override
    @Default(false) bool geofenceOverrideUsed,
    String? geofenceOverrideRequestServerId,
    
    @Default(SyncState.localOnly) SyncState syncState,
  }) = _ClockInSession;
}

enum ClockInStatus {
  active,
  completed,
  autoClockOut,
}

enum ClockOutReason {
  manual,
  geofenceExit,       // Left geofence for 10 minutes
  forcedTimeout,      // Exceeded allocated time
  serverAutoClose,    // Backend detected another session
  routeDeactivation,  // End of day / route closed
}

enum SyncState {
  localOnly,
  syncing,
  synced,
  syncFailed,
  needsAttention,
}

// Audit trail for disputes and debugging
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
    // Enhanced metadata with backend IDs for traceability
    Map<String, dynamic>? metadata,
    // metadata should include:
    // - outletVisitLocalId, outletVisitServerId
    // - dailyRouteLocalId, dailyRouteServerId
    // - geofenceOverrideRequestId (if applicable)
  }) = _ClockSessionEvent;
}

enum ClockSessionEventType {
  clockIn,
  firstOutsideReading,
  geofenceExitConfirmed,
  notificationSent,
  firstInsideReading,
  geofenceReentryConfirmed,
  autoClockOut,
  manualClockOut,
  accuracyImproved,
  accuracyDegraded,
  pollingIntervalChanged,
  geofenceOverrideRequested,  // NEW
  geofenceOverrideApproved,   // NEW
  geofenceOverrideRejected,   // NEW
  visitSkipped,               // NEW
}

// lib/features/daily_route/domain/entities/geofence_override_request.dart
@freezed
class GeofenceOverrideRequest with _$GeofenceOverrideRequest {
  factory GeofenceOverrideRequest({
    required String localId,
    String? serverId,
    required String outletVisitLocalId,
    String? outletVisitServerId,
    required String reason,
    required double requestedAtLatitude,
    required double requestedAtLongitude,
    required double distanceFromOutletMeters,
    required DateTime requestedAt,
    required GeofenceOverrideStatus status,
    String? approvedByUserId,
    DateTime? respondedAt,
    String? responseNotes,
    @Default(SyncState.localOnly) SyncState syncState,
  }) = _GeofenceOverrideRequest;
}

enum GeofenceOverrideStatus {
  pending,
  approved,
  rejected,
}
```

// NEW: Agent location pings (mirrors backend agent_location_pings)
// Rate limiting: ignore if last ping < 60s OR accuracy > 200m
```dart
@freezed
class AgentLocationPing with _$AgentLocationPing {
  factory AgentLocationPing({
    required String localId,
    String? serverId,
    String? dailyRouteLocalId,
    String? dailyRouteServerId,
    required double latitude,
    required double longitude,
    required double accuracyMeters,
    double? speedMps,
    double? headingDegrees,
    int? batteryLevel,           // 0-100
    bool? isCharging,
    String? networkType,         // wifi, cellular, none
    required PingSource pingSource,
    required DateTime recordedAt, // Device time
    DateTime? receivedAt,         // Server time (filled after sync)
    @Default(SyncState.localOnly) SyncState syncState,
  }) = _AgentLocationPing;
}

enum PingSource {
  periodic,
  geofenceEvent,
  manual,
  appForeground,
  appBackground,
}

// NEW: Route events audit trail (mirrors backend route_events)
// Separate from ClockSessionEvent which is session-centric
@freezed
class RouteEvent with _$RouteEvent {
  factory RouteEvent({
    required String localId,
    String? serverId,
    required String dailyRouteLocalId,
    String? dailyRouteServerId,
    required RouteEventType eventType,
    String? outletVisitLocalId,
    String? outletVisitServerId,
    Map<String, dynamic>? metadata,
    required DateTime createdAt,
    @Default(SyncState.localOnly) SyncState syncState,
  }) = _RouteEvent;
}

enum RouteEventType {
  activated,
  clockIn,
  clockOut,
  visitSkipped,
  closed,
  forceClosed,
  overrideRequested,
  overrideApproved,
  overrideRejected,
}

// NEW: Skip reason dictionary (fetched from GET /api/v1/visits/skip-reasons)
@freezed
class SkipReason with _$SkipReason {
  factory SkipReason({
    required String serverId,
    required String code,
    required String name,
    required bool requiresNotes,
    required bool isActive,
    required int displayOrder,
    required DateTime updatedAt,
  }) = _SkipReason;
}
```

**Use Cases:**
- `ActivateDailyRouteUseCase`: Activate route for today (creates DailyRoute + OutletVisits locally)
- `CloseDailyRouteUseCase`: Close route at end of day (validates all visits have outcomes)
- `ClockInVisitUseCase`: Validate location, create session via `/visits/{visit_id}/clock-in`
- `ClockOutVisitUseCase`: End session via `/visits/{visit_id}/clock-out`
- `SkipVisitUseCase`: Skip a visit with reason
- `ValidateLocationUseCase`: Check if within geofence
- `GetActiveSessionUseCase`: Retrieve current session
- `AutoClockOutUseCase`: Triggered by geofence exit
- `RequestGeofenceOverrideUseCase`: Request override when outside geofence
- `CreateAdHocVisitUseCase`: Create deviation visit

**Repository Interfaces:**
```dart
abstract class DailyRouteRepository {
  // NOTE: No scheduleServerId - backend derives from agent identity + routeDate's dayOfWeek
  Future<Either<Failure, ActivateRouteResult>> activateRoute({
    required DateTime routeDate,
    required String clientOperationId,
  });
  
  Future<Either<Failure, void>> closeRoute({
    required String dailyRouteLocalId,
    String? closingNotes,
    required String clientOperationId,
  });
  
  // Force close (manager/supervisor only)
  Future<Either<Failure, void>> forceCloseRoute({
    required String dailyRouteLocalId,
    required String reason,
    required String clientOperationId,
  });
  
  Future<Either<Failure, DailyRoute?>> getActiveRoute();
  Stream<DailyRoute?> watchActiveRoute();
  Future<Either<Failure, List<OutletVisit>>> getVisitsForRoute(String dailyRouteLocalId);
  Stream<List<OutletVisit>> watchVisitsForRoute(String dailyRouteLocalId);
}

// Result from activateRoute - contains route + visits for reconciliation
@freezed
class ActivateRouteResult with _$ActivateRouteResult {
  factory ActivateRouteResult({
    required DailyRoute dailyRoute,
    required List<OutletVisit> outletVisits,
  }) = _ActivateRouteResult;
}

abstract class OutletVisitRepository {
  Future<Either<Failure, ClockInSession>> clockIn({
    required String outletVisitLocalId,
    required double latitude,
    required double longitude,
    required double accuracy,
    required String clientOperationId,
  });
  
  Future<Either<Failure, void>> clockOut({
    required String outletVisitLocalId,
    required double transportExpense,
    required String routeCovered,
    required bool hasOrder,
    required double latitude,
    required double longitude,
    required double accuracy,
    required String clientOperationId,
  });
  
  Future<Either<Failure, void>> skipVisit({
    required String outletVisitLocalId,
    required String skipReasonCode,
    String? skipNotes,
    required String clientOperationId,
  });
  
  Future<Either<Failure, OutletVisit>> createAdHocVisit({
    required String dailyRouteLocalId,
    required String outletId,
    required String clientOperationId,
  });
  
  Future<Either<Failure, ClockInSession?>> getActiveSession();
  Stream<ClockInSession?> watchActiveSession();
}

abstract class GeofenceOverrideRepository {
  Future<Either<Failure, GeofenceOverrideRequest>> requestOverride({
    required String outletVisitLocalId,
    required String reason,
    required double latitude,
    required double longitude,
    required double distanceMeters,
    required String clientOperationId,
  });
  
  Stream<GeofenceOverrideRequest?> watchPendingRequest(String outletVisitLocalId);
}
```

### 2.2 Sync Operations (Backend Alignment)

**New SyncOperation Types:**
```dart
enum SyncOperationType {
  // Existing
  createClockIn,
  updateClockOut,
  createStockTake,
  createOrder,
  uploadAttachment,
  
  // NEW - Daily Route Lifecycle
  activateDailyRoute,      // POST /api/v1/visits/routes/activate
  closeDailyRoute,         // POST /api/v1/visits/routes/{route_id}/close
  forceCloseRoute,         // POST /api/v1/visits/routes/{route_id}/force-close (manager only)
  
  // NEW - Visit Lifecycle
  visitClockIn,            // POST /api/v1/visits/{visit_id}/clock-in
  visitClockOut,           // POST /api/v1/visits/{visit_id}/clock-out
  visitSkip,               // POST /api/v1/visits/{visit_id}/skip
  createAdHocVisit,        // POST /api/v1/visits/ad-hoc
  
  // NEW - Geofence Override
  requestGeofenceOverride, // POST /api/v1/visits/{visit_id}/request-override
  
  // NEW - Location Pings
  locationPing,            // POST /api/v1/location/ping
  locationPingBatch,       // POST /api/v1/location/ping/batch
  
  // NEW - Route Events (audit trail)
  createRouteEvent,        // POST /api/v1/visits/routes/{route_id}/events
}
```

**Location Ping Rate Limiting (enforced locally before queuing):**
- Ignore if last ping < 60 seconds ago
- Ignore if accuracy > 200 meters
- Batch pings when offline, sync as batch when online

**Sync Dependency Rules:**
```dart
// Dependency graph for sync operations
final syncDependencies = {
  SyncOperationType.visitClockIn: [SyncOperationType.activateDailyRoute],
  SyncOperationType.visitClockOut: [SyncOperationType.visitClockIn],
  SyncOperationType.visitSkip: [SyncOperationType.activateDailyRoute],
  SyncOperationType.createAdHocVisit: [SyncOperationType.activateDailyRoute],
  SyncOperationType.closeDailyRoute: [
    // All visitClockOut OR visitSkip for that route must complete first
    // OR backend rejects with PENDING_VISITS error
  ],
  SyncOperationType.requestGeofenceOverride: [SyncOperationType.activateDailyRoute],
  SyncOperationType.locationPing: [], // No dependencies
  SyncOperationType.createRouteEvent: [SyncOperationType.activateDailyRoute],
};
```

**Idempotency Contract:**
- ALL POST/PUT requests include `Idempotency-Key` header (= clientOperationId)
- Backend dedupes by idempotency key, returns same response on replay
- Mobile stores returned serverId in EntityIdMap
- Request body includes optional `payloadHash` for extra deduplication

### 2.3 Data Layer

**Models (Isar Collections):**
- `DailyRouteModel` - local daily route state
- `OutletVisitModel` - local visit state (separate from ClockInSession)
- `ClockInSessionModel` - real-time session with geofence tracking
- `GeofenceOverrideRequestModel` - override requests

**Data Sources:**
- `DailyRouteRemoteDataSource`: API calls for route lifecycle
- `DailyRouteLocalDataSource`: Isar for offline route/visit storage
- `VisitRemoteDataSource`: API calls for visit clock-in/out
- `VisitLocalDataSource`: Isar for offline visit state
- `GeofenceOverrideRemoteDataSource`: API for override requests

**Offline Behavior:**
1. **Activate Route Offline:**
   - Create local DailyRoute with `syncState = localOnly`
   - Create local OutletVisit rows from cached schedule
   - Queue `activateDailyRoute` sync operation
   - When online: sync returns server IDs, reconcile via EntityIdMap

2. **Clock-In Offline:**
   - Update local OutletVisit status to `inProgress`
   - Create local ClockInSession
   - Queue `visitClockIn` sync operation (dependsOn activateDailyRoute)
   - When online: sync returns visit server ID, update EntityIdMap

3. **Close Route Offline:**
   - Validate all visits have outcomes (completed/skipped)
   - Update local DailyRoute status to `closed`
   - Queue `closeDailyRoute` sync operation
   - When online: backend validates and confirms

### 2.3.1 Reconciliation Rules (Post-Sync)

**After `activateDailyRoute` sync succeeds:**
1. Backend returns `{ daily_route: {...}, outlet_visits: [...] }`
2. Upsert `DailyRoute.serverId` from response
3. For each returned `outlet_visit`:
   - Match local `OutletVisit` by `(outletId + routeDate + visitOrder)` OR `scheduleServerId` if present
   - Fill `OutletVisit.serverId` and `dailyRouteServerId`
   - Update `EntityIdMap` with `(outlet_visit, localId, serverId)` mapping
4. If no local route existed (online-first activation):
   - Create local `DailyRoute` + `OutletVisit` records directly from response
   - Mark `syncState = synced`

**After `visitClockIn` / `visitClockOut` sync succeeds:**
1. Update `OutletVisit.serverId` if returned
2. Update `EntityIdMap` mapping
3. Create `RouteEventModel` entry for audit trail

**After `closeDailyRoute` sync succeeds:**
1. Mark `DailyRoute.syncState = synced`
2. Create `RouteEventModel` entry (eventType = closed)

**Conflict Resolution:**
- If backend returns different `outlet_visits` than local (e.g., schedule changed):
  - Log discrepancy
  - Prefer backend as source of truth for `serverId` mappings
  - Local visits without backend match remain `localOnly` (potential orphans)

### 2.4 Presentation Layer

**Screens:**
- `TodaysRouteScreen`: Shows routeDate, status, OutletVisit list, progress (NEW)
- `ClockInScreen`: Select outlet from OutletVisit list OR ad-hoc search
- `ActiveSessionScreen`: Show current session, timer, clock-out button
- `ClockOutDialog`: Capture transport expense, route, order status
- `CloseRouteDialog`: Lists pending visits, requires skip reasons (NEW)
- `GeofenceOverrideDialog`: Request override when outside geofence (NEW)
- `SyncCenterScreen`: View pending/failed sync operations

**Providers:**
```dart
@riverpod
class DailyRouteController extends _$DailyRouteController {
  // Activate route for today
  // Check for ROUTE_BLOCKED (yesterday unclosed)
  // Close route with validation
}

@riverpod
Stream<DailyRoute?> activeDailyRoute(ref) {
  // Watch today's active route
}

@riverpod
Stream<List<OutletVisit>> todaysVisits(ref) {
  // Watch visits for active route
}

@riverpod
class ClockInController extends _$ClockInController {
  // Clock in via visit (outletVisitLocalId required)
  // Geofence validation with override flow
  // Exit confirmation tracking
}

@riverpod
Stream<ClockInSession?> activeClockInSession(ref) {
  // Watch active session (only one allowed)
}

@riverpod
FutureOr<ClockInValidation> validateClockIn(ref, String outletVisitLocalId) async {
  // Check: Route activated
  // Check: GPS accuracy <= 50m
  // Check: Within geofence (50m + 10m buffer) OR has approved override
  // Check: No other active session
  // Check: Visit not already completed/skipped
}

@riverpod
class GeofenceOverrideController extends _$GeofenceOverrideController {
  // Request override
  // Watch pending/approved/rejected status
}
```

**Widgets:**
- `RouteActivationCard` (shows activate CTA or blocked state)
- `VisitListTile` (visit status, tap to clock-in)
- `RouteProgressBar` (completed/total/skipped)
- `CloseRouteButton` (validates all visits have outcomes)
- `PendingVisitsSheet` (for close route - select skip reasons)
- `GeofenceOverrideCard` (request/status display)
- `ClockInButton` (with accuracy indicator + override option)
- `TimerWidget` (countdown with visual states)
- `GeofenceStatusWidget` (inside/outside/warning/override)
- `ClockOutForm`
- `SessionEventTimeline`

### 2.5 Acceptance Criteria (Testable)

**Route Lifecycle:**
1. ✅ If yesterday's route is unclosed on backend, today's activation returns `ROUTE_BLOCKED` error and mobile displays blocked state with "Close yesterday's route" action.
2. ✅ ROUTE_BLOCKED state shows:
   - Blocked route date and current status
   - "Close Yesterday's Route" action (if user can close their own)
   - "Request Supervisor Help" action (creates local flag/notification)
   - "Force Close" option (visible only if user has manager/supervisor role)
3. ✅ Route activation creates exactly one `DailyRoute` and N `OutletVisit` records locally.
4. ✅ Route cannot be closed unless ALL visits have outcomes (completed OR skipped with reason).
5. ✅ `CloseRouteDialog` shows pending visits and requires skip reason selection before submission.
6. ✅ Skip reasons are loaded from `SkipReasonCache`; reasons with `requiresNotes = true` enforce notes input.

**Offline-First:**
7. ✅ Mobile can work fully offline:
   - Activate route locally (from cached schedule)
   - Clock-in/out locally
   - Close route locally with skip reasons
   - Later sync produces exactly one `daily_route` and correct `outlet_visits` on backend (no duplicates)
8. ✅ When coming online after offline session, EntityIdMap is updated with all server IDs returned by sync operations.

**Idempotency:**
9. ✅ Visit clock-in/out requests are idempotent: replaying the same operation (same `clientOperationId`) does NOT create duplicates and returns same server IDs.
10. ✅ All sync operations include `Idempotency-Key` header matching `clientOperationId`.
11. ✅ `payloadHash` is included in request body for deduplication.

**Geofence Override:**
12. ✅ When outside geofence, user can request override via `GeofenceOverrideDialog`.
13. ✅ Override requests are created once per visit, deduped by clientOperationId.
14. ✅ Approved override allows clock-in even when outside geofence radius.
15. ✅ Override request status is tracked and displayed (pending/approved/rejected).

**Presence Computation:**
16. ✅ Presence status is COMPUTED from route/visit state, not stored.
17. ✅ Offline shows "offline status" indicator based on local route/visit state.

**Visit Lifecycle:**
18. ✅ Clock-in requires: (a) Route activated, (b) GPS accuracy ≤50m, (c) Within geofence OR approved override, (d) No other active session.
19. ✅ Clock-out records distance from outlet and clock-out reason.
20. ✅ Skip visit requires reason code selection.
21. ✅ Ad-hoc visits are created via `createAdHocVisit` operation with `visitType = adHoc`.

**Sync Dependencies:**
22. ✅ `visitClockIn` operation waits for `activateDailyRoute` to sync first.
23. ✅ `visitClockOut` operation waits for `visitClockIn` to sync first.
24. ✅ `closeDailyRoute` operation waits for all visit operations to sync first.

**Data Sync & Reconciliation:**
25. ✅ Skip reasons are fetched via `GET /api/v1/visits/skip-reasons` and cached in `SkipReasonCache`.
26. ✅ Location pings are rate-limited locally (≥60s apart, accuracy ≤200m) before queuing.
27. ✅ Route events are created locally and synced as audit trail.
28. ✅ Reconciliation after `activateDailyRoute` matches local `OutletVisit` by `(outletId + routeDate + visitOrder)` and fills server IDs.

**Entity Separation:**
29. ✅ `OutletVisitModel` is the canonical local mirror of backend `outlet_visits`.
30. ✅ `ClockInSession` is ephemeral runtime state derived from `OutletVisit` + geofence manager.
31. ✅ Only ONE active `ClockInSession` allowed at a time; it MUST reference `outletVisitLocalId`.

---

## Phase 3: Route Schedules, Outlet Management & Background Location Tracking

**Note:** Route activation/closing moved to Phase 2. Phase 3 focuses on:
- Viewing assigned visit schedules (each row = one outlet on one day)
- Outlet listing and search for ad-hoc visits
- Route history and reporting
- **Background location ping service (continuous tracking)**

### 3.0 Background Location Ping Service ✅ IMPLEMENTED

**Goal:** Track agent location continuously (whether clocked in or not) for fleet visibility, route optimization, and safety.

**Status:** ✅ Implemented with three-trigger strategy

---

#### Three-Trigger Sending Strategy

The service uses an intelligent three-trigger approach to balance accuracy, responsiveness, and battery efficiency:

| Trigger | Description | When it fires |
|---------|-------------|---------------|
| **A) Significant Change** | Main trigger - detects movement | Moved ≥ threshold **AND** accuracy good **AND** rate limit passed |
| **B) Heartbeat** | "Still here" ping for stationary users | Timer-based at regular intervals |
| **C) High-Precision Mode** | During active visits/navigation | Tighter thresholds, faster updates |

---

#### Tracking Modes

```dart
enum TrackingMode {
  normal,        // On-duty, clocked-in
  highPrecision, // Active visit or en-route
  lowPower,      // Off-duty or ultra-low usage
}
```

| Mode | Heartbeat | Distance Threshold | Accuracy Threshold | Min Interval |
|------|-----------|-------------------|-------------------|--------------|
| **Normal** | 5 min | 75m | ≤50m | 45s |
| **High-Precision** | 15s | 25m | ≤30m | 10s |
| **Low-Power** | 20 min | 150m | ≤100m | 120s |

---

#### How It Works

1. **Significant Change Monitoring (Trigger A)**
   - Polls location every 5-15 seconds (mode-dependent)
   - Compares against last sent location using Haversine formula
   - Only sends when user has moved beyond distance threshold
   - Prevents GPS jitter spam while catching real movement

2. **Heartbeat Timer (Trigger B)**
   - Sends "still here" pings at regular intervals
   - Ensures server knows user is still active even when stationary
   - Configurable per mode (5 min normal, 15s high-precision, 20 min low-power)

3. **High-Precision Mode (Trigger C)**
   - Activated when user enters an active visit or is navigating
   - 20-30m distance filter, 10-20s interval
   - Automatically returns to normal mode when visit ends

---

**API Endpoint:**
```
POST /api/v1/visits/location/ping
```

**Request Body:**
```json
{
  "latitude": -4.0436,
  "longitude": 39.6682,
  "accuracy_meters": 10.5,
  "altitude_meters": 50.0,
  "speed_mps": 2.5,
  "heading_degrees": 180,
  "battery_level": 85,
  "is_charging": false,
  "network_type": "wifi",
  "ping_source": "foreground",
  "recorded_at": "2026-01-29T10:30:00Z",
  "device_ping_id": "uuid-string"
}
```

**Success Response:**
```json
{
  "success": true,
  "ping_id": 123,
  "next_ping_seconds": 300,
  "server_time": "2026-01-29T10:30:05Z",
  "is_duplicate": false
}
```

**Files Created:**
```
lib/features/location_tracking/
├── location_tracking.dart           (barrel export)
├── domain/
│   ├── domain.dart
│   ├── entities/
│   │   └── location_ping.dart       ← Freezed entity
│   └── repositories/
│       └── location_ping_repository.dart
├── data/
│   ├── data.dart
│   ├── models/
│   │   └── location_ping_model.dart ← Isar collection
│   ├── datasources/
│   │   ├── location_ping_remote_datasource.dart
│   │   └── location_ping_local_datasource.dart
│   └── repositories/
│       └── location_ping_repository_impl.dart
├── services/
│   ├── services.dart
│   ├── location_ping_service.dart   ← Three-trigger service
│   └── location_ping_worker.dart    ← WorkManager background task
└── providers/
    └── location_ping_providers.dart
```

---

#### Service Implementation Highlights

```dart
class LocationPingService {
  // Mode-specific configuration
  
  // Normal mode (on-duty, clocked-in)
  static const int normalHeartbeatSeconds = 300;        // 5 minutes
  static const double normalDistanceMeters = 75.0;      // 50-100m range
  static const double normalAccuracyThreshold = 50.0;   // Good accuracy
  static const int normalMinIntervalSeconds = 45;       // ~30-60s rate limit
  
  // High-precision mode (active visit or en-route)
  static const int highPrecisionIntervalSeconds = 15;   // 10-20s
  static const double highPrecisionDistanceMeters = 25.0; // 20-30m
  static const double highPrecisionAccuracyThreshold = 30.0;
  static const int highPrecisionMinIntervalSeconds = 10;
  
  // Low-power mode (off-duty or ultra-low usage)
  static const int lowPowerHeartbeatSeconds = 1200;     // 20 minutes
  static const double lowPowerDistanceMeters = 150.0;   // Wider distance
  static const double lowPowerAccuracyThreshold = 100.0;
  static const int lowPowerMinIntervalSeconds = 120;

  /// Start foreground tracking with specified mode
  void startForegroundTracking({TrackingMode mode = TrackingMode.normal});
  
  /// Switch tracking mode (e.g., entering a visit)
  void setTrackingMode(TrackingMode mode);
  
  /// Enter high-precision mode (for active visits/navigation)
  void enterHighPrecisionMode();
  
  /// Exit high-precision mode, return to normal
  void exitHighPrecisionMode();
}
```

---

#### Provider Usage

```dart
// Start tracking (normal mode by default)
ref.read(locationPingControllerProvider.notifier).startTracking();

// When user starts a visit - switch to high-precision
ref.read(locationPingControllerProvider.notifier).enterHighPrecisionMode();

// When user ends a visit - return to normal
ref.read(locationPingControllerProvider.notifier).exitHighPrecisionMode();

// For off-duty users
ref.read(locationPingControllerProvider.notifier).enterLowPowerMode();

// Check current mode
final mode = ref.watch(currentTrackingModeProvider);
```

---

#### Background Task (WorkManager)

```dart
// Registers periodic task (minimum 15 minutes on Android)
Future<void> registerPeriodicLocationPing() async {
  await Workmanager().registerPeriodicTask(
    locationPingTaskUniqueName,
    locationPingTaskName,
    frequency: const Duration(minutes: 15),
    constraints: Constraints(
      networkType: NetworkType.connected,
      requiresBatteryNotLow: true,
    ),
    existingWorkPolicy: ExistingWorkPolicy.keep,
    backoffPolicy: BackoffPolicy.exponential,
    initialDelay: const Duration(minutes: 1),
  );
}
```

---

**Dependencies Added:**
```yaml
dependencies:
  workmanager: ^0.5.2        # Background tasks
  battery_plus: ^6.0.3       # Battery level info
```

**Rate Limiting Rules:**
1. **Minimum interval**: Mode-dependent (10s to 120s)
2. **Accuracy threshold**: Mode-dependent (30m to 100m for trigger, 200m global max)
3. **Distance threshold**: Mode-dependent (25m to 150m)
4. **Battery-aware**: Background task only runs when battery not low
5. **Network-aware**: Background task requires connectivity

**Offline Behavior:**
1. All pings saved locally first (Isar)
2. Attempt immediate send if online
3. When coming online, batch sync all pending pings
4. Deduplication via `device_ping_id` (UUID) prevents duplicate server records
5. Old synced pings cleaned up after 7 days

**Acceptance Criteria:**
1. ✅ Three-trigger strategy implemented (significant change, heartbeat, high-precision)
2. ✅ Normal mode: 75m distance filter, 5 min heartbeat, 50m accuracy threshold
3. ✅ High-precision mode: 25m distance filter, 15s heartbeat, 30m accuracy threshold
4. ✅ Low-power mode: 150m distance filter, 20 min heartbeat, 100m accuracy threshold
5. ✅ Pings include device context (battery, network, accuracy)
6. ✅ Haversine formula for accurate distance calculation
7. ✅ Offline pings are queued and synced when online
8. ✅ Mode switching API for visit start/end integration
9. ✅ Background task via WorkManager (15 min minimum on Android)
---

#### Integration with Visit Lifecycle

When a user clocks into a visit, switch to high-precision mode:

```dart
// In clock_in flow
void onClockInSuccess() {
  ref.read(locationPingControllerProvider.notifier).enterHighPrecisionMode();
}

// In clock_out flow
void onClockOutSuccess() {
  ref.read(locationPingControllerProvider.notifier).exitHighPrecisionMode();
}
```

---

#### TODO: App Lifecycle Integration

```dart
// In main.dart - integrate with app lifecycle
@override
void didChangeAppLifecycleState(AppLifecycleState state) {
  final controller = ref.read(locationPingControllerProvider.notifier);
  
  switch (state) {
    case AppLifecycleState.resumed:
      controller.startTracking();
      controller.syncPending(); // Sync any queued pings
      break;
    case AppLifecycleState.paused:
    case AppLifecycleState.inactive:
      controller.stopTracking();
      // Background task takes over
      break;
    // ...
  }
}
```

### 3.1 Domain Layer

**Entities:**
```dart
// Visit schedule row (direct mirror of backend outlet_visit_schedules)
// NOTE: Each row is one outlet on one day - NOT a "route template" object
// Group by dayOfWeek in UI to show "Monday's route", "Tuesday's route", etc.
@freezed
class VisitSchedule with _$VisitSchedule {
  factory VisitSchedule({
    required String serverId,              // outlet_visit_schedules.id
    required String salesAgentServerId,    // agent this schedule belongs to
    
    // Outlet info (denormalized for offline display)
    required String outletId,              // customer_id in backend
    required String outletCode,
    required String outletName,
    required double outletLatitude,
    required double outletLongitude,
    
    // Schedule details
    required int dayOfWeek,                // 0=Mon, 6=Sun
    DateTime? scheduledClockIn,            // Expected arrival time
    DateTime? scheduledClockOut,           // Expected departure time
    required int visitOrder,               // Sequence for the day
    required int visitPriority,            // 1=high, 2=medium, 3=low
    required int allocatedMinutes,         // Time budget
    
    // Validity period
    required DateTime effectiveFrom,
    DateTime? effectiveTo,                 // null = indefinite
    required bool isActive,
    
    DateTime? lastSyncedAt,
  }) = _VisitSchedule;
}

// Helper: Group schedules by day for UI
extension VisitScheduleListX on List<VisitSchedule> {
  Map<int, List<VisitSchedule>> groupByDayOfWeek() {
    final map = <int, List<VisitSchedule>>{};
    for (final schedule in this) {
      map.putIfAbsent(schedule.dayOfWeek, () => []).add(schedule);
    }
    // Sort each day's list by visitOrder
    for (final list in map.values) {
      list.sort((a, b) => a.visitOrder.compareTo(b.visitOrder));
    }
    return map;
  }
}

// Outlet for search/ad-hoc visits
@freezed
class Outlet with _$Outlet {
  factory Outlet({
    required String id,
    required String code,
    required String name,
    required String address,
    required double latitude,
    required double longitude,
    String? region,
    String? territory,
    @Default(true) bool isActive,
  }) = _Outlet;
}
```

**Use Cases:**
- `GetVisitSchedulesUseCase`: Fetch user's visit schedules (all days)
- `GetSchedulesForDayUseCase`: Get schedules for a specific dayOfWeek
- `GetTodaysSchedulesUseCase`: Get today's schedules (for activation)
- `SearchOutletsUseCase`: Search outlets for ad-hoc visits
- `GetRouteHistoryUseCase`: Past daily routes and visits
- `SyncVisitSchedulesUseCase`: Sync schedules from backend (`GET /api/v1/visits/schedules`)

**Repository Interface:**
```dart
abstract class VisitScheduleRepository {
  Future<Either<Failure, List<VisitSchedule>>> getSchedulesForAgent(String agentId);
  Future<Either<Failure, List<VisitSchedule>>> getSchedulesForDay(int dayOfWeek);
  Stream<List<VisitSchedule>> watchSchedulesForDay(int dayOfWeek);
  Future<Either<Failure, void>> syncSchedules();
}
```

### 3.2 Presentation Layer

**Screens:**
- `VisitScheduleListScreen`: Show schedules grouped by day of week
- `DayScheduleDetailScreen`: View outlets for a specific day on map
- `OutletSearchScreen`: Search outlets for ad-hoc visits
- `RouteHistoryScreen`: Past routes with completion stats
- `RouteHistoryDetailScreen`: Visits for a past route

---

## Phase 4: Stock Take Module (Consolidated)

### 4.1 Domain Layer

**Entities:**
```dart
// Unified storage: one table/collection for all stock take types
@freezed
class StockTakeEntry with _$StockTakeEntry {
  factory StockTakeEntry({
    required String id,
    required String sessionId,      // Link to ClockInSession
    required String outletId,       // Denormalized for queries
    required StockTakeType type,
    required String productId,
    required String productName,
    required String productCode,
    
    // Values (use based on type)
    int? valueInt,           // quantity, facingCount
    double? valueDouble,     // shelfSpaceCm, competitorSpaceCm
    String? valueText,       // shelfPosition, notes
    Map<String, dynamic>? metadata, // Additional type-specific data
    
    // Location & timestamp
    required DateTime recordedAt,
    double? latitude,
    double? longitude,
    @Default(false) bool synced,
    @Default(SyncState.localOnly) SyncState syncState,
  }) = _StockTakeEntry;
}

enum StockTakeType {
  stockCount,    // valueInt = quantity
  shelfShare,    // valueDouble = own space, metadata: competitor space
  facings,       // valueInt = count, valueText = position
}
```

**Use Cases:**
- `RecordStockTakeEntryUseCase`: Generic for all types
- `GetStockTakeHistoryUseCase`: Query by session/outlet/type
- `ScanBarcodeUseCase`
- `ValidateActiveSessionUseCase`: Require active clock-in

### 4.2 Presentation Layer

**Screens:**
- `StockTakeScreen`: Tabbed interface
  - Stock Count Tab
  - Shelf Share Tab  
  - Facings Tab
- Barcode scanner integration
- Session validation guard

**Benefits of Unified Model:**
- Single sync operation type
- Simplified daily summary queries
- Easier offline conflict resolution
- Consistent data structure

**Dependencies:**
- `mobile_scanner: ^5.1.1` (add)

---

## Phase 5: Orders Module

### 5.1 Domain Layer

**Entities:**
```dart
@freezed
class ProposedOrder with _$ProposedOrder {
  factory ProposedOrder({
    required String id,
    required String outletId,
    required String outletName,
    required List<OrderLine> items,
    required double totalAmount,
    required DateTime createdAt,
    @Default(false) bool convertedToSalesOrder,
    String? salesOrderId,
    @Default(false) bool synced,
  }) = _ProposedOrder;
}

@freezed
class SalesOrder with _$SalesOrder {
  factory SalesOrder({
    required String id,
    required String outletId,
    required String outletName,
    String? proposedOrderId,
    required List<OrderLine> items,
    required double totalAmount,
    required OrderType type,
    required DateTime createdAt,
    @Default(false) bool synced,
  }) = _SalesOrder;
}

enum OrderType {
  salesOrder,
  quotation,
}

@freezed
class OrderLine with _$OrderLine {
  factory OrderLine({
    required String productId,
    required String productName,
    required String productCode,
    required int quantity,
    required double unitPrice,
    required double totalPrice,
    double? discount,
  }) = _OrderLine;
}
```

**Use Cases:**
- `CreateProposedOrderUseCase`
- `ConvertToSalesOrderUseCase`
- `CreateSalesOrderUseCase`
- `GetOrdersUseCase`
- `SearchProductsUseCase`

### 5.2 Presentation Layer

**Screens:**
- `ProposedOrderListScreen`
- `CreateProposedOrderScreen`
- `SalesOrderListScreen`
- `CreateSalesOrderScreen`
- `OrderDetailScreen`

**Widgets:**
- `ProductSearchBar`
- `OrderLineItem`
- `OrderSummary`
- `ConvertToSalesOrderButton`

---

### 5.3 Pricing Strategy (Offline-First)

**Problem:** Order totals must match backend pricing

**Solution: Cached Price List**

```dart
class PriceCache {
  final Isar isar;
  
  // Sync price list from backend (ETag/delta updates)
  Future<void> syncPrices() async {
    final lastVersion = await getLocalPriceVersion();
    
    // Request only changed prices since last version
    final response = await api.getPrices(sinceVersion: lastVersion);
    
    if (response.hasUpdates) {
      await isar.writeTxn(() async {
        for (final price in response.prices) {
          await isar.priceCacheModels.put(price);
        }
      });
    }
  }
  
  // Get current price for product
  Future<double?> getPrice(String productId) async {
    final cached = await isar.priceCacheModels
      .filter()
      .productIdEqualTo(productId)
      .findFirst();
    
    if (cached != null && cached.expiresAt.isAfter(DateTime.now())) {
      return cached.unitPrice;
    }
    
    return null; // Expired or not found
  }
}
```

**Sync Flow:**
1. Price list synced daily (or on-demand)
2. Orders created with cached prices
3. Backend validates and returns corrected totals if mismatch
4. User sees "Price updated: old → new" notification
5. Order re-synced with correct totals

**Fallback:** If no cached price, show "Pending price lookup" and block order submission until price synced

---

## Phase 6: Remaining Features

### 6.1 Sales & Warranty
- Record sales transactions
- Register warranty
- Link to products
- Offline support

### 6.2 Complaints/After Sales

**Features:**
- Log complaints
- Photo attachments (multi-step sync)
- Issue tracking
- Follow-up status
- Offline support

**Attachment Sync Strategy (Two-Step):**

```dart
// Step 1: Create complaint (with attachments marked pending)
final complaintOp = SyncOperation(
  type: SyncOperationType.createComplaint,
  entityId: complaint.localId,
  priority: 3,
);

// Step 2: Upload attachments (depends on complaint creation)
for (final attachment in complaint.attachments) {
  final attachmentOp = SyncOperation(
    type: SyncOperationType.uploadAttachment,
    entityId: attachment.localId,
    dependsOn: [complaintOp.id], // Wait for complaint to sync first
    priority: 4, // Lower priority than complaint
  );
}
```

**Attachment Model:**
- `localPath`: File on device
- `remoteUrl`: Backend URL after upload
- `sha256`: File integrity check
- `status`: pending, uploading, uploaded, failed
- `mimeType`: image/jpeg, image/png, etc.
- `sizeBytes`: File size

**Sync Flow:**
1. User adds photos to complaint
2. Complaint saved locally with `syncState = localOnly`
3. Photos saved as `Attachment` records with `status = pending`
4. Sync queue creates complaint operation
5. After complaint syncs, attachment operations execute
6. Each photo uploaded with retry logic
7. Remote URLs stored in attachment records

**Dependencies:**
- ✅ `image_picker: ^1.0.7` (for selecting photos)
- `http: ^1.2.0` (for multipart file uploads)
- `path_provider: ^2.1.0` (for local file storage)

### 6.3 Daily Summary

**Local-First Computation (No Backend Required)**

**Repository:**
```dart
class DailySummaryRepository {
  final Isar isar;
  
  Future<DailySummary> buildDailySummary(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(Duration(days: 1));
    
    // Visited outlets (distinct)
    final visitedOutlets = await isar.clockInSessions
      .filter()
      .clockedInAtBetween(startOfDay, endOfDay)
      .distinctByOutletId()
      .findAll();
    
    // Orders placed
    final ordersCount = await isar.salesOrders
      .filter()
      .createdAtBetween(startOfDay, endOfDay)
      .count();
    
    // Stock counts by type
    final stockCountEntries = await isar.stockTakeEntries
      .filter()
      .typeEqualTo(StockTakeType.stockCount)
      .recordedAtBetween(startOfDay, endOfDay)
      .count();
      
    final shelfShareEntries = await isar.stockTakeEntries
      .filter()
      .typeEqualTo(StockTakeType.shelfShare)
      .recordedAtBetween(startOfDay, endOfDay)
      .count();
      
    final facingsEntries = await isar.stockTakeEntries
      .filter()
      .typeEqualTo(StockTakeType.facings)
      .recordedAtBetween(startOfDay, endOfDay)
      .count();
    
    // Time tracking
    final sessions = await isar.clockInSessions
      .filter()
      .clockedInAtBetween(startOfDay, endOfDay)
      .findAll();
    
    final totalMinutes = sessions.fold<int>(0, (sum, session) {
      if (session.clockedOutAt != null) {
        return sum + session.clockedOutAt!.difference(session.clockedInAt).inMinutes;
      }
      return sum;
    });
    
    // Sync status
    final pendingOps = await isar.syncOperations
      .filter()
      .not()
      .statusEqualTo(SyncStatus.synced)
      .count();
      
    final needsAttention = await isar.syncOperations
      .filter()
      .statusEqualTo(SyncStatus.needsAttention)
      .count();
    
    return DailySummary(
      date: date,
      outletsVisited: visitedOutlets.length,
      ordersPlaced: ordersCount,
      stockCountsRecorded: stockCountEntries,
      shelfSharesRecorded: shelfShareEntries,
      facingsRecorded: facingsEntries,
      totalTimeMinutes: totalMinutes,
      pendingSyncOperations: pendingOps,
      failedSyncOperations: needsAttention,
    );
  }
}
```

**Presentation:**
- Dashboard with charts and graphs
- Real-time sync status indicator
- Export functionality (PDF/CSV)
- Offline-capable (all data local)

---

## Phase 7: Quick Admin Actions (Mobile)

**STATUS: PLANNED**

**Goal:** Provide minimal, secure admin capabilities on mobile for Supervisors, Managers, and Admins without turning mobile into a full admin panel. Full admin management remains on web.

**Critical Rule:** ALL admin actions are **ONLINE-ONLY**. If offline, UI shows "Connect to internet to perform admin actions".

### 7.1 Roles & Permission Hierarchy

| Role | Scope | Capabilities |
|------|-------|--------------|
| Agent | Self only | Normal clock-in/out, stock take, orders |
| Supervisor | Team/Territory | + approveGeofenceOverride, closeRouteOnBehalf, viewTeamLiveMonitor, sendAgentNudge |
| Manager | Region | + forceCloseRoute, reassignVisit*, editVisitAllocatedMinutes* |
| Admin | Global | All capabilities, all agents |

*Phase 2 of Quick Admin

### 7.2 Domain Layer

**Entities (in-memory, not persisted to Isar):**

```dart
// Pending approval item - fetched from API, not stored locally
@freezed
class PendingApprovalItem with _$PendingApprovalItem {
  factory PendingApprovalItem({
    required String id,
    required ApprovalType type,
    required String requesterId,           // Agent who requested
    required String requesterName,
    required DateTime requestedAt,
    
    // For geofence override
    String? outletVisitServerId,
    String? outletName,
    double? distanceMeters,
    double? gpsAccuracy,
    double? latitude,
    double? longitude,
    String? overrideReason,
    
    // For route blocked resolution
    String? dailyRouteServerId,
    DateTime? routeDate,
    String? blockedReason,
  }) = _PendingApprovalItem;
}

enum ApprovalType {
  geofenceOverride,
  routeBlockedResolution,
}

// Team agent status - fetched from API, short TTL cache
@freezed
class TeamAgentStatus with _$TeamAgentStatus {
  factory TeamAgentStatus({
    required String agentId,
    required String agentName,
    required AgentPresenceStatus status,
    String? currentOutletName,
    String? currentOutletId,
    DateTime? lastPingAt,
    double? lastPingAccuracy,
    double? lastLatitude,
    double? lastLongitude,
    int? routeCompletedCount,
    int? routeTotalCount,
    int? routeSkippedCount,
    bool? hasActiveSession,
    bool? isRouteBlocked,
  }) = _TeamAgentStatus;
}

enum AgentPresenceStatus {
  activeVisit,      // Currently clocked in
  onRoute,          // Route active but between visits
  routeNotStarted,  // Has schedule but not activated
  routeCompleted,   // All visits done
  routeBlocked,     // Yesterday's route unclosed
  offline,          // No recent pings
}

// Admin action result
@freezed
class AdminActionResult with _$AdminActionResult {
  factory AdminActionResult.success({
    required String message,
    String? auditEventId,
  }) = AdminActionSuccess;
  
  factory AdminActionResult.failure({
    required String errorCode,
    required String message,
  }) = AdminActionFailure;
}

// Route detail for admin viewing (read-only)
@freezed
class AdminRouteDetail with _$AdminRouteDetail {
  factory AdminRouteDetail({
    required String routeId,
    required String agentId,
    required String agentName,
    required DateTime routeDate,
    required String status,             // pending, activated, inProgress, closed, forceClosed
    DateTime? activatedAt,
    DateTime? closedAt,
    String? closedByUserId,
    bool? forceClosed,
    String? forceCloseReason,
    required int totalVisits,
    required int completedCount,
    required int skippedCount,
    required int inProgressCount,
    required int pendingCount,
    required List<AdminVisitSummary> visits,
    List<PendingApprovalItem>? pendingOverrides,
  }) = _AdminRouteDetail;
}

// Visit summary within route detail
@freezed
class AdminVisitSummary with _$AdminVisitSummary {
  factory AdminVisitSummary({
    required String visitId,
    required String outletId,
    required String outletName,
    required String outletCode,
    required int visitOrder,
    required String status,             // pending, inProgress, completed, skipped
    required int allocatedMinutes,
    DateTime? actualClockIn,
    DateTime? actualClockOut,
    String? skipReasonCode,
    bool? geofenceOverrideUsed,
  }) = _AdminVisitSummary;
}

// Full visit detail for admin viewing (read-only)
@freezed
class AdminVisitDetail with _$AdminVisitDetail {
  factory AdminVisitDetail({
    required String visitId,
    required String routeId,
    required String agentId,
    required String agentName,
    required DateTime routeDate,
    
    // Outlet info
    required String outletId,
    required String outletName,
    required String outletCode,
    required double outletLatitude,
    required double outletLongitude,
    
    // Schedule
    required int visitOrder,
    required int allocatedMinutes,
    DateTime? scheduledClockIn,
    DateTime? scheduledClockOut,
    
    // Actual visit
    required String status,
    DateTime? actualClockIn,
    DateTime? actualClockOut,
    int? actualDurationMinutes,
    
    // Clock-in location
    double? clockInLatitude,
    double? clockInLongitude,
    double? clockInAccuracy,
    double? clockInDistanceMeters,
    
    // Clock-out location
    double? clockOutLatitude,
    double? clockOutLongitude,
    double? clockOutAccuracy,
    double? clockOutDistanceMeters,
    
    // Skip details
    String? skipReasonCode,
    String? skipReasonName,
    String? skipNotes,
    
    // Geofence override
    bool? geofenceOverrideUsed,
    String? overrideRequestId,
    String? overrideStatus,
    String? overrideApprovedByName,
    DateTime? overrideApprovedAt,
    String? overrideReason,
    
    // Clock-out details
    double? transportExpense,
    String? routeCovered,
    bool? hasOrder,
    String? clockOutReason,
  }) = _AdminVisitDetail;
}
```

**Use Cases:**

```dart
// Approvals
class GetPendingApprovalsUseCase { /* GET /api/v1/admin/approvals */ }
class ApproveGeofenceOverrideUseCase { /* POST /api/v1/admin/overrides/{id}/approve */ }
class RejectGeofenceOverrideUseCase { /* POST /api/v1/admin/overrides/{id}/reject */ }

// Route blocked resolution
class GetBlockedRoutesInScopeUseCase { /* GET /api/v1/admin/routes/blocked */ }
class CloseRouteOnBehalfUseCase { /* POST /api/v1/admin/routes/{id}/close-on-behalf */ }
class ForceCloseRouteUseCase { /* POST /api/v1/admin/routes/{id}/force-close */ }
class SendAgentNudgeUseCase { /* POST /api/v1/admin/notify/agent */ }

// Team monitoring
class GetTeamLiveStatusUseCase { /* GET /api/v1/admin/team/live-status */ }

// Route/Visit detail viewing (read-only, Supervisor+)
class GetAgentRouteDetailUseCase { /* GET /api/v1/admin/agents/{agent_id}/routes/today */ }
class GetRouteDetailUseCase { /* GET /api/v1/admin/routes/{route_id} */ }
class GetVisitDetailUseCase { /* GET /api/v1/admin/visits/{visit_id} */ }

// Phase 2 (optional)
class ReassignVisitUseCase { /* POST /api/v1/admin/visits/{id}/reassign */ }
class EditVisitAllocatedMinutesUseCase { /* PATCH /api/v1/admin/visits/{id}/allocated-minutes */ }
```

**Repository Interface:**

```dart
abstract class AdminRepository {
  // Approvals
  Future<Either<Failure, List<PendingApprovalItem>>> getPendingApprovals({
    required ApprovalType? type,
  });
  
  Future<Either<Failure, AdminActionResult>> approveGeofenceOverride({
    required String overrideId,
    required String notes,
    required String clientOperationId,
  });
  
  Future<Either<Failure, AdminActionResult>> rejectGeofenceOverride({
    required String overrideId,
    required String notes,
    required String clientOperationId,
  });
  
  // Route blocked
  Future<Either<Failure, List<PendingApprovalItem>>> getBlockedRoutesInScope();
  
  Future<Either<Failure, AdminActionResult>> closeRouteOnBehalf({
    required String routeId,
    required String notes,
    required String clientOperationId,
  });
  
  Future<Either<Failure, AdminActionResult>> forceCloseRoute({
    required String routeId,
    required String reason,
    required String clientOperationId,
  });
  
  Future<Either<Failure, void>> sendAgentNudge({
    required String agentId,
    required String message,
  });
  
  // Team monitor
  Future<Either<Failure, List<TeamAgentStatus>>> getTeamLiveStatus();
  
  // Route/Visit detail viewing (read-only)
  Future<Either<Failure, AdminRouteDetail>> getAgentRouteForDate({
    required String agentId,
    required DateTime date,
  });
  
  Future<Either<Failure, AdminRouteDetail>> getRouteDetail({
    required String routeId,
  });
  
  Future<Either<Failure, AdminVisitDetail>> getVisitDetail({
    required String visitId,
  });
}
```

### 7.3 Data Layer

**Remote Data Source (Online-Only):**

```dart
class AdminRemoteDataSource {
  final Dio dio;
  
  // All methods throw NetworkException if offline
  // All methods include Idempotency-Key header for mutations
  
  // Approvals
  Future<List<PendingApprovalItem>> getPendingApprovals(ApprovalType? type);
  Future<AdminActionResult> approveOverride(String id, String notes, String idempotencyKey);
  Future<AdminActionResult> rejectOverride(String id, String notes, String idempotencyKey);
  
  // Blocked routes
  Future<List<PendingApprovalItem>> getBlockedRoutes();
  Future<AdminActionResult> closeOnBehalf(String routeId, String notes, String idempotencyKey);
  Future<AdminActionResult> forceClose(String routeId, String reason, String idempotencyKey);
  Future<void> sendNudge(String agentId, String message);
  
  // Team monitor
  Future<List<TeamAgentStatus>> getTeamLiveStatus();
  
  // Route/Visit detail viewing (read-only)
  Future<AdminRouteDetail> getAgentRouteForDate(String agentId, DateTime date);
  Future<AdminRouteDetail> getRouteDetail(String routeId);
  Future<AdminVisitDetail> getVisitDetail(String visitId);
}
```

**No Local Data Source** - Admin data is not cached in Isar. Use in-memory state only.

### 7.4 Presentation Layer

**Files to Create:**
```
lib/features/admin/
├── domain/
│   ├── entities/
│   │   ├── pending_approval_item.dart
│   │   ├── team_agent_status.dart
│   │   ├── admin_action_result.dart
│   │   ├── admin_route_detail.dart
│   │   └── admin_visit_detail.dart
│   ├── repositories/
│   │   └── admin_repository.dart
│   └── usecases/
│       ├── get_pending_approvals_usecase.dart
│       ├── approve_geofence_override_usecase.dart
│       ├── get_agent_route_detail_usecase.dart
│       ├── get_visit_detail_usecase.dart
│       └── ... (other use cases)
├── data/
│   ├── datasources/
│   │   └── admin_remote_datasource.dart
│   └── repositories/
│       └── admin_repository_impl.dart
└── presentation/
    ├── screens/
    │   ├── admin_hub_screen.dart
    │   ├── approvals_inbox_screen.dart
    │   ├── approval_detail_screen.dart
    │   ├── team_monitor_screen.dart
    │   ├── blocked_routes_screen.dart
    │   ├── agent_route_detail_screen.dart
    │   └── visit_detail_screen.dart
    ├── widgets/
    │   ├── approval_card.dart
    │   ├── agent_status_tile.dart
    │   ├── route_admin_actions_sheet.dart
    │   ├── visit_admin_actions_sheet.dart
    │   ├── visit_status_chip.dart
    │   ├── override_map_preview.dart
    │   └── online_only_guard.dart
    └── providers/
        ├── admin_providers.dart
        ├── approvals_controller.dart
        ├── team_monitor_controller.dart
        ├── route_detail_controller.dart
        └── admin_route_actions_controller.dart
```

**Screens:**

| Screen | Access | Description |
|--------|--------|-------------|
| `AdminHubScreen` | Supervisor+ | Entry point showing pending counts, quick actions |
| `ApprovalsInboxScreen` | approveGeofenceOverride | List of pending geofence overrides |
| `ApprovalDetailScreen` | approveGeofenceOverride | Override details + map + approve/reject buttons |
| `TeamMonitorScreen` | viewTeamLiveMonitor | List/map of team agents with live status |
| `BlockedRoutesScreen` | resolveRouteBlocked | Agents with blocked routes in scope |
| `AgentRouteDetailScreen` | viewTeamLiveMonitor | Agent's route with visit list + status chips (read-only + actions) |
| `VisitDetailScreen` | viewTeamLiveMonitor | Full visit details: times, locations, override info (read-only + actions) |

**Widgets:**

- `OnlineOnlyGuard`: Wraps admin screens, shows offline message if no connectivity
- `ApprovalCard`: Summary of pending approval with quick actions
- `AgentStatusTile`: Agent name, status badge, last ping, route progress (tap → route detail)
- `RouteAdminActionsSheet`: Bottom sheet with Close On Behalf / Force Close options
- `VisitAdminActionsSheet`: Bottom sheet with Reassign / Edit Minutes (Phase 2)
- `VisitStatusChip`: Colored chip showing pending/inProgress/completed/skipped
- `VisitListTile`: Visit summary row with status chip, times, tap → visit detail
- `OverrideMapPreview`: Mini map showing outlet location vs agent location at request time
- `LocationAccuracyBadge`: Shows GPS accuracy with color coding (green/yellow/red)

**Providers:**

```dart
@riverpod
class ApprovalsController extends _$ApprovalsController {
  Future<void> loadPendingApprovals();
  Future<AdminActionResult> approveOverride(String id, String notes);
  Future<AdminActionResult> rejectOverride(String id, String notes);
}

@riverpod
class TeamMonitorController extends _$TeamMonitorController {
  Future<void> loadTeamStatus();
  void startAutoRefresh(Duration interval); // 30s default
  void stopAutoRefresh();
}

@riverpod
class AdminRouteActionsController extends _$AdminRouteActionsController {
  Future<AdminActionResult> closeOnBehalf(String routeId, String notes);
  Future<AdminActionResult> forceClose(String routeId, String reason);
  Future<void> sendNudge(String agentId);
}

@riverpod
class RouteDetailController extends _$RouteDetailController {
  Future<void> loadRouteDetail(String routeId);
  Future<void> loadAgentRouteForDate(String agentId, DateTime date);
  Future<void> loadVisitDetail(String visitId);
  // State holds AdminRouteDetail or AdminVisitDetail
}

// Permission-gated providers
@riverpod
bool canApproveOverrides(ref) {
  final permissions = ref.watch(userPermissionsProvider);
  return permissions.contains(FeaturePermission.approveGeofenceOverride);
}

@riverpod
bool canForceClose(ref) {
  final permissions = ref.watch(userPermissionsProvider);
  return permissions.contains(FeaturePermission.forceCloseRoute);
}
```

### 7.5 Navigation & UI Gating

**Add to main navigation (Supervisor+ only):**
```dart
// In home screen or app drawer
if (ref.watch(canAccessAdminHubProvider)) {
  ListTile(
    leading: Icon(Icons.admin_panel_settings),
    title: Text('Quick Admin'),
    trailing: ref.watch(pendingApprovalsCountProvider).when(
      data: (count) => count > 0 ? Badge(label: Text('$count')) : null,
      loading: () => null,
      error: (_, __) => null,
    ),
    onTap: () => context.push('/admin'),
  );
}
```

**Route definitions:**
```dart
GoRoute(
  path: '/admin',
  builder: (context, state) => const AdminHubScreen(),
  redirect: (context, state) {
    if (!ref.read(canAccessAdminHubProvider)) return '/home';
    return null;
  },
  routes: [
    GoRoute(path: 'approvals', builder: (_, __) => ApprovalsInboxScreen()),
    GoRoute(path: 'approvals/:id', builder: (_, state) => ApprovalDetailScreen(id: state.pathParameters['id']!)),
    GoRoute(path: 'team', builder: (_, __) => TeamMonitorScreen()),
    GoRoute(path: 'blocked-routes', builder: (_, __) => BlockedRoutesScreen()),
    // Route/Visit detail viewing
    GoRoute(path: 'agents/:agentId/route', builder: (_, state) => AgentRouteDetailScreen(
      agentId: state.pathParameters['agentId']!,
      date: state.uri.queryParameters['date'] != null 
        ? DateTime.parse(state.uri.queryParameters['date']!) 
        : DateTime.now(),
    )),
    GoRoute(path: 'routes/:routeId', builder: (_, state) => AgentRouteDetailScreen(
      routeId: state.pathParameters['routeId']!,
    )),
    GoRoute(path: 'visits/:visitId', builder: (_, state) => VisitDetailScreen(
      visitId: state.pathParameters['visitId']!,
    )),
  ],
),
```

### 7.6 Online-Only Enforcement Rules

**Critical Rule:** Admin state-changing actions are **ONLINE-ONLY, IMMEDIATE**.

**What this means:**
1. **State-changing actions** (approve, reject, close, force-close, reassign, edit) = **online-only, immediate API call**
2. **Audit trail** = **server-written source of truth** (server creates audit record)
3. Mobile may optionally write a **local mirrored audit record AFTER success**, but **NEVER queue state changes**
4. **No SyncOperation** for: approvals, close-on-behalf, force-close, reassign, edit-minutes

**Prohibited:**
```dart
// ❌ NEVER DO THIS - no queueing admin actions
syncQueue.add(SyncOperation(
  type: SyncOperationType.approveOverride, // NO!
  ...
));
```

**Correct pattern:**
```dart
// ✅ CORRECT - immediate online call, fail if offline
Future<AdminActionResult> approveOverride(String id, String notes) async {
  // 1. Check connectivity first
  if (!await connectivity.isOnline) {
    return AdminActionResult.failure(
      errorCode: 'OFFLINE',
      message: 'Connect to internet to perform admin actions',
    );
  }
  
  // 2. Execute immediately with await
  final result = await adminApi.approveOverride(
    id: id,
    notes: notes,
    idempotencyKey: uuid.v4(),
  );
  
  // 3. Optionally mirror audit locally (already on server)
  if (result.isSuccess) {
    await localAuditMirror.write(AdminAuditMirror(
      eventId: result.auditEventId,
      action: 'override_approved',
      timestamp: DateTime.now(),
      syncState: SyncState.synced, // Already on server
    ));
  }
  
  return result;
}
```

```dart
// OnlineOnlyGuard widget
class OnlineOnlyGuard extends ConsumerWidget {
  final Widget child;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnline = ref.watch(isOnlineProvider);
    
    if (!isOnline) {
      return Scaffold(
        appBar: AppBar(title: Text('Admin Actions')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.cloud_off, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text('Connect to internet to perform admin actions'),
              SizedBox(height: 8),
              Text('Your normal agent workflow is still available offline.'),
            ],
          ),
        ),
      );
    }
    
    return child;
  }
}
```

**Admin API calls:**
- Do NOT queue in SyncQueue
- Execute immediately with await
- Return success/failure directly to UI
- Audit events ARE created server-side (not queued locally)

**Exception:** If we want local audit backup:
- Create local RouteEventModel AFTER successful API call (not before)
- Mark as `syncState = synced` immediately (audit already on server)

### 7.7 Audit Trail Requirements

Every admin action creates audit records with:

```dart
// Server creates these, mobile receives confirmation
@freezed
class AdminAuditEvent with _$AdminAuditEvent {
  factory AdminAuditEvent({
    required String id,
    required String eventType,           // 'override_approved', 'route_force_closed', etc.
    required String actorId,
    required String actorRole,
    required String targetEntityType,    // 'geofence_override', 'daily_route', etc.
    required String targetEntityId,
    required String? targetAgentId,
    required Map<String, dynamic> metadata, // previousState, newState, reason, notes
    required DateTime deviceTime,
    required DateTime serverTime,
  }) = _AdminAuditEvent;
}
```

**Metadata includes:**
- `previousState`: State before action (e.g., "pending", "inProgress")
- `newState`: State after action (e.g., "approved", "closed")
- `reason` / `notes`: Required user input
- `distanceMeters`, `gpsAccuracy` (for overrides)
- `routeDate`, `completedCount`, `skippedCount` (for route closes)

### 7.8 Backend Endpoints (API Contract Additions)

**Add to Backend Development section:**

```yaml
# Quick Admin API Endpoints (Mobile)

# Approvals
GET /api/v1/admin/approvals:
  query: type=override|route_blocked, status=pending
  response: List<PendingApprovalItem>
  auth: approveGeofenceOverride OR resolveRouteBlocked
  scope: filtered by caller's admin scope

POST /api/v1/admin/overrides/{override_id}/approve:
  body: { notes: string }
  headers: Idempotency-Key
  auth: approveGeofenceOverride
  response: { success: bool, auditEventId: string }

POST /api/v1/admin/overrides/{override_id}/reject:
  body: { notes: string }
  headers: Idempotency-Key
  auth: approveGeofenceOverride
  response: { success: bool, auditEventId: string }

# Route Blocked Resolution
GET /api/v1/admin/routes/blocked:
  response: List<BlockedRouteItem>
  auth: resolveRouteBlocked
  scope: filtered by caller's admin scope

POST /api/v1/admin/routes/{route_id}/close-on-behalf:
  body: { notes: string }
  headers: Idempotency-Key
  auth: closeRouteOnBehalf
  response: { success: bool, auditEventId: string }

POST /api/v1/admin/routes/{route_id}/force-close:
  body: { reason: string }
  headers: Idempotency-Key
  auth: forceCloseRoute
  response: { success: bool, auditEventId: string }

# Agent Nudge
POST /api/v1/admin/notify/agent:
  body: { agentId: string, message: string, type: 'close_route_reminder' }
  auth: sendAgentNudge
  response: { sent: bool }

# Team Monitor
GET /api/v1/admin/team/live-status:
  response: List<TeamAgentStatus>
  auth: viewTeamLiveMonitor
  scope: filtered by caller's admin scope

# Route/Visit Detail Viewing (read-only)
GET /api/v1/admin/agents/{agent_id}/routes/today:
  query: date=YYYY-MM-DD (optional, defaults to today)
  response: AdminRouteDetail (with visits list)
  auth: viewTeamLiveMonitor
  scope: agent must be in caller's scope

GET /api/v1/admin/routes/{route_id}:
  response: AdminRouteDetail (with visits list + pending overrides)
  auth: viewTeamLiveMonitor
  scope: route's agent must be in caller's scope

GET /api/v1/admin/visits/{visit_id}:
  response: AdminVisitDetail (full visit info including override details)
  auth: viewTeamLiveMonitor
  scope: visit's agent must be in caller's scope

# Scope
GET /api/v1/admin/my-scope:
  response: AdminScope
  auth: any authenticated user

# Phase 2 (Optional)
POST /api/v1/admin/visits/{visit_id}/reassign:
  body: { newAgentId: string, reason: string }
  headers: Idempotency-Key
  auth: reassignVisit

PATCH /api/v1/admin/visits/{visit_id}/allocated-minutes:
  body: { allocatedMinutes: int, reason: string }
  headers: Idempotency-Key
  auth: editVisitAllocatedMinutes
```

### 7.9 Acceptance Criteria (Testable)

**Permission Gating:**
1. ✅ User without `approveGeofenceOverride` permission cannot see Approvals Inbox or approve buttons.
2. ✅ User without `forceCloseRoute` permission sees "Close On Behalf" but not "Force Close" option.
3. ✅ Admin Hub is hidden from navigation for users with Agent role only.
4. ✅ Scope filtering: Supervisor only sees their team's pending items, not other teams.

**Online-Only Enforcement:**
5. ✅ All admin screens show "Connect to internet" message when offline.
6. ✅ Normal agent workflow (clock-in/out, stock take) works offline even when admin features blocked.
7. ✅ Admin action buttons are disabled with loading state during API call.

**Geofence Override Approval:**
8. ✅ Approval detail shows: agent name, outlet, distance from outlet, GPS accuracy, timestamp, reason, map preview.
9. ✅ Approve/Reject requires non-empty notes field.
10. ✅ After approval, override status updates and agent can clock in within 2 seconds on good network.
11. ✅ Approval creates audit event with actorId, actorRole, previousState, newState, notes.

**Route Blocked Resolution:**
12. ✅ Blocked routes screen shows agents with unclosed yesterday routes in scope.
13. ✅ "Close On Behalf" requires notes; route status updates to `closed`.
14. ✅ "Force Close" requires reason; route status updates to `forceClosed`.
15. ✅ After resolution, blocked agent can activate today's route.
16. ✅ "Send Nudge" creates notification for agent without changing route state.

**Team Monitor:**
17. ✅ Shows real-time status of all agents in scope (refreshes every 30s or manual).
18. ✅ Each agent shows: name, status badge, current outlet (if active), last ping time, route progress.
19. ✅ Tapping agent opens `AgentRouteDetailScreen` showing their route.

**Route/Visit Detail Viewing:**
20. ✅ `AgentRouteDetailScreen` shows: route date, status, progress bar, list of visits with status chips.
21. ✅ Each visit in list shows: outlet name, visit order, status chip (pending/inProgress/completed/skipped), clock times.
22. ✅ Tapping a visit opens `VisitDetailScreen` with full details.
23. ✅ `VisitDetailScreen` shows: outlet info, schedule times, actual times, location accuracy, distance, skip reason (if any), override info (if used).
24. ✅ Admin actions (close on behalf, force close) available from route detail if permitted.
25. ✅ Pending override requests shown on route detail with approve/reject actions if permitted.

**Audit Trail:**
26. ✅ Every admin action logged with: actorId, actorRole, targetId, timestamp, previousState, newState, notes/reason.
27. ✅ Audit events visible in backend admin panel (not on mobile).

**Online-Only Enforcement:**
28. ✅ Admin state-changing actions execute immediately online (no SyncQueue).
29. ✅ Audit trail is server-written source of truth.
30. ✅ Local audit mirror (optional) only written AFTER successful API call, marked as `synced`.

### 7.10 Out of Scope on Mobile

**These remain Web Admin only:**
- ❌ Creating/editing user accounts
- ❌ Assigning roles or permissions
- ❌ Creating/editing route schedules (outlet_visit_schedules)
- ❌ Creating/editing outlets/customers
- ❌ Bulk operations (mass reassign, bulk close)
- ❌ Report generation and analytics dashboards
- ❌ System configuration and settings
- ❌ Audit log viewer (admins view on web)
- ❌ Territory/region management
- ❌ Price list management
- ❌ Product catalog management

**Phase 2 of Quick Admin (future):**
- ⏳ Reassign visit to another agent
- ⏳ Edit visit allocated minutes
- ⏳ Map view in team monitor
- ⏳ Push notification to specific agent

---

## Backend Development (Parallel)

### Approach
- Mobile app development proceeds with **mock data** and **offline-first** architecture
- Backend API being developed simultaneously
- API contracts defined collaboratively as features are built
- Local storage ensures app functionality independent of backend status

### API Contract Definition Process
1. Define required endpoints for each feature
2. Create request/response models
3. Implement with mock data in mobile app
4. Backend team implements actual endpoints
5. Replace mock data sources with real API calls
6. Test integration

### Mock Data Strategy
- Use factory constructors for test data
- Repository pattern allows easy swapping of data sources
- Feature flags to toggle mock vs real API

```dart
// Example: Toggle between mock and real data
final useMockData = AppConfig.environment == Environment.dev;

final clockInDataSource = useMockData 
    ? MockClockInRemoteDataSource()
    : ClockInRemoteDataSource(dio);
```

---

## Testing Strategy

### Unit Tests
- Domain layer (use cases with mocked repositories)
- Data layer (repositories, data sources)
- Utilities and services
- **Geofence validation logic** (accuracy gating, exit confirmation)
- **Sync queue dependency resolution**
- **Retry backoff calculations**
- **Permission gating logic** (admin feature access)
- **Scope filtering** (admin sees only in-scope agents)

### Widget Tests
- Individual widgets
- Screen layouts
- User interactions
- Geofence status indicators
- Accuracy warnings
- **OnlineOnlyGuard widget** (offline state display)
- **Admin action buttons** (permission-based visibility)

### Integration Tests
- End-to-end flows
- **Offline sync scenarios** (including dependency chains)
- **GPS tracking accuracy** (mocked location updates)
- **Exit confirmation logic** (2 readings, 3-minute duration)
- **Auto clock-out sequence** (4 notifications)
- **Re-entry cancellation**
- **One active session enforcement**
- **Admin approval flow** (mock API, verify state changes)
- **Online-only enforcement** (admin blocked offline, agent works)

### Manual Testing
- Real device testing
- **GPS accuracy (50m geofence validation)**
- **Battery consumption (2-min normal, 30s outside mode)**
- Background sync with exponential backoff
- **Notification delivery (4 strategic alerts)**
- **Geofence exit/re-entry behavior in real conditions**
- Urban/indoor GPS drift scenarios
- **Sync Center UI** (pending, failed, retry operations)
- **Quick Admin flows** (approval, force close, team monitor)

---

## Deployment Checklist

### Pre-Launch
- [ ] All features implemented
- [ ] Unit tests passing (80%+ coverage)
- [ ] Integration tests passing
- [ ] Performance profiling
- [ ] Battery optimization verified
- [ ] Offline sync tested thoroughly
- [ ] GPS accuracy validated
- [ ] Role permissions tested
- [ ] Notification delivery verified

### Launch
- [ ] Backend API ready
- [ ] App store assets prepared
- [ ] User documentation
- [ ] Training materials
- [ ] Support channels ready

### Post-Launch
- [ ] Monitor crash reports
- [ ] Track sync success rates
- [ ] Analyze GPS accuracy
- [ ] User feedback collection
- [ ] Performance metrics

---

## Appendix A: Backend API Reference

> **Base URL**: `/api/v1/visits`  
> **Authentication**: All endpoints require a valid JWT Bearer token in the `Authorization` header.

This section documents the complete Outlet Visits API that the mobile app will consume.

### A.1 API Overview

The API manages the complete visit workflow for sales agents:

| Component | Purpose |
|-----------|---------|
| **Schedules** | Weekly recurring schedules defining when agents should visit customers |
| **Routes** | Daily routes generated from schedules that agents activate each day |
| **Visits** | Individual outlet visits with clock-in/clock-out functionality |
| **Geofence** | GPS-based location verification with override requests |
| **Tracking** | Real-time location tracking and agent status monitoring |
| **Reports** | Analytics and compliance reporting |

**Typical Agent Workflow:**
```
1. Admin creates weekly schedules for agents
2. Agent activates their route at the start of the day
3. Agent travels to each outlet and clocks in (GPS verified)
4. Agent completes their work and clocks out
5. Agent closes the route at end of day
6. Managers view reports and dashboards
```

### A.2 Authentication & Permissions

All requests must include a valid JWT token:
```http
Authorization: Bearer <your_jwt_token>
```

**Permission Reference:**

| Permission | Description | Roles |
|------------|-------------|-------|
| `visit:schedule:list` | View schedules | Agent, Supervisor+ |
| `visit:schedule:create` | Create schedules | Admin |
| `visit:schedule:update` | Update schedules | Admin |
| `visit:schedule:delete` | Delete schedules | Admin |
| `visit:route:activate` | Activate daily route | Agent |
| `visit:route:view` | View routes | Agent, Supervisor+ |
| `visit:route:close` | Close own route | Agent |
| `visit:route:force-close` | Force-close any route | Supervisor+ |
| `visit:clock` | Clock in/out of visits | Agent |
| `visit:skip` | Skip visits | Agent |
| `visit:adhoc:create` | Add ad-hoc visits | Agent |
| `visit:geofence:request` | Request override | Agent |
| `visit:geofence:list-pending` | View pending overrides | Supervisor+ |
| `visit:geofence:approve` | Approve overrides | Supervisor+ |
| `visit:geofence:reject` | Reject overrides | Supervisor+ |
| `visit:location:ping` | Send location pings | Agent |
| `visit:location:history` | View location trail | Supervisor+ |
| `visit:tracking:subordinates` | View subordinate status | Supervisor+ |
| `visit:report:own` | View own reports | Agent |
| `visit:report:team` | View team reports | Supervisor+ |
| `visit:report:all` | View all reports | Admin |
| `visit:skip-reason:manage` | Manage skip reasons | Admin |

### A.3 Enums & Constants

**Route Status:**
| Value | Description | Mobile Handling |
|-------|-------------|-----------------|
| `pending` | Route created but not yet activated | Show "Activate Route" CTA |
| `activated` | Route activated, no visits started | Show visit list, ready to start |
| `in_progress` | At least one visit started | Normal workflow |
| `closed` | Route closed normally by agent | Show summary, no actions |
| `force_closed` | Route force-closed by supervisor | Show with force_close_reason |

**Visit Status:**
| Value | Description | Mobile Handling |
|-------|-------------|-----------------|
| `pending` | Visit not yet started | Show clock-in button |
| `in_progress` | Agent currently at outlet | Show clock-out button, timer |
| `completed` | Visit finished successfully | Green check, show duration |
| `skipped` | Visit skipped with reason | Gray, show skip reason |

**Visit Type:**
| Value | Description |
|-------|-------------|
| `scheduled` | Created from weekly schedule |
| `ad_hoc` | Added manually during route |

**Visit Priority:**
| Value | Description | UI Treatment |
|-------|-------------|--------------|
| `1` | Must visit (highest priority) | Red indicator, cannot skip easily |
| `2` | Important | Orange indicator |
| `3` | Flexible (can skip if needed) | No special indicator |

**Agent Presence Status (for Team Monitor):**
| Value | Description | UI Color |
|-------|-------------|----------|
| `absent` | No route activated today | Gray |
| `active` | Route active, not at outlet | Blue |
| `at_outlet` | Currently clocked into an outlet | Green |
| `in_transit` | Moving between outlets | Yellow |
| `completed` | All visits done for today | Green (faded) |
| `blocked` | Has unclosed route from previous day | Red |

**Geofence Override Status:**
| Value | Description | Mobile Handling |
|-------|-------------|-----------------|
| `pending` | Awaiting supervisor decision | Show "Waiting for approval" |
| `approved` | Approved, agent can clock in | Auto-proceed with clock-in |
| `rejected` | Rejected by supervisor | Show rejection message |
| `expired` | Request expired (15 min default) | Allow re-request |

### A.4 Error Handling

**Standard Error Response:**
```json
{
  "error": {
    "type": "error_type",
    "message": "Human readable error message"
  }
}
```

**Geofence Violation (400)** - Mobile must handle specially:
```json
{
  "error": "GEOFENCE_VIOLATION",
  "message": "You are 150 meters from the outlet. Maximum allowed: 50 meters",
  "your_location": {
    "latitude": -1.2921,
    "longitude": 36.8219
  },
  "outlet_location": {
    "latitude": -1.2934,
    "longitude": 36.8232
  },
  "distance_meters": 150.5,
  "required_radius_meters": 50,
  "can_request_override": true
}
```
**Mobile Action:** Show distance, outlet location on map, offer "Request Override" if `can_request_override=true`.

**Route Blocked (403)** - Critical error requiring supervisor:
```json
{
  "error": "ROUTE_BLOCKED",
  "message": "You have an unclosed route from 2026-01-27",
  "blocked_route_id": 123,
  "blocked_route_date": "2026-01-27",
  "status": "activated",
  "requires_supervisor_override": true
}
```
**Mobile Action:** Show blocking message, disable route activation, show "Contact Supervisor" guidance.

### A.5 Skip Reasons API

**List Skip Reasons:**
```http
GET /api/v1/visits/skip-reasons?active_only=true
```

**Response:**
```json
[
  {
    "id": 1,
    "reason_code": "CLOSED",
    "reason_name": "Outlet Closed",
    "description": "The outlet was closed during visit time",
    "requires_notes": false,
    "display_order": 1,
    "is_active": true
  },
  {
    "id": 2,
    "reason_code": "OUT_OF_STOCK",
    "reason_name": "Customer Out of Stock",
    "description": "Customer doesn't need restocking",
    "requires_notes": true,
    "display_order": 2,
    "is_active": true
  }
]
```

**Mobile Mapping:**
```dart
class SkipReasonModel {
  int id;
  String reasonCode;
  String reasonName;
  String? description;
  bool requiresNotes;
  int displayOrder;
  bool isActive;
}
```

**Create Skip Reason (Admin):**
```http
POST /api/v1/visits/skip-reasons
Permission: visit:skip-reason:manage
```
```json
{
  "reason_code": "ROAD_BLOCKED",
  "reason_name": "Road Inaccessible",
  "description": "Road to outlet is blocked or impassable",
  "requires_notes": true,
  "display_order": 5
}
```

### A.6 Schedules API

**List Schedules:**
```http
GET /api/v1/visits/schedules?sales_agent_id=24&day_of_week=1&page=1&size=20
Permission: visit:schedule:list
```

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "sales_agent_id": 24,
      "customer_id": 1,
      "card_code": "CL000001",
      "day_of_week": 1,
      "scheduled_clock_in": "09:00:00",
      "scheduled_clock_out": "10:00:00",
      "visit_priority": 2,
      "visit_order": 1,
      "visit_duration_mins": 60,
      "is_active": true,
      "effective_from": "2026-01-01",
      "effective_to": null,
      "agent_name": "John Doe",
      "agent_code": "SA-001",
      "customer_name": "ABC Store"
    }
  ],
  "meta": {
    "page": 1,
    "size": 20,
    "total_count": 45,
    "total_pages": 3
  }
}
```

**Get Agent Week Schedule:**
```http
GET /api/v1/visits/schedules/agent/{agent_id}/week?effective_date=2026-01-28
Permission: visit:schedule:list
```

**Response:**
```json
{
  "success": true,
  "data": {
    "monday": [
      {
        "id": 1,
        "customer_id": 1,
        "card_code": "CL000001",
        "scheduled_clock_in": "09:00:00",
        "scheduled_clock_out": "10:00:00",
        "visit_order": 1
      }
    ],
    "tuesday": [],
    "wednesday": [...],
    "thursday": [],
    "friday": [],
    "saturday": [],
    "sunday": []
  }
}
```

**Mobile Mapping to VisitScheduleModel:**
```dart
// Each item in day array maps to one VisitScheduleModel row
class VisitScheduleModel {
  int serverId;           // id from response
  int salesAgentId;       // from parent context
  int customerId;
  String cardCode;
  int dayOfWeek;          // 0=Monday, 6=Sunday
  String scheduledClockIn;
  String scheduledClockOut;
  int visitOrder;
  int visitPriority;
  int visitDurationMins;
  bool isActive;
  DateTime? effectiveFrom;
  DateTime? effectiveTo;
}
```

**Create Schedule (Admin):**
```http
POST /api/v1/visits/schedules
Permission: visit:schedule:create
```
```json
{
  "sales_agent_id": 24,
  "customer_id": 1,
  "card_code": "CL000001",
  "day_of_week": 1,
  "scheduled_clock_in": "09:00:00",
  "scheduled_clock_out": "10:00:00",
  "visit_priority": 2,
  "visit_order": 1,
  "visit_duration_mins": 60,
  "effective_from": "2026-02-01"
}
```

**Update/Delete Schedule (Admin):**
```http
PUT /api/v1/visits/schedules/{schedule_id}
DELETE /api/v1/visits/schedules/{schedule_id}  // Soft delete (is_active=false)
```

### A.7 Routes API

**Activate Route:**
```http
POST /api/v1/visits/routes/activate
Permission: visit:route:activate
```
```json
{
  "route_date": "2026-01-28"  // Optional, defaults to today
}
```

**Response (DailyRouteResponse):**
```json
{
  "id": 1,
  "sales_agent_id": 24,
  "route_date": "2026-01-28",
  "status": "activated",
  "activated_at": "2026-01-28T08:00:00Z",
  "first_clock_in_at": null,
  "last_clock_out_at": null,
  "closed_at": null,
  "total_scheduled": 5,
  "completed_count": 0,
  "skipped_count": 0,
  "total_visit_time_mins": 0,
  "closing_notes": null,
  "force_closed_at": null,
  "force_close_reason": null,
  "agent_name": "John Doe",
  "agent_code": "SA-001",
  "visits": [
    {
      "id": 1,
      "daily_route_id": 1,
      "customer_id": 1,
      "card_code": "CL000001",
      "scheduled_clock_in": "09:00:00",
      "scheduled_clock_out": "10:00:00",
      "visit_order": 1,
      "status": "pending",
      "visit_type": "scheduled",
      "visit_priority": 2,
      "geofence_override": false,
      "customer_name": "ABC Store"
    }
  ]
}
```

**Mobile Mapping to DailyRouteModel:**
```dart
class DailyRouteModel {
  int? serverId;              // id from response
  int salesAgentId;
  DateTime routeDate;
  RouteStatus status;
  DateTime? activatedAt;
  DateTime? firstClockInAt;
  DateTime? lastClockOutAt;
  DateTime? closedAt;
  int totalScheduled;
  int completedCount;
  int skippedCount;
  int totalVisitTimeMins;
  String? closingNotes;
  DateTime? forceClosedAt;
  String? forceCloseReason;
  int? forceClosedByUserId;
  // visits populated from OutletVisitModel join
}
```

**Errors:**
- `403` with `ROUTE_BLOCKED` → Show blocked state, require supervisor action
- `400` if route exists → Return existing route (idempotent behavior)

**Get Today's Route:**
```http
GET /api/v1/visits/routes/today
Permission: visit:route:view
```
Returns `DailyRouteResponse` or 404 if no route activated.

**Get Route by ID:**
```http
GET /api/v1/visits/routes/{route_id}
Permission: visit:route:view
```

**Close Route:**
```http
POST /api/v1/visits/routes/{route_id}/close
Permission: visit:route:close
```
```json
{
  "closing_notes": "All visits completed successfully",
  "skipped_visits": [
    {
      "visit_id": 5,
      "skip_reason_id": 1,
      "skip_notes": "Shop was closed early"
    }
  ]
}
```
**Note:** All visits must be in terminal state (completed/skipped). Use `skipped_visits` to skip remaining pending visits in one call.

**Force Close Route (Supervisor):**
```http
POST /api/v1/visits/routes/{route_id}/force-close
Permission: visit:route:force-close
```
```json
{
  "reason": "Agent forgot to close route yesterday",
  "skip_all_pending": true,
  "default_skip_reason_id": 3
}
```

### A.8 Visit Operations API

**Get Visit Details:**
```http
GET /api/v1/visits/{visit_id}
```

**Response (OutletVisitResponse):**
```json
{
  "id": 1,
  "daily_route_id": 1,
  "schedule_id": 1,
  "customer_id": 1,
  "card_code": "CL000001",
  "scheduled_clock_in": "09:00:00",
  "scheduled_clock_out": "10:00:00",
  "visit_order": 1,
  "actual_clock_in": "2026-01-28T09:05:00Z",
  "actual_clock_out": "2026-01-28T09:45:00Z",
  "visit_duration_mins": 40,
  "status": "completed",
  "visit_type": "scheduled",
  "visit_priority": 2,
  "skip_reason_id": null,
  "skip_notes": null,
  "clock_in_distance_m": 25.5,
  "clock_out_distance_m": 30.2,
  "geofence_override": false,
  "visit_notes": "Restocked 50 units",
  "customer_name": "ABC Store",
  "skip_reason_name": null
}
```

**Mobile Mapping to OutletVisitModel:**
```dart
class OutletVisitModel {
  int? serverId;
  int dailyRouteId;       // Local route ID (resolve via EntityIdMap)
  int? scheduleId;
  int customerId;
  String cardCode;
  String scheduledClockIn;
  String scheduledClockOut;
  int visitOrder;
  DateTime? actualClockIn;
  DateTime? actualClockOut;
  int? visitDurationMins;
  VisitStatus status;
  VisitType visitType;
  int visitPriority;
  int? skipReasonId;
  String? skipNotes;
  double? clockInDistanceM;
  double? clockOutDistanceM;
  bool geofenceOverride;
  String? visitNotes;
  SyncState syncState;
}
```

**Clock In:**
```http
POST /api/v1/visits/{visit_id}/clock-in
Permission: visit:clock
```
```json
{
  "latitude": -1.2921,
  "longitude": 36.8219,
  "accuracy_meters": 10.5,
  "notes": "Customer ready for restocking"
}
```

**Errors:**
- `400` with `GEOFENCE_VIOLATION` → Show override option
- `400` if another visit is already in progress → Show active visit
- `400` if visit not in `pending` status → Invalid state

**Clock Out:**
```http
POST /api/v1/visits/{visit_id}/clock-out
Permission: visit:clock
```
```json
{
  "latitude": -1.2921,
  "longitude": 36.8219,
  "accuracy_meters": 10.5,
  "notes": "Delivered 50 units, payment collected"
}
```
**Note:** Clock-out geofence is more lenient (100m vs 50m for clock-in).

**Skip Visit:**
```http
POST /api/v1/visits/{visit_id}/skip
Permission: visit:skip
```
```json
{
  "skip_reason_id": 1,
  "skip_notes": "Shop was closed for renovation"
}
```
**Errors:**
- `400` if skip reason `requires_notes=true` and no notes provided
- `400` if visit not in `pending` status

**Add Ad-hoc Visit:**
```http
POST /api/v1/visits/ad-hoc
Permission: visit:adhoc:create
```
```json
{
  "daily_route_id": 1,
  "customer_id": 5,
  "card_code": "CL000005",
  "notes": "Emergency restock request"
}
```

### A.9 Geofence Overrides API

**Request Override:**
```http
POST /api/v1/visits/{visit_id}/request-override
Permission: visit:geofence:request
```
```json
{
  "latitude": -1.2950,
  "longitude": 36.8250,
  "accuracy_meters": 15.0,
  "reason": "GPS inaccurate inside the mall. I am at the outlet entrance."
}
```

**Response (GeofenceOverrideResponse):**
```json
{
  "id": 1,
  "outlet_visit_id": 1,
  "requested_by_user_id": 5,
  "requested_at": "2026-01-28T09:10:00Z",
  "distance_from_outlet": 150.5,
  "reason": "GPS inaccurate inside the mall. I am at the outlet entrance.",
  "status": "pending",
  "decided_by_user_id": null,
  "decided_at": null,
  "decision_notes": null,
  "expires_at": "2026-01-28T09:25:00Z",
  "requested_by_name": "John Doe",
  "decided_by_name": null,
  "customer_name": "ABC Store",
  "card_code": "CL000001"
}
```

**Mobile Behavior:** After requesting, poll status or use WebSocket for real-time updates. Show countdown to `expires_at` (15 min default).

**List Pending Overrides (Supervisor):**
```http
GET /api/v1/visits/geofence-overrides/pending?page=1&size=20
Permission: visit:geofence:list-pending
```

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "outlet_visit_id": 1,
      "requested_by_user_id": 5,
      "requested_at": "2026-01-28T09:10:00Z",
      "distance_from_outlet": 150.5,
      "reason": "GPS inaccurate inside the mall",
      "status": "pending",
      "expires_at": "2026-01-28T09:25:00Z",
      "requested_by_name": "John Doe",
      "customer_name": "ABC Store",
      "card_code": "CL000001"
    }
  ],
  "meta": {...}
}
```

**Get Override Request:**
```http
GET /api/v1/visits/geofence-overrides/{request_id}
```

**Approve Override:**
```http
POST /api/v1/visits/geofence-overrides/{request_id}/approve
Permission: visit:geofence:approve
```
```json
{
  "notes": "Verified with customer, agent is at location"
}
```

**Reject Override:**
```http
POST /api/v1/visits/geofence-overrides/{request_id}/reject
Permission: visit:geofence:reject
```
```json
{
  "notes": "Agent needs to move closer to outlet"
}
```

### A.10 Location Tracking API

**Send Location Ping:**
```http
POST /api/v1/visits/location/ping
Permission: visit:location:ping
```
```json
{
  "latitude": -1.2921,
  "longitude": 36.8219,
  "accuracy_meters": 10.5,
  "altitude_meters": 1650.0,
  "speed_mps": 2.5,
  "heading_degrees": 180.0,
  "battery_level": 75,
  "is_charging": false,
  "network_type": "4G",
  "ping_source": "foreground",
  "recorded_at": "2026-01-28T10:00:00Z",
  "device_ping_id": "550e8400-e29b-41d4-a716-446655440000"
}
```

**Response:**
```json
{
  "success": true,
  "ping_id": 12345,
  "next_ping_seconds": 300,
  "server_time": "2026-01-28T10:00:05Z",
  "is_duplicate": false
}
```

**Mobile Behavior:**
- Use `next_ping_seconds` to schedule next ping
- `device_ping_id` (UUID) ensures idempotency on retry
- `is_duplicate=true` means server already received this ping

**Mobile Mapping to AgentLocationPingModel:**
```dart
class AgentLocationPingModel {
  String devicePingId;       // UUID for idempotency
  int? serverId;             // ping_id from response
  int salesAgentId;
  int? dailyRouteId;
  double latitude;
  double longitude;
  double? accuracyMeters;
  double? altitudeMeters;
  double? speedMps;
  double? headingDegrees;
  int? batteryLevel;
  bool? isCharging;
  String? networkType;
  String pingSource;         // foreground, background
  DateTime recordedAt;
  DateTime? receivedAt;
  SyncState syncState;
}
```

**Get Agents Status (Team Monitor):**
```http
GET /api/v1/visits/agents/status?supervisor_only=true&include_absent=false
Permission: visit:tracking:subordinates
```

**Response:**
```json
[
  {
    "agent_id": 24,
    "agent_code": "SA-001",
    "agent_name": "John Doe",
    "presence_status": "at_outlet",
    "current_outlet": {
      "customer_id": 1,
      "card_code": "CL000001",
      "customer_name": "ABC Store"
    },
    "route_progress": {
      "total": 5,
      "completed": 2,
      "skipped": 0,
      "pending": 3,
      "in_progress": 1
    },
    "last_activity": "2026-01-28T10:15:00Z",
    "last_location": {
      "latitude": -1.2921,
      "longitude": 36.8219,
      "recorded_at": "2026-01-28T10:14:00Z"
    },
    "route_activated_at": "2026-01-28T08:00:00Z",
    "blocked_reason": null,
    "blocked_route_id": null,
    "requires_action": false,
    "battery_level": 65
  },
  {
    "agent_id": 25,
    "agent_code": "SA-002",
    "agent_name": "Jane Smith",
    "presence_status": "blocked",
    "current_outlet": null,
    "route_progress": null,
    "last_activity": "2026-01-27T18:00:00Z",
    "last_location": null,
    "route_activated_at": null,
    "blocked_reason": "Unclosed route from 2026-01-27",
    "blocked_route_id": 45,
    "requires_action": true,
    "battery_level": null
  }
]
```

**Mobile Mapping to TeamAgentStatus:**
```dart
class TeamAgentStatus {
  int agentId;
  String agentCode;
  String agentName;
  AgentPresenceStatus presenceStatus;  // enum matching API values
  CurrentOutlet? currentOutlet;
  RouteProgress? routeProgress;
  DateTime? lastActivity;
  LastLocation? lastLocation;
  DateTime? routeActivatedAt;
  String? blockedReason;
  int? blockedRouteId;
  bool requiresAction;
  int? batteryLevel;
}
```

**Get Agent Location Trail:**
```http
GET /api/v1/visits/agents/{agent_id}/location-trail?route_date=2026-01-28&limit=1000
Permission: visit:location:history
```

**Response:**
```json
{
  "agent_id": 24,
  "agent_code": "SA-001",
  "agent_name": "John Doe",
  "date": "2026-01-28",
  "total_pings": 48,
  "pings": [
    {
      "id": 1001,
      "latitude": -1.2921,
      "longitude": 36.8219,
      "accuracy_meters": 10.5,
      "altitude_meters": 1650.0,
      "speed_mps": 0.0,
      "heading_degrees": null,
      "battery_level": 85,
      "is_charging": false,
      "network_type": "4G",
      "ping_source": "foreground",
      "recorded_at": "2026-01-28T08:00:00Z",
      "received_at": "2026-01-28T08:00:02Z"
    }
  ],
  "first_ping_at": "2026-01-28T08:00:00Z",
  "last_ping_at": "2026-01-28T12:00:00Z",
  "total_distance_meters": 15234.5
}
```

**Get Agent Location Summary:**
```http
GET /api/v1/visits/agents/{agent_id}/location-summary?date_from=2026-01-21&date_to=2026-01-28
Permission: visit:location:history
```

### A.11 Reports & Analytics API

**Agent Visit Report:**
```http
GET /api/v1/visits/reports/agent/{agent_id}?date_from=2026-01-01&date_to=2026-01-28
Permission: visit:report:own (self), visit:report:team (subordinates), visit:report:all (any)
```

**Response:**
```json
{
  "agent_id": 24,
  "agent_code": "SA-001",
  "agent_name": "John Doe",
  "date_from": "2026-01-01",
  "date_to": "2026-01-28",
  "total_routes": 20,
  "total_visits_scheduled": 100,
  "total_visits_completed": 85,
  "total_visits_skipped": 15,
  "compliance_rate": 85.0,
  "avg_visit_duration_mins": 35.5,
  "total_visit_time_mins": 3017,
  "routes": [
    {
      "id": 1,
      "route_date": "2026-01-28",
      "status": "closed",
      "activated_at": "2026-01-28T08:00:00Z",
      "closed_at": "2026-01-28T17:00:00Z",
      "total_scheduled": 5,
      "completed_count": 4,
      "skipped_count": 1,
      "total_visit_time_mins": 150,
      "visits": [...]
    }
  ]
}
```

**Team Compliance Report:**
```http
GET /api/v1/visits/reports/compliance?date_from=2026-01-01&date_to=2026-01-28
Permission: visit:report:team (subordinates), visit:report:all (all)
```

**Response:**
```json
{
  "date_from": "2026-01-01",
  "date_to": "2026-01-28",
  "total_agents": 10,
  "total_routes": 200,
  "total_visits_scheduled": 1000,
  "total_visits_completed": 850,
  "total_visits_skipped": 150,
  "overall_compliance_rate": 85.0,
  "by_agent": [...],
  "by_day": [
    {
      "date": "2026-01-28",
      "total_agents_active": 8,
      "total_visits_scheduled": 40,
      "total_visits_completed": 35,
      "total_visits_skipped": 5,
      "compliance_rate": 87.5
    }
  ]
}
```

**Outlet Visit Report:**
```http
GET /api/v1/visits/reports/outlet/{customer_id}?date_from=2026-01-01&date_to=2026-01-28
Permission: visit:report:team (subordinate visits), visit:report:all (all)
```

**Dashboard Metrics (Real-time):**
```http
GET /api/v1/visits/reports/dashboard?target_date=2026-01-28
Permission: visit:report:team (subordinates), visit:report:all (all)
```

**Response:**
```json
{
  "date": "2026-01-28",
  "total_agents": 10,
  "agents_active": 6,
  "agents_at_outlet": 3,
  "agents_completed": 2,
  "agents_blocked": 1,
  "total_visits_scheduled": 50,
  "visits_completed": 25,
  "visits_in_progress": 3,
  "visits_skipped": 5,
  "visits_pending": 17,
  "today_compliance_rate": 50.0,
  "pending_override_requests": 2,
  "unclosed_routes": 1
}
```

**Mobile Mapping:** Used for AdminHubScreen summary cards and TeamMonitorScreen header.

### A.12 Quick Reference - All Endpoints

| Method | Endpoint | Permission | Description |
|--------|----------|------------|-------------|
| **Skip Reasons** ||||
| GET | `/skip-reasons` | - | List skip reasons |
| POST | `/skip-reasons` | `visit:skip-reason:manage` | Create skip reason |
| **Schedules** ||||
| GET | `/schedules` | `visit:schedule:list` | List schedules |
| GET | `/schedules/agent/{id}/week` | `visit:schedule:list` | Agent week schedule |
| GET | `/schedules/{id}` | `visit:schedule:list` | Get schedule |
| POST | `/schedules` | `visit:schedule:create` | Create schedule |
| PUT | `/schedules/{id}` | `visit:schedule:update` | Update schedule |
| DELETE | `/schedules/{id}` | `visit:schedule:delete` | Delete schedule |
| **Routes** ||||
| POST | `/routes/activate` | `visit:route:activate` | Activate route |
| GET | `/routes/today` | `visit:route:view` | Get today's route |
| GET | `/routes/{id}` | `visit:route:view` | Get route by ID |
| POST | `/routes/{id}/close` | `visit:route:close` | Close route |
| POST | `/routes/{id}/force-close` | `visit:route:force-close` | Force-close route |
| **Visits** ||||
| GET | `/{id}` | - | Get visit details |
| POST | `/{id}/clock-in` | `visit:clock` | Clock in |
| POST | `/{id}/clock-out` | `visit:clock` | Clock out |
| POST | `/{id}/skip` | `visit:skip` | Skip visit |
| POST | `/ad-hoc` | `visit:adhoc:create` | Add ad-hoc visit |
| POST | `/{id}/request-override` | `visit:geofence:request` | Request override |
| **Geofence Overrides** ||||
| GET | `/geofence-overrides/pending` | `visit:geofence:list-pending` | List pending |
| GET | `/geofence-overrides/{id}` | - | Get override request |
| POST | `/geofence-overrides/{id}/approve` | `visit:geofence:approve` | Approve |
| POST | `/geofence-overrides/{id}/reject` | `visit:geofence:reject` | Reject |
| **Location Tracking** ||||
| POST | `/location/ping` | `visit:location:ping` | Send location ping |
| GET | `/agents/status` | `visit:tracking:subordinates` | Team status |
| GET | `/agents/{id}/location-trail` | `visit:location:history` | Location trail |
| GET | `/agents/{id}/location-summary` | `visit:location:history` | Location summary |
| **Reports** ||||
| GET | `/reports/agent/{id}` | `visit:report:*` | Agent report |
| GET | `/reports/compliance` | `visit:report:team+` | Team compliance |
| GET | `/reports/outlet/{id}` | `visit:report:team+` | Outlet report |
| GET | `/reports/dashboard` | `visit:report:team+` | Dashboard metrics |

### A.13 Mobile Implementation Notes

**Offline-First Considerations:**
- Agent workflow (activate, clock-in, clock-out, skip) → Queue in SyncQueue, work offline
- Admin/Supervisor actions (approve, force-close, team monitor) → Online-only, immediate API
- Skip reasons → Cache locally in SkipReasonCacheModel
- Schedules → Cache locally in VisitScheduleModel, read-only for agents

**Error Handling Priority:**
1. `GEOFENCE_VIOLATION` → Show distance, offer override request
2. `ROUTE_BLOCKED` → Show blocking message, disable activation
3. Network errors → Queue operation for retry (agent actions only)
4. Validation errors → Show user-friendly message

**Sync Dependencies (SyncQueue):**
```
activateRoute → visits created
clockIn → depends on route synced
clockOut → depends on clockIn synced
skip → depends on route synced
orderCreate → depends on clockIn synced (must be at outlet)
stockTake → depends on clockIn synced (must be at outlet)
```

**Polling vs WebSocket:**
- Override status → Poll every 30s while pending, or WebSocket if available
- Team status → Poll every 60s on TeamMonitorScreen
- Dashboard metrics → Poll every 60s on AdminHubScreen

---

**Dependencies to Add**

Update `pubspec.yaml`:

```yaml
dependencies:
  # Existing dependencies remain...
  
  # Database
  isar: ^3.1.0+1
  isar_flutter_libs: ^3.1.0+1
  
  # Background tasks & foreground service
  workmanager: ^0.5.2
  background_fetch: ^1.2.1
  flutter_foreground_task: ^8.0.0  # Android foreground service
  
  # Geofencing
  geofence_service: ^5.2.0
  
  # Notifications
  flutter_local_notifications: ^17.0.0
  
  # Barcode scanning
  mobile_scanner: ^5.1.1
  
  # Image handling (for complaints)
  image_picker: ^1.0.7
  http: ^1.2.0  # Multipart file uploads
  path_provider: ^2.1.0  # Local file storage
  
  # Security & hashing
  crypto: ^3.0.3  # SHA256 for payload hashing and file integrity
  
dev_dependencies:
  # Existing dev dependencies remain...
  
  # Database code generation
  isar_generator: ^3.1.0+1
```

---

## Next Immediate Steps

1. **Review architecture document** with team
2. **Approve implementation plan**
3. **Start Phase 1**: 
   - Set up Isar database
   - Implement sync infrastructure
   - Create location service
   - Set up notifications
4. **Create API contracts** for backend team
5. **Set up project tracking** (Jira/Trello)

Let me know when you're ready to begin implementation! 🚀
