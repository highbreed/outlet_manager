import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import 'section_card.dart';

/// Placeholder shown in place of an outlet-scoped section (sell-out, sales
/// target, alternatives, add-competitor-SKU, report-not-selling) when the
/// rep isn't currently clocked in to an outlet.
class ClockInPlaceholder extends StatelessWidget {
  final String title;
  final String message;

  const ClockInPlaceholder({
    super.key,
    required this.title,
    this.message = 'Clock in to an outlet to see this.',
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: title,
      child: Row(
        children: [
          const Icon(Icons.storefront_outlined, size: 18, color: kRedColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 13,
                color: kRedColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
