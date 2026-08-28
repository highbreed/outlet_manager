import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../domain/entities/outlet_visit.dart';
import 'visit_status_chip.dart';

/// A card displaying an outlet visit summary with modern, spacious design.
class VisitCard extends StatelessWidget {
  final OutletVisit visit;
  final VoidCallback? onTap;
  final bool showSchedule;
  final bool isActive;

  const VisitCard({
    super.key,
    required this.visit,
    this.onTap,
    this.showSchedule = true,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final displayName = visit.outletName.isNotEmpty
        ? visit.outletName
        : 'Outlet #${visit.visitOrder}';
    final displayCode = visit.outletCode.isNotEmpty
        ? visit.outletCode
        : 'ID: ${visit.outletId}';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? kSecondaryColor : kBorderColor,
          width: isActive ? 2 : 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: Order number, Name, and Status
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Visit order badge - larger and more prominent
                    _buildOrderBadge(),
                    const SizedBox(width: 14),
                    // Outlet info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            displayName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kTextDark,
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.tag, size: 14, color: kTextFaint),
                              const SizedBox(width: 4),
                              Text(
                                displayCode,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: kTextMuted,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                // Status row with schedule info
                _buildStatusRow(),

                // Clock in/out times if completed or in progress
                if (visit.actualClockIn != null) ...[
                  const SizedBox(height: 14),
                  _buildTimingInfo(),
                ],

                // Skip reason if skipped
                if (visit.status == VisitStatus.skipped &&
                    visit.skipReasonCode != null) ...[
                  const SizedBox(height: 14),
                  _buildSkipInfo(),
                ],

                // Action hint for pending visits
                if (visit.status == VisitStatus.pending && onTap != null) ...[
                  const SizedBox(height: 14),
                  _buildActionHint(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderBadge() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: _getOrderBadgeColor(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          '${visit.visitOrder}',
          style: TextStyle(
            color: _getOrderTextColor(),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: kBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Status chip
          VisitStatusChip(status: visit.status, compact: false),
          const Spacer(),
          // Schedule time if available
          if (showSchedule && visit.scheduledClockIn != null) ...[
            const Icon(Icons.schedule_outlined, size: 16, color: kTextFaint),
            const SizedBox(width: 6),
            Text(
              _formatSchedule(),
              style: const TextStyle(
                fontSize: 13,
                color: kTextMuted,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (visit.allocatedMinutes > 0) ...[
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: kSecondaryLightColor,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  '${visit.allocatedMinutes}m',
                  style: const TextStyle(
                    fontSize: 11,
                    color: kSecondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }

  Widget _buildTimingInfo() {
    final isCompleted = visit.status == VisitStatus.completed;
    final backgroundColor = isCompleted ? kSuccessBg : kSecondaryLightColor;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Clock in
          Expanded(
            child: _buildTimeItem(
              icon: Icons.login_rounded,
              label: 'Clocked In',
              time: _formatTime(visit.actualClockIn!),
              color: kSecondaryColor,
            ),
          ),
          if (visit.actualClockOut != null) ...[
            Container(
              width: 1,
              height: 36,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              color: kBorderColor,
            ),
            // Clock out
            Expanded(
              child: _buildTimeItem(
                icon: Icons.logout_rounded,
                label: 'Clocked Out',
                time: _formatTime(visit.actualClockOut!),
                color: kSuccessColor,
              ),
            ),
            // Duration badge
            if (visit.visitDurationMins != null)
              Container(
                margin: const EdgeInsets.only(left: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: kSuccessColor,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  '${visit.visitDurationMins}m',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: kTextLight,
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildTimeItem({
    required IconData icon,
    required String label,
    required String time,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: color.withValues(alpha: 0.8),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          time,
          style: TextStyle(
            fontSize: 15,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildSkipInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kWarningBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: kWarningColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.skip_next_rounded,
              size: 18,
              color: kWarningText,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Skipped',
                  style: TextStyle(
                    fontSize: 11,
                    color: kWarningText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  visit.skipReasonCode!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: kWarningText,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionHint() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: kSecondaryLightColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.touch_app_outlined, size: 18, color: kSecondaryColor),
          SizedBox(width: 8),
          Text(
            'Tap to start visit',
            style: TextStyle(
              fontSize: 13,
              color: kSecondaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward_rounded, size: 18, color: kSecondaryColor),
        ],
      ),
    );
  }

  Color _getOrderBadgeColor() {
    switch (visit.status) {
      case VisitStatus.pending:
        return kBackground;
      case VisitStatus.inProgress:
        return kSecondaryLightColor;
      case VisitStatus.completed:
        return kSuccessBg;
      case VisitStatus.skipped:
        return kWarningBg;
    }
  }

  Color _getOrderTextColor() {
    switch (visit.status) {
      case VisitStatus.pending:
        return kTextMuted;
      case VisitStatus.inProgress:
        return kSecondaryColor;
      case VisitStatus.completed:
        return kSuccessText;
      case VisitStatus.skipped:
        return kWarningText;
    }
  }

  String _formatSchedule() {
    if (visit.scheduledClockIn == null) return '';
    final start = visit.scheduledClockIn!;
    if (visit.scheduledClockOut != null) {
      final end = visit.scheduledClockOut!;
      return '$start - $end';
    }
    return start;
  }

  String _formatTime(DateTime time) {
    final hour = time.hour;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final hour12 = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$hour12:$minute $period';
  }
}
