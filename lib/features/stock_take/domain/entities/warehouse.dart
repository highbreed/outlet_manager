import 'package:freezed_annotation/freezed_annotation.dart';

part 'warehouse.freezed.dart';

/// Warehouse type enumeration
enum WarehouseType { display, backStore }

/// Domain entity for warehouse
@freezed
class Warehouse with _$Warehouse {
  const factory Warehouse({
    required int id,
    required String warehouseName,
    required String warehouseCode,
    String? sapWarehouseCode,
    required WarehouseType warehouseType,
    String? location,
    required bool isActive,
  }) = _Warehouse;

  const Warehouse._();

  bool get isDisplay => warehouseType == WarehouseType.display;
  bool get isBackStore => warehouseType == WarehouseType.backStore;

  String get typeDisplayName {
    switch (warehouseType) {
      case WarehouseType.display:
        return 'Display Warehouse';
      case WarehouseType.backStore:
        return 'Back Store';
    }
  }
}
