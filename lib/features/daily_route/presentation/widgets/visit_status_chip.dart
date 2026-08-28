import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../domain/entities/outlet_visit.dart';

/// A chip that displays the visit status with appropriate color coding.
class VisitStatusChip extends StatelessWidget {
  final VisitStatus status;
  final bool compact;

  const VisitStatusChip({
    super.key,
    required this.status,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final (color, bgColor, label) = _getStatusStyle();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 8 : 12,
        vertical: compact ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: compact ? 11 : 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  (Color, Color, String) _getStatusStyle() {
    switch (status) {
      case VisitStatus.pending:
        return (kTextMuted, kBackground, 'Pending');
      case VisitStatus.inProgress:
        return (kSecondaryColor, kSecondaryLightColor, 'In Progress');
      case VisitStatus.completed:
        return (kSuccessText, kSuccessBg, 'Completed');
      case VisitStatus.skipped:
        return (kWarningText, kWarningBg, 'Skipped');
    }
  }
}
