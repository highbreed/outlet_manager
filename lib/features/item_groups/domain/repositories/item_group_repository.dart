import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/item_group.dart';

/// Abstract repository interface for Item Groups
abstract class ItemGroupRepository {
  /// Fetch item groups from API (with caching)
  /// Falls back to cached data if offline
  Future<Either<Failure, List<ItemGroup>>> getItemGroups({
    String? search,
    int page = 1,
    int size = 50,
  });

  /// Get a single item group by ID
  Future<Either<Failure, ItemGroup>> getItemGroupById(int id);

  /// Get item groups from local cache only
  Future<Either<Failure, List<ItemGroup>>> getCachedItemGroups({
    String? search,
  });
}
