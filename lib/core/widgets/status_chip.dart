import 'package:flutter/material.dart';

import '../theme/colors.dart';

enum StatusChipVariant { success, warning, danger, info, neutral }

/// Small pill-shaped status label (e.g. "Completed", "Pending", "Rejected")
/// using the redesign's semantic color tokens instead of ad hoc hex literals.
class StatusChip extends StatelessWidget {
  final String label;
  final StatusChipVariant variant;

  const StatusChip({
    super.key,
    required this.label,
    this.variant = StatusChipVariant.neutral,
  });

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = switch (variant) {
      StatusChipVariant.success => (kSuccessBg, kSuccessText),
      StatusChipVariant.warning => (kWarningBg, kWarningText),
      StatusChipVariant.danger => (kRedColor.withValues(alpha: 0.1), kRedColor),
      StatusChipVariant.info => (kSecondaryLightColor, kSecondaryColor),
      StatusChipVariant.neutral => (kBackground, kTextMuted),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(999)),
      child: Text(
        label,
        style: TextStyle(color: fg, fontSize: 11, fontWeight: FontWeight.w700),
      ),
    );
  }
}
