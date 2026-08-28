import 'package:freezed_annotation/freezed_annotation.dart';

import 'daily_sale.dart';

part 'daily_sales_page.freezed.dart';

/// A paginated page of [DailySale] results from `GET /daily-sales`.
@freezed
class DailySalesPage with _$DailySalesPage {
  const factory DailySalesPage({
    required List<DailySale> items,
    required int page,
    required int size,
    required int total,
    required int pages,
    required bool hasPrevious,
    required bool hasNext,
  }) = _DailySalesPage;
}
