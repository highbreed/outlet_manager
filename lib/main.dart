import 'dart:async';
import 'dart:developer' as developer;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/notifications/notifications.dart';

import 'core/config/app_config.dart';
import 'core/location/background_location_service.dart';
import 'core/storage/token_storage.dart';
import 'features/auth/data/auth_controller.dart';
import 'features/auth/data/auth_state.dart';
import 'features/daily_route/providers/daily_route_providers.dart';
import 'core/debug/debug_region_banner.dart';
import 'core/providers/providers.dart';
import 'core/theme/colors.dart';
import 'core/theme/theme.dart';
import 'features/app_update/presentation/providers/app_update_providers.dart';
import 'features/app_update/presentation/screens/update_required_screen.dart';
import 'features/app_update/presentation/widgets/update_recommended_banner.dart';
import 'features/connectivity/connectivity.dart';
import 'features/location_tracking/location_tracking.dart';
import 'features/stock_take/presentation/providers/stock_take_providers.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const envRaw = String.fromEnvironment('APP_ENV', defaultValue: 'dev');
  final env = switch (envRaw.toLowerCase()) {
    'prod' || 'production' => Environment.prod,
    'staging' || 'stage' => Environment.staging,
    _ => Environment.dev,
  };

  // Sentry is initialized first, wrapping every other startup step, so a
  // crash during Firebase/AppConfig/location-ping init on a given device
  // is still reported instead of silently killing the app before Sentry's
  // error zone exists.
  await SentryFlutter.init((options) {
    options.dsn =
        'https://c992577ea49fec528b7f11d0911c2d31@o4508935326597120.ingest.de.sentry.io/4511966244503632';
    options.environment = envRaw.toLowerCase();
    // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
    // We recommend adjusting this value in production.
    options.tracesSampleRate = 1.0;
    // The sampling rate for profiling is relative to tracesSampleRate
    // Setting to 1.0 will profile 100% of sampled transactions:
    options.profilesSampleRate = 1.0;
  }, appRunner: () => _bootstrap(env));
}

Future<void> _bootstrap(Environment env) async {
  // Firebase must be initialized before any other Firebase service is used.
  // The background message handler must also be registered here (top-level).
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await AppConfig.initialize(env);

  // Initialize background location tracking (WorkManager)
  await initializeBackgroundLocationPing();

  // Lock orientation for mobile (optional)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(SentryWidget(child: const ProviderScope(child: OutletManagerApp())));
}

class OutletManagerApp extends ConsumerWidget {
  const OutletManagerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch initialization to ensure services are ready
    final appInit = ref.watch(appInitializationProvider);

    // Show loading/error screens during initialization
    return appInit.when(
      data: (result) {
        if (!result.success) {
          // Show initialization error
          return InitializationErrorScreen(
            errorMessage: result.errorMessage,
            serviceStatus: result.serviceStatus,
          );
        }

        // Version gate takes priority over routing: an unsupported build
        // never reaches the router (or the login screen it would otherwise
        // sit behind), so an already-authenticated user on an old build is
        // blocked too, not just fresh logins. A network failure while
        // polling fails open — see appVersionCheckProvider.
        final blockInfo = ref.watch(effectiveUpdateBlockProvider);
        if (blockInfo != null) {
          return UpdateRequiredScreen(info: blockInfo);
        }

        // App initialized successfully, show main app with router
        final router = ref.watch(routerProvider);

        return _AppLifecycleHandler(
          child: _NotificationTapListener(
            child: _DeviceRegistrationListener(
              child: _BackgroundSyncListener(
                child: MaterialApp.router(
                  title: 'Outlet Manager',
                  debugShowCheckedModeBanner: false,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: ThemeMode.light,
                  routerConfig: router,
                  builder: (context, child) {
                    // return DebugRegionBanner(
                    return UpdateRecommendedBanner(
                      child: ConnectivityBanner(
                        child: child ?? const SizedBox.shrink(),
                      ),
                    );
                    // );
                  },
                ),
              ),
            ),
          ),
        );
      },
      loading: () => const InitializationLoadingScreen(),
      error: (error, stack) => InitializationErrorScreen(
        errorMessage: error.toString(),
        serviceStatus: const {},
      ),
    );
  }
}

/// Shows a banner when device goes offline
class ConnectivityBanner extends ConsumerWidget {
  final Widget child;

  const ConnectivityBanner({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnline = ref.watch(isOnlineProvider);

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isOnline ? 0 : 32,
          child: Material(
            color: kRedColor,
            child: const Center(
              child: Text(
                'No internet connection',
                style: TextStyle(color: kTextLight, fontSize: 12),
              ),
            ),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}

/// Loading screen shown during initialization
class InitializationLoadingScreen extends StatelessWidget {
  const InitializationLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 24),
              Text(
                'Initializing Outlet Manager...',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Error screen shown if initialization fails
class InitializationErrorScreen extends StatelessWidget {
  final String? errorMessage;
  final Map<String, bool> serviceStatus;

  const InitializationErrorScreen({
    super.key,
    this.errorMessage,
    required this.serviceStatus,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 24),
                const Text(
                  'Initialization Failed',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  errorMessage ?? 'Unknown error occurred',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 24),
                if (serviceStatus.isNotEmpty) ...[
                  const Text(
                    'Service Status:',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  ...serviceStatus.entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            entry.value ? Icons.check_circle : Icons.cancel,
                            size: 16,
                            color: entry.value ? Colors.green : Colors.red,
                          ),
                          const SizedBox(width: 8),
                          Text(entry.key),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Handles app lifecycle events for location tracking.
///
/// Starts foreground tracking when app is active, stops when backgrounded.
/// Background tracking is handled by WorkManager.
class _AppLifecycleHandler extends ConsumerStatefulWidget {
  final Widget child;

  const _AppLifecycleHandler({required this.child});

  @override
  ConsumerState<_AppLifecycleHandler> createState() =>
      _AppLifecycleHandlerState();
}

class _AppLifecycleHandlerState extends ConsumerState<_AppLifecycleHandler>
    with WidgetsBindingObserver {
  StreamSubscription<NativeTokenRefresh>? _nativeTokenRefreshSubscription;
  StreamSubscription<GeofenceTransition>? _geofenceTransitionSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Start location tracking after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startLocationTracking();
    });

    // The other half of the token-sync loop — see
    // BackgroundLocationService.tokenRefreshedEvents' doc comment. Kept
    // subscribed for the app's whole lifetime (not just while a session is
    // active) since native can refresh independently at any point tracking
    // is running.
    _nativeTokenRefreshSubscription = ref
        .read(backgroundLocationServiceProvider)
        .tokenRefreshedEvents
        .listen((refresh) {
          TokenStorage().saveTokens(
            accessToken: refresh.accessToken,
            refreshToken: refresh.refreshToken,
            accessExpiresIn: refresh.accessExpiresAt.difference(
              DateTime.now(),
            ),
          );
        });

    // Purely a UX nicety: the native engine has already acted on the
    // transition (faster polling, an immediate geofence_event ping) by the
    // time this fires — this just surfaces the same notifications
    // `GeofenceManager` used to show, for whenever the app happens to be
    // foregrounded. No auto-clock-out here; that stays the backend's own
    // geofence violation detector's job (see GeofenceHysteresisTracker's
    // doc comment for why duplicating it client-side would be risky).
    _geofenceTransitionSubscription = ref
        .read(backgroundLocationServiceProvider)
        .geofenceTransitionEvents
        .listen((transition) {
          final notifications = NotificationService();
          if (transition.isExit) {
            notifications.showGeofenceExitDetected(
              outletName: transition.outletName,
              distanceMeters: transition.distanceMeters,
            );
          } else {
            notifications.clearGeofenceNotifications();
          }
        });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _nativeTokenRefreshSubscription?.cancel();
    _geofenceTransitionSubscription?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final controller = ref.read(locationPingControllerProvider.notifier);

    switch (state) {
      case AppLifecycleState.resumed:
        // App came to foreground - start foreground tracking
        controller.startTracking();
        // Sync any pending pings from when we were offline
        controller.syncPending();
        // Sync any pending stock take operations
        _syncPendingStockTakeOperations();
        // Keep the native tracking engine's own token copy from drifting —
        // AuthInterceptor only pushes when it actually performs a refresh,
        // which doesn't happen if the cached token still looks valid to
        // Dart. Pushing here too covers the case where native's copy has
        // already gone stale (e.g. rotated out by some other refresh)
        // without Dart ever needing to refresh its own.
        _syncBackgroundTrackingTokens();
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
        // Deliberately NOT stopping LocationPingService's heartbeat here.
        // This used to stop it and rely on the WorkManager background task
        // (>=15min floor) to take over, but that meant locking the screen
        // silently dropped ping cadence down to ~15 minutes. LocationService
        // now runs a real Android foreground service + wake lock
        // (see LocationService._startAndroidForegroundService) specifically
        // so the process survives long enough for these Dart timers to keep
        // firing on their normal schedule while locked/backgrounded — so
        // just leave them running.
        break;
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        // No action needed
        break;
    }
  }

  void _startLocationTracking() {
    // Start foreground tracking
    ref.read(locationPingControllerProvider.notifier).startTracking();

    // Register periodic background task (for when app is closed)
    registerPeriodicLocationPing();
  }

  /// Sync any pending stock take operations when app resumes
  Future<void> _syncPendingStockTakeOperations() async {
    try {
      final handler = await ref.read(stockTakeSyncHandlerProvider.future);
      final count = await handler.processAllPending();
      if (count > 0) {
        developer.log(
          '[StockTakeSync] Synced $count pending operations on app resume',
          name: 'StockTakeSync',
        );
      }
    } catch (e) {
      developer.log(
        '[StockTakeSync] Error syncing on resume: $e',
        name: 'StockTakeSync',
      );
    }
  }

  /// Pushes the current tokens to the native tracking engine's own
  /// encrypted copy on every resume — see the call site's comment for why
  /// this is needed in addition to AuthInterceptor's post-refresh push.
  /// Best-effort and silent: BackgroundLocationService.syncTokens already
  /// catches its own errors, and a missing/absent token here just means
  /// not logged in, nothing to push.
  Future<void> _syncBackgroundTrackingTokens() async {
    final tokens = await TokenStorage().getTokens();
    if (tokens == null) return;

    await ref
        .read(backgroundLocationServiceProvider)
        .syncTokens(
          accessToken: tokens.accessToken,
          refreshToken: tokens.refreshToken,
          accessExpiresAt: tokens.accessExpiresAt,
        );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

/// Listens for connectivity restoration and triggers background sync
class _BackgroundSyncListener extends ConsumerStatefulWidget {
  final Widget child;

  const _BackgroundSyncListener({required this.child});

  @override
  ConsumerState<_BackgroundSyncListener> createState() =>
      _BackgroundSyncListenerState();
}

class _BackgroundSyncListenerState
    extends ConsumerState<_BackgroundSyncListener> {
  bool _isSyncing = false;

  @override
  Widget build(BuildContext context) {
    // Listen for connectivity restoration
    ref.listen<AsyncValue<bool>>(onlineRestoredEventsProvider, (
      previous,
      next,
    ) {
      next.whenData((restored) {
        if (restored && !_isSyncing) {
          _triggerBackgroundSync();
        }
      });
    });

    return widget.child;
  }

  Future<void> _triggerBackgroundSync() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      developer.log(
        '[BackgroundSync] Connectivity restored - starting sync...',
        name: 'BackgroundSync',
      );

      ref.read(locationPingControllerProvider.notifier).syncPending();

      final handler = await ref.read(stockTakeSyncHandlerProvider.future);
      final count = await handler.processAllPending();

      if (count > 0) {
        developer.log(
          '[BackgroundSync] Synced $count stock take operations',
          name: 'BackgroundSync',
        );
      }

      developer.log('[BackgroundSync] Sync complete', name: 'BackgroundSync');
    } catch (e) {
      developer.log(
        '[BackgroundSync] Error during sync: $e',
        name: 'BackgroundSync',
      );
    } finally {
      _isSyncing = false;
    }
  }
}

/// Registers the FCM device token with the backend whenever the user
/// transitions to an authenticated state (login or session restore).
/// Token refreshes while authenticated are handled separately via
/// [initializedFcmServiceProvider]'s onTokenRefresh callback.
class _DeviceRegistrationListener extends ConsumerStatefulWidget {
  final Widget child;

  const _DeviceRegistrationListener({required this.child});

  @override
  ConsumerState<_DeviceRegistrationListener> createState() =>
      _DeviceRegistrationListenerState();
}

class _DeviceRegistrationListenerState
    extends ConsumerState<_DeviceRegistrationListener> {
  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authControllerProvider, (previous, next) {
      if (next is Authenticated) {
        _registerFcmToken();
      }
    });
    return widget.child;
  }

  Future<void> _registerFcmToken() async {
    final token = await ref.read(fcmServiceProvider).getToken();
    if (token != null) {
      ref.read(deviceRegistrationRepositoryProvider).registerDevice(token);
    }
  }
}

/// Wires FCM and local notification tap callbacks to in-app navigation.
/// Handles background/terminated FCM taps via [FcmService.onNotificationTap]
/// and foreground local notification taps via [NotificationService.setNotificationCallback].
class _NotificationTapListener extends ConsumerStatefulWidget {
  final Widget child;

  const _NotificationTapListener({required this.child});

  @override
  ConsumerState<_NotificationTapListener> createState() =>
      _NotificationTapListenerState();
}

class _NotificationTapListenerState
    extends ConsumerState<_NotificationTapListener> {
  @override
  void initState() {
    super.initState();
    // Wire immediately — ref is available on ConsumerStatefulWidget.
    // Deferring to addPostFrameCallback caused a race where the local
    // notification tap fired before the callback was registered.
    _wireCallbacks();
  }

  void _wireCallbacks() {
    developer.log(
      '[NotifTap] Wiring notification tap callbacks',
      name: 'NotifTap',
    );
    ref.read(fcmServiceProvider).onNotificationTap = _onTap;
    ref.read(notificationServiceProvider).setNotificationCallback((payload) {
      if (payload == null) {
        developer.log(
          '[NotifTap] Local notification callback fired with null payload',
          name: 'NotifTap',
        );
        return;
      }
      developer.log(
        '[NotifTap] Local notification tapped — type: ${payload.type} | data: ${payload.data}',
        name: 'NotifTap',
      );
      _onTap(payload.data ?? {'action': payload.type});
    });
  }

  void _onTap(Map<String, dynamic> data) {
    final action = data['action'] as String?;
    final status = data['status'] as String?;
    developer.log(
      '[NotifTap] _onTap — full data: $data | action: $action | status: $status',
      name: 'NotifTap',
    );
    if (action == NotificationTypes.locationOverride && status == 'approved') {
      developer.log(
        '[NotifTap] Condition matched → navigating to clock-in',
        name: 'NotifTap',
      );
      _navigateToClockIn(data);
    } else {
      developer.log(
        '[NotifTap] No route — expected action="${NotificationTypes.locationOverride}" '
        'status="approved", got action="$action" status="$status"',
        name: 'NotifTap',
      );
    }
  }

  Future<void> _navigateToClockIn(Map<String, dynamic> data) async {
    final visitId = data['visit_id'] as String?;
    developer.log(
      '[NotifTap] _navigateToClockIn — visit_id: $visitId',
      name: 'NotifTap',
    );
    if (visitId == null) {
      developer.log(
        '[NotifTap] visit_id is null — aborting navigation',
        name: 'NotifTap',
      );
      return;
    }

    final result = await ref
        .read(outletVisitRepositoryProvider)
        .getVisitByServerId(visitId);

    if (!mounted) {
      developer.log(
        '[NotifTap] Widget unmounted after DB lookup — aborting',
        name: 'NotifTap',
      );
      return;
    }

    result.fold(
      (failure) {
        developer.log(
          '[NotifTap] DB lookup failed: $failure — falling back to /daily-route',
          name: 'NotifTap',
        );
        ref.read(routerProvider).go('/daily-route');
      },
      (visit) {
        if (visit == null) {
          developer.log(
            '[NotifTap] No local visit found for serverId=$visitId — falling back to /daily-route',
            name: 'NotifTap',
          );
          ref.read(routerProvider).go('/daily-route');
          return;
        }
        developer.log(
          '[NotifTap] Found visit localId=${visit.localId} outlet="${visit.outletName}" — navigating to /clock-in',
          name: 'NotifTap',
        );
        ref
            .read(routerProvider)
            .go(
              '/clock-in',
              extra: {
                'outletId': visit.outletId,
                'outletName': visit.outletName,
                'outletCode': visit.outletCode,
                'allocatedMinutes': visit.allocatedMinutes,
                'outletLatitude': visit.outletLatitude,
                'outletLongitude': visit.outletLongitude,
                'geofenceRadius': visit.geofenceRadiusMeters,
                'isDeviation': true,
                'routeId': visit.dailyRouteServerId ?? visit.dailyRouteLocalId,
                'visitLocalId': visit.localId,
              },
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
