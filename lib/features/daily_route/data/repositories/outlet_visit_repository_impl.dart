import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/network/failures.dart';
import '../../domain/entities/daily_route.dart' show SyncState;
import '../../domain/entities/outlet_visit.dart';
import '../../domain/entities/geofence_override_request.dart';
import '../../domain/repositories/outlet_visit_repository.dart';
import '../datasources/daily_route_local_datasource.dart';
import '../datasources/daily_route_remote_datasource.dart';
import '../models/outlet_visit_model.dart' as visit_model;
import '../models/geofence_override_model.dart' as override_model;
import '../../../outlet_mapping/domain/entities/mapping_enums.dart';
import '../../../outlet_mapping/domain/entities/mapping_request.dart';

/// Implementation of [OutletVisitRepository].
///
/// Coordinates between local (Isar) and remote (API) data sources.
/// Follows offline-first pattern for clock operations.
class OutletVisitRepositoryImpl implements OutletVisitRepository {
  final DailyRouteLocalDataSource _localDataSource;
  final DailyRouteRemoteDataSource _remoteDataSource;
  final Uuid _uuid;

  OutletVisitRepositoryImpl({
    required DailyRouteLocalDataSource localDataSource,
    required DailyRouteRemoteDataSource remoteDataSource,
    Uuid? uuid,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource,
       _uuid = uuid ?? const Uuid();

  @override
  Future<Either<Failure, OutletVisit?>> getVisitByLocalId(
    String localId,
  ) async {
    try {
      final model = await _localDataSource.getVisitByLocalId(localId);
      if (model == null) return const Right(null);
      return Right(_visitToDomain(model));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OutletVisit?>> getVisitByServerId(
    String serverId,
  ) async {
    try {
      final model = await _localDataSource.getVisitByServerId(serverId);
      if (model == null) return const Right(null);
      return Right(_visitToDomain(model));
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

  @override
  Future<Either<Failure, OutletVisit?>> getActiveVisit() async {
    try {
      // TODO: Need to get current route ID from somewhere
      // For now, return null
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OutletVisit>>> getVisitsByStatus(
    String routeLocalId,
    VisitStatus status,
  ) async {
    try {
      final visits = await _localDataSource.getVisitsForRoute(routeLocalId);
      final filtered = visits.where((v) {
        return _mapVisitStatusToDomain(v.status) == status;
      }).toList();
      return Right(filtered.map((v) => _visitToDomain(v)).toList());
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OutletVisit>> clockIn({
    required String visitLocalId,
    required double latitude,
    required double longitude,
    required double accuracyMeters,
    String? verificationId,
    String? deviceId,
    String? notes,
  }) async {
    try {
      final localVisit = await _localDataSource.getVisitByLocalId(visitLocalId);
      if (localVisit == null) {
        return Left(
          NotFoundFailure(
            resourceType: 'OutletVisit',
            resourceId: visitLocalId,
          ),
        );
      }

      final serverId = localVisit.serverId ?? visitLocalId;
      final response = await _remoteDataSource.clockIn(
        serverId,
        latitude: latitude,
        longitude: longitude,
        accuracy: accuracyMeters,
        verificationId: verificationId,
        deviceId: deviceId,
        notes: notes,
      );

      final updatedVisit = response.toDomain(
        localVisit.localId,
        localVisit.dailyRouteLocalId,
      );
      final model = _visitToModel(updatedVisit, existingId: localVisit.id);
      await _localDataSource.saveVisit(model);

      return Right(updatedVisit);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OutletVisit>> clockOut({
    required String visitLocalId,
    required double latitude,
    required double longitude,
    required double accuracyMeters,
    String? notes,
  }) async {
    try {
      final localVisit = await _localDataSource.getVisitByLocalId(visitLocalId);
      if (localVisit == null) {
        return Left(
          NotFoundFailure(
            resourceType: 'OutletVisit',
            resourceId: visitLocalId,
          ),
        );
      }

      final serverId = localVisit.serverId ?? visitLocalId;
      final response = await _remoteDataSource.clockOut(
        serverId,
        latitude: latitude,
        longitude: longitude,
        accuracy: accuracyMeters,
        notes: notes,
      );

      final updatedVisit = response.toDomain(
        localVisit.localId,
        localVisit.dailyRouteLocalId,
      );
      final model = _visitToModel(updatedVisit, existingId: localVisit.id);
      await _localDataSource.saveVisit(model);

      return Right(updatedVisit);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OutletVisit>> skipVisit({
    required String visitLocalId,
    required int skipReasonId,
    String? skipNotes,
  }) async {
    try {
      final localVisit = await _localDataSource.getVisitByLocalId(visitLocalId);
      if (localVisit == null) {
        return Left(
          NotFoundFailure(
            resourceType: 'OutletVisit',
            resourceId: visitLocalId,
          ),
        );
      }

      final serverId = localVisit.serverId ?? visitLocalId;
      final response = await _remoteDataSource.skipVisit(
        serverId,
        reasonId: skipReasonId,
        notes: skipNotes,
      );

      final updatedVisit = response.toDomain(
        localVisit.localId,
        localVisit.dailyRouteLocalId,
      );
      final model = _visitToModel(updatedVisit, existingId: localVisit.id);
      await _localDataSource.saveVisit(model);

      return Right(updatedVisit);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OutletVisit>> addAdHocVisit({
    required String routeLocalId,
    required String outletId,
    required String outletCode,
    required String outletName,
    required double outletLatitude,
    required double outletLongitude,
    String? notes,
  }) async {
    // TODO: Implement when ad-hoc API is ready
    return Left(UnknownFailure(message: 'Not implemented'));
  }

  @override
  Future<Either<Failure, GeofenceOverrideRequest>> requestGeofenceOverride({
    required String visitLocalId,
    required double latitude,
    required double longitude,
    required double accuracyMeters,
    required String reason,
  }) async {
    try {
      final localVisit = await _localDataSource.getVisitByLocalId(visitLocalId);
      if (localVisit == null) {
        return Left(
          NotFoundFailure(
            resourceType: 'OutletVisit',
            resourceId: visitLocalId,
          ),
        );
      }

      final serverId = localVisit.serverId ?? visitLocalId;
      final response = await _remoteDataSource.requestOverride(
        serverId,
        latitude: latitude,
        longitude: longitude,
        accuracy: accuracyMeters,
        reason: reason,
      );

      final localId = _uuid.v4();
      final override = response.toDomain(
        localId,
        localVisit.localId,
        requestLatitude: latitude,
        requestLongitude: longitude,
        requestAccuracyMeters: accuracyMeters,
      );

      final model = _overrideToModel(override);
      await _localDataSource.saveOverride(model);

      return Right(override);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GeofenceOverrideRequest?>> getOverrideForVisit(
    String visitLocalId,
  ) async {
    try {
      final override = await _localDataSource.getPendingOverrideForVisit(
        visitLocalId,
      );
      if (override == null) return const Right(null);
      return Right(_overrideToDomain(override));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GeofenceOverrideRequest?>> getLatestOverrideForVisit(
    String visitLocalId,
  ) async {
    try {
      final override = await _localDataSource.getLatestOverrideForVisit(
        visitLocalId,
      );
      if (override == null) return const Right(null);
      return Right(_overrideToDomain(override));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GeofenceOverrideRequest>> refreshOverrideStatus(
    String overrideLocalId,
  ) async {
    try {
      final localOverride = await _localDataSource.getOverrideByLocalId(
        overrideLocalId,
      );
      if (localOverride == null) {
        return Left(
          NotFoundFailure(
            resourceType: 'GeofenceOverrideRequest',
            resourceId: overrideLocalId,
          ),
        );
      }

      final serverId = localOverride.serverId ?? overrideLocalId;
      final response = await _remoteDataSource.getOverrideStatus(serverId);

      final updated = response.toDomain(
        localOverride.localId,
        localOverride.outletVisitLocalId,
        requestLatitude: localOverride.requestLatitude,
        requestLongitude: localOverride.requestLongitude,
        requestAccuracyMeters: localOverride.requestAccuracyMeters,
      );
      final model = _overrideToModel(updated, existingId: localOverride.id);
      await _localDataSource.saveOverride(model);

      return Right(updated);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OutletVisit>> clockInWithOverride({
    required String visitLocalId,
    required String overrideLocalId,
    String? verificationId,
    String? deviceId,
    String? notes,
  }) async {
    try {
      final localVisit = await _localDataSource.getVisitByLocalId(visitLocalId);
      if (localVisit == null) {
        return Left(
          NotFoundFailure(
            resourceType: 'OutletVisit',
            resourceId: visitLocalId,
          ),
        );
      }

      final localOverride = await _localDataSource.getOverrideByLocalId(
        overrideLocalId,
      );
      if (localOverride == null) {
        return Left(
          NotFoundFailure(
            resourceType: 'GeofenceOverrideRequest',
            resourceId: overrideLocalId,
          ),
        );
      }

      final serverId = localVisit.serverId ?? visitLocalId;
      final overrideServerId = localOverride.serverId;

      final response = await _remoteDataSource.clockIn(
        serverId,
        latitude: localOverride.requestLatitude,
        longitude: localOverride.requestLongitude,
        accuracy: localOverride.requestAccuracyMeters,
        verificationId: verificationId,
        deviceId: deviceId,
        notes: notes,
        overrideRequestId: overrideServerId,
      );

      final updatedVisit = response.toDomain(
        localVisit.localId,
        localVisit.dailyRouteLocalId,
      );
      final model = _visitToModel(updatedVisit, existingId: localVisit.id);
      await _localDataSource.saveVisit(model);

      return Right(updatedVisit);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OutletVisit>> updateVisitStatus({
    required String visitLocalId,
    required VisitStatus status,
    DateTime? actualClockIn,
    DateTime? actualClockOut,
    int? visitDurationMins,
  }) async {
    try {
      final localVisit = await _localDataSource.getVisitByLocalId(visitLocalId);
      if (localVisit == null) {
        return Left(
          NotFoundFailure(
            resourceType: 'OutletVisit',
            resourceId: visitLocalId,
          ),
        );
      }

      localVisit.status = _mapStatusToModel(status);
      if (actualClockIn != null) localVisit.actualClockIn = actualClockIn;
      if (actualClockOut != null) localVisit.actualClockOut = actualClockOut;
      if (visitDurationMins != null)
        localVisit.visitDurationMins = visitDurationMins;
      localVisit.updatedAt = DateTime.now();

      await _localDataSource.saveVisit(localVisit);
      return Right(_visitToDomain(localVisit));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> syncPendingOperations() async {
    // TODO: Implement sync logic for pending operations
    // This would query local db for unsynced records and push to server
    return const Right(null);
  }

  @override
  Future<Either<Failure, OutletVisit>> refreshFromServer(
    String visitServerId,
  ) async {
    try {
      // TODO: Need an API endpoint to get a single visit by server ID
      // For now, return not found
      return Left(
        NotFoundFailure(
          resourceType: 'OutletVisit',
          resourceId: visitServerId,
          message: 'Refresh from server not yet implemented',
        ),
      );
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  // === Mapper Helpers ===

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
      mappingRequest: model.mappingRequestId == null
          ? null
          : MappingRequest(
              requestId: model.mappingRequestId!,
              footprintId: model.mappingFootprintId,
              footprintStatus: model.mappingFootprintStatus == null
                  ? null
                  : MappingFootprintStatus.values.byName(model.mappingFootprintStatus!),
            ),
    );
  }

  visit_model.OutletVisitModel _visitToModel(
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
      ..status = _mapStatusToModel(visit.status)
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
      ..syncState = visit_model.SyncStateModel.synced
      ..syncError = visit.syncError
      ..lastSyncedAt = visit.lastSyncedAt
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..mappingRequestId = visit.mappingRequest?.requestId
      ..mappingFootprintId = visit.mappingRequest?.footprintId
      ..mappingFootprintStatus = visit.mappingRequest?.footprintStatus?.name;
  }

  GeofenceOverrideRequest _overrideToDomain(
    override_model.GeofenceOverrideModel model,
  ) {
    return GeofenceOverrideRequest(
      localId: model.localId,
      serverId: model.serverId,
      outletVisitLocalId: model.outletVisitLocalId,
      outletVisitServerId: model.outletVisitServerId,
      requestedByUserId: model.requestedByUserId,
      requestedByName: model.requestedByName,
      requestedAt: model.requestedAt,
      reason: model.reason,
      requestLatitude: model.requestLatitude,
      requestLongitude: model.requestLongitude,
      requestAccuracyMeters: model.requestAccuracyMeters,
      distanceFromOutlet: model.distanceFromOutlet,
      outletName: model.outletName,
      outletCode: model.outletCode,
      status: _mapOverrideStatusToDomain(model.status),
      expiresAt: model.expiresAt,
      decidedByUserId: model.decidedByUserId,
      decidedByName: model.decidedByName,
      decidedAt: model.decidedAt,
      decisionNotes: model.decisionNotes,
      syncState: SyncState.synced,
    );
  }

  override_model.GeofenceOverrideModel _overrideToModel(
    GeofenceOverrideRequest override, {
    int? existingId,
  }) {
    return override_model.GeofenceOverrideModel()
      ..id = existingId
      ..localId = override.localId
      ..serverId = override.serverId
      ..outletVisitLocalId = override.outletVisitLocalId
      ..outletVisitServerId = override.outletVisitServerId
      ..requestedByUserId = override.requestedByUserId
      ..requestedByName = override.requestedByName
      ..requestedAt = override.requestedAt
      ..reason = override.reason
      ..requestLatitude = override.requestLatitude
      ..requestLongitude = override.requestLongitude
      ..requestAccuracyMeters = override.requestAccuracyMeters
      ..distanceFromOutlet = override.distanceFromOutlet
      ..outletName = override.outletName
      ..outletCode = override.outletCode
      ..status = _mapOverrideStatusToModel(override.status)
      ..expiresAt = override.expiresAt
      ..decidedByUserId = override.decidedByUserId
      ..decidedByName = override.decidedByName
      ..decidedAt = override.decidedAt
      ..decisionNotes = override.decisionNotes
      ..syncState = override_model.SyncStateModel.synced
      ..syncError = override.syncError
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();
  }

  visit_model.VisitStatusModel _mapStatusToModel(VisitStatus status) {
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

  VisitType _mapVisitTypeToDomain(visit_model.VisitTypeModel type) {
    switch (type) {
      case visit_model.VisitTypeModel.scheduled:
        return VisitType.scheduled;
      case visit_model.VisitTypeModel.adHoc:
        return VisitType.adHoc;
    }
  }

  override_model.GeofenceOverrideStatusModel _mapOverrideStatusToModel(
    GeofenceOverrideStatus status,
  ) {
    switch (status) {
      case GeofenceOverrideStatus.pending:
        return override_model.GeofenceOverrideStatusModel.pending;
      case GeofenceOverrideStatus.approved:
        return override_model.GeofenceOverrideStatusModel.approved;
      case GeofenceOverrideStatus.rejected:
        return override_model.GeofenceOverrideStatusModel.rejected;
      case GeofenceOverrideStatus.expired:
        return override_model.GeofenceOverrideStatusModel.expired;
    }
  }

  GeofenceOverrideStatus _mapOverrideStatusToDomain(
    override_model.GeofenceOverrideStatusModel status,
  ) {
    switch (status) {
      case override_model.GeofenceOverrideStatusModel.pending:
        return GeofenceOverrideStatus.pending;
      case override_model.GeofenceOverrideStatusModel.approved:
        return GeofenceOverrideStatus.approved;
      case override_model.GeofenceOverrideStatusModel.rejected:
        return GeofenceOverrideStatus.rejected;
      case override_model.GeofenceOverrideStatusModel.expired:
        return GeofenceOverrideStatus.expired;
    }
  }

  Failure _mapDioError(DioException e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final raw = e.response!.data;

      // Backend error envelope can be:
      //   { "detail": { "error": "...", ... } }                (structured)
      //   { "error_code": "...", "message": "..." }            (legacy flat)
      //   { "detail": "string message" }                        (plain FastAPI)
      final Map<String, dynamic> data = () {
        if (raw is Map && raw['detail'] is Map) {
          return Map<String, dynamic>.from(raw['detail'] as Map);
        }
        if (raw is Map) {
          return Map<String, dynamic>.from(raw);
        }
        return <String, dynamic>{};
      }();

      // Accept both new ("error") and legacy ("error_code") keys.
      final errorCode =
          (data['error'] as String?) ?? (data['error_code'] as String?);
      final message =
          data['message'] as String? ??
          (raw is Map && raw['detail'] is String
              ? raw['detail'] as String
              : null);

      double? numAt(List<String> keys) {
        for (final k in keys) {
          final v = data[k];
          if (v is num) return v.toDouble();
        }
        return null;
      }

      if (errorCode == 'GEOFENCE_VIOLATION') {
        // New nested shape uses your_location / outlet_location maps.
        final yourLoc = data['your_location'];
        final outletLoc = data['outlet_location'];
        final userLat =
            (yourLoc is Map ? (yourLoc['lat'] as num?) : null)?.toDouble() ??
            numAt(['user_latitude']);
        final userLon =
            (yourLoc is Map ? (yourLoc['lng'] as num?) : null)?.toDouble() ??
            numAt(['user_longitude']);
        final outletLat =
            (outletLoc is Map ? (outletLoc['lat'] as num?) : null)
                ?.toDouble() ??
            numAt(['outlet_latitude']);
        final outletLon =
            (outletLoc is Map ? (outletLoc['lng'] as num?) : null)
                ?.toDouble() ??
            numAt(['outlet_longitude']);
        final distance = numAt(['distance_meters', 'distance']);
        final required = numAt(['required_radius_meters', 'required_radius']);
        final canOverride = data['can_request_override'] as bool? ?? true;

        return GeofenceViolationFailure(
          userLatitude: userLat ?? 0,
          userLongitude: userLon ?? 0,
          outletLatitude: outletLat ?? 0,
          outletLongitude: outletLon ?? 0,
          distanceMeters: distance ?? 0,
          requiredRadiusMeters: required ?? 50,
          canRequestOverride: canOverride,
        );
      }

      if (errorCode == 'GPS_ACCURACY_INSUFFICIENT') {
        final current = numAt(['current_accuracy_meters', 'current_accuracy']);
        return GpsAccuracyFailure(currentAccuracy: current ?? 0);
      }

      if (errorCode == 'VISIT_IN_PROGRESS') {
        final visitId = data['active_visit_id'] as String?;
        final outletName = data['active_outlet_name'] as String?;
        return VisitInProgressFailure(
          activeVisitLocalId: visitId ?? '',
          activeOutletName: outletName ?? 'another outlet',
        );
      }

      if (errorCode == 'INVALID_VISIT_STATE') {
        final currentState = data['current_state'] as String?;
        return InvalidVisitStateFailure(
          currentStatus: currentState ?? 'unknown',
          operation: 'perform this action',
        );
      }

      // Clock-in's own rejection of a missing/expired/invalid/already-used
      // verification_id — see the "Phase 5" plan's section D. Distinct
      // from `/biometrics/verify`'s own error codes (handled in
      // BiometricRepositoryImpl), since these are returned by the
      // clock-in endpoint itself.
      final clockInRejectionReason = switch (errorCode) {
        'BIOMETRIC_VERIFICATION_REQUIRED' =>
          BiometricClockInRejectionReason.verificationRequired,
        'BIOMETRIC_VERIFICATION_EXPIRED' =>
          BiometricClockInRejectionReason.verificationExpired,
        'BIOMETRIC_VERIFICATION_INVALID' =>
          BiometricClockInRejectionReason.verificationInvalid,
        'BIOMETRIC_VERIFICATION_ALREADY_USED' =>
          BiometricClockInRejectionReason.verificationAlreadyUsed,
        _ => null,
      };
      if (clockInRejectionReason != null) {
        return BiometricVerificationFailure.clockInRejected(
          reason: clockInRejectionReason,
          message: message ?? 'Verification could not be completed. Please try again.',
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
            resourceType: 'OutletVisit',
            resourceId: '',
            message: message ?? 'Not found',
          );
        case 409:
          return ConflictFailure.duplicateEntry(
            field: 'visit',
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
