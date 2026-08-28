import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../domain/entities/visit_schedule.dart';

/// Card displaying a single scheduled visit.
///
/// Shows outlet info, scheduled times, and priority.
class ScheduleCard extends StatelessWidget {
  final VisitSchedule schedule;
  final VoidCallback? onTap;

  const ScheduleCard({super.key, required this.schedule, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? Colors.grey[850] : Colors.white;
    final borderColor = isDark ? Colors.grey[700] : Colors.grey[200];
    final textColor = isDark ? Colors.white : kTextDark;
    final mutedColor = isDark ? Colors.grey[400] : kTextMuted;

    return Material(
      color: cardColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row with order number and priority
              Row(
                children: [
                  // Visit order badge
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        schedule.visitOrder.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: kSecondaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Outlet name
                  Expanded(
                    child: Text(
                      schedule.outletName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Priority indicator
                  _PriorityBadge(priority: schedule.visitPriority),
                ],
              ),
              const SizedBox(height: 8),

              // Outlet code
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  schedule.outletCode,
                  style: TextStyle(fontSize: 13, color: mutedColor),
                ),
              ),
              const SizedBox(height: 12),

              // Time and duration row
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    // Scheduled time
                    if (schedule.scheduledClockIn != null) ...[
                      Icon(Icons.schedule, size: 16, color: mutedColor),
                      const SizedBox(width: 4),
                      Text(
                        _formatTime(schedule.scheduledClockIn!),
                        style: TextStyle(fontSize: 13, color: textColor),
                      ),
                      if (schedule.scheduledClockOut != null) ...[
                        Text(' - ', style: TextStyle(color: mutedColor)),
                        Text(
                          _formatTime(schedule.scheduledClockOut!),
                          style: TextStyle(fontSize: 13, color: textColor),
                        ),
                      ],
                      const SizedBox(width: 16),
                    ],

                    // Duration
                    Icon(Icons.timelapse, size: 16, color: mutedColor),
                    const SizedBox(width: 4),
                    Text(
                      _formatDuration(schedule.allocatedMinutes),
                      style: TextStyle(fontSize: 13, color: textColor),
                    ),
                  ],
                ),
              ),

              // Address if available
              if (schedule.outletAddress != null &&
                  schedule.outletAddress!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: mutedColor),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          schedule.outletAddress!,
                          style: TextStyle(fontSize: 12, color: mutedColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(String time) {
    // Input: "09:00:00" or "09:00"
    final parts = time.split(':');
    if (parts.length < 2) return time;

    final hour = int.tryParse(parts[0]) ?? 0;
    final minute = parts[1];
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

    return '$displayHour:$minute $period';
  }

  String _formatDuration(int minutes) {
    if (minutes < 60) return '${minutes}min';
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    if (mins == 0) return '${hours}h';
    return '${hours}h ${mins}m';
  }
}

class _PriorityBadge extends StatelessWidget {
  final int priority;

  const _PriorityBadge({required this.priority});

  @override
  Widget build(BuildContext context) {
    final (color, label) = switch (priority) {
      1 => (kRedColor, 'High'),
      2 => (Colors.orange, 'Med'),
      _ => (kTextMuted, 'Low'),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
