import 'package:isar_community/isar.dart';

part 'warehouse_model.g.dart';

/// Warehouse types for stock storage locations
enum WarehouseType {
  display, // On-shelf/display inventory
  backStore, // Back room/storage inventory
}

/// Cached warehouse data for offline access
@collection
class WarehouseModel {
  Id id = Isar.autoIncrement;

  @Index()
  late int serverId; // Backend warehouse ID

  late String warehouseName;
  late String warehouseCode;
  String? sapWarehouseCode;

  @Enumerated(EnumType.name)
  late WarehouseType warehouseType; // display or backStore

  String? location;
  late bool isActive;

  DateTime cachedAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  WarehouseModel();

  /// Create from API response
  factory WarehouseModel.fromJson(Map<String, dynamic> json) {
    return WarehouseModel()
      ..serverId = json['id'] as int
      ..warehouseName = json['warehouse_name'] as String
      ..warehouseCode = json['warehouse_code'] as String
      ..sapWarehouseCode = json['sap_warehouse_code'] as String?
      ..warehouseType = _parseWarehouseType(json['warehouse_type'] as String)
      ..location = json['location'] as String?
      ..isActive = json['is_active'] as bool? ?? true
      ..cachedAt = DateTime.now()
      ..updatedAt = DateTime.now();
  }

  /// Convert to JSON for API requests
  Map<String, dynamic> toJson() {
    return {
      'id': serverId,
      'warehouse_name': warehouseName,
      'warehouse_code': warehouseCode,
      'sap_warehouse_code': sapWarehouseCode,
      'warehouse_type': _warehouseTypeToString(warehouseType),
      'location': location,
      'is_active': isActive,
    };
  }

  /// Parse warehouse type from backend string
  static WarehouseType _parseWarehouseType(String type) {
    switch (type.toLowerCase()) {
      case 'display':
        return WarehouseType.display;
      case 'back_store':
      case 'backstore':
        return WarehouseType.backStore;
      default:
        throw ArgumentError('Unknown warehouse type: $type');
    }
  }

  /// Convert warehouse type to backend string
  static String _warehouseTypeToString(WarehouseType type) {
    switch (type) {
      case WarehouseType.display:
        return 'display';
      case WarehouseType.backStore:
        return 'back_store';
    }
  }

  bool get isDisplay => warehouseType == WarehouseType.display;
  bool get isBackStore => warehouseType == WarehouseType.backStore;
}
