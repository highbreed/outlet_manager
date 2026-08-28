import 'package:isar_community/isar.dart';

import '../models/item_group_model.dart';

/// Local data source for Item Groups using Isar
class ItemGroupLocalDataSource {
  final Isar _isar;

  const ItemGroupLocalDataSource(this._isar);

  /// Cache a list of item groups (upsert by serverId)
  Future<void> cacheItemGroups(List<ItemGroupModel> groups) async {
    await _isar.writeTxn(() async {
      for (final group in groups) {
        final existing = await _isar.itemGroupModels
            .filter()
            .serverIdEqualTo(group.serverId)
            .findFirst();
        if (existing != null) {
          group.id = existing.id;
        }
        group.syncedAt = DateTime.now();
      }
      await _isar.itemGroupModels.putAll(groups);
    });
    print('[ItemGroupLocalDS] Cached ${groups.length} item groups');
  }

  /// Get all cached item groups, optionally filtered by search
  Future<List<ItemGroupModel>> getCachedItemGroups({String? search}) async {
    var query = _isar.itemGroupModels.filter().isActiveEqualTo(true);

    if (search != null && search.isNotEmpty) {
      query = query.group(
        (q) => q
            .nameContains(search, caseSensitive: false)
            .or()
            .codeContains(search, caseSensitive: false),
      );
    }

    return await query.sortByName().findAll();
  }

  /// Get a single cached item group by server ID
  Future<ItemGroupModel?> getByServerId(int serverId) async {
    return await _isar.itemGroupModels
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();
  }

  /// Clear all cached item groups
  Future<void> clearCache() async {
    await _isar.writeTxn(() async {
      await _isar.itemGroupModels.clear();
    });
    print('[ItemGroupLocalDS] Cache cleared');
  }

  /// Get count of cached item groups
  Future<int> getCachedCount() async {
    return await _isar.itemGroupModels.count();
  }
}
