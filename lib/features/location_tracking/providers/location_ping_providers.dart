import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../data/datasources/location_ping_local_datasource.dart';
import '../data/datasources/location_ping_remote_datasource.dart';
import '../data/repositories/location_ping_repository_impl.dart';
import '../domain/repositories/location_ping_repository.dart';

part 'location_ping_providers.g.dart';

// === Data Sources ===

@riverpod
LocationPingRemoteDataSource locationPingRemoteDataSource(
  LocationPingRemoteDataSourceRef ref,
) {
  final dio = ref.watch(dioProvider);
  return LocationPingRemoteDataSource(dio);
}

@riverpod
LocationPingLocalDataSource locationPingLocalDataSource(
  LocationPingLocalDataSourceRef ref,
) {
  return LocationPingLocalDataSource();
}

// === Repository ===

@riverpod
LocationPingRepository locationPingRepository(LocationPingRepositoryRef ref) {
  return LocationPingRepositoryImpl(
    remoteDataSource: ref.watch(locationPingRemoteDataSourceProvider),
    localDataSource: ref.watch(locationPingLocalDataSourceProvider),
  );
}
