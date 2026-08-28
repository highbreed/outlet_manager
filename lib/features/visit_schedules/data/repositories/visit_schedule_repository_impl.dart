import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../../domain/entities/visit_schedule.dart';
import '../../domain/repositories/visit_schedule_repository.dart';
import '../datasources/visit_schedule_local_datasource.dart';
import '../datasources/visit_schedule_remote_datasource.dart';
import '../models/visit_schedule_mapper.dart';
import '../models/visit_schedule_model.dart';

/// Implementation of [VisitScheduleRepository].
///
/// Uses offline-first pattern:
/// 1. Read from local cache first
/// 2. Sync from backend when requested
/// 3. Update local cache after sync
class VisitScheduleRepositoryImpl implements VisitScheduleRepository {
  final VisitScheduleLocalDataSource _localDataSource;
  final VisitScheduleRemoteDataSource _remoteDataSource;
  final String _currentAgentId;

  VisitScheduleRepositoryImpl({
    required VisitScheduleLocalDataSource localDataSource,
    required VisitScheduleRemoteDataSource remoteDataSource,
    required String currentAgentId,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource,
       _currentAgentId = currentAgentId;

  @override
  Future<Either<Failure, List<VisitSchedule>>> getAllSchedules() async {
    try {
      final models = await _localDataSource.getAllSchedules();
      return Right(models.toEntities());
    } catch (e) {
      return Left(UnknownFailure(message: 'Failed to load schedules: $e'));
    }
  }

  @override
  Future<Either<Failure, List<VisitSchedule>>> getSchedulesForDay(
    int dayOfWeek,
  ) async {
    try {
      final models = await _localDataSource.getSchedulesForDay(dayOfWeek);
      return Right(models.toEntities());
    } catch (e) {
      return Left(
        UnknownFailure(message: 'Failed to load schedules for day: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, List<VisitSchedule>>> getTodaysSchedules() async {
    // Convert Flutter weekday (1=Monday, 7=Sunday) to our format (0=Monday, 6=Sunday)
    final todayDayOfWeek = DateTime.now().weekday - 1;
    return getSchedulesForDay(todayDayOfWeek);
  }

  @override
  Stream<List<VisitSchedule>> watchSchedulesForDay(int dayOfWeek) {
    return _localDataSource
        .watchSchedulesForDay(dayOfWeek)
        .map((models) => models.toEntities());
  }

  @override
  Stream<List<VisitSchedule>> watchAllSchedules() {
    return _localDataSource.watchAllSchedules().map(
      (models) => models.toEntities(),
    );
  }

  @override
  Future<Either<Failure, void>> syncSchedules() async {
    try {
      // Fetch week schedule from backend using /me/week endpoint
      final response = await _remoteDataSource.getMyWeekSchedule();

      // Convert to models
      final models = <VisitScheduleModel>[];
      final now = DateTime.now();

      for (final entry in response.allSchedules) {
        final item = entry.item;
        final model = VisitScheduleModel()
          ..serverId = item.id.toString()
          ..salesAgentServerId = _currentAgentId
          ..outletId = item.customerId.toString()
          ..outletCode = item.cardCode
          ..outletName = item.customerName
          ..outletLatitude = item.latitude ?? 0.0
          ..outletLongitude = item.longitude ?? 0.0
          ..outletAddress = item.address
          ..dayOfWeek = entry.dayOfWeek
          ..scheduledClockIn = item.scheduledClockIn
          ..scheduledClockOut = item.scheduledClockOut
          ..visitOrder = item.visitOrder
          ..visitPriority = item.visitPriority
          ..allocatedMinutes = item.visitDurationMins
          ..effectiveFrom = item.effectiveFrom ?? now
          ..effectiveTo = item.effectiveTo
          ..isActive = item.isActive
          ..lastSyncedAt = now;

        models.add(model);
      }

      // Save to local storage (replaces all existing)
      await _localDataSource.saveAllSchedules(models);
      await _localDataSource.setLastSyncTime(now);

      return const Right(null);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(
        ServerFailure.internalError(message: 'Failed to sync schedules: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, Map<int, int>>> getScheduleCountsByDay() async {
    try {
      final counts = await _localDataSource.getScheduleCountsByDay();
      return Right(counts);
    } catch (e) {
      return Left(UnknownFailure(message: 'Failed to get schedule counts: $e'));
    }
  }

  @override
  Future<DateTime?> getLastSyncTime() {
    return _localDataSource.getLastSyncTime();
  }

  Failure _mapDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return const NetworkFailure.timeout();
    }

    if (e.type == DioExceptionType.connectionError) {
      return const NetworkFailure.offline();
    }

    final statusCode = e.response?.statusCode;
    final data = e.response?.data;

    if (statusCode == 401) {
      return const AuthFailure.tokenExpired(
        message: 'Session expired. Please login again.',
      );
    }

    if (statusCode == 403) {
      return const ForbiddenFailure.insufficientPermissions(
        requiredPermission: 'visit:schedule:list',
        message: 'You do not have permission to view schedules',
      );
    }

    if (data is Map && data['message'] != null) {
      return ServerFailure.internalError(message: data['message'] as String);
    }

    return ServerFailure.internalError(
      message: e.message ?? 'Failed to sync schedules',
    );
  }
}
