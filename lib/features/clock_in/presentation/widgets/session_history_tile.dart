import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../domain/entities/clock_in_session.dart';
import 'session_timer.dart';

/// List tile for displaying session history
class SessionHistoryTile extends StatelessWidget {
  final ClockInSession session;
  final VoidCallback? onTap;

  const SessionHistoryTile({super.key, required this.session, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Status indicator
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _getStatusColor(session.status).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getStatusIcon(session.status),
                  color: _getStatusColor(session.status),
                ),
              ),
              const SizedBox(width: 12),

              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      session.outletName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatDate(session.clockedInAt),
                      style: const TextStyle(color: kTextMuted, fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _StatusBadge(status: session.status),
                        if (session.isDeviation) ...[
                          const SizedBox(width: 8),
                          const _DeviationBadge(),
                        ],
                        if (session.hasOrder == true) ...[
                          const SizedBox(width: 8),
                          const _OrderBadge(),
                        ],
                      ],
                    ),
                  ],
                ),
              ),

              // Duration
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CompactTimer(
                    startTime: session.clockedInAt,
                    endTime: session.clockedOutAt,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatTime(session.clockedInAt),
                    style: const TextStyle(color: kTextMuted, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(ClockInStatus status) {
    switch (status) {
      case ClockInStatus.active:
        return kSecondaryColor;
      case ClockInStatus.completed:
        return Colors.green;
      case ClockInStatus.autoClockOut:
        return Colors.orange;
    }
  }

  IconData _getStatusIcon(ClockInStatus status) {
    switch (status) {
      case ClockInStatus.active:
        return Icons.timer;
      case ClockInStatus.completed:
        return Icons.check_circle;
      case ClockInStatus.autoClockOut:
        return Icons.warning_amber;
    }
  }

  String _formatDate(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final date = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (date == today) {
      return 'Today';
    } else if (date == today.subtract(const Duration(days: 1))) {
      return 'Yesterday';
    }

    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${dateTime.day} ${months[dateTime.month - 1]}';
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

class _StatusBadge extends StatelessWidget {
  final ClockInStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      ClockInStatus.active => kSecondaryColor,
      ClockInStatus.completed => Colors.green,
      ClockInStatus.autoClockOut => Colors.orange,
    };

    final label = switch (status) {
      ClockInStatus.active => 'Active',
      ClockInStatus.completed => 'Completed',
      ClockInStatus.autoClockOut => 'Auto',
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
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

class _DeviationBadge extends StatelessWidget {
  const _DeviationBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: kSecondaryColor2,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        'DEV',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: kTextDark,
        ),
      ),
    );
  }
}

class _OrderBadge extends StatelessWidget {
  const _OrderBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.shopping_cart, size: 10, color: Colors.green),
          SizedBox(width: 2),
          Text(
            'Order',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
