import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../../domain/entities/mapping_sample.dart';
import '../../domain/repositories/outlet_mapping_repository.dart';
import '../datasources/outlet_mapping_remote_datasource.dart';
import '../models/mapping_response_models.dart';

class OutletMappingRepositoryImpl implements OutletMappingRepository {
  final OutletMappingRemoteDataSource _remoteDataSource;

  OutletMappingRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, StartCaptureResponse>> startCapture({
    required int requestId,
    required int visitId,
  }) async {
    try {
      final response = await _remoteDataSource.startCapture(
        requestId: requestId,
        visitId: visitId,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UploadSamplesResponse>> uploadSamples({
    required int footprintId,
    required List<MappingSample> samples,
  }) async {
    try {
      // Exact backend field names (spec §25) — latitude/longitude, NOT
      // lat/lng, no nested coords object. Optional fields omitted
      // entirely (not sent as null) when the sample doesn't carry them —
      // spec §26.
      final wireSamples = samples.map((s) {
        final map = <String, dynamic>{
          'client_sample_id': s.clientSampleId,
          'latitude': s.latitude,
          'longitude': s.longitude,
          'accuracy_m': s.accuracyM,
          'recorded_at': s.recordedAt.toUtc().toIso8601String(),
          'sequence': s.sequence,
        };
        if (s.altitudeM != null) map['altitude_m'] = s.altitudeM;
        if (s.verticalAccuracyM != null) map['vertical_accuracy_m'] = s.verticalAccuracyM;
        if (s.floorLabel != null) map['floor_label'] = s.floorLabel;
        if (s.speedMps != null) map['speed_mps'] = s.speedMps;
        if (s.headingDeg != null) map['heading_deg'] = s.headingDeg;
        if (s.provider != null) map['provider'] = s.provider;
        if (s.isMock != null) map['is_mock'] = s.isMock;
        return map;
      }).toList();

      final response = await _remoteDataSource.uploadSamples(
        footprintId: footprintId,
        samples: wireSamples,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FinishCaptureResponse>> finishCapture(int footprintId) async {
    try {
      final response = await _remoteDataSource.finishCapture(footprintId);
      return Right(response);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CaptureStatusResponse>> getCaptureStatus(int footprintId) async {
    try {
      final response = await _remoteDataSource.getCaptureStatus(footprintId);
      return Right(response);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AbandonCaptureResponse>> abandonCapture(int footprintId) async {
    try {
      final response = await _remoteDataSource.abandonCapture(footprintId);
      return Right(response);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  /// Spec §12's exact error envelope: 409/413 →
  /// `{"detail":{"error":CODE,"message":"..."}}`; 403/404 →
  /// `{"detail":"<string>"}`; 422 →
  /// `{"error":{"type":"validation_error","message":"...","details":[]}}`.
  /// Branches primarily on HTTP status, per the spec's own instruction —
  /// not on the shape of the body alone, which differs by status.
  Failure _mapDioError(DioException e) {
    final statusCode = e.response?.statusCode;
    final raw = e.response?.data;

    if (statusCode == null) {
      // No response at all — genuine transport failure, not a mapping-
      // specific one. Let the generic network/timeout mapping apply.
      return switch (e.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout =>
          const NetworkFailure.timeout(),
        DioExceptionType.connectionError => const NetworkFailure.offline(),
        _ => UnknownFailure(message: e.message ?? 'Unknown error'),
      };
    }

    if (statusCode == 403 || statusCode == 404) {
      final message = raw is Map && raw['detail'] is String
          ? raw['detail'] as String
          : null;
      return statusCode == 403
          ? OutletMappingFailure.forbidden(message: message ?? 'You are not authorized to map this outlet')
          : OutletMappingFailure.notFound(message: message ?? 'Mapping request not found');
    }

    if (statusCode == 409 || statusCode == 413) {
      final detail = raw is Map ? raw['detail'] : null;
      final code = detail is Map ? detail['error'] as String? : null;
      final message = detail is Map ? detail['message'] as String? : null;

      if (statusCode == 413 || code == 'TOO_MANY_SAMPLES') {
        return OutletMappingFailure.tooManySamples(
          message: message ?? 'Maximum mapping readings reached',
        );
      }
      return OutletMappingFailure.conflict(
        code: code ?? 'UNKNOWN_CONFLICT',
        message: message ?? 'This mapping session cannot continue right now',
      );
    }

    if (statusCode == 422) {
      final errorObj = raw is Map ? raw['error'] : null;
      final message = errorObj is Map ? errorObj['message'] as String? : null;
      return OutletMappingFailure.validation(message: message ?? 'Invalid mapping request');
    }

    if (statusCode == 429) {
      final retryAfterHeader = e.response?.headers.value('retry-after');
      final seconds = int.tryParse(retryAfterHeader ?? '');
      return RateLimitFailure(retryAfter: Duration(seconds: seconds ?? 5));
    }

    if (statusCode >= 500) {
      return const ServerFailure.internalError();
    }

    return UnknownFailure(message: 'Unexpected status $statusCode');
  }
}
