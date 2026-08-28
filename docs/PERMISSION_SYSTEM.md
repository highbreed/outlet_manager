# Permission System

## Overview
The Permission System provides comprehensive management of both runtime permissions (location, camera, etc.) and feature permissions (backend-controlled capabilities). It includes caching, automatic refresh, and ready-to-use UI widgets.

## Architecture

### Core Components

#### 1. **PermissionService**
Location: [lib/core/permissions/permission_service.dart](../lib/core/permissions/permission_service.dart)

Handles all permission-related operations with caching support.

#### 2. **Permission Types**
Location: [lib/core/permissions/permission_types.dart](../lib/core/permissions/permission_types.dart)

Defines two types of permissions:
- **AppPermissionType**: Runtime OS permissions
- **FeaturePermission**: Backend-controlled feature access

#### 3. **Permission Widgets**
Location: [lib/core/widgets/permission_widgets.dart](../lib/core/widgets/permission_widgets.dart)

Pre-built UI components for permission requests.

## Permission Types

### Runtime Permissions (AppPermissionType)

```dart
enum AppPermissionType {
  location,      // GPS tracking for geofencing
  camera,        // Photo capture
  storage,       // File storage
  notification,  // Push notifications
  photos,        // Gallery access
}
```

### Feature Permissions (FeaturePermission)

```dart
enum FeaturePermission {
  viewCustomers,       // View customer information
  createOrders,        // Create new orders
  editOrders,          // Modify existing orders
  cancelOrders,        // Cancel orders
  viewProducts,        // View product catalog
  viewPricing,         // View pricing information
  applyDiscounts,      // Give discounts
  performStockTakes,   // Perform stock takes
  submitComplaints,    // Submit complaints
  viewRoutes,          // View route information
  deviateFromRoute,    // Deviate from assigned route
}
```

## Usage

### Checking Permissions

```dart
// Check single runtime permission
final service = ref.read(permissionServiceProvider);
final hasLocation = await service.hasLocationPermission();

// Check multiple permissions
final results = await service.checkPermissions([
  AppPermissionType.location,
  AppPermissionType.camera,
]);

// Using providers
final hasLocation = ref.watch(hasLocationPermissionProvider);
final hasCamera = ref.watch(hasCameraPermissionProvider);
```

### Requesting Permissions

```dart
// Request single permission
final status = await service.requestCameraPermission();

if (status.isGranted) {
  // Permission granted
} else if (status.isPermanentlyDenied) {
  // Show settings dialog
  await service.openAppSettings();
}

// Request multiple permissions
final results = await service.requestPermissions([
  AppPermissionType.location,
  AppPermissionType.notification,
]);
```

### Feature Permissions

```dart
// Load all feature permissions (from cache)
final permissions = await service.loadFeaturePermissions();

// Check specific feature permission
final canCreateOrders = await service.hasFeaturePermission(
  FeaturePermission.createOrders,
);

// Update from API response
await service.updateFeaturePermissions({
  'create_orders': true,
  'edit_orders': false,
  'view_customers': true,
});

// Using providers
final permissions = ref.watch(featurePermissionsProvider);
final canCreateOrders = ref.watch(
  featurePermissionProvider(FeaturePermission.createOrders),
);
```

### Permission Caching

```dart
// Check if cache is stale (>24 hours)
final isStale = await service.isPermissionCacheStale();

if (isStale) {
  // Fetch fresh permissions from API
  final apiPermissions = await api.getPermissions();
  await service.updateFeaturePermissions(apiPermissions);
}

// Clear cache (e.g., on logout)
await service.clearPermissionCache();
```

## UI Widgets

### 1. Permission Request Dialog

```dart
// Show permission request dialog
showPermissionRequest(
  context,
  permission: AppPermissionType.camera,
  customRationale: 'We need camera access to scan barcodes',
  onGranted: () {
    // Permission granted
    startCamera();
  },
  onDenied: () {
    // Permission denied
    showError('Camera access is required');
  },
);

// Or use the widget directly
PermissionRequestDialog(
  permission: AppPermissionType.location,
  onGranted: () => print('Granted'),
  onDenied: () => print('Denied'),
)
```

### 2. Permission Status Card

```dart
// Show permission status with request button
PermissionStatusCard(
  permission: AppPermissionType.location,
  onPermissionGranted: () {
    // Refresh UI or proceed
    ref.invalidate(hasLocationPermissionProvider);
  },
)
```

### 3. Critical Permissions Checker

```dart
// Wrap your app to ensure critical permissions are granted
CriticalPermissionsChecker(
  onAllGranted: () {
    // All critical permissions granted, proceed
    print('Ready to use app');
  },
  child: YourMainApp(),
)
```

This widget blocks the app until location and notification permissions are granted.

## Providers

### Available Providers

```dart
// Permission service
final permissionServiceProvider

// Runtime permission checks
final hasLocationPermissionProvider       // FutureProvider<bool>
final hasCameraPermissionProvider         // FutureProvider<bool>
final hasNotificationPermissionProvider   // FutureProvider<bool>
final hasAllCriticalPermissionsProvider   // FutureProvider<bool>

// Feature permissions
final featurePermissionsProvider          // FutureProvider<Map<FeaturePermission, bool>>
final featurePermissionProvider           // FutureProvider.family<bool, FeaturePermission>

// Cache status
final isPermissionCacheStaleProvider      // FutureProvider<bool>
```

### Provider Usage

```dart
// Watch permission status
final hasLocation = ref.watch(hasLocationPermissionProvider);

hasLocation.when(
  data: (hasPermission) {
    if (hasPermission) {
      return LocationEnabledWidget();
    }
    return RequestLocationButton();
  },
  loading: () => CircularProgressIndicator(),
  error: (error, stack) => ErrorWidget(error),
);

// Read permission service
final service = ref.read(permissionServiceProvider);
await service.requestCameraPermission();

// Invalidate to refresh
ref.invalidate(hasLocationPermissionProvider);
```

## Permission Rationales

The service provides built-in rationales for each permission:

```dart
final rationale = service.getPermissionRationale(AppPermissionType.location);
// Returns:
// "Location permission is required to track your visits to outlets 
//  and automatically clock in/out."
```

You can also provide custom rationales:

```dart
PermissionRequestDialog(
  permission: AppPermissionType.camera,
  customRationale: 'We need camera access to scan product barcodes',
)
```

## Critical Permissions

The app defines two critical permissions that are required for core functionality:

1. **Location** - For geofencing and automatic clock in/out
2. **Notification** - For geofence alerts and important updates

```dart
// Check all critical permissions
final hasAll = await service.hasAllCriticalPermissions();

// Request all critical permissions
await service.requestAllCriticalPermissions();
```

## Opening Settings

When permissions are permanently denied, direct users to settings:

```dart
// Open app settings
await service.openAppSettings();

// Open location settings specifically
await service.openLocationSettings();
```

## Best Practices

### 1. Request Permissions Contextually
Don't request all permissions on app start. Request them when the feature is first used.

```dart
// ❌ Bad: Request on app start
void initState() {
  requestAllPermissions();
}

// ✅ Good: Request when needed
void onTakePhotoPressed() async {
  final hasCamera = await service.hasCameraPermission();
  if (!hasCamera) {
    final status = await service.requestCameraPermission();
    if (!status.isGranted) return;
  }
  takePhoto();
}
```

### 2. Show Rationale Before Requesting
Always explain why you need the permission:

```dart
showPermissionRequest(
  context,
  permission: AppPermissionType.location,
  customRationale: 'Location is needed to track your outlet visits',
  onGranted: () => startTracking(),
);
```

### 3. Handle Permanent Denials
Provide a path to settings when permanently denied:

```dart
if (status.isPermanentlyDenied) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Permission Required'),
      content: Text('Please enable location in settings'),
      actions: [
        TextButton(
          onPressed: () => service.openAppSettings(),
          child: Text('Open Settings'),
        ),
      ],
    ),
  );
}
```

### 4. Cache Feature Permissions
Feature permissions should be cached and refreshed periodically:

```dart
// On app start or login
if (await service.isPermissionCacheStale()) {
  final permissions = await api.getUserPermissions();
  await service.updateFeaturePermissions(permissions);
}

// Use cached permissions throughout the app
final canEdit = await service.hasFeaturePermission(
  FeaturePermission.editOrders,
);
```

### 5. Clear Cache on Logout
```dart
void logout() async {
  await service.clearPermissionCache();
  await tokenStorage.clear();
  // Navigate to login
}
```

## Testing

### Mock Permission Service

```dart
class MockPermissionService extends Mock implements PermissionService {}

final mockPermissionService = MockPermissionService();

// Setup mocks
when(() => mockPermissionService.hasLocationPermission())
    .thenAnswer((_) async => true);

when(() => mockPermissionService.hasFeaturePermission(
      FeaturePermission.createOrders,
    ))
    .thenAnswer((_) async => true);
```

### Testing Permission Widgets

```dart
testWidgets('Shows permission request dialog', (tester) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        permissionServiceProvider.overrideWithValue(mockPermissionService),
      ],
      child: MaterialApp(
        home: PermissionRequestDialog(
          permission: AppPermissionType.camera,
        ),
      ),
    ),
  );

  expect(find.text('Camera Permission'), findsOneWidget);
  expect(find.text('Grant Permission'), findsOneWidget);
});
```

## Platform-Specific Notes

### iOS
- Location permission requires `NSLocationWhenInUseUsageDescription` and `NSLocationAlwaysAndWhenInUseUsageDescription` in Info.plist
- Camera requires `NSCameraUsageDescription`
- Photos requires `NSPhotoLibraryUsageDescription`
- Notifications require user prompt

### Android
- Runtime permissions required for Android 6.0+ (API 23+)
- Location requires `ACCESS_FINE_LOCATION` and `ACCESS_COARSE_LOCATION` in manifest
- Camera requires `CAMERA` permission
- Notification permission required for Android 13+ (API 33+)

### Adding New Permissions

1. Add to `AppPermissionType` enum
2. Implement check and request methods in `PermissionService`
3. Add to `checkPermissions` and `requestPermissions` switch statements
4. Update rationale in `getPermissionRationale`
5. Add corresponding provider if needed

## Error Handling

```dart
try {
  final status = await service.requestLocationPermission();
  
  switch (status) {
    case LocationPermission.always:
    case LocationPermission.whileInUse:
      // Success
      break;
    case LocationPermission.denied:
      // User denied, can request again
      showRetryDialog();
      break;
    case LocationPermission.deniedForever:
      // Permanently denied, need to open settings
      showSettingsDialog();
      break;
    case LocationPermission.unableToDetermine:
      // Error state
      showErrorDialog();
      break;
  }
} catch (e) {
  // Handle exception
  showError('Failed to request permission: $e');
}
```

## Migration from Old Code

### Before:
```dart
// Old approach
if (await Permission.location.isGranted) {
  // Use location
}
```

### After:
```dart
// New approach
final service = ref.read(permissionServiceProvider);
if (await service.hasLocationPermission()) {
  // Use location
}

// Or with provider
final hasLocation = ref.watch(hasLocationPermissionProvider);
hasLocation.when(
  data: (hasPermission) => hasPermission ? UseLocation() : RequestPermission(),
  loading: () => Loading(),
  error: (e, s) => Error(e),
);
```

## Future Enhancements

- [ ] Batch permission requests with single dialog
- [ ] Permission usage tracking/analytics
- [ ] Automatic permission refresh on app resume
- [ ] Custom permission check intervals
- [ ] Role-based feature permission presets
- [ ] Permission denial reason tracking
