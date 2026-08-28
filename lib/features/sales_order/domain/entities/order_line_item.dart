import 'product.dart';

/// A single line item on a sales order or quotation.
class OrderLineItem {
  final String localId; // client-side id (uuid)
  final int productId;
  final String productCode;
  final String productName;
  final String? modelNumber;
  final String uom;
  final int quantity;
  final double unitPrice;
  final double discountPercent; // 0..100

  const OrderLineItem({
    required this.localId,
    required this.productId,
    required this.productCode,
    required this.productName,
    this.modelNumber,
    required this.uom,
    required this.quantity,
    required this.unitPrice,
    this.discountPercent = 0,
  });

  /// Gross amount before discount
  double get gross => unitPrice * quantity;

  /// Discount amount in currency
  double get discountAmount => gross * (discountPercent / 100);

  /// Net line total after discount
  double get total => gross - discountAmount;

  OrderLineItem copyWith({
    int? quantity,
    double? unitPrice,
    double? discountPercent,
  }) => OrderLineItem(
    localId: localId,
    productId: productId,
    productCode: productCode,
    productName: productName,
    modelNumber: modelNumber,
    uom: uom,
    quantity: quantity ?? this.quantity,
    unitPrice: unitPrice ?? this.unitPrice,
    discountPercent: discountPercent ?? this.discountPercent,
  );

  factory OrderLineItem.fromProduct({
    required String localId,
    required SalesProduct product,
    int quantity = 1,
    double discountPercent = 0,
  }) => OrderLineItem(
    localId: localId,
    productId: product.id,
    productCode: product.code,
    productName: product.name,
    modelNumber: product.modelNumber,
    uom: product.uom,
    quantity: quantity,
    unitPrice: product.unitPrice,
    discountPercent: discountPercent,
  );
}
