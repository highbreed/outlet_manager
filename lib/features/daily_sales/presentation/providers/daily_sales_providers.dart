import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/providers/database_providers.dart';
import '../../data/datasources/daily_sales_local_datasource.dart';
import '../../data/datasources/daily_sales_remote_datasource.dart';
import '../../data/repositories/daily_sales_repository_impl.dart';
import '../../domain/repositories/daily_sales_repository.dart';

part 'daily_sales_providers.g.dart';

/// Provides the local datasource for daily sales (async - waits for Isar)
@riverpod
Future<DailySalesLocalDataSource> dailySalesLocalDataSource(Ref ref) async {
  final isar = await ref.watch(isarProvider);
  return DailySalesLocalDataSource(isar);
}

/// Provides the remote datasource for daily sales
@riverpod
DailySalesRemoteDataSource dailySalesRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return DailySalesRemoteDataSource(dio);
}

/// Provides the daily sales repository implementation
@riverpod
Future<DailySalesRepository> dailySalesRepository(Ref ref) async {
  final localDataSource = await ref.watch(
    dailySalesLocalDataSourceProvider.future,
  );
  final remoteDataSource = ref.watch(dailySalesRemoteDataSourceProvider);

  return DailySalesRepositoryImpl(
    localDataSource: localDataSource,
    remoteDataSource: remoteDataSource,
  );
}
