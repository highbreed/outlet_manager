import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

import '../database/isar_database.dart';
import '../database/models/permission_cache_model.dart';
import 'permission_types.dart';

/// Service for managing app permissions (runtime and feature)
class PermissionService {
  final IsarDatabase _database;

  // Cache version - increment when permission structure changes
  static const int _cacheVersion = 1;

  PermissionService(this._database);

  // ==================== RUNTIME PERMISSIONS ====================

  /// Check if location permission is granted
  Future<bool> hasLocationPermission() async {
    if (await Geolocator.isLocationServiceEnabled() == false) {
      return false;
    }

    final permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  /// Request location permission
  Future<LocationPermission> requestLocationPermission() async {
    // Check if location service is enabled
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return LocationPermission.denied;
    }

    // Check current permission
    LocationPermission permission = await Geolocator.checkPermission();

    // If denied, request permission
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return permission;
  }

  /// Check if camera permission is granted
  Future<bool> hasCameraPermission() async {
    final status = await Permission.camera.status;
    return status.isGranted;
  }

  /// Request camera permission
  Future<PermissionStatus> requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status;
  }

  /// Check if storage permission is granted
  Future<bool> hasStoragePermission() async {
    final status = await Permission.storage.status;
    return status.isGranted;
  }

  /// Request storage permission
  Future<PermissionStatus> requestStoragePermission() async {
    final status = await Permission.storage.request();
    return status;
  }

  /// Check if photos permission is granted
  Future<bool> hasPhotosPermission() async {
    final status = await Permission.photos.status;
    return status.isGranted;
  }

  /// Request photos permission
  Future<PermissionStatus> requestPhotosPermission() async {
    final status = await Permission.photos.request();
    return status;
  }

  /// Check if notification permission is granted
  Future<bool> hasNotificationPermission() async {
    final status = await Permission.notification.status;
    return status.isGranted;
  }

  /// Request notification permission
  Future<PermissionStatus> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    return status;
  }

  /// Check multiple permissions at once
  Future<Map<AppPermissionType, bool>> checkPermissions(
    List<AppPermissionType> permissions,
  ) async {
    final results = <AppPermissionType, bool>{};

    for (final permission in permissions) {
      switch (permission) {
        case AppPermissionType.location:
          results[permission] = await hasLocationPermission();
          break;
        case AppPermissionType.camera:
          results[permission] = await hasCameraPermission();
          break;
        case AppPermissionType.storage:
          results[permission] = await hasStoragePermission();
          break;
        case AppPermissionType.notification:
          results[permission] = await hasNotificationPermission();
          break;
        case AppPermissionType.photos:
          results[permission] = await hasPhotosPermission();
          break;
      }
    }

    return results;
  }

  /// Request multiple permissions at once
  Future<Map<AppPermissionType, PermissionStatus>> requestPermissions(
    List<AppPermissionType> permissions,
  ) async {
    final results = <AppPermissionType, PermissionStatus>{};

    for (final permission in permissions) {
      switch (permission) {
        case AppPermissionType.location:
          final locationPermission = await requestLocationPermission();
          results[permission] = locationToPermissionStatus(locationPermission);
          break;
        case AppPermissionType.camera:
          results[permission] = await requestCameraPermission();
          break;
        case AppPermissionType.storage:
          results[permission] = await requestStoragePermission();
          break;
        case AppPermissionType.notification:
          results[permission] = await requestNotificationPermission();
          break;
        case AppPermissionType.photos:
          results[permission] = await requestPhotosPermission();
          break;
      }
    }

    return results;
  }

  /// Open app settings for permission management
  Future<bool> openAppSettings() async {
    return await Geolocator.openAppSettings();
  }

  /// Open location settings
  Future<bool> openLocationSettings() async {
    return await Geolocator.openLocationSettings();
  }

  // ==================== FEATURE PERMISSIONS ====================

  /// Load feature permissions from cache
  Future<Map<FeaturePermission, bool>> loadFeaturePermissions() async {
    final cache = await _database.getPermissionCache();

    // Check if cache exists and is not expired
    if (cache == null || cache.expiresAt.isBefore(DateTime.now())) {
      return {};
    }

    // Parse cached permissions from JSON string
    final permissions = <FeaturePermission, bool>{};

    // The permissionsJson field contains the serialized permissions
    // For now, return empty map - will be populated from API
    return permissions;
  }

  /// Save feature permissions to cache
  Future<void> saveFeaturePermissions(
    Map<FeaturePermission, bool> permissions,
  ) async {
    // Convert permissions to JSON format
    final permissionMap = <String, bool>{};
    for (final entry in permissions.entries) {
      permissionMap[entry.key.key] = entry.value;
    }

    final cache = PermissionCacheModel()
      ..userId =
          'current_user' // TODO: Get from auth service
      ..permissionsJson = permissionMap.toString()
      ..version = _cacheVersion
      ..updatedAt = DateTime.now()
      ..expiresAt = DateTime.now().add(const Duration(hours: 24));

    await _database.savePermissionCache(cache);
  }

  /// Update feature permissions from API response
  Future<void> updateFeaturePermissions(
    Map<String, bool> apiPermissions,
  ) async {
    final permissions = <FeaturePermission, bool>{};

    for (final entry in apiPermissions.entries) {
      final permission = parseFeaturePermission(entry.key);
      if (permission != null) {
        permissions[permission] = entry.value;
      }
    }

    await saveFeaturePermissions(permissions);
  }

  /// Check if user has a specific feature permission
  Future<bool> hasFeaturePermission(FeaturePermission permission) async {
    final permissions = await loadFeaturePermissions();
    return permissions[permission] ?? false;
  }

  /// Check multiple feature permissions
  Future<Map<FeaturePermission, bool>> hasFeaturePermissions(
    List<FeaturePermission> permissions,
  ) async {
    final allPermissions = await loadFeaturePermissions();
    final results = <FeaturePermission, bool>{};

    for (final permission in permissions) {
      results[permission] = allPermissions[permission] ?? false;
    }

    return results;
  }

  /// Clear all cached permissions
  Future<void> clearPermissionCache() async {
    await _database.clearPermissionCache();
  }

  /// Get cache timestamp
  Future<DateTime?> getPermissionCacheTimestamp() async {
    final cache = await _database.getPermissionCache();
    return cache?.updatedAt;
  }

  /// Check if permission cache is stale (older than 24 hours)
  Future<bool> isPermissionCacheStale() async {
    final cache = await _database.getPermissionCache();
    if (cache == null) return true;

    return cache.expiresAt.isBefore(DateTime.now());
  }

  // ==================== HELPER METHODS ====================

  /// Convert LocationPermission to PermissionStatus
  PermissionStatus locationToPermissionStatus(LocationPermission permission) {
    switch (permission) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        return PermissionStatus.granted;
      case LocationPermission.denied:
        return PermissionStatus.denied;
      case LocationPermission.deniedForever:
        return PermissionStatus.permanentlyDenied;
      case LocationPermission.unableToDetermine:
        return PermissionStatus.denied;
    }
  }

  /// Get permission rationale message
  String getPermissionRationale(AppPermissionType permission) {
    switch (permission) {
      case AppPermissionType.location:
        return 'Location permission is required to track your visits to outlets '
            'and automatically clock in/out.';
      case AppPermissionType.camera:
        return 'Camera permission is required to take photos of products, '
            'receipts, and outlet displays.';
      case AppPermissionType.storage:
        return 'Storage permission is required to save photos and documents.';
      case AppPermissionType.notification:
        return 'Notification permission is required to receive important alerts '
            'about orders, routes, and geofence boundaries.';
      case AppPermissionType.photos:
        return 'Photos permission is required to select images from your gallery.';
    }
  }

  /// Check if all critical permissions are granted
  Future<bool> hasAllCriticalPermissions() async {
    final location = await hasLocationPermission();
    final notification = await hasNotificationPermission();

    return location && notification;
  }

  /// Request all critical permissions
  Future<Map<AppPermissionType, PermissionStatus>>
  requestAllCriticalPermissions() async {
    return await requestPermissions([
      AppPermissionType.location,
      AppPermissionType.notification,
    ]);
  }
}
