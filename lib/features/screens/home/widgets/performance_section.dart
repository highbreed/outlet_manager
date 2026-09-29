import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/metric_card.dart';
import '../providers/home_performance_provider.dart';

/// Home screen's summary stat row — real data throughout (see
/// [homePerformanceProvider]), no new backend endpoint needed. Third tile
/// matches the mock's two variants: Target (no active visit) vs Orders
/// (active visit).
class PerformanceSection extends ConsumerWidget {
  final bool hasActiveVisit;

  const PerformanceSection({super.key, this.hasActiveVisit = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(homePerformanceProvider).value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Performance',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: MetricCard(
                label: 'Visits',
                value: stats == null
                    ? '0/0'
                    : '${stats.visitsCompleted}/${stats.visitsTotal}',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MetricCard(
                label: 'Sales',
                value: stats == null
                    ? '0'
                    : formatCompactAmount(stats.todaysSalesTotal),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: hasActiveVisit
                  ? MetricCard(
                      label: 'Orders',
                      value: '${stats?.todaysOrdersCount ?? 0}',
                    )
                  : MetricCard(
                      label: 'Target',
                      value: stats?.targetPercent != null
                          ? '${stats!.targetPercent!.toStringAsFixed(0)}%'
                          : '—',
                      valueColor: kSecondaryColor,
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
