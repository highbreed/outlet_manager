import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../daily_route/domain/entities/outlet_visit.dart';
import '../../../daily_route/providers/daily_route_providers.dart';
import '../../../daily_sales/domain/usecases/usecases.dart';
import '../../../daily_sales/presentation/providers/usecase_providers.dart';
import '../../../sales_order/presentation/providers/sales_order_providers.dart';
import '../../../sales_performance/presentation/providers/sales_performance_providers.dart';

/// Home's Performance stat row — all real, already-available data, no new
/// backend endpoint: today's visit progress (from the same route data
/// `RouteStatusCard` uses), today's confirmed Daily Sales total (agent-wide,
/// same unscoped fetch as Recent Activity), today's Sales Orders count
/// (in-memory, real for the current app session), and this month's real
/// sales-target achievement percentage (the only "target" concept that
/// actually exists anywhere in the app — inherently monthly, not daily).
class HomePerformanceStats {
  final int visitsCompleted;
  final int visitsTotal;
  final double todaysSalesTotal;
  final int todaysOrdersCount;
  final double? targetPercent;

  const HomePerformanceStats({
    required this.visitsCompleted,
    required this.visitsTotal,
    required this.todaysSalesTotal,
    required this.todaysOrdersCount,
    required this.targetPercent,
  });
}

final homePerformanceProvider =
    FutureProvider.autoDispose<HomePerformanceStats>((ref) async {
      final now = DateTime.now();
      final todayStart = DateTime(now.year, now.month, now.day);

      final visits = ref.watch(visitListProvider);
      final visitsCompleted = visits
          .where((v) => v.status == VisitStatus.completed)
          .length;

      double todaysSalesTotal = 0;
      try {
        final usecase = await ref.watch(getDailySalesProvider.future);
        final result = await usecase(const GetDailySalesParams(size: 50));
        result.fold((_) {}, (page) {
          for (final sale in page.items) {
            if (!sale.isConfirmed) continue;
            final createdAt = sale.createdAt?.toLocal();
            if (createdAt == null || createdAt.isBefore(todayStart)) continue;
            todaysSalesTotal += sale.totalAmountValue;
          }
        });
      } catch (_) {
        // Best-effort — a failed fetch just leaves this tile at 0, not a
        // broken Home.
      }

      final todaysOrdersCount = ref
          .watch(salesOrdersProvider)
          .where((o) => !o.createdAt.toLocal().isBefore(todayStart))
          .length;

      double? targetPercent;
      try {
        final performance = await ref.watch(
          salesPerformanceProvider((now.year, now.month, null)).future,
        );
        targetPercent = performance.achievementPercentage;
      } catch (_) {
        // No target this month, or the fetch failed — tile falls back to
        // its existing "no data" rendering rather than a fabricated number.
      }

      return HomePerformanceStats(
        visitsCompleted: visitsCompleted,
        visitsTotal: visits.length,
        todaysSalesTotal: todaysSalesTotal,
        todaysOrdersCount: todaysOrdersCount,
        targetPercent: targetPercent,
      );
    });

/// Compact "184.5K" / "1.2M" style formatting for the tight MetricCard
/// tile — full-precision currency belongs on detail screens, not here.
String formatCompactAmount(double value) {
  if (value >= 1000000) {
    return '${(value / 1000000).toStringAsFixed(1)}M';
  }
  if (value >= 1000) {
    return '${(value / 1000).toStringAsFixed(1)}K';
  }
  return value.toStringAsFixed(0);
}
