import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../permissions/permissions.dart';
import 'database_providers.dart';

/// Provider for PermissionService
final permissionServiceProvider = Provider<PermissionService>((ref) {
  final database = ref.watch(isarDatabaseProvider);
  return PermissionService(database);
});

/// Provider to check if location permission is granted
final hasLocationPermissionProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(permissionServiceProvider);
  return await service.hasLocationPermission();
});

/// Provider to check if camera permission is granted
final hasCameraPermissionProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(permissionServiceProvider);
  return await service.hasCameraPermission();
});

/// Provider to check if notification permission is granted
final hasNotificationPermissionProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(permissionServiceProvider);
  return await service.hasNotificationPermission();
});

/// Provider to check all critical permissions
final hasAllCriticalPermissionsProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(permissionServiceProvider);
  return await service.hasAllCriticalPermissions();
});

/// Provider for loaded feature permissions
final featurePermissionsProvider = FutureProvider<Map<FeaturePermission, bool>>(
  (ref) async {
    final service = ref.watch(permissionServiceProvider);
    return await service.loadFeaturePermissions();
  },
);

/// Provider to check specific feature permission
final featurePermissionProvider =
    FutureProvider.family<bool, FeaturePermission>((ref, permission) async {
      final service = ref.watch(permissionServiceProvider);
      return await service.hasFeaturePermission(permission);
    });

/// Provider to check if permission cache is stale
final isPermissionCacheStaleProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(permissionServiceProvider);
  return await service.isPermissionCacheStale();
});
