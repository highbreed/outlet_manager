class SalesProduct {
  final int id;
  final String code;
  final String name;
  final String? category;
  final String? modelNumber;
  final String? barcode;
  final String? description;
  final String? brand;
  final String uom; // unit of measure (e.g. PCS, BOX)
  final double unitPrice;
  final int stockOnHand;

  const SalesProduct({
    required this.id,
    required this.code,
    required this.name,
    this.category,
    this.modelNumber,
    this.barcode,
    this.description,
    this.brand,
    this.uom = 'PCS',
    required this.unitPrice,
    this.stockOnHand = 0,
  });

  static double _toDouble(dynamic value) {
    if (value == null) return 0;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0;
    return 0;
  }

  static int _toInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  /// Maps `/sales/products` payload to domain model.
  factory SalesProduct.fromApiJson(Map<String, dynamic> json, {int id = 0}) {
    return SalesProduct(
      id: id,
      code: json['item_code'] as String? ?? '',
      name: json['item_name'] as String? ?? '',
      category: json['category'] as String?,
      modelNumber: json['model_number'] as String?,
      barcode: json['barcode'] as String?,
      brand: json['brand'] as String?,
      unitPrice: _toDouble(json['unit_price']),
      stockOnHand: _toInt(json['quantity']),
    );
  }
}
