/// Stock availability buckets, computed from a product's live per-warehouse
/// total (see `ProductStockDetail.totalAvailable`) — the catalogue list
/// endpoint itself never returns stock levels.
enum StockStatus { inStock, lowStock, outOfStock }

/// A product from the company catalogue (`GET /products`).
class Product {
  final String code;
  final String name;
  final String? category;
  final String? subGroup2;
  final String? subGroup3;
  final String? brand;
  final String? modelNumber;
  final String? barcode;
  final String? description;
  final String? productStatus; // e.g. "EOL Discounted", "NEW REPL Prod"
  final String uom; // unit of measure (e.g. PCS, BOX)
  final double unitPrice;
  final double incentiveAmount;

  const Product({
    required this.code,
    required this.name,
    this.category,
    this.subGroup2,
    this.subGroup3,
    this.brand,
    this.modelNumber,
    this.barcode,
    this.description,
    this.productStatus,
    this.uom = 'PCS',
    this.unitPrice = 0,
    this.incentiveAmount = 0,
  });

  /// Quantity at or below which a product is considered low on stock.
  static const int lowStockThreshold = 5;

  static double _toDouble(dynamic value) {
    if (value == null) return 0;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0;
    return 0;
  }

  /// Maps a `GET /products` item to the domain model.
  factory Product.fromApiJson(Map<String, dynamic> json) {
    return Product(
      code: json['item_code'] as String? ?? '',
      name: json['item_description'] as String? ?? '',
      category: json['item_group1'] as String?,
      subGroup2: json['item_group2'] as String?,
      subGroup3: json['item_group3'] as String?,
      brand: json['brand'] as String?,
      modelNumber: json['model_no'] as String?,
      barcode: json['barcode'] as String?,
      productStatus: json['status'] as String?,
      uom: json['uom'] as String? ?? 'PCS',
      unitPrice: _toDouble(json['regular_price']),
      incentiveAmount: _toDouble(json['incentive_amount']),
    );
  }
}
