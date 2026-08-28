import 'package:isar_community/isar.dart';
import 'stock_take_session_model.dart' show SyncState;

part 'stock_take_item_model.g.dart';

/// Item counting status
enum ItemCountStatus { inProgress, completed }

/// Product item within a stock take session
@collection
class StockTakeItemModel {
  Id id = Isar.autoIncrement;

  @Index()
  late String localId; // UUID

  int? serverId; // Backend item ID

  @Index()
  late String sessionLocalId; // FK to StockTakeSession

  late int customerProductId; // Product catalogue ID
  late int brandId; // Product brand ID
  late String brandName;

  late String itemCode; // SAP item code
  late String itemName;
  String? itemDescription;
  String? category;
  String? modelNumber; // Product model number for display

  late int serialCount; // Count of serials for this item

  late int minStockLevel; // From catalogue
  late int maxStockLevel;

  @Enumerated(EnumType.name)
  late ItemCountStatus status; // inProgress, completed

  DateTime startedAt = DateTime.now();
  DateTime? completedAt;
  DateTime updatedAt = DateTime.now();

  @Index()
  @Enumerated(EnumType.name)
  late SyncState syncState;

  String? syncError;

  StockTakeItemModel();

  /// Create new local item
  factory StockTakeItemModel.create({
    required String localId,
    required String sessionLocalId,
    required int customerProductId,
    required int brandId,
    required String brandName,
    required String itemCode,
    required String itemName,
    String? itemDescription,
    String? category,
    required int minStockLevel,
    required int maxStockLevel,
  }) {
    final now = DateTime.now();
    return StockTakeItemModel()
      ..localId = localId
      ..sessionLocalId = sessionLocalId
      ..customerProductId = customerProductId
      ..brandId = brandId
      ..brandName = brandName
      ..itemCode = itemCode
      ..itemName = itemName
      ..itemDescription = itemDescription
      ..category = category
      ..modelNumber = null
      ..serialCount = 0
      ..minStockLevel = minStockLevel
      ..maxStockLevel = maxStockLevel
      ..status = ItemCountStatus.inProgress
      ..startedAt = now
      ..updatedAt = now
      ..syncState = SyncState.pending;
  }

  /// Create from API response
  factory StockTakeItemModel.fromJson(Map<String, dynamic> json) {
    return StockTakeItemModel()
      ..serverId = json['id'] as int
      ..localId = json['local_id'] as String? ?? ''
      ..customerProductId = json['customer_product_id'] as int
      ..brandId = json['brand_id'] as int? ?? 0
      ..brandName = json['brand_name'] as String? ?? ''
      ..itemCode = json['item_code'] as String
      ..itemName = json['item_name'] as String
      ..itemDescription = json['item_description'] as String?
      ..category = json['category'] as String?
      ..modelNumber = json['model_number'] as String?
      ..serialCount = json['counted_quantity'] as int? ?? 0
      ..minStockLevel = json['min_stock_level'] as int? ?? 0
      ..maxStockLevel = json['max_stock_level'] as int? ?? 0
      ..status = json['status'] == 'completed'
          ? ItemCountStatus.completed
          : ItemCountStatus.inProgress
      ..startedAt = json['started_at'] != null
          ? DateTime.parse(json['started_at'] as String)
          : DateTime.now()
      ..completedAt = json['completed_at'] != null
          ? DateTime.parse(json['completed_at'] as String)
          : null
      ..updatedAt = DateTime.now()
      ..syncState = SyncState.synced;
  }

  /// Convert to JSON for API requests
  Map<String, dynamic> toJson() {
    return {
      if (serverId != null) 'id': serverId,
      'local_id': localId,
      'customer_product_id': customerProductId,
    };
  }

  bool get isCompleted => status == ItemCountStatus.completed;
  bool get isBelowMin => serialCount < minStockLevel;
  bool get isAboveMax => serialCount > maxStockLevel;
  bool get isInRange =>
      serialCount >= minStockLevel && serialCount <= maxStockLevel;
}
