import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';

/// Mandatory gate (Android 14+ only — the router redirect never reaches
/// this screen on older Android or iOS, since
/// [BackgroundGeolocationService.isFullScreenIntentPermissionGranted]
/// always reports `true` there) for the "Full screen intents" system
/// permission.
///
/// Without it, [TrackingReminderScheduler] (native Kotlin)'s reboot
/// reminder — which nudges the agent to reopen the app after a device
/// restart, since tracking otherwise silently stops once Doze engages —
/// downgrades from a full-screen alarm to an easily-missed heads-up
/// notification. Treated the same as location permission itself: this app
/// depends on background tracking working reliably enough that we block
/// use entirely rather than let it degrade silently.
class FullScreenIntentPermissionScreen extends ConsumerStatefulWidget {
  const FullScreenIntentPermissionScreen({super.key});

  @override
  ConsumerState<FullScreenIntentPermissionScreen> createState() =>
      _FullScreenIntentPermissionScreenState();
}

class _FullScreenIntentPermissionScreenState
    extends ConsumerState<FullScreenIntentPermissionScreen> {
  bool _isLoading = false;

  Future<void> _openSettings() async {
    setState(() => _isLoading = true);
    try {
      await ref
          .read(backgroundGeolocationServiceProvider)
          .requestFullScreenIntentPermission();
    } finally {
      // No manual navigation on return — fullScreenIntentPermissionGrantedProvider
      // polls every 5s and the router redirects to home as soon as it sees
      // the grant, same as the location-permission screen's flow.
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.notifications_active_outlined,
                size: 100,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 32),
              Text(
                'Full-Screen Alerts Required',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'If your device restarts while you\'re clocked in to an '
                'outlet, location tracking silently stops until the app is '
                'reopened. Outlet Manager needs permission to show a '
                'full-screen alert so you notice and can reopen it right '
                'away, instead of tracking staying off for the rest of '
                'your shift.',
                style: theme.textTheme.bodyLarge?.copyWith(color: kTextMuted),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _isLoading ? null : _openSettings,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Open Settings'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
