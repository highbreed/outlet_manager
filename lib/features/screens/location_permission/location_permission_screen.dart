import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import 'widgets/widgets.dart';

/// Screen for requesting and handling location permissions
/// This is a mandatory step before accessing the app
class LocationPermissionScreen extends ConsumerStatefulWidget {
  const LocationPermissionScreen({super.key});

  @override
  ConsumerState<LocationPermissionScreen> createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState
    extends ConsumerState<LocationPermissionScreen>
    with WidgetsBindingObserver {
  bool _isLoading = false;
  String? _errorMessage;
  bool _isServiceDisabled = false;

  // Showing ANY system dialog in _completePostPermissionSetup (the location
  // permission prompt itself, the battery-optimization settings screen, the
  // activity-recognition prompt) sends this app to background and back,
  // which fires didChangeAppLifecycleState(resumed) below — re-entering
  // _checkInitialStatus mid-sequence. Without this guard, two concurrent
  // calls can both reach Permission.activityRecognition.request(), and
  // permission_handler's native side only allows one request in flight —
  // confirmed on-device via the exact
  // "A request for permissions is already running" PlatformException.
  bool _isCompletingSetup = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkInitialStatus();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // Re-check permission when returning from settings
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkInitialStatus();
    }
  }

  Future<void> _checkInitialStatus() async {
    final controller = ref.read(locationTrackingControllerProvider.notifier);

    try {
      // Check if location service is enabled
      final service = ref.read(locationServiceProvider);
      final serviceEnabled = await service.isLocationServiceEnabled();
      if (!mounted) return;

      if (!serviceEnabled) {
        setState(() {
          _isServiceDisabled = true;
          _errorMessage = 'Location services are disabled';
        });
        return;
      }

      // Check permission
      final permission = await controller.checkPermission();
      if (!mounted) return;

      if (permission == LocationPermissionStatus.granted) {
        await _completePostPermissionSetup();
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  Future<void> _requestPermission() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _isServiceDisabled = false;
    });

    final controller = ref.read(locationTrackingControllerProvider.notifier);

    try {
      final status = await controller.requestPermission();
      if (!mounted) return;

      if (status == LocationPermissionStatus.granted) {
        await _completePostPermissionSetup();
      } else if (status == LocationPermissionStatus.deniedForever) {
        setState(() {
          _errorMessage =
              'Location permission permanently denied. Please enable it in app settings.';
        });
      } else {
        setState(() {
          _errorMessage = 'Location permission is required to use this app.';
        });
      }
    } on LocationServiceDisabledException catch (e) {
      setState(() {
        _isServiceDisabled = true;
        _errorMessage = e.toString();
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  /// Runs everything that happens once location permission is confirmed
  /// granted — starting tracking and requesting the follow-on system
  /// permissions the new engine needs — exactly once at a time. See
  /// [_isCompletingSetup]'s doc comment for why the guard is needed: each
  /// step below can itself trigger a resume that re-enters this same
  /// method via [didChangeAppLifecycleState].
  Future<void> _completePostPermissionSetup() async {
    if (_isCompletingSetup) return;
    _isCompletingSetup = true;
    try {
      // Deliberately does NOT call
      // locationTrackingControllerProvider.notifier.startTracking() here
      // anymore — that opened LocationService's app-wide geolocator
      // "anchor" stream (running for the rest of the app's life), whose
      // only actual consumer was app_bar.dart's cosmetic tracking-active
      // dot (nothing reads its position data — confirmed by searching for
      // other consumers). Left running, it silently competed with any
      // other screen's own one-shot LocationService.getCurrentLocation()
      // call (e.g. geofence_override_request_screen.dart) for
      // geolocator_android's single shared native engine — the same class
      // of multi-stream-contention bug the flutter_background_geolocation
      // migration exists to eliminate, just recurring on a screen outside
      // that migration's scope. See the "Phase 3" plan.

      // Upgrades to background ("Allow all the time") location + motion/
      // activity-recognition authorization in one call — the plugin's own
      // requestPermission() (no explicit Permission passed) requests
      // everything its current config needs, using
      // BackgroundGeolocationService.configure's backgroundPermissionRationale
      // for the background-location step. The plain OS grant above only
      // gets "while using the app"; without this, pings after clock-in
      // would silently stop the moment the app backgrounds. A denial here
      // isn't fatal to this screen — foreground use still works — so it's
      // logged, not surfaced as an error.
      try {
        await ref.read(backgroundGeolocationServiceProvider).requestPermission();
      } catch (e) {
        developer.log(
          '[LocationPermissionScreen] background/motion permission not fully granted: $e',
          name: 'LocationPermissionScreen',
        );
      }

      await _requestBatteryOptimizationExemptionIfNeeded();
      await _requestFullScreenIntentPermissionIfNeeded();

      if (mounted) {
        context.go('/');
      }
    } finally {
      _isCompletingSetup = false;
    }
  }

  /// Requests the battery-optimization exemption, right after location
  /// permission is granted — the same screen has already explained why
  /// background tracking matters (BackgroundLocationDisclosure above), so
  /// this isn't an unprompted system dialog. Confirmed by device testing
  /// (on the old native engine, same underlying OS mechanism): without this
  /// exemption, background delivery can be throttled regardless of
  /// anything else the app does correctly — see
  /// BackgroundGeolocationService.requestBatteryOptimizationExemption.
  Future<void> _requestBatteryOptimizationExemptionIfNeeded() async {
    final service = ref.read(backgroundGeolocationServiceProvider);
    final alreadyExempt = await service.isIgnoringBatteryOptimizations();
    if (!alreadyExempt) {
      await service.requestBatteryOptimizationExemption();
    }
  }

  /// Android 14+ only (no-op on older versions): without this, the reboot
  /// reminder that nudges the agent to reopen the app after a device
  /// restart (see TrackingReminderScheduler) silently downgrades to a
  /// normal heads-up notification instead of taking over the screen. Same
  /// non-fatal, best-effort pattern as the battery-optimization request
  /// above — a denial here doesn't block using the app.
  Future<void> _requestFullScreenIntentPermissionIfNeeded() async {
    final service = ref.read(backgroundGeolocationServiceProvider);
    final alreadyGranted = await service.isFullScreenIntentPermissionGranted();
    if (!alreadyGranted) {
      await service.requestFullScreenIntentPermission();
    }
  }

  Future<void> _openSettings() async {
    final controller = ref.read(locationTrackingControllerProvider.notifier);
    await controller.openAppSettings();
  }

  Future<void> _openLocationSettings() async {
    final controller = ref.read(locationTrackingControllerProvider.notifier);
    await controller.openLocationSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PermissionHeader(isServiceDisabled: _isServiceDisabled),
              const SizedBox(height: 32),

              // Required disclosure: must be visible before the Android
              // location permission prompt is triggered below.
              if (!_isServiceDisabled) ...[
                const BackgroundLocationDisclosure(),
                const SizedBox(height: 24),
              ],

              // Error message
              if (_errorMessage != null) ...[
                ErrorBanner(message: _errorMessage!),
                const SizedBox(height: 24),
              ],

              // Permission benefits
              const FeatureItem(
                icon: Icons.pin_drop,
                title: 'Real-time Tracking',
                description: 'Track your location as you visit outlets',
              ),
              const SizedBox(height: 16),
              const FeatureItem(
                icon: Icons.verified_user,
                title: 'Verify Visits',
                description: 'Automatically verify outlet check-ins',
              ),
              const SizedBox(height: 16),
              const FeatureItem(
                icon: Icons.route,
                title: 'Route Optimization',
                description: 'Get optimized routes to nearby outlets',
              ),
              const SizedBox(height: 48),

              // Action buttons
              if (_isServiceDisabled)
                ServiceDisabledActions(
                  isLoading: _isLoading,
                  onOpenSettings: _openLocationSettings,
                  onRetry: _checkInitialStatus,
                )
              else
                PermissionRequestActions(
                  isLoading: _isLoading,
                  showOpenSettings:
                      _errorMessage != null &&
                      _errorMessage!.contains('permanently denied'),
                  onRequestPermission: _requestPermission,
                  onOpenSettings: _openSettings,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
