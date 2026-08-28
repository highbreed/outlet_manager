import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/providers/database_providers.dart';
import '../../data/datasources/brand_remote_datasource.dart';
import '../../data/datasources/shelf_share_local_datasource.dart';
import '../../data/datasources/shelf_share_remote_datasource.dart';
import '../../data/repositories/shelf_share_repository_impl.dart';
import '../../domain/repositories/shelf_share_repository.dart';

part 'shelf_share_providers.g.dart';

@riverpod
Future<ShelfShareLocalDataSource> shelfShareLocalDataSource(Ref ref) async {
  final isar = await ref.watch(isarProvider);
  return ShelfShareLocalDataSource(isar);
}

@riverpod
ShelfShareRemoteDataSource shelfShareRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ShelfShareRemoteDataSource(dio);
}

@riverpod
BrandRemoteDataSource brandRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return BrandRemoteDataSource(dio);
}

@riverpod
Future<ShelfShareRepository> shelfShareRepository(Ref ref) async {
  final localDataSource = await ref.watch(
    shelfShareLocalDataSourceProvider.future,
  );
  final remoteDataSource = ref.watch(shelfShareRemoteDataSourceProvider);
  return ShelfShareRepositoryImpl(
    localDataSource: localDataSource,
    remoteDataSource: remoteDataSource,
  );
}
