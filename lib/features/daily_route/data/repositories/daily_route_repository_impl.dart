import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/network/failures.dart';
import '../../domain/entities/daily_route.dart';
import '../../domain/entities/outlet_visit.dart';
import '../../domain/repositories/daily_route_repository.dart';
import '../datasources/daily_route_local_datasource.dart';
import '../datasources/daily_route_remote_datasource.dart';
import '../models/daily_route_model.dart';
import '../models/outlet_visit_model.dart' as visit_model;

/// Implementation of [DailyRouteRepository].
///
/// Coordinates between local (Isar) and remote (API) data sources.
/// Follows offline-first pattern: save locally first, then sync to server.
class DailyRouteRepositoryImpl implements DailyRouteRepository {
  final DailyRouteLocalDataSource _localDataSource;
  final DailyRouteRemoteDataSource _remoteDataSource;
  final String _currentAgentId;
  final Uuid _uuid;

  DailyRouteRepositoryImpl({
    required DailyRouteLocalDataSource localDataSource,
    required DailyRouteRemoteDataSource remoteDataSource,
    required String currentAgentId,
    Uuid? uuid,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource,
       _currentAgentId = currentAgentId,
       _uuid = uuid ?? const Uuid();

  @override
  Future<Either<Failure, DailyRoute>> activateRoute({
    DateTime? routeDate,
  }) async {
    try {
      final response = await _remoteDataSource.activateRoute();
      final localId = _uuid.v4();
      final route = response.toDomain(localId);

      final model = _toModel(route);
      await _localDataSource.saveRoute(model);

      return Right(route);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DailyRoute?>> getTodaysRoute() async {
    try {
      // Try to get from server
      final response = await _remoteDataSource.getTodaysRoute();

      // Check if route already exists locally by server ID
      final existingRoute = await _localDataSource.getRouteByServerId(
        response.route.id,
      );

      // Use existing localId if route exists, otherwise generate new one
      final routeLocalId = existingRoute?.localId ?? _uuid.v4();
      final route = response.route.toDomain(routeLocalId);

      final routeModel = _toModel(route, existingId: existingRoute?.id);
      await _localDataSource.saveRoute(routeModel);

      // Save visits from the response
      for (final visitResponse in response.visits) {
        // Check if visit already exists locally by server ID
        final existingVisit = await _localDataSource.getVisitByServerId(
          visitResponse.id,
        );
        final visitLocalId = existingVisit?.localId ?? _uuid.v4();
        final visit = visitResponse.toDomain(visitLocalId, routeLocalId);
        final visitModel = _toVisitModel(visit, existingId: existingVisit?.id);
        await _localDataSource.saveVisit(visitModel);
      }

      return Right(route);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Right(null);
      }
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DailyRoute?>> getRouteByLocalId(String localId) async {
    try {
      final model = await _localDataSource.getRouteByLocalId(localId);
      if (model == null) return const Right(null);
      return Right(_toDomain(model));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DailyRoute?>> getRouteByServerId(
    String serverId,
  ) async {
    try {
      final model = await _localDataSource.getRouteByServerId(serverId);
      if (model == null) return const Right(null);
      return Right(_toDomain(model));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DailyRoute>> fetchAndSaveRouteById(
    String serverId,
  ) async {
    try {
      // Fetch from server
      final response = await _remoteDataSource.getRouteById(serverId);

      // Check if route already exists locally by server ID
      final existingRoute = await _localDataSource.getRouteByServerId(
        response.route.id,
      );

      // Use existing localId if route exists, otherwise generate new one
      final routeLocalId = existingRoute?.localId ?? _uuid.v4();
      final route = response.route.toDomain(routeLocalId);

      final routeModel = _toModel(route, existingId: existingRoute?.id);
      await _localDataSource.saveRoute(routeModel);

      // Save visits from the response
      for (final visitResponse in response.visits) {
        // Check if visit already exists locally by server ID
        final existingVisit = await _localDataSource.getVisitByServerId(
          visitResponse.id,
        );
        final visitLocalId = existingVisit?.localId ?? _uuid.v4();
        final visit = visitResponse.toDomain(visitLocalId, routeLocalId);
        final visitModel = _toVisitModel(visit, existingId: existingVisit?.id);
        await _localDataSource.saveVisit(visitModel);
      }

      return Right(route);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DailyRoute>> closeRoute({
    required String routeLocalId,
    String? closingNotes,
    List<SkipVisitParams>? skippedVisits,
  }) async {
    try {
      final localRoute = await _localDataSource.getRouteByLocalId(routeLocalId);
      if (localRoute == null) {
        return Left(
          NotFoundFailure(resourceType: 'DailyRoute', resourceId: routeLocalId),
        );
      }

      final serverId = localRoute.serverId ?? routeLocalId;

      // Convert skippedVisits to backend format with server IDs
      List<Map<String, dynamic>>? skippedVisitsData;
      if (skippedVisits != null && skippedVisits.isNotEmpty) {
        skippedVisitsData = [];
        for (final visit in skippedVisits) {
          // Get the visit from local DB to find its server ID
          final visitModel = await _localDataSource.getVisitByLocalId(
            visit.visitLocalId,
          );
          if (visitModel != null && visitModel.serverId != null) {
            skippedVisitsData.add({
              'visit_id': int.parse(visitModel.serverId!),
              'skip_reason_id': visit.skipReasonId,
              if (visit.skipNotes != null && visit.skipNotes!.isNotEmpty)
                'skip_notes': visit.skipNotes,
            });
          }
        }
      }

      final response = await _remoteDataSource.closeRoute(
        serverId,
        closingNotes: closingNotes,
        skippedVisits: skippedVisitsData,
      );

      final updatedRoute = response.toDomain(localRoute.localId);
      final model = _toModel(updatedRoute, existingId: localRoute.id);
      await _localDataSource.saveRoute(model);

      return Right(updatedRoute);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DailyRoute>> forceCloseRoute({
    required String routeServerId,
    required String reason,
    bool skipAllPending = true,
    int? defaultSkipReasonId,
  }) async {
    try {
      final response = await _remoteDataSource.forceCloseRoute(
        routeServerId,
        reason: reason,
      );

      // Try to get local route to maintain local ID
      final localRoute = await _localDataSource.getRouteByServerId(
        routeServerId,
      );
      final localId = localRoute?.localId ?? _uuid.v4();

      final updatedRoute = response.toDomain(localId);
      final model = _toModel(updatedRoute, existingId: localRoute?.id);
      await _localDataSource.saveRoute(model);

      return Right(updatedRoute);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DailyRoute>>> getRoutesByDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    // TODO: Implement when needed
    return const Right([]);
  }

  @override
  Future<Either<Failure, DailyRoute?>> getUnclosedRoute() async {
    try {
      final model = await _localDataSource.getUnclosedRoute(_currentAgentId);
      if (model == null) {
        return const Right(null);
      }
      return Right(_toDomain(model));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<bool> hasRouteForDate(DateTime date) async {
    try {
      final model = await _localDataSource.getRouteForDate(
        _currentAgentId,
        date,
      );
      return model != null;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either<Failure, DailyRoute>> updateRouteStatus({
    required String routeLocalId,
    required DailyRouteStatus status,
    DateTime? firstClockInAt,
    DateTime? lastClockOutAt,
  }) async {
    try {
      final localRoute = await _localDataSource.getRouteByLocalId(routeLocalId);
      if (localRoute == null) {
        return Left(
          NotFoundFailure(resourceType: 'DailyRoute', resourceId: routeLocalId),
        );
      }

      localRoute.status = _mapStatusToModel(status);
      if (firstClockInAt != null) localRoute.firstClockInAt = firstClockInAt;
      if (lastClockOutAt != null) localRoute.lastClockOutAt = lastClockOutAt;
      localRoute.updatedAt = DateTime.now();

      await _localDataSource.saveRoute(localRoute);
      return Right(_toDomain(localRoute));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DailyRoute>> updateRouteProgress({
    required String routeLocalId,
    int? completedCount,
    int? skippedCount,
    int? inProgressCount,
    int? totalVisitTimeMins,
  }) async {
    try {
      final localRoute = await _localDataSource.getRouteByLocalId(routeLocalId);
      if (localRoute == null) {
        return Left(
          NotFoundFailure(resourceType: 'DailyRoute', resourceId: routeLocalId),
        );
      }

      if (completedCount != null) localRoute.completedCount = completedCount;
      if (skippedCount != null) localRoute.skippedCount = skippedCount;
      if (inProgressCount != null) localRoute.inProgressCount = inProgressCount;
      if (totalVisitTimeMins != null)
        localRoute.totalVisitTimeMins = totalVisitTimeMins;
      localRoute.updatedAt = DateTime.now();

      await _localDataSource.saveRoute(localRoute);
      return Right(_toDomain(localRoute));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> syncPendingOperations() async {
    // TODO: Implement sync logic
    return const Right(null);
  }

  @override
  Future<Either<Failure, DailyRoute>> refreshFromServer(
    String routeServerId,
  ) async {
    try {
      // For now, just return the local route if exists
      final localRoute = await _localDataSource.getRouteByServerId(
        routeServerId,
      );
      if (localRoute == null) {
        return Left(
          NotFoundFailure(
            resourceType: 'DailyRoute',
            resourceId: routeServerId,
          ),
        );
      }
      return Right(_toDomain(localRoute));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OutletVisit>>> getVisitsForRoute(
    String routeLocalId,
  ) async {
    try {
      final visits = await _localDataSource.getVisitsForRoute(routeLocalId);
      return Right(visits.map((v) => _visitToDomain(v)).toList());
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  // === Mapper Helpers ===

  DailyRouteModel _toModel(DailyRoute route, {int? existingId}) {
    return DailyRouteModel()
      ..id = existingId
      ..localId = route.localId
      ..serverId = route.serverId
      ..salesAgentId = route.salesAgentId
      ..routeDate = route.routeDate
      ..dayOfWeek = route.dayOfWeek
      ..status = _mapStatusToModel(route.status)
      ..activatedAt = route.activatedAt
      ..firstClockInAt = route.firstClockInAt
      ..lastClockOutAt = route.lastClockOutAt
      ..closedAt = route.closedAt
      ..totalScheduled = route.totalScheduled
      ..completedCount = route.completedCount
      ..skippedCount = route.skippedCount
      ..inProgressCount = route.inProgressCount
      ..totalVisitTimeMins = route.totalVisitTimeMins
      ..closingNotes = route.closingNotes
      ..closedByUserId = route.closedByUserId
      ..forceClosed = route.forceClosed
      ..forceClosedByUserId = route.forceClosedByUserId
      ..forceClosedAt = route.forceClosedAt
      ..forceCloseReason = route.forceCloseReason
      ..syncState = _mapSyncStateToModel(route.syncState)
      ..syncError = route.syncError
      ..lastSyncedAt = route.lastSyncedAt
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();
  }

  DailyRoute _toDomain(DailyRouteModel model) {
    return DailyRoute(
      localId: model.localId,
      serverId: model.serverId,
      salesAgentId: model.salesAgentId,
      routeDate: model.routeDate,
      dayOfWeek: model.dayOfWeek,
      status: _mapStatusToDomain(model.status),
      activatedAt: model.activatedAt,
      firstClockInAt: model.firstClockInAt,
      lastClockOutAt: model.lastClockOutAt,
      closedAt: model.closedAt,
      totalScheduled: model.totalScheduled,
      completedCount: model.completedCount,
      skippedCount: model.skippedCount,
      inProgressCount: model.inProgressCount,
      totalVisitTimeMins: model.totalVisitTimeMins,
      closingNotes: model.closingNotes,
      closedByUserId: model.closedByUserId,
      forceClosed: model.forceClosed,
      forceClosedByUserId: model.forceClosedByUserId,
      forceClosedAt: model.forceClosedAt,
      forceCloseReason: model.forceCloseReason,
      syncState: _mapSyncStateToDomain(model.syncState),
      syncError: model.syncError,
      lastSyncedAt: model.lastSyncedAt,
    );
  }

  OutletVisit _visitToDomain(visit_model.OutletVisitModel model) {
    return OutletVisit(
      localId: model.localId,
      serverId: model.serverId,
      dailyRouteLocalId: model.dailyRouteLocalId,
      dailyRouteServerId: model.dailyRouteServerId,
      outletId: model.outletId,
      outletCode: model.outletCode,
      outletName: model.outletName,
      outletLatitude: model.outletLatitude,
      outletLongitude: model.outletLongitude,
      geofenceRadiusMeters: model.geofenceRadiusMeters,
      scheduleServerId: model.scheduleServerId,
      visitOrder: model.visitOrder,
      scheduledClockIn: model.scheduledClockIn,
      scheduledClockOut: model.scheduledClockOut,
      allocatedMinutes: model.allocatedMinutes,
      visitPriority: model.visitPriority,
      visitType: _mapVisitTypeToDomain(model.visitType),
      status: _mapVisitStatusToDomain(model.status),
      actualClockIn: model.actualClockIn,
      actualClockOut: model.actualClockOut,
      visitDurationMins: model.visitDurationMins,
      clockInLatitude: model.clockInLatitude,
      clockInLongitude: model.clockInLongitude,
      clockInAccuracyMeters: model.clockInAccuracyMeters,
      clockInDistanceMeters: model.clockInDistanceMeters,
      clockOutLatitude: model.clockOutLatitude,
      clockOutLongitude: model.clockOutLongitude,
      clockOutAccuracyMeters: model.clockOutAccuracyMeters,
      clockOutDistanceMeters: model.clockOutDistanceMeters,
      geofenceOverride: model.geofenceOverride,
      overrideRequestId: model.overrideRequestId,
      skipReasonId: model.skipReasonId,
      skipReasonCode: model.skipReasonCode,
      skipNotes: model.skipNotes,
      clockInNotes: model.clockInNotes,
      clockOutNotes: model.clockOutNotes,
      visitNotes: model.visitNotes,
      syncState: SyncState.synced,
      lastSyncedAt: model.lastSyncedAt,
    );
  }

  DailyRouteStatusModel _mapStatusToModel(DailyRouteStatus status) {
    switch (status) {
      case DailyRouteStatus.pending:
        return DailyRouteStatusModel.pending;
      case DailyRouteStatus.activated:
        return DailyRouteStatusModel.activated;
      case DailyRouteStatus.inProgress:
        return DailyRouteStatusModel.inProgress;
      case DailyRouteStatus.closed:
        return DailyRouteStatusModel.closed;
      case DailyRouteStatus.forceClosed:
        return DailyRouteStatusModel.forceClosed;
    }
  }

  DailyRouteStatus _mapStatusToDomain(DailyRouteStatusModel status) {
    switch (status) {
      case DailyRouteStatusModel.pending:
        return DailyRouteStatus.pending;
      case DailyRouteStatusModel.activated:
        return DailyRouteStatus.activated;
      case DailyRouteStatusModel.inProgress:
        return DailyRouteStatus.inProgress;
      case DailyRouteStatusModel.closed:
        return DailyRouteStatus.closed;
      case DailyRouteStatusModel.forceClosed:
        return DailyRouteStatus.forceClosed;
    }
  }

  SyncStateModel _mapSyncStateToModel(SyncState syncState) {
    switch (syncState) {
      case SyncState.localOnly:
        return SyncStateModel.localOnly;
      case SyncState.syncing:
        return SyncStateModel.syncing;
      case SyncState.synced:
        return SyncStateModel.synced;
      case SyncState.syncFailed:
        return SyncStateModel.syncFailed;
      case SyncState.needsAttention:
        return SyncStateModel.needsAttention;
    }
  }

  SyncState _mapSyncStateToDomain(SyncStateModel syncState) {
    switch (syncState) {
      case SyncStateModel.localOnly:
        return SyncState.localOnly;
      case SyncStateModel.syncing:
        return SyncState.syncing;
      case SyncStateModel.synced:
        return SyncState.synced;
      case SyncStateModel.syncFailed:
        return SyncState.syncFailed;
      case SyncStateModel.needsAttention:
        return SyncState.needsAttention;
    }
  }

  VisitType _mapVisitTypeToDomain(visit_model.VisitTypeModel type) {
    switch (type) {
      case visit_model.VisitTypeModel.scheduled:
        return VisitType.scheduled;
      case visit_model.VisitTypeModel.adHoc:
        return VisitType.adHoc;
    }
  }

  VisitStatus _mapVisitStatusToDomain(visit_model.VisitStatusModel status) {
    switch (status) {
      case visit_model.VisitStatusModel.pending:
        return VisitStatus.pending;
      case visit_model.VisitStatusModel.inProgress:
        return VisitStatus.inProgress;
      case visit_model.VisitStatusModel.completed:
        return VisitStatus.completed;
      case visit_model.VisitStatusModel.skipped:
        return VisitStatus.skipped;
    }
  }

  visit_model.VisitTypeModel _mapVisitTypeToModel(VisitType type) {
    switch (type) {
      case VisitType.scheduled:
        return visit_model.VisitTypeModel.scheduled;
      case VisitType.adHoc:
        return visit_model.VisitTypeModel.adHoc;
    }
  }

  visit_model.VisitStatusModel _mapVisitStatusToModel(VisitStatus status) {
    switch (status) {
      case VisitStatus.pending:
        return visit_model.VisitStatusModel.pending;
      case VisitStatus.inProgress:
        return visit_model.VisitStatusModel.inProgress;
      case VisitStatus.completed:
        return visit_model.VisitStatusModel.completed;
      case VisitStatus.skipped:
        return visit_model.VisitStatusModel.skipped;
    }
  }

  visit_model.SyncStateModel _mapSyncStateToVisitModel(SyncState syncState) {
    switch (syncState) {
      case SyncState.localOnly:
        return visit_model.SyncStateModel.localOnly;
      case SyncState.syncing:
        return visit_model.SyncStateModel.syncing;
      case SyncState.synced:
        return visit_model.SyncStateModel.synced;
      case SyncState.syncFailed:
        return visit_model.SyncStateModel.syncFailed;
      case SyncState.needsAttention:
        return visit_model.SyncStateModel.needsAttention;
    }
  }

  visit_model.OutletVisitModel _toVisitModel(
    OutletVisit visit, {
    int? existingId,
  }) {
    return visit_model.OutletVisitModel()
      ..id = existingId
      ..localId = visit.localId
      ..serverId = visit.serverId
      ..dailyRouteLocalId = visit.dailyRouteLocalId
      ..dailyRouteServerId = visit.dailyRouteServerId
      ..outletId = visit.outletId
      ..outletCode = visit.outletCode
      ..outletName = visit.outletName
      ..outletLatitude = visit.outletLatitude
      ..outletLongitude = visit.outletLongitude
      ..geofenceRadiusMeters = visit.geofenceRadiusMeters
      ..scheduleServerId = visit.scheduleServerId
      ..visitOrder = visit.visitOrder
      ..scheduledClockIn = visit.scheduledClockIn
      ..scheduledClockOut = visit.scheduledClockOut
      ..allocatedMinutes = visit.allocatedMinutes
      ..visitPriority = visit.visitPriority
      ..visitType = _mapVisitTypeToModel(visit.visitType)
      ..status = _mapVisitStatusToModel(visit.status)
      ..actualClockIn = visit.actualClockIn
      ..actualClockOut = visit.actualClockOut
      ..visitDurationMins = visit.visitDurationMins
      ..clockInLatitude = visit.clockInLatitude
      ..clockInLongitude = visit.clockInLongitude
      ..clockInAccuracyMeters = visit.clockInAccuracyMeters
      ..clockInDistanceMeters = visit.clockInDistanceMeters
      ..clockOutLatitude = visit.clockOutLatitude
      ..clockOutLongitude = visit.clockOutLongitude
      ..clockOutAccuracyMeters = visit.clockOutAccuracyMeters
      ..clockOutDistanceMeters = visit.clockOutDistanceMeters
      ..geofenceOverride = visit.geofenceOverride
      ..overrideRequestId = visit.overrideRequestId
      ..skipReasonId = visit.skipReasonId
      ..skipReasonCode = visit.skipReasonCode
      ..skipNotes = visit.skipNotes
      ..clockInNotes = visit.clockInNotes
      ..clockOutNotes = visit.clockOutNotes
      ..visitNotes = visit.visitNotes
      ..syncState = _mapSyncStateToVisitModel(visit.syncState)
      ..syncError = visit.syncError
      ..lastSyncedAt = visit.lastSyncedAt
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();
  }

  Failure _mapDioError(DioException e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final data = e.response!.data;

      // Check if error is nested under 'detail' (FastAPI format)
      final errorData = data is Map && data.containsKey('detail')
          ? data['detail'] as Map<String, dynamic>?
          : data as Map<String, dynamic>?;

      final errorCode =
          errorData?['error'] as String? ?? errorData?['error_code'] as String?;
      final message = errorData?['message'] as String?;

      if (errorCode == 'ROUTE_BLOCKED') {
        final blockedDate = errorData?['blocked_route_date'] as String?;
        final blockedId = errorData?['blocked_route_id']?.toString();
        final blockedStatus = errorData?['status'] as String?;

        return RouteBlockedFailure(
          blockedRouteId: blockedId ?? '',
          blockedRouteDate: blockedDate != null
              ? DateTime.parse(blockedDate)
              : DateTime.now(),
          blockedRouteStatus: blockedStatus ?? 'unknown',
        );
      }

      if (errorCode == 'INVALID_ROUTE_STATE') {
        final currentState = errorData?['current_state'] as String?;
        return InvalidRouteStateFailure(
          currentStatus: currentState ?? 'unknown',
          operation: 'perform this action',
        );
      }

      switch (statusCode) {
        case 400:
          return ValidationFailure(
            message: message ?? 'Bad request',
            fieldErrors: const {},
          );
        case 401:
          return AuthFailure.tokenExpired(message: message ?? 'Unauthorized');
        case 403:
          return ForbiddenFailure.resourceForbidden(
            message: message ?? 'Forbidden',
          );
        case 404:
          return NotFoundFailure(
            resourceType: 'DailyRoute',
            resourceId: '',
            message: message ?? 'Not found',
          );
        case 409:
          return ConflictFailure.duplicateEntry(
            field: 'route',
            message: message ?? 'Conflict',
          );
        case 422:
          return ValidationFailure(
            message: message ?? 'Validation failed',
            fieldErrors: const {},
          );
        case 500:
        case 502:
        case 503:
          return ServerFailure.internalError(
            message: message ?? 'Server error',
          );
        default:
          return ServerFailure.internalError(
            message: message ?? 'Request failed',
          );
      }
    }

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return const NetworkFailure.timeout();
    }

    if (e.type == DioExceptionType.connectionError) {
      return const NetworkFailure.offline();
    }

    return UnknownFailure(message: e.message ?? 'Unknown error');
  }
}
