import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// Action buttons for location service disabled state
class ServiceDisabledActions extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onOpenSettings;
  final VoidCallback onRetry;

  const ServiceDisabledActions({
    super.key,
    required this.isLoading,
    required this.onOpenSettings,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          onPressed: isLoading ? null : onOpenSettings,
          icon: const Icon(Icons.settings),
          label: const Text('Enable Location Services'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        const SizedBox(height: 12),
        TextButton(
          onPressed: onRetry,
          child: const Text("I've Enabled Location Services"),
        ),
      ],
    );
  }
}

/// Action buttons for requesting location permission
class PermissionRequestActions extends StatelessWidget {
  final bool isLoading;
  final bool showOpenSettings;
  final VoidCallback onRequestPermission;
  final VoidCallback onOpenSettings;

  const PermissionRequestActions({
    super.key,
    required this.isLoading,
    required this.showOpenSettings,
    required this.onRequestPermission,
    required this.onOpenSettings,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          onPressed: isLoading ? null : onRequestPermission,
          icon: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: kTextLight,
                  ),
                )
              : const Icon(Icons.location_on),
          label: Text(
            isLoading ? 'Requesting...' : 'Grant Location Permission',
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        if (showOpenSettings) ...[
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: onOpenSettings,
            icon: const Icon(Icons.settings),
            label: const Text('Open Settings'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ],
      ],
    );
  }
}
