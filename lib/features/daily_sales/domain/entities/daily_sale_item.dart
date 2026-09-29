import 'package:freezed_annotation/freezed_annotation.dart';

import 'sale_serial_number.dart';

part 'daily_sale_item.freezed.dart';

/// One product line within a daily sale.
@freezed
abstract class DailySaleItem with _$DailySaleItem {
  const factory DailySaleItem({
    required int id,
    required int dailySalesId,
    required String productCode,
    required String productName,
    required int quantity,

    /// Kept as returned by the API (decimal string, e.g. "15000.00").
    /// Can be "0.00" if the catalogue entry has no price set.
    required String unitPrice,
    required String totalPrice,
    @Default(<SaleSerialNumber>[]) List<SaleSerialNumber> serialNumbers,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DailySaleItem;

  const DailySaleItem._();

  double get unitPriceValue => double.tryParse(unitPrice) ?? 0;

  double get totalPriceValue => double.tryParse(totalPrice) ?? 0;

  /// Whether every unit sold on this line already has a serial recorded.
  bool get isFullySerialized => serialNumbers.length == quantity;

  int get remainingSerials => (quantity - serialNumbers.length).clamp(
    0,
    quantity,
  );
}
