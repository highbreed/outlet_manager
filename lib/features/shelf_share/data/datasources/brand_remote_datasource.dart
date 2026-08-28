import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_exceptions.dart';

/// Remote datasource for fetching brands from /api/v1/brands
class BrandRemoteDataSource {
  final Dio _dio;

  BrandRemoteDataSource(this._dio);

  /// GET /brands
  /// Returns paginated list of brands
  Future<Map<String, dynamic>> getBrands({
    String? search,
    int page = 1,
    int size = 200,
  }) async {
    try {
      final queryParams = <String, dynamic>{'page': page, 'size': size};
      if (search != null && search.isNotEmpty) {
        queryParams['search'] = search;
      }

      print('[BrandDS] GET ${ApiEndpoints.brands} params=$queryParams');

      final response = await _dio.get(
        ApiEndpoints.brands,
        queryParameters: queryParams,
      );

      print(
        '[BrandDS] Response: ${(response.data['items'] as List?)?.length ?? 0} brands',
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('[BrandDS] DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }
}
