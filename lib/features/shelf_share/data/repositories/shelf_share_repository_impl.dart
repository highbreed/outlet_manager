import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../domain/entities/shelf_share_session.dart';
import '../../domain/repositories/shelf_share_repository.dart';
import '../datasources/shelf_share_local_datasource.dart';
import '../datasources/shelf_share_remote_datasource.dart';
import '../models/mappers.dart';
import '../models/shelf_share_session_model.dart';

/// Offline-first implementation of [ShelfShareRepository]
class ShelfShareRepositoryImpl implements ShelfShareRepository {
  final ShelfShareLocalDataSource _localDataSource;
  final ShelfShareRemoteDataSource _remoteDataSource;

  ShelfShareRepositoryImpl({
    required ShelfShareLocalDataSource localDataSource,
    required ShelfShareRemoteDataSource remoteDataSource,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, ShelfShareSession>> createSession({
    required int visitServerId,
    required int customerId,
    required String customerCode,
    required String customerName,
    required int salesAgentId,
    required String visitLocalId,
  }) async {
    final localId = const Uuid().v4();

    // Generate default note with location coordinates
    String notes =
        'Shelf share for $customerName on ${DateTime.now().toString().substring(0, 19)}';
    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 5),
        ),
      );
      notes +=
          ' at ${position.latitude.toStringAsFixed(6)}, ${position.longitude.toStringAsFixed(6)}';
    } catch (_) {
      // Location unavailable — proceed without coordinates
    }

    final model = ShelfShareSessionModel.create(
      localId: localId,
      visitLocalId: visitLocalId,
      visitServerId: visitServerId,
      customerId: customerId,
      customerCode: customerCode,
      customerName: customerName,
      salesAgentId: salesAgentId,
    );
    model.notes = notes;

    try {
      // Try to create on server first
      final createJson = model.toCreateJson();
      print('[ShelfShareRepo] Creating session with body: $createJson');
      final response = await _remoteDataSource.createSession(createJson);
      final serverModel = ShelfShareSessionModel.fromJson(response);
      serverModel.localId = localId;

      // Save to local with server ID
      await _localDataSource.createSession(serverModel);
      return right(serverModel.toEntity());
    } on NetworkException catch (e) {
      print(
        '[ShelfShareRepo] Network error creating session, saving locally: $e',
      );
      // Save locally for offline sync
      await _localDataSource.createSession(model);
      return right(model.toEntity());
    } catch (e) {
      // Try to save locally even on unexpected errors
      try {
        await _localDataSource.createSession(model);
        return right(model.toEntity());
      } catch (localError) {
        return left(UnknownFailure(message: 'Failed to create session: $e'));
      }
    }
  }

  @override
  Future<Either<Failure, List<ShelfShareSession>>> getSessions({
    int? customerId,
    int page = 1,
    int size = 50,
  }) async {
    try {
      final response = await _remoteDataSource.getSessions(
        customerId: customerId,
        page: page,
        size: size,
      );

      final items =
          (response['items'] as List<dynamic>?)
              ?.map(
                (e) =>
                    ShelfShareSessionModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [];

      // Cache results
      for (final item in items) {
        final existing = await _localDataSource.getSessionByServerId(
          item.serverId!,
        );
        if (existing != null) {
          item.id = existing.id;
          item.localId = existing.localId;
        }
        await _localDataSource.updateSession(item);
      }

      final entities = items.map((m) => m.toEntity()).toList();
      return right(entities);
    } on NetworkException catch (e) {
      print('[ShelfShareRepo] Network error, falling back to cache: $e');
      if (customerId != null) {
        final cached = await _localDataSource.getCustomerSessions(customerId);
        return right(cached.map((m) => m.toEntity()).toList());
      }
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShelfShareSession?>> getSessionByVisit(
    int visitId,
  ) async {
    try {
      final response = await _remoteDataSource.getSessionByVisit(visitId);
      if (response == null) {
        return right(null);
      }

      final model = ShelfShareSessionModel.fromJson(response);

      // Cache
      final existing = await _localDataSource.getSessionByServerId(
        model.serverId!,
      );
      if (existing != null) {
        model.id = existing.id;
        model.localId = existing.localId;
      }
      await _localDataSource.updateSession(model);

      return right(model.toEntity());
    } on NetworkException catch (e) {
      print('[ShelfShareRepo] Network error fetching by visit: $e');
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShelfShareSession>> getSessionById(int id) async {
    try {
      final response = await _remoteDataSource.getSessionById(id);
      final model = ShelfShareSessionModel.fromJson(response);

      // Cache
      final existing = await _localDataSource.getSessionByServerId(
        model.serverId!,
      );
      if (existing != null) {
        model.id = existing.id;
        model.localId = existing.localId;
      }
      await _localDataSource.updateSession(model);

      return right(model.toEntity());
    } on NetworkException catch (e) {
      // Try cache
      final cached = await _localDataSource.getSessionByServerId(id);
      if (cached != null) {
        return right(cached.toEntity());
      }
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShelfShareSession>> getSessionByLocalId(
    String localId,
  ) async {
    try {
      final cached = await _localDataSource.getSessionByLocalId(localId);
      if (cached == null) {
        return left(
          const NotFoundFailure(
            resourceType: 'ShelfShareSession',
            resourceId: 'local',
            message: 'Session not found',
          ),
        );
      }
      return right(cached.toEntity());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShelfShareSession>> saveProgress({
    required String localId,
    required List<ShelfShareItemGroup> itemGroups,
    String? notes,
  }) async {
    try {
      // Update local first
      final session = await _localDataSource.getSessionByLocalId(localId);
      if (session == null) {
        return left(
          const NotFoundFailure(
            resourceType: 'ShelfShareSession',
            resourceId: 'local',
            message: 'Session not found',
          ),
        );
      }

      // Convert domain entities to models
      session.itemGroups = itemGroups.map((g) => g.toModel()).toList();
      if (notes != null) {
        session.notes = notes;
      }
      session.updatedAt = DateTime.now();

      // Save locally
      await _localDataSource.updateSession(session);

      // Try to sync to server
      if (session.serverId != null) {
        try {
          final updateJson = session.toUpdateJson();
          print('[ShelfShareRepo] Saving progress to server: $updateJson');
          final response = await _remoteDataSource.saveProgress(
            session.serverId!,
            updateJson,
          );
          print('[ShelfShareRepo] Server response: $response');
          final updatedModel = ShelfShareSessionModel.fromJson(response);
          updatedModel.id = session.id;
          updatedModel.localId = session.localId;
          updatedModel.syncState = ShelfShareSyncState.synced;
          updatedModel.lastSyncedAt = DateTime.now();

          // Preserve local item groups if server response doesn't include them
          if (updatedModel.itemGroups.isEmpty &&
              session.itemGroups.isNotEmpty) {
            updatedModel.itemGroups = session.itemGroups;
          }

          await _localDataSource.updateSession(updatedModel);
          return right(updatedModel.toEntity());
        } on NetworkException catch (e) {
          print(
            '[ShelfShareRepo] Network error saving progress, saved locally: $e',
          );
          session.syncState = ShelfShareSyncState.pending;
          await _localDataSource.updateSession(session);
          return right(session.toEntity());
        }
      } else {
        // No server ID yet - keep as pending
        session.syncState = ShelfShareSyncState.pending;
        await _localDataSource.updateSession(session);
        return right(session.toEntity());
      }
    } catch (e) {
      return left(UnknownFailure(message: 'Failed to save progress: $e'));
    }
  }

  @override
  Future<Either<Failure, ShelfShareSession>> submitSession(
    String localId,
  ) async {
    try {
      final session = await _localDataSource.getSessionByLocalId(localId);
      if (session == null) {
        return left(
          const NotFoundFailure(
            resourceType: 'ShelfShareSession',
            resourceId: 'local',
            message: 'Session not found',
          ),
        );
      }

      if (session.serverId == null) {
        // Session was created offline - try to sync it to server now
        try {
          final response = await _remoteDataSource.createSession(
            session.toCreateJson(),
          );
          final serverModel = ShelfShareSessionModel.fromJson(response);
          session.serverId = serverModel.serverId;
          session.syncState = ShelfShareSyncState.synced;
          session.lastSyncedAt = DateTime.now();
          await _localDataSource.updateSession(session);
          print(
            '[ShelfShareRepo] Synced offline session to server: ${session.serverId}',
          );
        } on NetworkException {
          return left(
            const NetworkFailure.connectionError(
              message:
                  'Could not sync session to server. Please check your connection and try again.',
            ),
          );
        } catch (e) {
          return left(
            UnknownFailure(
              message: 'Failed to sync session before submitting: $e',
            ),
          );
        }
      }

      // Save progress first to ensure latest data is on server
      final progressResult = await saveProgress(
        localId: localId,
        itemGroups: session.itemGroups.map((g) => g.toEntity()).toList(),
        notes: session.notes,
      );

      if (progressResult.isLeft()) {
        return progressResult;
      }

      // Submit on server
      final response = await _remoteDataSource.submitSession(session.serverId!);
      final updatedModel = ShelfShareSessionModel.fromJson(response);
      updatedModel.id = session.id;
      updatedModel.localId = session.localId;
      updatedModel.syncState = ShelfShareSyncState.synced;
      updatedModel.lastSyncedAt = DateTime.now();

      // Preserve local item groups if server response doesn't include them
      if (updatedModel.itemGroups.isEmpty && session.itemGroups.isNotEmpty) {
        updatedModel.itemGroups = session.itemGroups;
      }

      await _localDataSource.updateSession(updatedModel);

      return right(updatedModel.toEntity());
    } on NetworkException catch (e) {
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: 'Failed to submit session: $e'));
    }
  }

  @override
  Future<Either<Failure, ShelfShareSession?>> getActiveSession(
    int customerId,
  ) async {
    try {
      final cached = await _localDataSource.getActiveSession(customerId);
      if (cached != null) {
        return right(cached.toEntity());
      }
      return right(null);
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShelfShareSession?>> getActiveSessionByVisit(
    int visitId,
  ) async {
    try {
      final response = await _remoteDataSource.getActiveSessionByVisit(visitId);
      if (response == null) {
        return right(null);
      }

      final model = ShelfShareSessionModel.fromJson(response);
      print(
        '[ShelfShareRepo] Found active session from server: ${model.serverId}, status: ${model.status}',
      );

      // Cache locally
      final existing = await _localDataSource.getSessionByServerId(
        model.serverId!,
      );
      if (existing != null) {
        model.id = existing.id;
        model.localId = existing.localId;
      }
      model.syncState = ShelfShareSyncState.synced;
      model.lastSyncedAt = DateTime.now();
      await _localDataSource.updateSession(model);

      return right(model.toEntity());
    } on NetworkException catch (e) {
      print(
        '[ShelfShareRepo] Network error checking active session by visit: $e',
      );
      // Fallback: no active session from server
      return right(null);
    } catch (e) {
      return left(
        UnknownFailure(message: 'Failed to check active session: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, List<ShelfShareSession>>> getCompletedSessions(
    int customerId,
  ) async {
    try {
      final cached = await _localDataSource.getCompletedSessions(customerId);
      final entities = cached.map((m) => m.toEntity()).toList();
      return right(entities);
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSession(String localId) async {
    try {
      await _localDataSource.deleteSession(localId);
      return right(null);
    } catch (e) {
      return left(UnknownFailure(message: 'Failed to delete session: $e'));
    }
  }
}
