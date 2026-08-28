import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/theme/colors.dart';
import '../../../daily_route/providers/daily_route_providers.dart';
import '../providers/products_providers.dart';
import 'outlet_gate.dart';
import 'section_card.dart';

const _kMonthAbbrev = [
  'J',
  'F',
  'M',
  'A',
  'M',
  'J',
  'J',
  'A',
  'S',
  'O',
  'N',
  'D',
];

/// This year's monthly sell-out history for the product at the rep's
/// currently clocked-in outlet. Requires an active visit — the endpoint has
/// no outlet-less fallback.
class SellOutCard extends ConsumerWidget {
  final String itemCode;

  const SellOutCard({super.key, required this.itemCode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeVisit = ref.watch(activeVisitProvider);
    if (activeVisit == null) {
      return const ClockInPlaceholder(title: 'Sell-out History');
    }

    final args = (activeVisit.outletCode, itemCode);
    final sellOutAsync = ref.watch(sellOutHistoryProvider(args));

    return sellOutAsync.when(
      loading: () => const SectionCard(
        title: 'Sell-out History',
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
        title: 'Sell-out History',
        child: Row(
          children: [
            Expanded(
              child: Text(
                error is Failure
                    ? error.displayMessage
                    : 'Unable to load sell-out history',
                style: const TextStyle(fontSize: 13, color: kTextMuted),
              ),
            ),
            TextButton(
              onPressed: () => ref.invalidate(sellOutHistoryProvider(args)),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
      data: (history) {
        final maxQty = history.months.fold<int>(
          0,
          (max, m) => m.qty > max ? m.qty : max,
        );

        return SectionCard(
          title: 'Sell-out History (${history.year})',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total ${history.totalQty} · Avg ${history.averageMonthlyQty.toStringAsFixed(1)}/mo',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: kTextDark,
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 90,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (final month in history.months)
                      Expanded(
                        child: _MonthBar(
                          qty: month.qty,
                          fraction: maxQty == 0 ? 0 : month.qty / maxQty,
                          label: _kMonthAbbrev[(month.month - 1).clamp(0, 11)],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MonthBar extends StatelessWidget {
  final int qty;
  final double fraction;
  final String label;

  const _MonthBar({required this.qty, required this.fraction, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (qty > 0)
            Text(
              '$qty',
              style: const TextStyle(fontSize: 9, color: kTextMuted),
            ),
          const SizedBox(height: 2),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: fraction.clamp(0.03, 1),
                child: Container(
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 9, color: kTextMuted),
          ),
        ],
      ),
    );
  }
}
