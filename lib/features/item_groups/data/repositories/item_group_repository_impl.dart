import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../domain/entities/item_group.dart';
import '../../domain/repositories/item_group_repository.dart';
import '../datasources/item_group_local_datasource.dart';
import '../datasources/item_group_remote_datasource.dart';
import '../models/item_group_model.dart';
import '../models/mappers.dart';

/// Offline-first implementation of [ItemGroupRepository]
class ItemGroupRepositoryImpl implements ItemGroupRepository {
  final ItemGroupLocalDataSource _localDataSource;
  final ItemGroupRemoteDataSource _remoteDataSource;

  ItemGroupRepositoryImpl({
    required ItemGroupLocalDataSource localDataSource,
    required ItemGroupRemoteDataSource remoteDataSource,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, List<ItemGroup>>> getItemGroups({
    String? search,
    int page = 1,
    int size = 50,
  }) async {
    try {
      // Try remote first
      final response = await _remoteDataSource.getItemGroups(
        search: search,
        page: page,
        size: size,
      );

      final items =
          (response['items'] as List<dynamic>?)
              ?.map((e) => ItemGroupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

      // Cache the results
      if (items.isNotEmpty) {
        await _localDataSource.cacheItemGroups(items);
      }

      // Return mapped entities
      final entities = items.map((m) => m.toEntity()).toList();
      return right(entities);
    } on NetworkException catch (e) {
      print('[ItemGroupRepo] Network error, falling back to cache: $e');
      // Fallback to cache on network failure
      return _getCachedFallback(search: search);
    } catch (e) {
      print('[ItemGroupRepo] Unexpected error: $e');
      // Attempt cache fallback for any error
      return _getCachedFallback(search: search);
    }
  }

  @override
  Future<Either<Failure, ItemGroup>> getItemGroupById(int id) async {
    try {
      final response = await _remoteDataSource.getItemGroupById(id);
      final model = ItemGroupModel.fromJson(response);

      // Cache the result
      await _localDataSource.cacheItemGroups([model]);

      return right(model.toEntity());
    } on NetworkException catch (e) {
      // Try cache
      final cached = await _localDataSource.getByServerId(id);
      if (cached != null) {
        return right(cached.toEntity());
      }
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ItemGroup>>> getCachedItemGroups({
    String? search,
  }) async {
    try {
      final cached = await _localDataSource.getCachedItemGroups(search: search);
      final entities = cached.map((m) => m.toEntity()).toList();
      return right(entities);
    } catch (e) {
      return left(
        UnknownFailure(message: 'Failed to get cached item groups: $e'),
      );
    }
  }

  /// Fallback to cached data when remote fails
  Future<Either<Failure, List<ItemGroup>>> _getCachedFallback({
    String? search,
  }) async {
    try {
      final cached = await _localDataSource.getCachedItemGroups(search: search);
      if (cached.isNotEmpty) {
        final entities = cached.map((m) => m.toEntity()).toList();
        return right(entities);
      }
      return left(
        const NetworkFailure.connectionError(
          message: 'No item groups available. Please check your connection.',
        ),
      );
    } catch (e) {
      return left(UnknownFailure(message: 'Failed to load item groups: $e'));
    }
  }
}
