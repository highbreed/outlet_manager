import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/connectivity/data/connectivity_provider.dart';
import '../failures.dart';

/// Checks connectivity before sending requests
class ConnectivityInterceptor extends Interceptor {
  final Ref _ref;

  ConnectivityInterceptor(this._ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Allow offline-capable requests to proceed (will be queued)
    if (options.extra['allowOffline'] == true) {
      return handler.next(options);
    }

    final isOnline = _ref.read(isOnlineProvider);

    if (!isOnline) {
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: const NetworkFailure.offline(),
        ),
      );
    }

    handler.next(options);
  }
}
