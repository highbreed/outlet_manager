import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_cart_item.freezed.dart';

/// A draft line item in the in-progress sale cart, built from a barcode
/// scan or catalogue search before the sale is submitted.
///
/// This is UI-only state — it is never persisted, and only becomes a real
/// [DailySaleItem] once `POST /daily-sales` succeeds. [estimatedUnitPrice]
/// comes straight from the `GET /products` result used to resolve the
/// barcode/search match (VAT-inclusive, same convention as elsewhere in the
/// app) — the real price is only known once the server confirms the sale.
@freezed
class SaleCartItem with _$SaleCartItem {
  const factory SaleCartItem({
    required String barcode,
    required String productCode,
    required String productName,
    String? modelNumber,
    @Default(1) int quantity,
    double? estimatedUnitPrice,
  }) = _SaleCartItem;

  const SaleCartItem._();

  bool get hasEstimatedPrice =>
      estimatedUnitPrice != null && estimatedUnitPrice! > 0;

  double get estimatedLineTotal => (estimatedUnitPrice ?? 0) * quantity;
}
