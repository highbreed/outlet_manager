import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_take_item.freezed.dart';

/// Item counting status
enum ItemCountStatus { inProgress, completed }

/// Domain entity for stock take item
@freezed
abstract class StockTakeItem with _$StockTakeItem {
  const factory StockTakeItem({
    required String localId,
    int? serverId,
    required String sessionLocalId,
    required int customerProductId,
    required int brandId,
    required String brandName,
    required String itemCode,
    required String itemName,
    String? itemDescription,
    String? category,
    String? modelNumber,
    required int serialCount,
    required int minStockLevel,
    required int maxStockLevel,
    required ItemCountStatus status,
    required DateTime startedAt,
    DateTime? completedAt,
    required DateTime updatedAt,
  }) = _StockTakeItem;

  const StockTakeItem._();

  bool get isCompleted => status == ItemCountStatus.completed;
  bool get isBelowMin => serialCount < minStockLevel;
  bool get isAboveMax => serialCount > maxStockLevel;
  bool get isInRange =>
      serialCount >= minStockLevel && serialCount <= maxStockLevel;

  String get statusDisplayName {
    switch (status) {
      case ItemCountStatus.inProgress:
        return 'In Progress';
      case ItemCountStatus.completed:
        return 'Completed';
    }
  }

  String get stockLevelStatus {
    if (isBelowMin) return 'Below Minimum';
    if (isAboveMax) return 'Above Maximum';
    return 'In Range';
  }

  /// Calculate how many units needed to reach max
  int get unitsToMax =>
      (maxStockLevel - serialCount).clamp(0, double.infinity).toInt();

  /// Calculate how many units needed to reach min
  int get unitsToMin =>
      (minStockLevel - serialCount).clamp(0, double.infinity).toInt();

  /// Progress percentage towards max level
  double get progressPercentage {
    if (maxStockLevel == 0) return 0;
    return (serialCount / maxStockLevel * 100).clamp(0, 100);
  }
}
