class ComplaintProduct {
  final String itemCode;
  final String itemName;
  final String brandName;
  final String? modelNumber;
  final String? barcode;
  final String? itemGroup;

  const ComplaintProduct({
    required this.itemCode,
    required this.itemName,
    required this.brandName,
    this.modelNumber,
    this.barcode,
    this.itemGroup,
  });

  factory ComplaintProduct.fromJson(Map<String, dynamic> json) =>
      ComplaintProduct(
        itemCode: json['item_code'] as String? ?? '',
        itemName: json['item_name'] as String? ?? '',
        brandName: json['brand'] as String? ?? '',
        modelNumber: json['model_number'] as String?,
        barcode: json['barcode'] as String?,
        itemGroup: json['item_group'] as String?,
      );
}
