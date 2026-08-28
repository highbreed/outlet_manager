import 'package:isar_community/isar.dart';

import 'daily_sale_item_embedded.dart';

part 'daily_sale_model.g.dart';

/// Local read-cache of a [DailySale] as last seen from the server.
///
/// This mirrors server state only — it is written after every successful
/// create/confirm/cancel/get/list call, and read from when offline, but it
/// is never itself the source of truth for a mutation (see
/// [DailySalesRepositoryImpl]).
@collection
class DailySaleModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int serverId;

  @Index()
  late int outletId;

  late int userId;
  late String customerName;
  String? customerPhone;
  late double totalAmount;
  late int totalItems;

  @Index()
  late DateTime saleDate;

  /// One of DailySaleStatus enum names: pending | confirmed | cancelled
  @Index()
  late String status;

  List<DailySaleItemEmbedded> items = [];

  DateTime? createdAt;
  DateTime? updatedAt;
  String? proofOfPurchasePath;

  /// When this row was last written from a server response.
  late DateTime cachedAt;

  DailySaleModel();

  /// Create from a `DailySalesResponse` (create/get/confirm/cancel/list item).
  factory DailySaleModel.fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List<dynamic>? ?? [])
        .map(
          (item) =>
              DailySaleItemEmbedded.fromJson(item as Map<String, dynamic>),
        )
        .toList();

    return DailySaleModel()
      ..serverId = json['id'] as int
      ..outletId = json['outlet_id'] as int
      ..userId = json['user_id'] as int
      ..customerName = json['customer_name'] as String
      ..customerPhone = json['customer_phone'] as String?
      ..totalAmount =
          double.tryParse(json['total_amount']?.toString() ?? '') ?? 0
      ..totalItems = json['total_items'] as int? ?? 0
      ..saleDate = DateTime.parse(json['sale_date'] as String)
      ..status = json['status'] as String
      ..items = items
      ..createdAt = json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null
      ..updatedAt = json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null
      ..proofOfPurchasePath = json['proof_of_purchase_path'] as String?
      ..cachedAt = DateTime.now();
  }
}
