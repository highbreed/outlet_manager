import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/failures.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../data/datasources/replenishment_remote_datasource.dart';

final replenishmentRemoteDataSourceProvider =
    Provider<ReplenishmentRemoteDataSource>((ref) {
      final dio = ref.watch(dioProvider);
      return ReplenishmentRemoteDataSource(dio);
    });

/// The caller's own active visit's live reorder suggestions. `null` means
/// no order — either the agent isn't clocked in, or nothing has dropped
/// to/below its minimum stock yet today. Both cases are a normal 404 from
/// the backend, not an error state.
final replenishmentCurrentProvider = FutureProvider<ReplenishmentOrder?>((
  ref,
) async {
  final dataSource = ref.watch(replenishmentRemoteDataSourceProvider);
  try {
    return await dataSource.fetchCurrent();
  } on NetworkException catch (e) {
    final failure = e.toFailure();
    if (failure is NotFoundFailure) return null;
    throw failure;
  }
});
