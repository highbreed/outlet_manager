import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// Widget showing geofence status and distance from outlet.
class GeofenceStatusWidget extends StatelessWidget {
  final double distanceMeters;
  final double requiredRadius;
  final bool isLoading;
  final String? error;

  const GeofenceStatusWidget({
    super.key,
    required this.distanceMeters,
    required this.requiredRadius,
    this.isLoading = false,
    this.error,
  });

  bool get isWithinGeofence => distanceMeters <= requiredRadius;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const _StatusContainer(
        icon: Icons.location_searching,
        color: kTextMuted,
        bg: kBackground,
        message: 'Getting your location...',
        isLoading: true,
      );
    }

    if (error != null) {
      return _StatusContainer(
        icon: Icons.location_off,
        color: kRedColor,
        bg: kRedColor.withValues(alpha: 0.08),
        message: error!,
      );
    }

    if (isWithinGeofence) {
      return _StatusContainer(
        icon: Icons.check_circle,
        color: kSuccessText,
        bg: kSuccessBg,
        message: 'You are within the allowed outlet area',
        subtitle: 'Ready to clock in · ${_formatDistance(distanceMeters)}',
      );
    }

    return _StatusContainer(
      icon: Icons.location_off,
      color: kWarningText,
      bg: kWarningBg,
      message: 'You are ${_formatDistance(distanceMeters)} from the outlet',
      subtitle: 'Required: within ${_formatDistance(requiredRadius)}',
    );
  }

  String _formatDistance(double meters) {
    if (meters < 1000) {
      return '${meters.round()}m';
    }
    return '${(meters / 1000).toStringAsFixed(1)}km';
  }
}

class _StatusContainer extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color bg;
  final String message;
  final String? subtitle;
  final bool isLoading;

  const _StatusContainer({
    required this.icon,
    required this.color,
    required this.bg,
    required this.message,
    this.subtitle,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          if (isLoading)
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            )
          else
            Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: TextStyle(
                    color: color,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    style: TextStyle(color: color.withValues(alpha: 0.8), fontSize: 12),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
