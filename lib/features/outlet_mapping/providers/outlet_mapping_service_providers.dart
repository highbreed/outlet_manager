import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../data/datasources/mapping_sample_local_datasource.dart';
import '../data/datasources/mapping_session_local_datasource.dart';
import '../data/datasources/outlet_mapping_remote_datasource.dart';
import '../data/repositories/outlet_mapping_repository_impl.dart';
import '../domain/config/mapping_config.dart';
import '../domain/repositories/outlet_mapping_repository.dart';
import '../services/mapping_uploader.dart';

part 'outlet_mapping_service_providers.g.dart';

@riverpod
MappingConfig mappingConfig(Ref ref) => const MappingConfig();

@riverpod
OutletMappingRemoteDataSource outletMappingRemoteDataSource(Ref ref) {
  return OutletMappingRemoteDataSourceImpl(ref.watch(dioProvider));
}

/// No dependency injection via constructor, same convention
/// `LocationPingLocalDataSource` uses — Isar access is per-call via
/// `IsarDatabase.getInstance()`, not injected.
@riverpod
MappingSessionLocalDataSource mappingSessionLocalDataSource(Ref ref) {
  return MappingSessionLocalDataSource();
}

@riverpod
MappingSampleLocalDataSource mappingSampleLocalDataSource(Ref ref) {
  return MappingSampleLocalDataSource();
}

@riverpod
OutletMappingRepository outletMappingRepository(Ref ref) {
  return OutletMappingRepositoryImpl(ref.watch(outletMappingRemoteDataSourceProvider));
}

@riverpod
MappingUploader mappingUploader(Ref ref) {
  return MappingUploader(
    repository: ref.watch(outletMappingRepositoryProvider),
    localDataSource: ref.watch(mappingSampleLocalDataSourceProvider),
  );
}
