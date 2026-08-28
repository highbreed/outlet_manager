import 'package:isar_community/isar.dart';

part 'item_group_model.g.dart';

@collection
class ItemGroupModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int serverId;

  @Index()
  late String code;

  late String name;

  late bool isActive;

  DateTime? syncedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  ItemGroupModel();

  /// Create from API JSON response
  factory ItemGroupModel.fromJson(Map<String, dynamic> json) {
    return ItemGroupModel()
      ..serverId = json['id'] as int
      ..code = json['code'] as String? ?? ''
      ..name = json['name'] as String? ?? ''
      ..isActive = json['is_active'] as bool? ?? true
      ..syncedAt = json['synced_at'] != null
          ? DateTime.parse(json['synced_at'] as String)
          : null
      ..createdAt = json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null
      ..updatedAt = json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null;
  }
}
