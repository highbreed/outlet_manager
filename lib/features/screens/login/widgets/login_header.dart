import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/utils/assets.dart';

/// Header widget for the login screen with app branding
class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Image.asset(
          isDark ? Assets.logoWhite : Assets.logoBlack,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            // Fallback to icon if image fails to load
            return Icon(
              Icons.store,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            );
          },
        ),
        const SizedBox(height: 24),
        Text(
          'Sign in to continue',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: kTextMuted),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
