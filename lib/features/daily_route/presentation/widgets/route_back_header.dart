import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// Minimal in-content header used by pushed Daily Route sub-screens (Visit
/// Detail, Active Visit, Skipped Outlets) — a back chevron next to the
/// title, no app bar chrome and no bottom nav (those screens sit on top of
/// the Today's Route tab root, which owns the floating nav).
class RouteBackHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;
  final EdgeInsetsGeometry padding;

  const RouteBackHeader({
    super.key,
    required this.title,
    required this.onBack,
    this.padding = const EdgeInsets.fromLTRB(20, 20, 20, 14),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: const Icon(Icons.arrow_back, size: 18, color: kTextDark),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
