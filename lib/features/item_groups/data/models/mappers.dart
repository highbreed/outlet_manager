import '../../domain/entities/item_group.dart';
import 'item_group_model.dart';

/// Extension to convert ItemGroupModel → ItemGroup entity
extension ItemGroupModelMapper on ItemGroupModel {
  ItemGroup toEntity() {
    return ItemGroup(
      id: serverId,
      code: code,
      name: name,
      isActive: isActive,
      syncedAt: syncedAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
