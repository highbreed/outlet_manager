import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// Header section for location permission screen
class PermissionHeader extends StatelessWidget {
  final bool isServiceDisabled;

  const PermissionHeader({super.key, required this.isServiceDisabled});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 100,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(height: 32),
        Text(
          'Location Access Required',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          isServiceDisabled
              ? 'Please enable location services on your device to continue.'
              : 'This app requires access to your location to track outlet visits and verify your position in real-time.',
          style: theme.textTheme.bodyLarge?.copyWith(color: kTextMuted),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
