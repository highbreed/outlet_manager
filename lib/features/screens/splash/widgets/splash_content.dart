import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';

/// Splash content widget with app branding
class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          isDark ? Assets.logoWhite : Assets.logoBlack,
          height: 120,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            // Fallback to icon if image fails to load
            return Icon(
              Icons.store,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            );
          },
        ),
        const SizedBox(height: 24),
        const CircularProgressIndicator(),
      ],
    );
  }
}
