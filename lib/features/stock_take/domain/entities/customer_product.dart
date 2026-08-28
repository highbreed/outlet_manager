import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_product.freezed.dart';

/// Domain entity for customer product catalogue item
@freezed
class CustomerProduct with _$CustomerProduct {
  const factory CustomerProduct({
    required int id,
    required int customerId,
    required int brandId,
    required String brandName,
    required String itemCode,
    required String itemName,
    String? itemDescription,

    /// Product barcode (EAN/UPC) for scanning
    String? barcode,

    /// Product categorization
    String? itemGroup,
    String? modelNumber,
    String? productStatus,
    required int approvalStatus,
    // Min/Max levels (uses effective values)
    required int minOnshelfQty,
    required int maxOnshelfQty,
    required int minBackstoreQty,
    required int maxBackstoreQty,
    required bool isActive,
  }) = _CustomerProduct;

  const CustomerProduct._();

  /// Display name for UI
  String get displayName => itemName;

  /// Check if product has valid min/max levels
  bool get hasStockLevels => maxOnshelfQty > 0 || maxBackstoreQty > 0;

  /// Check if product has a barcode for scanning
  bool get hasBarcode => barcode != null && barcode!.isNotEmpty;
}
