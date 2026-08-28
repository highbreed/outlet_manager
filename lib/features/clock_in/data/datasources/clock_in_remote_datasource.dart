import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../../domain/entities/clock_in_session.dart';
import '../../domain/entities/clock_session_event.dart';
import '../models/clock_in_session_mapper.dart';
import '../models/clock_session_event_mapper.dart';

/// Remote data source for clock-in operations using REST API
class ClockInRemoteDataSource {
  final Dio _dio;

  ClockInRemoteDataSource({required Dio dio}) : _dio = dio;

  /// Clock in at an outlet
  Future<Either<Failure, Map<String, dynamic>>> clockIn({
    required String outletId,
    required String outletName,
    required String outletCode,
    required bool isDeviation,
    String? routeId,
    required double latitude,
    required double longitude,
    required double accuracy,
    required int allocatedMinutes,
    required String localId,
  }) async {
    try {
      final response = await _dio.post(
        '/clock-in',
        data: {
          'local_id': localId,
          'outlet_id': outletId,
          'outlet_name': outletName,
          'outlet_code': outletCode,
          'is_deviation': isDeviation,
          'route_id': routeId,
          'latitude': latitude,
          'longitude': longitude,
          'accuracy': accuracy,
          'allocated_minutes': allocatedMinutes,
        },
      );
      return Right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure.internalError(message: e.toString()));
    }
  }

  /// Clock out from an outlet
  Future<Either<Failure, Map<String, dynamic>>> clockOut({
    required String sessionId,
    required double transportExpense,
    required String routeCovered,
    required bool hasOrder,
    required double latitude,
    required double longitude,
    required double accuracy,
    required String clockOutReason,
  }) async {
    try {
      final response = await _dio.put(
        '/clock-in/$sessionId/clock-out',
        data: {
          'transport_expense': transportExpense,
          'route_covered': routeCovered,
          'has_order': hasOrder,
          'latitude': latitude,
          'longitude': longitude,
          'accuracy': accuracy,
          'clock_out_reason': clockOutReason,
        },
      );
      return Right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure.internalError(message: e.toString()));
    }
  }

  /// Auto clock out (triggered by geofence exit)
  Future<Either<Failure, Map<String, dynamic>>> autoClockOut({
    required String sessionId,
    required String reason,
    required double latitude,
    required double longitude,
    required double accuracy,
  }) async {
    try {
      final response = await _dio.put(
        '/clock-in/$sessionId/auto-clock-out',
        data: {
          'reason': reason,
          'latitude': latitude,
          'longitude': longitude,
          'accuracy': accuracy,
        },
      );
      return Right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure.internalError(message: e.toString()));
    }
  }

  /// Get active session from server (for sync check)
  Future<Either<Failure, Map<String, dynamic>?>> getActiveSession() async {
    try {
      final response = await _dio.get('/clock-in/active');
      final data = response.data as Map<String, dynamic>;
      if (data.isEmpty || data['data'] == null) return const Right(null);
      return Right(data['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure.internalError(message: e.toString()));
    }
  }

  /// Get session history
  Future<Either<Failure, List<Map<String, dynamic>>>> getSessionHistory({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final response = await _dio.get(
        '/clock-in/history',
        queryParameters: {
          'start_date': startDate.toIso8601String(),
          'end_date': endDate.toIso8601String(),
        },
      );
      final data = response.data as Map<String, dynamic>;
      final list = data['data'] as List<dynamic>? ?? [];
      return Right(list.cast<Map<String, dynamic>>());
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure.internalError(message: e.toString()));
    }
  }

  /// Sync a local session to the server
  Future<Either<Failure, Map<String, dynamic>>> syncSession(
    ClockInSession session,
  ) async {
    try {
      final response = await _dio.post(
        '/clock-in/sync',
        data: session.toApiJson(),
      );
      return Right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure.internalError(message: e.toString()));
    }
  }

  /// Sync session events to the server
  Future<Either<Failure, void>> syncSessionEvents({
    required String sessionId,
    required List<ClockSessionEvent> events,
  }) async {
    try {
      await _dio.post(
        '/clock-in/$sessionId/events',
        data: {'events': events.map((e) => e.toApiJson()).toList()},
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure.internalError(message: e.toString()));
    }
  }

  /// Update session location (for tracking)
  Future<Either<Failure, void>> updateLocation({
    required String sessionId,
    required double latitude,
    required double longitude,
    required double accuracy,
    required bool isInsideGeofence,
  }) async {
    try {
      await _dio.post(
        '/clock-in/$sessionId/location',
        data: {
          'latitude': latitude,
          'longitude': longitude,
          'accuracy': accuracy,
          'is_inside_geofence': isInsideGeofence,
        },
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure.internalError(message: e.toString()));
    }
  }

  /// Handle Dio errors and map to appropriate Failure types
  Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure.timeout();
      case DioExceptionType.connectionError:
        return const NetworkFailure.offline();
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode ?? 0;
        final data = error.response?.data;
        final message = data is Map ? data['message'] as String? : null;
        if (statusCode == 401) {
          return AuthFailure.tokenExpired(message: message ?? 'Unauthorized');
        } else if (statusCode == 403) {
          return ForbiddenFailure.resourceForbidden(
            message: message ?? 'Forbidden',
          );
        } else if (statusCode == 404) {
          return NotFoundFailure(
            resourceType: 'Resource',
            resourceId: '',
            message: message ?? 'Not found',
          );
        } else if (statusCode >= 500) {
          return ServerFailure.internalError(
            message: message ?? 'Server error',
          );
        }
        return ServerFailure.internalError(
          message: message ?? 'Request failed',
        );
      case DioExceptionType.cancel:
        return const ServerFailure.internalError(message: 'Request cancelled');
      case DioExceptionType.badCertificate:
        return const NetworkFailure.sslError();
      case DioExceptionType.unknown:
        return ServerFailure.internalError(
          message: error.message ?? 'Unknown error',
        );
    }
  }
}
