import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/isar_database.dart';
import '../location/location_service.dart';
import '../notifications/notification_service.dart';
import '../permissions/permission_service.dart';
import '../providers/notification_providers.dart';
import '../sync/sync_service.dart';

/// Result of app initialization
class InitializationResult {
  final bool success;
  final String? errorMessage;
  final Map<String, bool> serviceStatus;

  const InitializationResult({
    required this.success,
    this.errorMessage,
    required this.serviceStatus,
  });

  factory InitializationResult.success(Map<String, bool> serviceStatus) {
    return InitializationResult(success: true, serviceStatus: serviceStatus);
  }

  factory InitializationResult.failure(
    String errorMessage,
    Map<String, bool> serviceStatus,
  ) {
    return InitializationResult(
      success: false,
      errorMessage: errorMessage,
      serviceStatus: serviceStatus,
    );
  }
}

/// Service that handles app initialization in the correct order
/// and ensures all core services are properly set up
class AppInitializationService {
  final Map<String, bool> _serviceStatus = {};

  // OutletManagerApp (the app's root widget) shows nothing but a bare
  // spinner until appInitializationProvider resolves — every phase below
  // is documented as "non-critical, continue initialization" on failure,
  // but before this timeout that was only true for a *thrown* exception.
  // A phase whose Future simply never completes (confirmed in production:
  // FcmService.initialize()'s _fcm.getToken() call, a network request to
  // Google's FCM servers with no timeout of its own) left the entire app
  // stuck on the loading screen forever, with nothing to observe in logs
  // since nothing ever actually failed.
  static const _phaseTimeout = Duration(seconds: 15);

  /// Initialize all core services in dependency order (with Ref from provider)
  /// Returns result with success status and service health info
  Future<InitializationResult> initializeWithRef(Ref ref) async {
    developer.log('🚀 Starting app initialization...');

    try {
      // Phase 1: Database (no dependencies)
      await _initializeDatabase();

      // Phase 2: Services that depend only on database
      await _initializeNotificationService();
      await _initializePermissionService();

      // Phase 3: Services that need other services
      await _initializeLocationService();
      await _initializeSyncService();
      await _initializeFcmService(ref);

      developer.log('✅ App initialization completed successfully');
      return InitializationResult.success(_serviceStatus);
    } catch (e, stackTrace) {
      developer.log(
        '❌ App initialization failed: $e',
        error: e,
        stackTrace: stackTrace,
      );
      return InitializationResult.failure(e.toString(), _serviceStatus);
    }
  }

  /// Phase 1: Initialize database
  Future<void> _initializeDatabase() async {
    try {
      developer.log('📦 Initializing database...');
      final isar = await IsarDatabase.getInstance();
      _serviceStatus['database'] = isar.isOpen;
      developer.log('✓ Database initialized');
    } catch (e) {
      _serviceStatus['database'] = false;
      rethrow;
    }
  }

  /// Phase 2: Initialize notification service
  Future<void> _initializeNotificationService() async {
    try {
      developer.log('🔔 Initializing notification service...');
      final notificationService = NotificationService();
      await notificationService.initialize().timeout(_phaseTimeout);
      _serviceStatus['notifications'] = true;
      developer.log('✓ Notification service initialized');
    } catch (e) {
      _serviceStatus['notifications'] = false;
      // Non-critical, continue initialization
      developer.log('⚠️ Notification service initialization failed: $e');
    }
  }

  /// Phase 2: Initialize permission service
  Future<void> _initializePermissionService() async {
    try {
      developer.log('🔐 Initializing permission service...');
      final database = IsarDatabase();
      final permissionService = PermissionService(database);

      // Check critical permissions status (don't request, just check)
      final hasCritical = await permissionService
          .hasAllCriticalPermissions()
          .timeout(_phaseTimeout);
      _serviceStatus['permissions'] = true;
      developer.log(
        '✓ Permission service initialized (critical: $hasCritical)',
      );
    } catch (e) {
      _serviceStatus['permissions'] = false;
      // Non-critical, continue initialization
      developer.log('⚠️ Permission service initialization failed: $e');
    }
  }

  /// Phase 3: Initialize location service
  Future<void> _initializeLocationService() async {
    try {
      developer.log('📍 Initializing location service...');
      final locationService = LocationService();

      // Check if service is available (don't start tracking yet)
      final isAvailable = await locationService
          .isLocationServiceEnabled()
          .timeout(_phaseTimeout);
      _serviceStatus['location'] = isAvailable;
      developer.log('✓ Location service initialized (available: $isAvailable)');
    } catch (e) {
      _serviceStatus['location'] = false;
      // Non-critical, continue initialization
      developer.log('⚠️ Location service initialization failed: $e');
    }
  }

  /// Phase 3: Initialize sync service
  Future<void> _initializeSyncService() async {
    try {
      developer.log('🔄 Initializing sync service...');
      final isar = await IsarDatabase.getInstance().timeout(_phaseTimeout);
      // Create sync service (implicitly validates database connection)
      // ignore: unused_local_variable
      final syncService = SyncService(isar);

      _serviceStatus['sync'] = true;
      developer.log('✓ Sync service initialized');
    } catch (e) {
      _serviceStatus['sync'] = false;
      // Non-critical, continue initialization
      developer.log('⚠️ Sync service initialization failed: $e');
    }
  }

  /// Phase 3: Initialize FCM service (non-critical — app works without push)
  Future<void> _initializeFcmService(Ref ref) async {
    try {
      developer.log('🔔 Initializing FCM service...');
      await ref.read(initializedFcmServiceProvider.future).timeout(_phaseTimeout);
      _serviceStatus['fcm'] = true;
      developer.log('✓ FCM service initialized');
    } catch (e) {
      _serviceStatus['fcm'] = false;
      developer.log('⚠️ FCM service initialization failed: $e');
    }
  }

  /// Get health status of all initialized services
  Map<String, bool> getServiceStatus() => Map.unmodifiable(_serviceStatus);

  /// Check if a specific service is healthy
  bool isServiceHealthy(String serviceName) =>
      _serviceStatus[serviceName] ?? false;

  /// Check if all critical services are healthy
  bool areAllCriticalServicesHealthy() {
    // Only database is truly critical for app to start
    return _serviceStatus['database'] ?? false;
  }
}
