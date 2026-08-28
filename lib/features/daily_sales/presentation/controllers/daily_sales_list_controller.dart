import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../providers/usecase_providers.dart';

part 'daily_sales_list_controller.g.dart';

/// Currently selected status filter tab on the daily sales home screen.
/// `null` means "all statuses".
@riverpod
class DailySalesStatusFilter extends _$DailySalesStatusFilter {
  @override
  DailySaleStatus? build() => null;

  void set(DailySaleStatus? status) => state = status;
}

/// Loads today's sales for a given outlet, re-fetching whenever the status
/// filter changes.
@riverpod
class DailySalesListController extends _$DailySalesListController {
  @override
  Future<DailySalesPage> build(int outletId) async {
    final status = ref.watch(dailySalesStatusFilterProvider);
    final usecase = await ref.watch(getDailySalesProvider.future);

    final result = await usecase(
      GetDailySalesParams(outletId: outletId, status: status, size: 100),
    );

    return result.fold((failure) => throw failure, (page) => page);
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
