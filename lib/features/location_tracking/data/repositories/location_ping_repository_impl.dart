import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../../domain/entities/location_ping.dart';
import '../../domain/repositories/location_ping_repository.dart';
import '../datasources/location_ping_local_datasource.dart';
import '../datasources/location_ping_remote_datasource.dart';

/// Implementation of [LocationPingRepository].
///
/// Handles sending pings to server with offline fallback to local storage.
class LocationPingRepositoryImpl implements LocationPingRepository {
  final LocationPingRemoteDataSource _remoteDataSource;
  final LocationPingLocalDataSource _localDataSource;

  LocationPingRepositoryImpl({
    required LocationPingRemoteDataSource remoteDataSource,
    required LocationPingLocalDataSource localDataSource,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource;

  @override
  Future<Either<Failure, LocationPingResponse>> sendPing(
    LocationPing ping,
  ) async {
    try {
      // Mark as syncing if it exists locally
      await _localDataSource.markPingSyncing(ping.localId);

      final response = await _remoteDataSource.sendPing(ping);

      // Mark as synced in local storage
      await _localDataSource.markPingSynced(ping.localId, response.pingId);

      return Right(response);
    } on DioException catch (e) {
      // Mark as failed if it exists locally
      await _localDataSource.markPingFailed(ping.localId);

      return Left(_mapDioError(e));
    } catch (e) {
      await _localDataSource.markPingFailed(ping.localId);
      return Left(UnknownFailure(message: e.toString(), originalError: e));
    }
  }

  @override
  Future<void> savePingLocally(LocationPing ping) async {
    await _localDataSource.savePing(ping);
  }

  @override
  Future<List<LocationPing>> getPendingPings() async {
    return _localDataSource.getPendingPings();
  }

  @override
  Future<void> markPingSynced(String localId, int serverId) async {
    await _localDataSource.markPingSynced(localId, serverId);
  }

  @override
  Future<void> markPingFailed(String localId) async {
    await _localDataSource.markPingFailed(localId);
  }

  @override
  Future<int> cleanupOldPings({
    Duration retention = const Duration(days: 7),
  }) async {
    return _localDataSource.cleanupOldPings(retention);
  }

  @override
  Future<LocationPing?> getLastPing() async {
    return _localDataSource.getLastPing();
  }

  @override
  Future<Map<LocationPingSyncState, int>> getPingStats() async {
    return _localDataSource.getPingStats();
  }

  Failure _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure.timeout();
      case DioExceptionType.connectionError:
        return const NetworkFailure.offline();
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message =
            e.response?.data?['message'] as String? ?? 'Server error';

        if (statusCode == 401) {
          return const AuthFailure.tokenExpired();
        } else if (statusCode == 403) {
          return ForbiddenFailure.resourceForbidden(message: message);
        } else if (statusCode != null && statusCode >= 500) {
          return ServerFailure.internalError(message: message);
        }
        return ServerFailure.internalError(message: message);
      default:
        return UnknownFailure(message: e.message ?? 'Unknown error');
    }
  }
}
