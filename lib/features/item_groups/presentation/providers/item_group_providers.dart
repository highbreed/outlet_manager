import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/providers/database_providers.dart';
import '../../data/datasources/item_group_local_datasource.dart';
import '../../data/datasources/item_group_remote_datasource.dart';
import '../../data/repositories/item_group_repository_impl.dart';
import '../../domain/repositories/item_group_repository.dart';

part 'item_group_providers.g.dart';

@riverpod
Future<ItemGroupLocalDataSource> itemGroupLocalDataSource(Ref ref) async {
  final isar = await ref.watch(isarProvider);
  return ItemGroupLocalDataSource(isar);
}

@riverpod
ItemGroupRemoteDataSource itemGroupRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ItemGroupRemoteDataSource(dio);
}

@riverpod
Future<ItemGroupRepository> itemGroupRepository(Ref ref) async {
  final localDataSource = await ref.watch(
    itemGroupLocalDataSourceProvider.future,
  );
  final remoteDataSource = ref.watch(itemGroupRemoteDataSourceProvider);
  return ItemGroupRepositoryImpl(
    localDataSource: localDataSource,
    remoteDataSource: remoteDataSource,
  );
}
