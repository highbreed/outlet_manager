import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../domain/entities/daily_route.dart';

/// A banner that displays the current route status.
class RouteStatusBanner extends StatelessWidget {
  final DailyRouteStatus status;
  final VoidCallback? onTap;

  const RouteStatusBanner({super.key, required this.status, this.onTap});

  @override
  Widget build(BuildContext context) {
    final (color, bgColor, icon, message) = _getStatusStyle();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: color,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (onTap != null)
              Icon(Icons.chevron_right, color: color, size: 20),
          ],
        ),
      ),
    );
  }

  (Color, Color, IconData, String) _getStatusStyle() {
    switch (status) {
      case DailyRouteStatus.pending:
        return (
          kTextMuted,
          kBackground,
          Icons.edit_outlined,
          'Route is pending activation',
        );
      case DailyRouteStatus.activated:
        return (
          kSecondaryColor,
          kSecondaryLightColor,
          Icons.play_circle_outline,
          'Route activated - ready to start visits',
        );
      case DailyRouteStatus.inProgress:
        return (
          kSecondaryColor,
          kSecondaryLightColor,
          Icons.directions_walk,
          'Route in progress',
        );
      case DailyRouteStatus.closed:
        return (
          kSuccessText,
          kSuccessBg,
          Icons.check_circle_outline,
          'Route closed',
        );
      case DailyRouteStatus.forceClosed:
        return (
          kWarningText,
          kWarningBg,
          Icons.warning_amber_outlined,
          'Route was force closed',
        );
    }
  }
}
