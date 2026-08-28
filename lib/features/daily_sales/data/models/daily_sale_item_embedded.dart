import 'package:isar_community/isar.dart';

part 'daily_sale_item_embedded.g.dart';

/// Embedded (non-collection) cache of one [DailySaleItem] line within a
/// [DailySaleModel].
@embedded
class DailySaleItemEmbedded {
  int serverId = 0;
  int dailySalesId = 0;
  String productCode = '';
  String productName = '';
  int quantity = 0;
  double unitPrice = 0;
  double totalPrice = 0;
  List<String> serialNumbers = const [];

  DailySaleItemEmbedded();

  /// Create from a `DailySalesResponse.items[]` entry.
  factory DailySaleItemEmbedded.fromJson(Map<String, dynamic> json) {
    final serials = (json['serial_numbers'] as List<dynamic>? ?? [])
        .map((s) => (s as Map<String, dynamic>)['serial_number'] as String)
        .toList();

    return DailySaleItemEmbedded()
      ..serverId = json['id'] as int
      ..dailySalesId = json['daily_sales_id'] as int
      ..productCode = json['product_code'] as String
      ..productName = json['product_name'] as String
      ..quantity = json['quantity'] as int
      ..unitPrice = double.tryParse(json['unit_price']?.toString() ?? '') ?? 0
      ..totalPrice =
          double.tryParse(json['total_price']?.toString() ?? '') ?? 0
      ..serialNumbers = serials;
  }
}
