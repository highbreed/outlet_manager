import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../domain/entities/facings_count.dart';
import '../../domain/repositories/facings_count_repository.dart';
import '../datasources/facings_count_local_datasource.dart';
import '../datasources/facings_count_remote_datasource.dart';
import '../models/facings_count_model.dart';
import '../models/mappers.dart';

/// Offline-first implementation of [FacingsCountRepository]
class FacingsCountRepositoryImpl implements FacingsCountRepository {
  final FacingsCountLocalDataSource _localDataSource;
  final FacingsCountRemoteDataSource _remoteDataSource;

  FacingsCountRepositoryImpl({
    required FacingsCountLocalDataSource localDataSource,
    required FacingsCountRemoteDataSource remoteDataSource,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource;

  /// The API never echoes back customer_code/customer_name/visit_local_id —
  /// restore them from what we already know locally after every response.
  void _restoreLocalOnlyFields(
    FacingsCountModel serverModel, {
    required String visitLocalId,
    required String customerCode,
    required String customerName,
  }) {
    serverModel.visitLocalId = visitLocalId;
    serverModel.customerCode = customerCode;
    serverModel.customerName = customerName;
  }

  @override
  Future<Either<Failure, FacingsCount>> createDraft({
    required String visitLocalId,
    int? visitServerId,
    required int customerId,
    required String customerCode,
    required String customerName,
    required int salesAgentId,
  }) async {
    final localId = const Uuid().v4();

    final model = FacingsCountModel.create(
      localId: localId,
      visitLocalId: visitLocalId,
      visitServerId: visitServerId,
      customerId: customerId,
      customerCode: customerCode,
      customerName: customerName,
      salesAgentId: salesAgentId,
    );

    try {
      final createJson = model.toCreateJson();
      print('[FacingsCountRepo] Creating session with body: $createJson');
      final response = await _remoteDataSource.createSession(createJson);
      final serverModel = FacingsCountModel.fromJson(response);
      serverModel.localId = localId;
      _restoreLocalOnlyFields(
        serverModel,
        visitLocalId: visitLocalId,
        customerCode: customerCode,
        customerName: customerName,
      );

      await _localDataSource.createDraft(serverModel);
      return right(serverModel.toEntity());
    } on NetworkException catch (e) {
      print(
        '[FacingsCountRepo] Network error creating session, saving locally: $e',
      );
      await _localDataSource.createDraft(model);
      return right(model.toEntity());
    } catch (e) {
      try {
        await _localDataSource.createDraft(model);
        return right(model.toEntity());
      } catch (localError) {
        return left(UnknownFailure(message: 'Failed to create draft: $e'));
      }
    }
  }

  @override
  Future<Either<Failure, FacingsCount?>> getActiveDraft(int customerId) async {
    try {
      final cached = await _localDataSource.getActiveDraft(customerId);
      if (cached != null) {
        return right(cached.toEntity());
      }
      return right(null);
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FacingsCount>> getByLocalId(String localId) async {
    try {
      final cached = await _localDataSource.getByLocalId(localId);
      if (cached == null) {
        return left(
          const NotFoundFailure(
            resourceType: 'FacingsCount',
            resourceId: 'local',
            message: 'Facings count not found',
          ),
        );
      }
      return right(cached.toEntity());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FacingsCount>> saveProgress({
    required String localId,
    required List<FacingsCountItem> items,
  }) async {
    try {
      final count = await _localDataSource.getByLocalId(localId);
      if (count == null) {
        return left(
          const NotFoundFailure(
            resourceType: 'FacingsCount',
            resourceId: 'local',
            message: 'Facings count not found',
          ),
        );
      }

      count.items = items.map((i) => i.toModel()).toList();
      count.updatedAt = DateTime.now();

      // Save locally first
      await _localDataSource.updateCount(count);

      if (count.serverId != null) {
        try {
          final updateJson = count.toUpdateJson();
          print('[FacingsCountRepo] Saving progress to server: $updateJson');
          final response = await _remoteDataSource.saveProgress(
            count.serverId!,
            updateJson,
          );
          final updatedModel = FacingsCountModel.fromJson(response);
          updatedModel.id = count.id;
          updatedModel.localId = count.localId;
          updatedModel.syncState = FacingsCountSyncState.synced;
          updatedModel.lastSyncedAt = DateTime.now();
          _restoreLocalOnlyFields(
            updatedModel,
            visitLocalId: count.visitLocalId,
            customerCode: count.customerCode,
            customerName: count.customerName,
          );

          // Preserve local items if server response doesn't include them
          if (updatedModel.items.isEmpty && count.items.isNotEmpty) {
            updatedModel.items = count.items;
          }

          await _localDataSource.updateCount(updatedModel);
          return right(updatedModel.toEntity());
        } on NetworkException catch (e) {
          print(
            '[FacingsCountRepo] Network error saving progress, saved locally: $e',
          );
          count.syncState = FacingsCountSyncState.pending;
          await _localDataSource.updateCount(count);
          return right(count.toEntity());
        }
      } else {
        count.syncState = FacingsCountSyncState.pending;
        await _localDataSource.updateCount(count);
        return right(count.toEntity());
      }
    } catch (e) {
      return left(UnknownFailure(message: 'Failed to save progress: $e'));
    }
  }

  @override
  Future<Either<Failure, FacingsCount>> submitCount(String localId) async {
    try {
      final count = await _localDataSource.getByLocalId(localId);
      if (count == null) {
        return left(
          const NotFoundFailure(
            resourceType: 'FacingsCount',
            resourceId: 'local',
            message: 'Facings count not found',
          ),
        );
      }

      if (count.serverId == null) {
        // Draft was created offline - try to sync it to server now
        try {
          final response = await _remoteDataSource.createSession(
            count.toCreateJson(),
          );
          final serverModel = FacingsCountModel.fromJson(response);
          count.serverId = serverModel.serverId;
          count.syncState = FacingsCountSyncState.synced;
          count.lastSyncedAt = DateTime.now();
          await _localDataSource.updateCount(count);
          print(
            '[FacingsCountRepo] Synced offline draft to server: ${count.serverId}',
          );
        } on NetworkException {
          return left(
            const NetworkFailure.connectionError(
              message:
                  'Could not sync count to server. Please check your connection and try again.',
            ),
          );
        } catch (e) {
          return left(
            UnknownFailure(
              message: 'Failed to sync count before submitting: $e',
            ),
          );
        }
      }

      // Submit requires the entries in the request body itself (min 1)
      final response = await _remoteDataSource.submitSession(
        count.serverId!,
        count.toSubmitJson(),
      );
      final updatedModel = FacingsCountModel.fromJson(response);
      updatedModel.id = count.id;
      updatedModel.localId = count.localId;
      updatedModel.syncState = FacingsCountSyncState.synced;
      updatedModel.lastSyncedAt = DateTime.now();
      _restoreLocalOnlyFields(
        updatedModel,
        visitLocalId: count.visitLocalId,
        customerCode: count.customerCode,
        customerName: count.customerName,
      );

      if (updatedModel.items.isEmpty && count.items.isNotEmpty) {
        updatedModel.items = count.items;
      }
      // Server may not echo submitted status/timestamp back consistently — enforce locally
      if (updatedModel.status == FacingsCountModelStatus.inProgress) {
        updatedModel.status = FacingsCountModelStatus.submitted;
      }
      updatedModel.submittedAt ??= DateTime.now();

      await _localDataSource.updateCount(updatedModel);

      return right(updatedModel.toEntity());
    } on NetworkException catch (e) {
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: 'Failed to submit count: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> discardDraft(String localId) async {
    try {
      await _localDataSource.deleteCount(localId);
      return right(null);
    } catch (e) {
      return left(UnknownFailure(message: 'Failed to discard draft: $e'));
    }
  }

  @override
  Future<Either<Failure, List<FacingsCount>>> getTodaySubmitted({
    required int customerId,
    required int salesAgentId,
  }) async {
    try {
      final cached = await _localDataSource.getTodaySubmitted(
        customerId: customerId,
        salesAgentId: salesAgentId,
      );
      return right(cached.map((m) => m.toEntity()).toList());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }
}
