# Provider Integration Guide

## Overview

The Outlet Manager app uses **Riverpod** for state management with comprehensive provider integration across all core services. This document describes the provider architecture, initialization flow, and best practices.

## Provider Architecture

### Core Providers

All core providers are organized in `/lib/core/providers/` and exported through `providers.dart`:

```dart
// Single import for all providers
import 'package:outlet_manager/core/providers/providers.dart';
```

### Provider Categories

#### 1. Database Providers
**File:** `database_providers.dart`

```dart
// Async Isar instance
final isarProvider = Provider<Future<Isar>>((ref) async {
  return IsarDatabase.getInstance();
});

// Synchronous database wrapper
final isarDatabaseProvider = Provider<IsarDatabase>((ref) {
  return IsarDatabase();
});
```

**Usage:**
```dart
// For async database operations
final isar = await ref.read(isarProvider);

// For service injection
final database = ref.read(isarDatabaseProvider);
```

---

#### 2. Initialization Providers
**File:** `initialization_providers.dart`

```dart
// App initialization service
final appInitializationServiceProvider = Provider<AppInitializationService>((ref) {
  return AppInitializationService();
});

// Performs initialization
final appInitializationProvider = FutureProvider<InitializationResult>((ref) async {
  final service = ref.watch(appInitializationServiceProvider);
  return await service.initialize(ref);
});

// Check if initialized
final isAppInitializedProvider = Provider<bool>((ref) {
  // ...
});

// Service health status
final serviceStatusProvider = Provider<Map<String, bool>>((ref) {
  // ...
});
```

**Initialization Order:**

1. **Phase 1: Database** (no dependencies)
   - Initialize Isar database
   - Critical: App cannot proceed without this

2. **Phase 2: Database-dependent services**
   - Notification Service
   - Permission Service

3. **Phase 3: Complex services**
   - Location Service
   - Sync Service

---

#### 3. Location Providers
**File:** `location_providers.dart`

```dart
// LocationService instance
final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

// GeofenceManager (async, waits for dependencies)
final asyncGeofenceManagerProvider = FutureProvider<GeofenceManager>((ref) async {
  final isar = await IsarDatabase.getInstance();
  final locationService = ref.watch(locationServiceProvider);
  final notificationService = await ref.watch(initializedNotificationServiceProvider.future);
  
  return GeofenceManager(
    locationService: locationService,
    isar: isar,
    notificationService: notificationService,
  );
});
```

---

#### 4. Location Tracking Providers
**File:** `location_tracking_providers.dart`

```dart
// Location permission status
final locationPermissionStatusProvider = StateProvider<LocationPermissionStatus>((ref) {
  return LocationPermissionStatus.denied;
});

// Location tracking state
final locationTrackingStateProvider = StateProvider<LocationTrackingState>((ref) {
  return LocationTrackingState.initial();
});

// Location tracking controller
final locationTrackingControllerProvider = 
    StateNotifierProvider<LocationTrackingController, LocationTrackingState>((ref) {
  final locationService = ref.watch(locationServiceProvider);
  return LocationTrackingController(locationService);
});

// Check if currently tracking
final isLocationTrackingProvider = Provider<bool>((ref) {
  final state = ref.watch(locationTrackingControllerProvider);
  return state.isTracking;
});
```

**Usage:**
```dart
// Start tracking
await ref.read(locationTrackingControllerProvider.notifier).startTracking();

// Check status
final isTracking = ref.watch(isLocationTrackingProvider);
```

---

#### 5. Notification Providers
**File:** `notification_providers.dart`

```dart
// NotificationService instance
final notificationServiceProvider = Provider<NotificationService>((ref) {
  final service = NotificationService();
  ref.onDispose(() => service.dispose());
  return service;
});

// Async initialized service
final initializedNotificationServiceProvider = 
    FutureProvider<NotificationService>((ref) async {
  final service = ref.watch(notificationServiceProvider);
  await service.initialize();
  return service;
});

// Check if initialized
final notificationServiceInitializedProvider = FutureProvider<bool>((ref) async {
  await ref.watch(initializedNotificationServiceProvider.future);
  return true;
});
```

---

#### 6. Permission Providers
**File:** `permission_providers.dart`

```dart
// PermissionService instance
final permissionServiceProvider = Provider<PermissionService>((ref) {
  final database = ref.watch(isarDatabaseProvider);
  return PermissionService(database);
});

// Runtime permission checks
final hasLocationPermissionProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(permissionServiceProvider);
  return await service.hasLocationPermission();
});

final hasCameraPermissionProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(permissionServiceProvider);
  return await service.hasCameraPermission();
});

final hasNotificationPermissionProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(permissionServiceProvider);
  return await service.hasNotificationPermission();
});

// Critical permissions check
final hasAllCriticalPermissionsProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(permissionServiceProvider);
  return await service.hasAllCriticalPermissions();
});

// Feature permissions
final featurePermissionsProvider = 
    FutureProvider<Map<FeaturePermission, bool>>((ref) async {
  final service = ref.watch(permissionServiceProvider);
  return await service.loadFeaturePermissions();
});

final featurePermissionProvider = 
    FutureProvider.family<bool, FeaturePermission>((ref, permission) async {
  final service = ref.watch(permissionServiceProvider);
  return await service.hasFeaturePermission(permission);
});

// Cache status
final isPermissionCacheStaleProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(permissionServiceProvider);
  return await service.isPermissionCacheStale();
});
```

---

#### 7. Sync Providers
**File:** `sync_providers.dart`

```dart
// SyncService instance (throws until initialized)
final syncServiceProvider = Provider<SyncService>((ref) {
  throw UnimplementedError('SyncService must be initialized with Isar instance');
});

// Async sync service (waits for database)
final asyncSyncServiceProvider = FutureProvider<SyncService>((ref) async {
  final isar = await IsarDatabase.getInstance();
  return SyncService(isar);
});
```

---

#### 8. Router Provider
**File:** `router_provider.dart`

```dart
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);
  final locationPermissionStatus = ref.watch(locationPermissionStatusProvider);
  
  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      // Navigation logic based on auth and permission state
      // ...
    },
    routes: [
      // Route definitions
    ],
  );
});
```

---

## Riverpod Generator Providers

Some providers use `@riverpod` annotations for code generation:

### Auth Providers
**File:** `features/auth/data/auth_controller.dart`

```dart
@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    // Initialize auth state
  }
  
  Future<void> login(String email, String password) async {
    // Login logic
  }
}

@riverpod
bool isAuthenticated(Ref ref) {
  final authState = ref.watch(authControllerProvider);
  return authState is Authenticated;
}

@riverpod
User? currentUser(Ref ref) {
  final authState = ref.watch(authControllerProvider);
  if (authState is Authenticated) {
    return authState.user;
  }
  return null;
}
```

**Generated providers:**
- `authControllerProvider` - StateNotifierProvider
- `isAuthenticatedProvider` - Provider<bool>
- `currentUserProvider` - Provider<User?>

### Connectivity Providers
**File:** `features/connectivity/data/connectivity_provider.dart`

```dart
@riverpod
class ConnectivityController extends _$ConnectivityController {
  @override
  ConnectivityState build() {
    // Monitor connectivity
  }
}

@riverpod
bool isOnline(Ref ref) {
  final connectivity = ref.watch(connectivityControllerProvider);
  return connectivity != ConnectivityState.offline;
}
```

---

## Initialization Flow

### App Startup Sequence

1. **main.dart**
   ```dart
   void main() async {
     WidgetsFlutterBinding.ensureInitialized();
     await AppConfig.initialize(Environment.dev);
     await SystemChrome.setPreferredOrientations([...]);
     
     runApp(const ProviderScope(child: OutletManagerApp()));
   }
   ```

2. **OutletManagerApp** watches `appInitializationProvider`
   ```dart
   @override
   Widget build(BuildContext context, WidgetRef ref) {
     final appInit = ref.watch(appInitializationProvider);
     
     return appInit.when(
       data: (result) => result.success ? MainApp() : ErrorScreen(),
       loading: () => LoadingScreen(),
       error: (error, stack) => ErrorScreen(),
     );
   }
   ```

3. **AppInitializationService** initializes services in order:
   - Database → Notifications → Permissions → Location → Sync

### Result Handling

```dart
class InitializationResult {
  final bool success;
  final String? errorMessage;
  final Map<String, bool> serviceStatus;
}
```

- `success`: true if all critical services initialized
- `errorMessage`: null on success, error description on failure
- `serviceStatus`: health check for each service

---

## Testing with Providers

### Provider Overrides

For unit tests, override providers with test implementations:

```dart
testWidgets('Test with mocked database', (tester) async {
  final mockDatabase = MockIsarDatabase();
  
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        isarDatabaseProvider.overrideWithValue(mockDatabase),
      ],
      child: MyApp(),
    ),
  );
  
  // Test with mocked database
});
```

### Common Test Overrides

```dart
// Mock database
isarDatabaseProvider.overrideWithValue(mockDatabase)

// Mock services
locationServiceProvider.overrideWithValue(mockLocationService)
notificationServiceProvider.overrideWithValue(mockNotificationService)
permissionServiceProvider.overrideWithValue(mockPermissionService)

// Mock auth state
authControllerProvider.overrideWith((ref) => mockAuthController)

// Skip initialization
appInitializationProvider.overrideWith((ref) async {
  return InitializationResult.success({'database': true});
})
```

### Integration Test Setup

```dart
void main() {
  testWidgets('Full app test', (tester) async {
    // Use real providers for integration tests
    await tester.pumpWidget(
      const ProviderScope(child: OutletManagerApp()),
    );
    
    // Wait for initialization
    await tester.pumpAndSettle();
    
    // Run tests
  });
}
```

---

## Best Practices

### 1. Provider Access

**✅ DO:**
```dart
// Watch for reactive updates
final value = ref.watch(someProvider);

// Read once (no rebuild)
final value = ref.read(someProvider);

// Listen to changes
ref.listen(someProvider, (previous, next) {
  // Handle change
});
```

**❌ DON'T:**
```dart
// Don't read in build method (use watch instead)
@override
Widget build(BuildContext context, WidgetRef ref) {
  final value = ref.read(someProvider); // ❌
  return Text(value);
}
```

### 2. Async Providers

**✅ DO:**
```dart
// Use .when() for clean handling
final asyncValue = ref.watch(asyncProvider);

return asyncValue.when(
  data: (data) => SuccessWidget(data),
  loading: () => LoadingWidget(),
  error: (error, stack) => ErrorWidget(error),
);

// Or use .maybeWhen() for partial handling
return asyncValue.maybeWhen(
  data: (data) => DataWidget(data),
  orElse: () => PlaceholderWidget(),
);
```

### 3. Provider Scope

**✅ DO:**
```dart
// Create provider scopes for isolated state
ProviderScope(
  overrides: [
    userIdProvider.overrideWithValue(userId),
  ],
  child: UserProfileScreen(),
)
```

### 4. Provider Disposal

**✅ DO:**
```dart
// Clean up in provider
final myServiceProvider = Provider<MyService>((ref) {
  final service = MyService();
  
  ref.onDispose(() {
    service.dispose(); // Clean up resources
  });
  
  return service;
});
```

### 5. Family Providers

**✅ DO:**
```dart
// Use .family for parameterized providers
final itemProvider = FutureProvider.family<Item, String>((ref, id) async {
  return await fetchItem(id);
});

// Usage
final item = ref.watch(itemProvider('item-123'));
```

---

## Code Generation

### Running Generator

```bash
# One-time generation
dart run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerate on file changes)
dart run build_runner watch --delete-conflicting-outputs
```

### Generated Files

Code generation creates `.g.dart` files next to annotated files:
- `auth_controller.dart` → `auth_controller.g.dart`
- `connectivity_provider.dart` → `connectivity_provider.g.dart`
- `api_client.dart` → `api_client.g.dart`

**Never edit `.g.dart` files manually!**

---

## Debugging Providers

### Provider Observer

Add a provider observer to log all provider changes:

```dart
class LoggerProviderObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('[${provider.name ?? provider.runtimeType}] value: $newValue');
  }
}

void main() {
  runApp(
    ProviderScope(
      observers: [LoggerProviderObserver()],
      child: OutletManagerApp(),
    ),
  );
}
```

### Devtools Integration

Riverpod integrates with Flutter DevTools:
1. Run app in debug mode
2. Open Flutter DevTools
3. Navigate to "Provider" tab
4. Inspect provider states and dependencies

---

## Migration Checklist

When adding new services:

- [ ] Create service provider in appropriate file
- [ ] Add to barrel export in `providers.dart`
- [ ] If async initialization needed, add to `AppInitializationService`
- [ ] Update initialization order if dependencies exist
- [ ] Add provider overrides for testing
- [ ] Document in this guide
- [ ] Run `flutter analyze` to verify

---

## Common Patterns

### Service Injection Pattern

```dart
// Define service provider
final myServiceProvider = Provider<MyService>((ref) {
  final database = ref.watch(isarDatabaseProvider);
  return MyService(database);
});

// Service depends on multiple providers
final complexServiceProvider = Provider<ComplexService>((ref) {
  final database = ref.watch(isarDatabaseProvider);
  final notifications = ref.watch(notificationServiceProvider);
  final location = ref.watch(locationServiceProvider);
  
  return ComplexService(
    database: database,
    notifications: notifications,
    location: location,
  );
});
```

### State Controller Pattern

```dart
// Using StateNotifierProvider
final counterProvider = StateNotifierProvider<CounterController, int>((ref) {
  return CounterController();
});

class CounterController extends StateNotifier<int> {
  CounterController() : super(0);
  
  void increment() => state++;
  void decrement() => state--;
}

// Usage
final count = ref.watch(counterProvider);
ref.read(counterProvider.notifier).increment();
```

### Stream Provider Pattern

```dart
// Expose stream as provider
final locationStreamProvider = StreamProvider<LocationData>((ref) {
  final service = ref.watch(locationServiceProvider);
  return service.locationStream;
});

// Usage
final locationAsync = ref.watch(locationStreamProvider);
locationAsync.when(
  data: (location) => Text('Lat: ${location.latitude}'),
  loading: () => CircularProgressIndicator(),
  error: (error, stack) => Text('Error: $error'),
);
```

---

## Troubleshooting

### Provider Not Found

**Error:** `ProviderNotFoundException`

**Solution:** Ensure provider is defined above where it's used, or add to ProviderScope overrides.

### Circular Dependencies

**Error:** `CircularDependencyError`

**Solution:** Refactor providers to remove circular references. Consider using lazy initialization.

### State Not Updating

**Issue:** Widget not rebuilding when provider changes

**Solution:** Use `ref.watch()` instead of `ref.read()` in build method.

### Async Provider Always Loading

**Issue:** FutureProvider stuck in loading state

**Solution:** Check if Future completes. Add error handling. Consider using `.family` if parameterized.

---

## Related Documentation

- [Permission System](./PERMISSION_SYSTEM.md)
- [Database Schema](./architecture/mobile-architecture.md#database)
- [Sync System](./architecture/mobile-architecture.md#sync)
- [Location Services](./architecture/mobile-architecture.md#location)
- [Flutter Riverpod Official Docs](https://riverpod.dev/)
