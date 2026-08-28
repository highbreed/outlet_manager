import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_exceptions.dart';

/// Remote datasource for Horizontal Facings Count API (`/facings`)
class FacingsCountRemoteDataSource {
  final Dio _dio;

  FacingsCountRemoteDataSource(this._dio);

  /// POST /facings - Create a new session (FacingsSessionCreate)
  Future<Map<String, dynamic>> createSession(Map<String, dynamic> data) async {
    try {
      print('[FacingsCountDS] POST ${ApiEndpoints.facings} data=$data');
      final response = await _dio.post(ApiEndpoints.facings, data: data);
      print('[FacingsCountDS] Created session: ${response.data['id']}');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('[FacingsCountDS] DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }

  /// GET /facings - List sessions
  Future<Map<String, dynamic>> getSessions({
    int? customerId,
    int? salesAgentId,
    String? status,
    int page = 1,
    int size = 50,
  }) async {
    try {
      final queryParams = <String, dynamic>{'page': page, 'size': size};
      if (customerId != null) queryParams['customer_id'] = customerId;
      if (salesAgentId != null) queryParams['sales_agent_id'] = salesAgentId;
      if (status != null) queryParams['status'] = status;

      print('[FacingsCountDS] GET ${ApiEndpoints.facings} params=$queryParams');
      final response = await _dio.get(
        ApiEndpoints.facings,
        queryParameters: queryParams,
      );

      print(
        '[FacingsCountDS] Response: ${(response.data['items'] as List?)?.length ?? 0} sessions',
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('[FacingsCountDS] DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }

  /// GET /facings/by-visit/{outlet_visit_id} - All sessions for a visit
  Future<List<Map<String, dynamic>>> getSessionsByVisit(
    int outletVisitId,
  ) async {
    try {
      final url = '${ApiEndpoints.facingsByVisit}/$outletVisitId';
      print('[FacingsCountDS] GET $url');
      final response = await _dio.get(url);
      return (response.data as List<dynamic>).cast<Map<String, dynamic>>();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        print('[FacingsCountDS] No sessions found for visit $outletVisitId');
        return [];
      }
      print('[FacingsCountDS] DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }

  /// GET /facings/{id} - Get single session
  Future<Map<String, dynamic>> getSessionById(int id) async {
    try {
      final url = '${ApiEndpoints.facings}/$id';
      print('[FacingsCountDS] GET $url');
      final response = await _dio.get(url);
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('[FacingsCountDS] DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }

  /// PATCH /facings/{id} - Save progress (FacingsSessionUpdate)
  Future<Map<String, dynamic>> saveProgress(
    int id,
    Map<String, dynamic> data,
  ) async {
    try {
      final url = '${ApiEndpoints.facings}/$id';
      print('[FacingsCountDS] PATCH $url');
      final response = await _dio.patch(url, data: data);
      print('[FacingsCountDS] Progress saved for session $id');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('[FacingsCountDS] DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }

  /// POST /facings/{id}/submit - Submit session (FacingsSessionSubmit,
  /// entries required, min 1)
  Future<Map<String, dynamic>> submitSession(
    int id,
    Map<String, dynamic> data,
  ) async {
    try {
      final url = '${ApiEndpoints.facings}/$id/submit';
      print('[FacingsCountDS] POST $url data=$data');
      final response = await _dio.post(url, data: data);
      print('[FacingsCountDS] Session $id submitted');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('[FacingsCountDS] DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }
}
