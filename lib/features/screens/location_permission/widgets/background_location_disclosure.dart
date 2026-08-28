import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// Prominent in-app disclosure explaining background location collection.
///
/// Google Play policy requires this to be shown to the user before the
/// Android runtime location permission prompt appears. Do not remove or
/// reword without checking the Play Console "Background location" data
/// safety declaration this text matches.
class BackgroundLocationDisclosure extends StatelessWidget {
  const BackgroundLocationDisclosure({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWarningBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kWarningColor.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.privacy_tip_outlined, color: kWarningColor),
              const SizedBox(width: 8),
              Text(
                'Background Location Disclosure',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: kWarningText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Outlet Manager collects location data to enable field '
            'representative location tracking even when the app is closed '
            'or not in use. Location is used during working hours to track '
            'movement between assigned outlets and verify field activities.',
            style: theme.textTheme.bodyMedium?.copyWith(color: kWarningText),
          ),
        ],
      ),
    );
  }
}
