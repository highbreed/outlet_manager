import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import '../../../products/presentation/widgets/stock_status_badge.dart'
    show formatKes;
import '../../data/datasources/sales_performance_remote_datasource.dart';
import '../providers/sales_performance_providers.dart';

const _kMonthAbbrev = [
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
];

/// The full Summary tab card stack: achievement ring + gap/incentive, pace
/// to target, 6-month trend, contribution by category, and projected
/// outcome — matching the mock's stacked-card layout exactly (previously
/// one single card).
///
/// [performance.targetAmount] is a currency target the backend doesn't
/// return yet (see `SalesPerformanceResponse.targetAmount` doc) — the ring
/// card, pace card, and projected card only render their target-dependent
/// content once it's non-null; until then they fall back to the mock's own
/// "no target set" framing, which is a real, designed state, not a gap.
class PerformanceSummaryCard extends ConsumerWidget {
  final int year;
  final int month;
  final String? cardCode;
  final SalesPerformanceResponse performance;

  const PerformanceSummaryCard({
    super.key,
    required this.year,
    required this.month,
    required this.cardCode,
    required this.performance,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final previousAsync = ref.watch(
      previousMonthPerformanceProvider((year, month, cardCode)),
    );
    final trendAsync = ref.watch(
      sixMonthTrendProvider((year, month, cardCode)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _RingCard(
          performance: performance,
          previous: previousAsync.value,
          year: year,
          month: month,
        ),
        const SizedBox(height: 14),
        _PaceCard(performance: performance, year: year, month: month),
        const SizedBox(height: 14),
        _TrendCard(trendAsync: trendAsync, month: month),
        const SizedBox(height: 14),
        _ContributionCard(performance: performance),
        const SizedBox(height: 14),
        _ProjectedCard(performance: performance, year: year, month: month),
        const SizedBox(height: 14),
        const Text(
          'Works agent-wide, or scoped to the outlet above',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11, color: kTextFaint),
        ),
      ],
    );
  }
}

/// Days actually elapsed in [year]/[month] as of today, and days remaining
/// — real calendar math against the selected period, clamped so a past
/// period reads as fully elapsed and a future one doesn't go negative.
(int elapsed, int total, int left) _periodProgress(int year, int month) {
  final total = DateTime(year, month + 1, 0).day;
  final now = DateTime.now();
  final isCurrentMonth = now.year == year && now.month == month;
  final isPast =
      DateTime(year, month).isBefore(DateTime(now.year, now.month));
  final elapsed = isPast
      ? total
      : isCurrentMonth
      ? now.day.clamp(1, total)
      : 0;
  return (elapsed, total, (total - elapsed).clamp(0, total));
}

class _RingCard extends StatelessWidget {
  final SalesPerformanceResponse performance;
  final SalesPerformanceResponse? previous;
  final int year;
  final int month;

  const _RingCard({
    required this.performance,
    required this.previous,
    required this.year,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    final hasTargetAmount = performance.hasTargetAmount;
    final pct = performance.achievementPercentage;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: kBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 92,
                height: 92,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 92,
                      height: 92,
                      child: hasTargetAmount
                          ? CircularProgressIndicator(
                              value: pct != null ? (pct / 100).clamp(0, 1) : 0,
                              strokeWidth: 9,
                              backgroundColor: const Color(0xFFEFEFEC),
                              valueColor: const AlwaysStoppedAnimation(
                                kSecondaryColor,
                              ),
                            )
                          : CircularProgressIndicator(
                              value: 1,
                              strokeWidth: 2,
                              backgroundColor: kBorderColor,
                              valueColor: const AlwaysStoppedAnimation(
                                kBorderColor,
                              ),
                            ),
                    ),
                    Text(
                      hasTargetAmount
                          ? '${(pct ?? 0).toStringAsFixed(0)}%'
                          : '—',
                      style: TextStyle(
                        fontSize: hasTargetAmount ? 20 : 22,
                        fontWeight: FontWeight.w800,
                        color: hasTargetAmount ? kTextDark : kTextFaint,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: hasTargetAmount
                    ? _RingCardTargetContent(
                        performance: performance,
                        previous: previous,
                        year: year,
                        month: month,
                      )
                    : _RingCardNoTargetContent(performance: performance),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: Color(0xFFF0F0EE)),
          const SizedBox(height: 12),
          if (hasTargetAmount)
            Row(
              children: [
                Expanded(
                  child: _MiniStat(
                    label: 'GAP TO TARGET',
                    value: formatKes(
                      (performance.targetAmount! - performance.totalAmountSold)
                          .clamp(0, double.infinity),
                    ),
                  ),
                ),
                Expanded(
                  child: _MiniStat(
                    label: 'INCENTIVE EARNED',
                    value: formatKes(performance.totalIncentiveEarned),
                    valueColor: kSuccessColor,
                  ),
                ),
              ],
            )
          else
            Row(
              children: [
                Expanded(
                  child: _MiniStat(
                    label: 'VS LAST MONTH',
                    value: previous == null
                        ? '—'
                        : _deltaLabel(
                            performance.totalAmountSold -
                                previous!.totalAmountSold,
                          ),
                    valueColor:
                        previous != null &&
                            performance.totalAmountSold >=
                                previous!.totalAmountSold
                        ? kSuccessColor
                        : kRedColor,
                  ),
                ),
                Expanded(
                  child: _MiniStat(
                    label: 'INCENTIVE EARNED',
                    value: formatKes(performance.totalIncentiveEarned),
                    valueColor: kSuccessColor,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  static String _deltaLabel(double delta) {
    final arrow = delta >= 0 ? '↑' : '↓';
    return '$arrow ${formatKes(delta.abs())}';
  }
}

class _RingCardTargetContent extends StatelessWidget {
  final SalesPerformanceResponse performance;
  final SalesPerformanceResponse? previous;
  final int year;
  final int month;

  const _RingCardTargetContent({
    required this.performance,
    required this.previous,
    required this.year,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    final pct = performance.achievementPercentage ?? 0;
    final (elapsed, total, _) = _periodProgress(year, month);
    final expectedPct = total == 0 ? 0.0 : (elapsed / total) * 100;
    final onTrack = pct >= expectedPct;

    final prevPct = previous?.achievementPercentage;
    final ptsDelta = prevPct != null ? (pct - prevPct).round() : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              onTrack ? 'Target on track' : 'Behind pace',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: onTrack ? kSuccessText : kWarningText,
              ),
            ),
            if (ptsDelta != null) ...[
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: ptsDelta >= 0 ? kSuccessBg : kRedColor.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  '${ptsDelta >= 0 ? '↑' : '↓'} ${ptsDelta.abs()} pts vs ${_kMonthAbbrev[DateTime(year, month - 1).month - 1]}',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: ptsDelta >= 0 ? kSuccessText : kRedColor,
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 6),
        const Text('Target', style: TextStyle(fontSize: 12, color: kTextMuted)),
        Text(
          formatKes(performance.targetAmount!),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: kTextDark,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Sold so far',
          style: TextStyle(fontSize: 12, color: kTextMuted),
        ),
        Text(
          formatKes(performance.totalAmountSold),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: kTextDark,
          ),
        ),
      ],
    );
  }
}

class _RingCardNoTargetContent extends StatelessWidget {
  final SalesPerformanceResponse performance;

  const _RingCardNoTargetContent({required this.performance});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'No target set for this period',
          style: TextStyle(fontSize: 12, color: kTextFaint),
        ),
        const SizedBox(height: 8),
        const Text(
          'Amount sold',
          style: TextStyle(fontSize: 12, color: kTextMuted),
        ),
        Text(
          formatKes(performance.totalAmountSold),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: kTextDark,
          ),
        ),
      ],
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _MiniStat({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: kTextFaint),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: valueColor ?? kTextDark,
          ),
        ),
      ],
    );
  }
}

/// Current vs. needed run-rate to hit [SalesPerformanceResponse.targetAmount]
/// by the end of the period — real calendar math + real totals, only
/// rendered once a currency target exists.
class _PaceCard extends StatelessWidget {
  final SalesPerformanceResponse performance;
  final int year;
  final int month;

  const _PaceCard({
    required this.performance,
    required this.year,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    if (!performance.hasTargetAmount) return const SizedBox.shrink();

    final (elapsed, _, daysLeft) = _periodProgress(year, month);
    final gap = (performance.targetAmount! - performance.totalAmountSold)
        .clamp(0, double.infinity);
    final currentRate = elapsed > 0 ? performance.totalAmountSold / elapsed : 0.0;
    final neededRate = daysLeft > 0 ? gap / daysLeft : 0.0;
    final aheadOfPace = currentRate >= neededRate;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: kBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'PACE TO HIT TARGET',
                style: TextStyle(
                  fontSize: 11,
                  color: kTextFaint,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                daysLeft > 0 ? '$daysLeft days left' : 'Period ended',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: kSecondaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Current run-rate',
                      style: TextStyle(fontSize: 11, color: kTextMuted),
                    ),
                    Text(
                      '${formatKes(currentRate)}/day',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: kTextDark,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Needed to hit target',
                    style: TextStyle(fontSize: 11, color: kTextMuted),
                  ),
                  Text(
                    '${formatKes(neededRate)}/day',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: kWarningText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (daysLeft > 0) ...[
            const SizedBox(height: 8),
            Text(
              aheadOfPace
                  ? "You're ahead of the pace needed — keep it up"
                  : "You're behind the pace needed to hit target",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: aheadOfPace ? kSuccessText : kRedColor,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _TrendCard extends StatelessWidget {
  final AsyncValue<List<SalesPerformanceResponse>> trendAsync;
  final int month;

  const _TrendCard({required this.trendAsync, required this.month});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: kBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '6-MONTH TREND',
            style: TextStyle(
              fontSize: 11,
              color: kTextFaint,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          trendAsync.when(
            loading: () => const SizedBox(
              height: 64,
              child: Center(
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ),
            error: (_, _) => const SizedBox(
              height: 64,
              child: Center(
                child: Text(
                  'Unable to load trend',
                  style: TextStyle(fontSize: 12, color: kTextMuted),
                ),
              ),
            ),
            data: (months) {
              final maxAmount = months.fold<double>(
                0,
                (max, m) => m.totalAmountSold > max ? m.totalAmountSold : max,
              );
              return Column(
                children: [
                  SizedBox(
                    height: 64,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        for (var i = 0; i < months.length; i++)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              child: FractionallySizedBox(
                                heightFactor: maxAmount == 0
                                    ? 0.03
                                    : (months[i].totalAmountSold / maxAmount)
                                          .clamp(0.03, 1),
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: i == months.length - 1
                                        ? kSecondaryColor
                                        : const Color(0xFFEFEFEC),
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(6),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      for (var i = 0; i < months.length; i++)
                        Expanded(
                          child: Text(
                            _kMonthAbbrev[months[i].month - 1],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              color: i == months.length - 1
                                  ? kSecondaryColor
                                  : kTextFaint,
                              fontWeight: i == months.length - 1
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ContributionCard extends StatelessWidget {
  final SalesPerformanceResponse performance;

  const _ContributionCard({required this.performance});

  @override
  Widget build(BuildContext context) {
    if (performance.products.isEmpty) return const SizedBox.shrink();

    final byCategory = <String, double>{};
    for (final p in performance.products) {
      final key = (p.itemGroup1 == null || p.itemGroup1!.isEmpty)
          ? 'Uncategorized'
          : p.itemGroup1!;
      byCategory[key] = (byCategory[key] ?? 0) + p.amountSold;
    }
    final total = byCategory.values.fold(0.0, (s, v) => s + v);
    final entries = byCategory.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: kBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'CONTRIBUTION BY CATEGORY',
            style: TextStyle(
              fontSize: 11,
              color: kTextFaint,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < entries.length; i++) ...[
            if (i > 0) const SizedBox(height: 10),
            _CategoryBar(
              label: entries[i].key,
              amount: entries[i].value,
              fraction: total == 0 ? 0 : entries[i].value / total,
            ),
          ],
        ],
      ),
    );
  }
}

class _CategoryBar extends StatelessWidget {
  final String label;
  final double amount;
  final double fraction;

  const _CategoryBar({
    required this.label,
    required this.amount,
    required this.fraction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 12, color: kTextDark)),
            Text(
              '${formatKes(amount)} · ${(fraction * 100).toStringAsFixed(0)}%',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: fraction.clamp(0, 1),
            minHeight: 6,
            backgroundColor: const Color(0xFFEFEFEC),
            valueColor: const AlwaysStoppedAnimation(kSecondaryColor),
          ),
        ),
      ],
    );
  }
}

class _ProjectedCard extends StatelessWidget {
  final SalesPerformanceResponse performance;
  final int year;
  final int month;

  const _ProjectedCard({
    required this.performance,
    required this.year,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    if (!performance.hasTargetAmount) return const SizedBox.shrink();

    final (elapsed, total, _) = _periodProgress(year, month);
    if (elapsed == 0) return const SizedBox.shrink();

    final currentRate = performance.totalAmountSold / elapsed;
    final projected = currentRate * total;
    final target = performance.targetAmount!;
    final pct = target > 0 ? (projected / target) * 100 : 0.0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kSecondaryLightColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'PROJECTED AT THIS PACE',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: kSecondaryColor,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                '${formatKes(projected)} · ${pct.toStringAsFixed(0)}%',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: kSecondaryColor,
                ),
              ),
            ],
          ),
          const Icon(Icons.bar_chart, color: kSecondaryColor, size: 20),
        ],
      ),
    );
  }
}
