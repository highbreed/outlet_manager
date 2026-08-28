import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/theme/colors.dart';
import '../../../daily_route/providers/daily_route_providers.dart';
import '../providers/products_providers.dart';
import 'outlet_gate.dart';
import 'section_card.dart';
import 'stock_status_badge.dart' show formatKes;

const _kBucketColors = [
  kSuccessColor,
  Color(0xFF9CCC65),
  kWarningColor,
  Color(0xFFEF5350),
  kRedColor,
];

/// Shows how long the outlet's current stock of this item has been sitting,
/// as a donut chart across 30/60/90/120/121+ day buckets. Requires an
/// active visit — `card_code` is required server-side.
class StockAgeingCard extends ConsumerWidget {
  final String itemCode;

  const StockAgeingCard({super.key, required this.itemCode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeVisit = ref.watch(activeVisitProvider);
    if (activeVisit == null) {
      return const ClockInPlaceholder(title: 'Stock Ageing');
    }

    final args = (itemCode, activeVisit.outletCode);
    final ageingAsync = ref.watch(stockAgeingProvider(args));

    return ageingAsync.when(
      loading: () => const SectionCard(
        title: 'Stock Ageing',
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
        title: 'Stock Ageing',
        child: Row(
          children: [
            Expanded(
              child: Text(
                error is Failure
                    ? error.displayMessage
                    : 'Unable to load stock ageing',
                style: const TextStyle(fontSize: 13, color: kTextMuted),
              ),
            ),
            TextButton(
              onPressed: () => ref.invalidate(stockAgeingProvider(args)),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
      data: (row) {
        if (row == null || row.totalQty <= 0) {
          return const SectionCard(
            title: 'Stock Ageing',
            child: Text(
              'No ageing data for this product.',
              style: TextStyle(fontSize: 13, color: kTextMuted),
            ),
          );
        }

        final buckets = <(String, int, double)>[
          ('0-30 days', row.bucket0to30Qty, row.bucket0to30Value),
          ('31-60 days', row.bucket31to60Qty, row.bucket31to60Value),
          ('61-90 days', row.bucket61to90Qty, row.bucket61to90Value),
          ('91-120 days', row.bucket91to120Qty, row.bucket91to120Value),
          ('121+ days', row.bucketAbove121Qty, row.bucketAbove121Value),
        ];

        return SectionCard(
          title: 'Stock Ageing',
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 108,
                height: 108,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 2,
                        centerSpaceRadius: 32,
                        sections: [
                          for (var i = 0; i < buckets.length; i++)
                            if (buckets[i].$2 > 0)
                              PieChartSectionData(
                                value: buckets[i].$2.toDouble(),
                                color: _kBucketColors[i],
                                showTitle: false,
                                radius: 22,
                              ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${row.totalQty}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: kTextDark,
                          ),
                        ),
                        const Text(
                          'units',
                          style: TextStyle(fontSize: 10, color: kTextMuted),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < buckets.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: _LegendRow(
                          color: _kBucketColors[i],
                          label: buckets[i].$1,
                          qty: buckets[i].$2,
                          value: buckets[i].$3,
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

class _LegendRow extends StatelessWidget {
  final Color color;
  final String label;
  final int qty;
  final double value;

  const _LegendRow({
    required this.color,
    required this.label,
    required this.qty,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 11, color: kTextDark),
          ),
        ),
        Text(
          qty > 0 ? '$qty · ${formatKes(value)}' : '0',
          style: const TextStyle(fontSize: 10, color: kTextMuted),
        ),
      ],
    );
  }
}
