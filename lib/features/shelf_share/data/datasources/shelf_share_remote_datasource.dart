import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_exceptions.dart';

/// Remote datasource for Shelf Share API
class ShelfShareRemoteDataSource {
  final Dio _dio;

  ShelfShareRemoteDataSource(this._dio);

  /// POST /shelf-share - Create a new session
  Future<Map<String, dynamic>> createSession(Map<String, dynamic> data) async {
    try {
      print('[ShelfShareDS] POST ${ApiEndpoints.shelfShare} data=$data');
      final response = await _dio.post(ApiEndpoints.shelfShare, data: data);
      print('[ShelfShareDS] Created session: ${response.data['id']}');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('[ShelfShareDS] DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }

  /// GET /shelf-share - List sessions
  Future<Map<String, dynamic>> getSessions({
    int? customerId,
    int page = 1,
    int size = 50,
  }) async {
    try {
      final queryParams = <String, dynamic>{'page': page, 'size': size};
      if (customerId != null) {
        queryParams['customer_id'] = customerId;
      }

      print(
        '[ShelfShareDS] GET ${ApiEndpoints.shelfShare} params=$queryParams',
      );
      final response = await _dio.get(
        ApiEndpoints.shelfShare,
        queryParameters: queryParams,
      );

      print(
        '[ShelfShareDS] Response: ${(response.data['items'] as List?)?.length ?? 0} sessions',
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('[ShelfShareDS] DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }

  /// GET /shelf-share/{id} - Get single session
  Future<Map<String, dynamic>> getSessionById(int id) async {
    try {
      final url = '${ApiEndpoints.shelfShare}/$id';
      print('[ShelfShareDS] GET $url');
      final response = await _dio.get(url);
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('[ShelfShareDS] DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }

  /// GET /shelf-share/by-visit/{visit_id} - Get session for a visit
  Future<Map<String, dynamic>?> getSessionByVisit(int visitId) async {
    try {
      final url = '${ApiEndpoints.shelfShareByVisit}/$visitId';
      print('[ShelfShareDS] GET $url');
      final response = await _dio.get(url);
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      // 404 means no session for this visit - return null
      if (e.response?.statusCode == 404) {
        print('[ShelfShareDS] No session found for visit $visitId');
        return null;
      }
      print('[ShelfShareDS] DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }

  /// GET /shelf-share/by-visit/{visit_id}/active - Get active (in_progress) session for a visit
  Future<Map<String, dynamic>?> getActiveSessionByVisit(int visitId) async {
    try {
      final url = '${ApiEndpoints.shelfShareByVisit}/$visitId/active';
      print('[ShelfShareDS] GET $url');
      final response = await _dio.get(url);
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        print('[ShelfShareDS] No active session for visit $visitId');
        return null;
      }
      print('[ShelfShareDS] DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }

  /// PATCH /shelf-share/{id} - Save progress (upsert item groups)
  Future<Map<String, dynamic>> saveProgress(
    int id,
    Map<String, dynamic> data,
  ) async {
    try {
      final url = '${ApiEndpoints.shelfShare}/$id';
      print('[ShelfShareDS] PATCH $url');
      final response = await _dio.patch(url, data: data);
      print('[ShelfShareDS] Progress saved for session $id');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('[ShelfShareDS] DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }

  /// POST /shelf-share/{id}/submit - Submit session
  Future<Map<String, dynamic>> submitSession(int id) async {
    try {
      final url = '${ApiEndpoints.shelfShare}/$id/submit';
      print('[ShelfShareDS] POST $url');
      final response = await _dio.post(url);
      print('[ShelfShareDS] Session $id submitted');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('[ShelfShareDS] DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }
}
