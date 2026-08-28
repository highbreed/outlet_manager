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

      if (!serviceEnabled) {
        setState(() {
          _isServiceDisabled = true;
          _errorMessage = 'Location services are disabled';
        });
        return;
      }

      // Check permission
      final permission = await controller.checkPermission();

      if (permission == LocationPermissionStatus.granted) {
        // Start tracking immediately
        await controller.startTracking();

        // Permission already granted, navigate to home
        if (mounted) {
          context.go('/');
        }
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

      if (status == LocationPermissionStatus.granted) {
        // Start tracking immediately
        await controller.startTracking();

        if (mounted) {
          context.go('/');
        }
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
