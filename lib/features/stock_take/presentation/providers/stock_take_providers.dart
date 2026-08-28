import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/providers/database_providers.dart';
import '../../../../core/providers/sync_providers.dart';
import '../../../auth/auth.dart';
import '../../data/datasources/stock_take_local_datasource.dart';
import '../../data/datasources/stock_take_remote_datasource.dart';
import '../../data/repositories/stock_take_repository_impl.dart';
import '../../domain/repositories/stock_take_repository.dart';
import '../../services/stock_take_sync_handler.dart';

part 'stock_take_providers.g.dart';

/// Provides the local datasource for stock take (async - waits for Isar)
@riverpod
Future<StockTakeLocalDataSource> stockTakeLocalDataSource(Ref ref) async {
  final isar = await ref.watch(isarProvider);
  return StockTakeLocalDataSource(isar);
}

/// Provides the remote datasource for stock take
@riverpod
StockTakeRemoteDataSource stockTakeRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return StockTakeRemoteDataSource(dio);
}

/// Provides the stock take repository implementation (async - waits for local datasource)
@riverpod
Future<StockTakeRepository> stockTakeRepository(Ref ref) async {
  final localDataSource = await ref.watch(
    stockTakeLocalDataSourceProvider.future,
  );
  final remoteDataSource = ref.watch(stockTakeRemoteDataSourceProvider);
  final syncService = await ref.watch(asyncSyncServiceProvider.future);
  // A one-time read, not a watch: the agent id only needs to be correct at
  // construction time. Watching it made this provider (and therefore every
  // session query through it) rebuild on every currentUserProvider change,
  // including transient ones during navigation - if that rebuild landed
  // while currentUserProvider was momentarily null, every query silently
  // returned an empty list (see the defensive null-agentId guards below),
  // which looked exactly like a session vanishing.
  final currentAgentId = ref.read(currentUserProvider)?.id;

  return StockTakeRepositoryImpl(
    localDataSource: localDataSource,
    remoteDataSource: remoteDataSource,
    syncService: syncService,
    currentAgentId: currentAgentId,
  );
}

/// Provides the stock take sync handler for background operations
@riverpod
Future<StockTakeSyncHandler> stockTakeSyncHandler(Ref ref) async {
  final localDataSource = await ref.watch(
    stockTakeLocalDataSourceProvider.future,
  );
  final remoteDataSource = ref.watch(stockTakeRemoteDataSourceProvider);
  final syncService = await ref.watch(asyncSyncServiceProvider.future);

  return StockTakeSyncHandler(
    localDataSource: localDataSource,
    remoteDataSource: remoteDataSource,
    syncService: syncService,
  );
}
