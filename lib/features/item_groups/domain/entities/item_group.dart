import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_group.freezed.dart';

/// Domain entity for an Item Group (product category)
/// Used by both Shelf Share and Facings features
@freezed
class ItemGroup with _$ItemGroup {
  const factory ItemGroup({
    required int id,
    required String code,
    required String name,
    required bool isActive,
    DateTime? syncedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ItemGroup;

  const ItemGroup._();

  /// Display name for UI
  String get displayName => name.isNotEmpty ? name : code;
}
