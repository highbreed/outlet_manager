import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// A circular progress indicator showing route completion progress.
class RouteProgressIndicator extends StatelessWidget {
  final double progress;
  final int completed;
  final int total;
  final double size;

  const RouteProgressIndicator({
    super.key,
    required this.progress,
    required this.completed,
    required this.total,
    this.size = 80,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background circle
          CircularProgressIndicator(
            value: 1.0,
            strokeWidth: 8,
            backgroundColor: Colors.transparent,
            valueColor: const AlwaysStoppedAnimation<Color>(kBorderColor),
          ),
          // Progress circle
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 8,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(
              progress >= 1.0 ? kSuccessColor : kSecondaryColor,
            ),
          ),
          // Center text
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$completed',
                  style: TextStyle(
                    fontSize: size * 0.25,
                    fontWeight: FontWeight.bold,
                    color: kTextDark,
                  ),
                ),
                Text(
                  'of $total',
                  style: TextStyle(fontSize: size * 0.15, color: kTextMuted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A linear progress bar for route completion.
class RouteProgressBar extends StatelessWidget {
  final double progress;
  final int completed;
  final int skipped;
  final int total;

  const RouteProgressBar({
    super.key,
    required this.progress,
    required this.completed,
    required this.skipped,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Progress bar
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: kBackground,
            valueColor: AlwaysStoppedAnimation<Color>(
              progress >= 1.0 ? kSuccessColor : kSecondaryColor,
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Stats row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$completed completed${skipped > 0 ? ', $skipped skipped' : ''}',
              style: const TextStyle(fontSize: 12, color: kTextMuted),
            ),
            Text(
              '$total total',
              style: const TextStyle(fontSize: 12, color: kTextMuted),
            ),
          ],
        ),
      ],
    );
  }
}
