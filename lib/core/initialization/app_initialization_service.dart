import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../database/isar_database.dart';
import '../location/location_service.dart';
import '../notifications/notification_service.dart';
import '../permissions/permission_service.dart';
import '../providers/initialization_providers.dart';
import '../providers/notification_providers.dart';
import '../sync/sync_service.dart';

/// Result of app initialization
class InitializationResult {
  final bool success;
  final String? errorMessage;
  final Map<String, bool> serviceStatus;
  // True when the database phase failed because its open attempt is
  // genuinely stuck (IsarDatabase.hasStuckOpenAttempt), not just slow —
  // see that getter's doc comment. Lets InitializationErrorScreen tell
  // the user the truth instead of offering a Retry that can't work.
  final bool isDatabaseStuck;

  const InitializationResult({
    required this.success,
    this.errorMessage,
    required this.serviceStatus,
    this.isDatabaseStuck = false,
  });

  factory InitializationResult.success(Map<String, bool> serviceStatus) {
    return InitializationResult(success: true, serviceStatus: serviceStatus);
  }

  factory InitializationResult.failure(
    String errorMessage,
    Map<String, bool> serviceStatus, {
    bool isDatabaseStuck = false,
  }) {
    return InitializationResult(
      success: false,
      errorMessage: errorMessage,
      serviceStatus: serviceStatus,
      isDatabaseStuck: isDatabaseStuck,
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

  // The database phase gets a longer budget than every other phase (see
  // its own doc comment below) — confirmed in the field (2026-09-30) that
  // 15s isn't always enough for legitimate lock contention against
  // Isar/mdbx to clear on its own (another isolate/engine briefly holding
  // the same environment open), producing a hard, user-facing
  // TimeoutException for a wait that would have resolved itself in a few
  // more seconds. IsarDatabase's own `_openingFuture` cache means this
  // costs nothing extra on a normal fast open, and makes a manual "Retry"
  // tap after this timeout safe too — it awaits the same in-flight attempt
  // rather than racing a second one.
  static const _databasePhaseTimeout = Duration(seconds: 45);

  /// Initialize all core services in dependency order (with Ref from provider)
  /// Returns result with success status and service health info
  Future<InitializationResult> initializeWithRef(Ref ref) async {
    developer.log('🚀 Starting app initialization...');

    // This service instance outlives a single initializeWithRef() call —
    // appInitializationServiceProvider is a plain Provider, so it isn't
    // recreated when appInitializationProvider is invalidated by the error
    // screen's retry button. Clear here so a retry never shows leftover
    // status from the previous attempt.
    _serviceStatus.clear();

    void setPhase(String phase) {
      developer.log('▶️ $phase');
      // Deferred to a microtask, not written synchronously: this whole
      // method runs as appInitializationProvider's own build function, and
      // the very first call here happens before this function's first
      // `await` — i.e. still inside that provider's own creation. Riverpod
      // asserts against a provider modifying another provider's state
      // while it's still building ("Providers are not allowed to modify
      // other providers during their initialization"), which this would
      // trip on every cold start. Scheduling the write as a microtask lets
      // appInitializationProvider's creation call return first; Dart drains
      // the microtask queue before any awaited phase can actually progress,
      // so the UI still updates in the same order, just no longer
      // synchronously nested inside the other provider's build.
      Future.microtask(() {
        ref.read(initializationPhaseProvider.notifier).state = phase;
      });
    }

    try {
      // Phase 1: Database (no dependencies)
      setPhase('Starting database…');
      await _initializeDatabase();

      // Phase 2: Services that depend only on database
      setPhase('Checking notifications…');
      await _initializeNotificationService();
      setPhase('Checking permissions…');
      await _initializePermissionService();

      // Phase 3: Services that need other services
      setPhase('Checking location services…');
      await _initializeLocationService();
      setPhase('Starting sync service…');
      await _initializeSyncService();
      setPhase('Connecting push notifications…');
      await _initializeFcmService(ref);

      developer.log('✅ App initialization completed successfully');
      return InitializationResult.success(_serviceStatus);
    } catch (e, stackTrace) {
      developer.log(
        '❌ App initialization failed: $e',
        error: e,
        stackTrace: stackTrace,
      );
      // Field-reported: this failure screen (InitializationErrorScreen)
      // had zero Sentry visibility anywhere in this whole path — confirmed
      // via grep, no Sentry call in this service, the provider, or the
      // screen that displays it, despite this being a real, recurring,
      // user-visible failure users have had to work around by clearing
      // app data or rebooting. Every past occurrence has been invisible
      // to monitoring; the only evidence of it has ever been user-
      // submitted screenshots. _serviceStatus is attached as context so a
      // future occurrence shows exactly which phase failed (e.g.
      // "database") without needing the screenshot at all.
      final isDatabaseStuck = IsarDatabase.hasStuckOpenAttempt;
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) async {
          await scope.setTag('failure_type', 'app_initialization');
          await scope.setTag('database_stuck', isDatabaseStuck.toString());
          await scope.setContexts('service_status', _serviceStatus);
        },
      );
      return InitializationResult.failure(
        e.toString(),
        _serviceStatus,
        isDatabaseStuck: isDatabaseStuck,
      );
    }
  }

  /// Phase 1: Initialize database
  ///
  /// Gets a longer timeout than every other phase below (see
  /// `_databasePhaseTimeout`'s doc comment) — `IsarDatabase.getInstance()`
  /// can genuinely hang rather than error on some devices:
  /// `getApplicationDocumentsDirectory()` is a platform-channel call that
  /// can stall on certain OEM Android skins, and `Isar.open()` itself can
  /// block waiting on a native file lock if another isolate/engine (or a
  /// previous process force-stopped/OOM-killed mid-write) hasn't released
  /// it yet — both are device/history-dependent, matching "some phones,
  /// not others" rather than a universal failure. A timeout turns that
  /// indefinite hang into the same clear, catchable failure every other
  /// phase already gets, just with more room for a legitimate wait to
  /// resolve on its own first.
  Future<void> _initializeDatabase() async {
    try {
      developer.log('📦 Initializing database...');
      final isar = await IsarDatabase.getInstance().timeout(
        _databasePhaseTimeout,
      );
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
