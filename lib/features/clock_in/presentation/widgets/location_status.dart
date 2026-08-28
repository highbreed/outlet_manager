import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// Status indicator for GPS signal quality
class GpsStatusIndicator extends StatelessWidget {
  final double? accuracy;
  final bool isLoading;

  const GpsStatusIndicator({super.key, this.accuracy, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _StatusChip(
        icon: Icons.gps_not_fixed,
        label: accuracy != null
            ? 'Improving accuracy… ${accuracy!.toStringAsFixed(0)}m'
            : 'Acquiring GPS…',
        color: kTextMuted,
        isLoading: true,
      );
    }

    if (accuracy == null) {
      return const _StatusChip(
        icon: Icons.gps_off,
        label: 'GPS unavailable',
        color: kRedColor,
      );
    }

    if (accuracy! <= 40) {
      return _StatusChip(
        icon: Icons.gps_fixed,
        label: '${accuracy!.toStringAsFixed(0)}m accuracy',
        color: Colors.green,
      );
    } else if (accuracy! <= 120) {
      return _StatusChip(
        icon: Icons.gps_fixed,
        label: '${accuracy!.toStringAsFixed(0)}m accuracy',
        color: Colors.green.shade700,
      );
    } else if (accuracy! <= 200) {
      return _StatusChip(
        icon: Icons.gps_not_fixed,
        label: '${accuracy!.toStringAsFixed(0)}m accuracy',
        color: Colors.orange,
      );
    } else {
      return _StatusChip(
        icon: Icons.gps_not_fixed,
        label: '${accuracy!.toStringAsFixed(0)}m - Low accuracy',
        color: kRedColor,
      );
    }
  }
}

class _StatusChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool isLoading;

  const _StatusChip({
    required this.icon,
    required this.label,
    required this.color,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLoading)
            SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(strokeWidth: 2, color: color),
            )
          else
            Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

/// Geofence status indicator
class GeofenceStatusIndicator extends StatelessWidget {
  final bool isInsideGeofence;
  final double? distanceToCenter;

  const GeofenceStatusIndicator({
    super.key,
    required this.isInsideGeofence,
    this.distanceToCenter,
  });

  @override
  Widget build(BuildContext context) {
    if (isInsideGeofence) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, size: 16, color: Colors.green),
            const SizedBox(width: 6),
            Text(
              distanceToCenter != null
                  ? 'Inside (${distanceToCenter!.toStringAsFixed(0)}m)'
                  : 'Inside geofence',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: kRedColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kRedColor.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.warning_amber, size: 16, color: kRedColor),
          const SizedBox(width: 6),
          Text(
            distanceToCenter != null
                ? 'Outside (${distanceToCenter!.toStringAsFixed(0)}m away)'
                : 'Outside geofence',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: kRedColor,
            ),
          ),
        ],
      ),
    );
  }
}
