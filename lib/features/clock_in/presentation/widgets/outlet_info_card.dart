import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// Card displaying outlet information for clock-in
class OutletInfoCard extends StatelessWidget {
  final String outletName;
  final String outletCode;
  final int allocatedMinutes;
  final double? distanceMeters;
  final bool isDeviation;
  final bool isSelected;
  final VoidCallback? onTap;

  const OutletInfoCard({
    super.key,
    required this.outletName,
    required this.outletCode,
    required this.allocatedMinutes,
    this.distanceMeters,
    this.isDeviation = false,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isSelected
            ? const BorderSide(color: kSecondaryColor, width: 2)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kSecondaryLightColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.store,
                      color: kSecondaryColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          outletName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kTextDark,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          outletCode,
                          style: const TextStyle(
                            fontSize: 13,
                            color: kTextMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isDeviation)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: kSecondaryColor2,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'DEVIATION',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: kTextDark,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(height: 1),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _InfoChip(
                    icon: Icons.timer_outlined,
                    label: '${allocatedMinutes}min',
                  ),
                  if (distanceMeters != null)
                    _InfoChip(
                      icon: Icons.near_me,
                      label: _formatDistance(distanceMeters!),
                      color: distanceMeters! <= 50
                          ? Colors.green
                          : distanceMeters! <= 100
                          ? Colors.orange
                          : kRedColor,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDistance(double meters) {
    if (meters >= 1000) {
      return '${(meters / 1000).toStringAsFixed(1)}km';
    }
    return '${meters.toStringAsFixed(0)}m';
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;

  const _InfoChip({required this.icon, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: color ?? kTextMuted),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: color ?? kTextMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

/// Compact outlet info for active session display
class ActiveSessionOutletInfo extends StatelessWidget {
  final String outletName;
  final String outletCode;
  final bool isDeviation;

  const ActiveSessionOutletInfo({
    super.key,
    required this.outletName,
    required this.outletCode,
    this.isDeviation = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.store, color: kSecondaryColor, size: 20),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              outletName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kTextDark,
              ),
            ),
            Text(
              outletCode,
              style: const TextStyle(fontSize: 13, color: kTextMuted),
            ),
          ],
        ),
        if (isDeviation) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: kSecondaryColor2,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'DEV',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: kTextDark,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
