import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synchronized/synchronized.dart';

import '../../../features/auth/data/auth_controller.dart';
import '../../config/app_config.dart';
import '../../storage/token_storage.dart';

/// Handles JWT token attachment and automatic refresh
class AuthInterceptor extends QueuedInterceptor {
  final Ref _ref;
  final TokenStorage _tokenStorage;
  final Dio _refreshDio;
  final _refreshLock = Lock();

  bool _isRefreshing = false;

  AuthInterceptor({
    required Ref ref,
    required TokenStorage tokenStorage,
    required String baseUrl,
  })  : _ref = ref,
        _tokenStorage = tokenStorage,
        _refreshDio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'X-Client-Version': AppConfig.appVersion,
            'X-Platform': AppConfig.platform,
          },
        ));

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip auth header for public endpoints
    if (options.extra['skipAuth'] == true) {
      return handler.next(options);
    }

    final tokens = await _tokenStorage.getTokens();

    if (tokens == null) {
      return handler.next(options);
    }

    // Proactive refresh if token expires within 1 minute
    if (tokens.shouldProactiveRefresh && !_isRefreshing) {
      await _refreshLock.synchronized(() async {
        if (!_isRefreshing) {
          _isRefreshing = true;
          await _performRefresh();
          _isRefreshing = false;
        }
      });
      final newTokens = await _tokenStorage.getTokens();
      options.headers['Authorization'] = 'Bearer ${newTokens?.accessToken}';
    } else {
      options.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    // Skip public endpoints (e.g. /auth/login itself) — a 401 here means
    // bad credentials, not an expired session, so it must not trigger a
    // token refresh / forceLogout, which would race with and clobber the
    // caller's own error handling for this request.
    if (err.requestOptions.extra['skipAuth'] == true) {
      return handler.next(err);
    }

    // Skip if this was already a refresh request
    if (err.requestOptions.path.contains('/auth/refresh')) {
      return handler.next(err);
    }

    // Single-flight refresh
    final refreshSuccess = await _refreshLock.synchronized(() async {
      // Check if another request already refreshed successfully
      final tokens = await _tokenStorage.getTokens();
      if (tokens != null && !tokens.isAccessExpired) {
        return true;
      }

      _isRefreshing = true;
      final success = await _performRefresh();
      _isRefreshing = false;
      return success;
    });

    if (refreshSuccess) {
      // Retry original request with new token
      try {
        final tokens = await _tokenStorage.getTokens();
        err.requestOptions.headers['Authorization'] =
            'Bearer ${tokens?.accessToken}';

        final response = await _refreshDio.fetch(err.requestOptions);
        return handler.resolve(response);
      } on DioException catch (e) {
        return handler.reject(e);
      }
    } else {
      // Force logout
      _ref.read(authControllerProvider.notifier).forceLogout(
            reason: 'Session expired. Please log in again.',
          );
      handler.next(err);
    }
  }

  Future<bool> _performRefresh() async {
    try {
      final refreshToken = await _tokenStorage.getRefreshToken();
      if (refreshToken == null) return false;

      final response = await _refreshDio.post(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
        options: Options(extra: {'skipAuth': true}),
      );

      if (response.statusCode == 200 && response.data != null) {
        final accessToken = response.data['access_token'] as String;
        final newRefreshToken =
            response.data['refresh_token'] as String? ?? refreshToken;
        final expiresIn = response.data['expires_in'] as int? ?? 900;

        await _tokenStorage.saveTokens(
          accessToken: accessToken,
          refreshToken: newRefreshToken,
          accessExpiresIn: Duration(seconds: expiresIn),
        );

        return true;
      }

      return false;
    } on DioException catch (e) {
      // 401/403 on refresh = refresh token invalid
      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
        return false;
      }
      // Network error during refresh - don't logout, let request fail
      return false;
    }
  }
}
