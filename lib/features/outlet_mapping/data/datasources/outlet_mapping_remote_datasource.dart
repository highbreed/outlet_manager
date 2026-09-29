import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../models/mapping_response_models.dart';

/// Thin Dio calls against the frozen outlet-mapping contract — no error
/// mapping here (that's the repository's job, spec §81/§82), no retry
/// (owned by the uploader, spec §29/§H).
abstract class OutletMappingRemoteDataSource {
  /// [visitId] is the backend's integer `outlet_visits.id` (NOT the local
  /// UUID) — confirmed integer by direct precedent elsewhere in this same
  /// codebase against the same backend family: `visit_id` sent inside a
  /// request body (not a URL path) is always an int, e.g.
  /// `daily_route_repository_impl.dart`'s `closeRoute()` does
  /// `'visit_id': int.parse(visitModel.serverId!)` for the exact same
  /// field name in the exact same position (a JSON body, not a path
  /// segment).
  Future<StartCaptureResponse> startCapture({
    required int requestId,
    required int visitId,
  });

  /// [samples] are already-serialized JSON maps (spec §25 exact field
  /// names) — the caller (repository) owns turning [MappingSample]
  /// entities into wire shape, keeping this datasource a pure transport
  /// layer like every other datasource in this codebase.
  Future<UploadSamplesResponse> uploadSamples({
    required int footprintId,
    required List<Map<String, dynamic>> samples,
  });

  Future<FinishCaptureResponse> finishCapture(int footprintId);

  Future<CaptureStatusResponse> getCaptureStatus(int footprintId);

  Future<AbandonCaptureResponse> abandonCapture(int footprintId);
}

class OutletMappingRemoteDataSourceImpl implements OutletMappingRemoteDataSource {
  final Dio _dio;

  OutletMappingRemoteDataSourceImpl(this._dio);

  @override
  Future<StartCaptureResponse> startCapture({
    required int requestId,
    required int visitId,
  }) async {
    final response = await _dio.post(
      ApiEndpoints.outletMappingCaptures(requestId),
      data: {'visit_id': visitId},
    );
    return StartCaptureResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<UploadSamplesResponse> uploadSamples({
    required int footprintId,
    required List<Map<String, dynamic>> samples,
  }) async {
    final response = await _dio.post(
      ApiEndpoints.outletFootprintSamples(footprintId),
      data: {'samples': samples},
      // Retry is queue-driven, not Dio-level — see the uploader. A blind
      // Dio-level retry after a timeout risks a duplicate-looking batch
      // attempt landing while the previous one is still in flight
      // server-side (spec §29).
      options: Options(extra: {'skipRetry': true}),
    );
    return UploadSamplesResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<FinishCaptureResponse> finishCapture(int footprintId) async {
    final response = await _dio.post(
      ApiEndpoints.outletFootprintFinish(footprintId),
      options: Options(extra: {'skipRetry': true}),
    );
    return FinishCaptureResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<CaptureStatusResponse> getCaptureStatus(int footprintId) async {
    final response =
        await _dio.get(ApiEndpoints.outletFootprintCaptureStatus(footprintId));
    return CaptureStatusResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<AbandonCaptureResponse> abandonCapture(int footprintId) async {
    final response = await _dio.post(
      ApiEndpoints.outletFootprintAbandon(footprintId),
      options: Options(extra: {'skipRetry': true}),
    );
    return AbandonCaptureResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
