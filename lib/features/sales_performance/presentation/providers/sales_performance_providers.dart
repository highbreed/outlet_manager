import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../data/datasources/sales_performance_remote_datasource.dart';

final salesPerformanceRemoteDataSourceProvider =
    Provider<SalesPerformanceRemoteDataSource>((ref) {
      final dio = ref.watch(dioProvider);
      return SalesPerformanceRemoteDataSource(dio);
    });

/// The agent's own confirmed-sales performance for a given
/// `(year, month, cardCode)` — `cardCode == null` means all of the agent's
/// actively-assigned outlets combined.
final salesPerformanceProvider =
    FutureProvider.family<
      SalesPerformanceResponse,
      (int year, int month, String? cardCode)
    >((ref, args) async {
      final dataSource = ref.watch(salesPerformanceRemoteDataSourceProvider);
      try {
        return await dataSource.fetchMyPerformance(
          year: args.$1,
          month: args.$2,
          cardCode: args.$3,
        );
      } on NetworkException catch (e) {
        throw e.toFailure();
      }
    });

/// The same period one month back — used for the Summary tab's "vs last
/// month" comparison. Reuses [salesPerformanceProvider]'s own fetch so the
/// two stay in sync (same error handling, same underlying endpoint).
final previousMonthPerformanceProvider =
    FutureProvider.family<
      SalesPerformanceResponse,
      (int year, int month, String? cardCode)
    >((ref, args) {
      final previous = DateTime(args.$1, args.$2 - 1);
      return ref.watch(
        salesPerformanceProvider((previous.year, previous.month, args.$3)).future,
      );
    });

/// The trailing 6 months (5 prior + the selected one) for the Summary tab's
/// bar chart, oldest first. Issues 6 real calls to the same endpoint in
/// parallel rather than fabricating a trend from a single period.
final sixMonthTrendProvider =
    FutureProvider.family<
      List<SalesPerformanceResponse>,
      (int year, int month, String? cardCode)
    >((ref, args) async {
      final months = [
        for (var i = 5; i >= 0; i--) DateTime(args.$1, args.$2 - i),
      ];
      return Future.wait([
        for (final m in months)
          ref.watch(
            salesPerformanceProvider((m.year, m.month, args.$3)).future,
          ),
      ]);
    });
