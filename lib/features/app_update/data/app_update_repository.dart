import 'package:dio/dio.dart';

import '../../../core/network/api_endpoints.dart';
import 'app_version_info.dart';

class AppUpdateRepository {
  final Dio _dio;

  AppUpdateRepository({required Dio dio}) : _dio = dio;

  /// GET /app/version — public, unauthenticated, never itself gated.
  /// Throws [DioException] on failure; callers should fail open (don't
  /// block the app just because this poll couldn't be reached).
  Future<AppVersionInfo> checkVersion() async {
    final response = await _dio.get(
      ApiEndpoints.appVersion,
      options: Options(extra: {'skipAuth': true}),
    );
    return AppVersionInfo.fromJson(response.data as Map<String, dynamic>);
  }
}
