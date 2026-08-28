import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

/// Adds unique request ID to all requests for tracing
class RequestIdInterceptor extends Interceptor {
  static const _uuid = Uuid();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestId = _uuid.v4();
    options.headers['X-Request-ID'] = requestId;
    options.extra['requestId'] = requestId;
    options.extra['requestStart'] = DateTime.now().millisecondsSinceEpoch;
    handler.next(options);
  }
}
