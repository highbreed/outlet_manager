import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../daily_route/providers/daily_route_providers.dart';
import '../../../daily_sales/domain/usecases/usecases.dart';
import '../../../daily_sales/presentation/providers/usecase_providers.dart';
import '../../../stock_take/presentation/providers/stock_take_providers.dart';

enum ActivityType { stockTake, dailySale, clockIn, clockOut }

/// One row in Home's Recent Activity feed — always built from a real,
/// already-timestamped event (a completed stock take session, a submitted
/// daily sale, or a visit clock-in/out), never fabricated.
class ActivityItem {
  final ActivityType type;
  final String moduleLabel;
  final String outletName;
  final String statusLabel;
  final DateTime timestamp;

  const ActivityItem({
    required this.type,
    required this.moduleLabel,
    required this.outletName,
    required this.statusLabel,
    required this.timestamp,
  });
}

/// Merges today's real activity across three sources — agent-wide Stock
/// Take completions (`GET /visits/routes/today/sessions`), agent-wide
/// Daily Sales submissions (unscoped `GET /daily-sales`, filtered
/// client-side to today), and today's route visits' clock-in/out
/// timestamps — sorted newest-first. Each source is best-effort: a failure
/// fetching one doesn't block the others or blank out the whole section.
final recentActivityProvider = FutureProvider.autoDispose<List<ActivityItem>>((
  ref,
) async {
  final now = DateTime.now();
  final todayStart = DateTime(now.year, now.month, now.day);

  final visits = ref.watch(visitListProvider);
  final outletNameById = {for (final v in visits) v.outletId: v.outletName};

  final items = <ActivityItem>[];

  for (final visit in visits) {
    final clockIn = visit.actualClockIn?.toLocal();
    if (clockIn != null && !clockIn.isBefore(todayStart)) {
      items.add(
        ActivityItem(
          type: ActivityType.clockIn,
          moduleLabel: 'Visit',
          outletName: visit.outletName,
          statusLabel: 'Clocked in',
          timestamp: clockIn,
        ),
      );
    }
    final clockOut = visit.actualClockOut?.toLocal();
    if (clockOut != null && !clockOut.isBefore(todayStart)) {
      items.add(
        ActivityItem(
          type: ActivityType.clockOut,
          moduleLabel: 'Visit',
          outletName: visit.outletName,
          statusLabel: 'Clocked out',
          timestamp: clockOut,
        ),
      );
    }
  }

  try {
    final dataSource = ref.watch(stockTakeRemoteDataSourceProvider);
    final sessions = await dataSource.getTodaysSessions();
    for (final session in sessions) {
      if (session['status'] != 'completed') continue;
      final completedAt = DateTime.tryParse(
        session['completed_at'] as String? ?? '',
      )?.toLocal();
      if (completedAt == null || completedAt.isBefore(todayStart)) continue;
      items.add(
        ActivityItem(
          type: ActivityType.stockTake,
          moduleLabel: 'Stock Take',
          outletName: session['outlet_name'] as String? ?? 'Outlet',
          statusLabel: 'Completed',
          timestamp: completedAt,
        ),
      );
    }
  } catch (_) {
    // Best-effort — a failed fetch just means fewer rows, not a broken Home.
  }

  try {
    final usecase = await ref.watch(getDailySalesProvider.future);
    final result = await usecase(const GetDailySalesParams(size: 50));
    result.fold((_) {}, (page) {
      for (final sale in page.items) {
        final createdAt = sale.createdAt?.toLocal();
        if (createdAt == null || createdAt.isBefore(todayStart)) continue;
        items.add(
          ActivityItem(
            type: ActivityType.dailySale,
            moduleLabel: 'Daily Sales',
            outletName:
                outletNameById[sale.outletId.toString()] ?? sale.customerName,
            statusLabel: 'Submitted',
            timestamp: createdAt,
          ),
        );
      }
    });
  } catch (_) {
    // Best-effort, same as above.
  }

  items.sort((a, b) => b.timestamp.compareTo(a.timestamp));
  return items.take(6).toList();
});
