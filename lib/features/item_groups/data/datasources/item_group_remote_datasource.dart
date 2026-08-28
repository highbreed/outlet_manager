import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_exceptions.dart';

/// Remote datasource for Item Groups API
class ItemGroupRemoteDataSource {
  final Dio _dio;

  ItemGroupRemoteDataSource(this._dio);

  /// GET /item-groups
  /// Returns paginated list of item groups
  Future<Map<String, dynamic>> getItemGroups({
    String? search,
    int page = 1,
    int size = 50,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'size': size,
        'is_active': true,
      };
      if (search != null && search.isNotEmpty) {
        queryParams['search'] = search;
      }

      print('[ItemGroupDS] GET ${ApiEndpoints.itemGroups} params=$queryParams');

      final response = await _dio.get(
        ApiEndpoints.itemGroups,
        queryParameters: queryParams,
      );

      print(
        '[ItemGroupDS] Response: ${(response.data['items'] as List?)?.length ?? 0} items',
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('[ItemGroupDS] DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }

  /// GET /item-groups/{id}
  Future<Map<String, dynamic>> getItemGroupById(int id) async {
    try {
      final url = '${ApiEndpoints.itemGroups}/$id';
      print('[ItemGroupDS] GET $url');

      final response = await _dio.get(url);

      print('[ItemGroupDS] Response: ${response.data}');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('[ItemGroupDS] DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }
}
