import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/providers/database_providers.dart';
import '../../data/datasources/facings_count_local_datasource.dart';
import '../../data/datasources/facings_count_remote_datasource.dart';
import '../../data/repositories/facings_count_repository_impl.dart';
import '../../domain/repositories/facings_count_repository.dart';

part 'facings_count_providers.g.dart';

@riverpod
Future<FacingsCountLocalDataSource> facingsCountLocalDataSource(
  Ref ref,
) async {
  final isar = await ref.watch(isarProvider);
  return FacingsCountLocalDataSource(isar);
}

@riverpod
FacingsCountRemoteDataSource facingsCountRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return FacingsCountRemoteDataSource(dio);
}

@riverpod
Future<FacingsCountRepository> facingsCountRepository(Ref ref) async {
  final localDataSource = await ref.watch(
    facingsCountLocalDataSourceProvider.future,
  );
  final remoteDataSource = ref.watch(facingsCountRemoteDataSourceProvider);
  return FacingsCountRepositoryImpl(
    localDataSource: localDataSource,
    remoteDataSource: remoteDataSource,
  );
}
