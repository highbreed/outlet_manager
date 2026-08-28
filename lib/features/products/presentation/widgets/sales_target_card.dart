import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/theme/colors.dart';
import '../../../daily_route/providers/daily_route_providers.dart';
import '../providers/products_providers.dart';
import 'outlet_gate.dart';
import 'section_card.dart';

/// This month's sales target for the product at the rep's currently
/// clocked-in outlet. Requires an active visit.
class SalesTargetCard extends ConsumerWidget {
  final String itemCode;

  const SalesTargetCard({super.key, required this.itemCode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeVisit = ref.watch(activeVisitProvider);
    if (activeVisit == null) {
      return const ClockInPlaceholder(title: 'Sales Target');
    }

    final args = (activeVisit.outletCode, itemCode);
    final targetAsync = ref.watch(salesTargetProvider(args));

    return targetAsync.when(
      loading: () => const SectionCard(
        title: 'Sales Target',
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        ),
      ),
      error: (error, _) => SectionCard(
        title: 'Sales Target',
        child: Row(
          children: [
            Expanded(
              child: Text(
                error is Failure
                    ? error.displayMessage
                    : 'Unable to load sales target',
                style: const TextStyle(fontSize: 13, color: kTextMuted),
              ),
            ),
            TextButton(
              onPressed: () => ref.invalidate(salesTargetProvider(args)),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
      data: (target) {
        if (target == null) {
          return const SectionCard(
            title: 'Sales Target',
            child: Text(
              'No target set for this outlet this month.',
              style: TextStyle(fontSize: 13, color: kTextMuted),
            ),
          );
        }

        return SectionCard(
          title: 'Sales Target',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${target.targetQty}',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: kTextDark,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Text(
                      'units target this month',
                      style: TextStyle(fontSize: 13, color: kTextMuted),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                target.isManuallySet
                    ? 'Manually set target'
                    : 'System-estimated target',
                style: const TextStyle(fontSize: 11, color: kTextMuted),
              ),
            ],
          ),
        );
      },
    );
  }
}
