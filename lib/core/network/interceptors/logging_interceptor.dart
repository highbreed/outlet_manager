import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Logs requests and responses with sanitization
class LoggingInterceptor extends Interceptor {
  static const _sensitiveHeaders = {'authorization', 'cookie', 'x-api-key'};
  static const _sensitiveFields = {
    'password',
    'token',
    'secret',
    'credit_card',
    'refresh_token',
  };

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      final sanitizedHeaders = _sanitizeHeaders(options.headers);
      final sanitizedBody = _sanitizeBody(options.data);

      debugPrint('┌── API Request ──────────────────────────────────────');
      debugPrint('│ ${options.method} ${options.uri}');
      debugPrint('│ Request ID: ${options.extra['requestId']}');
      debugPrint('│ Headers: $sanitizedHeaders');
      if (sanitizedBody != null) {
        debugPrint('│ Body: $sanitizedBody');
      }
      debugPrint('└────────────────────────────────────────────────────');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      final requestStart =
          response.requestOptions.extra['requestStart'] as int?;
      final duration = requestStart != null
          ? DateTime.now().millisecondsSinceEpoch - requestStart
          : null;

      debugPrint('┌── API Response ─────────────────────────────────────');
      debugPrint(
        '│ ${response.requestOptions.method} ${response.requestOptions.uri}',
      );
      debugPrint('│ Request ID: ${response.requestOptions.extra['requestId']}');
      debugPrint('│ Status: ${response.statusCode}');
      if (duration != null) {
        debugPrint('│ Duration: ${duration}ms');
      }
      // Log sanitized response body for debugging — chunked, since a
      // single long line here silently gets truncated by Android's
      // per-log-entry size limit (~4KB) rather than by anything in this
      // app, hiding whatever comes after that point in the JSON.
      // TEMPORARY, same as the native verbose logger — remove once the
      // day-status/activeVisit investigation is done.
      if (response.data != null) {
        final sanitizedData = _sanitizeBody(response.data).toString();
        const chunkSize = 800;
        for (var i = 0; i < sanitizedData.length; i += chunkSize) {
          final end = (i + chunkSize < sanitizedData.length)
              ? i + chunkSize
              : sanitizedData.length;
          debugPrint('│ Body[${i ~/ chunkSize}]: ${sanitizedData.substring(i, end)}');
        }
      }
      debugPrint('└────────────────────────────────────────────────────');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      final requestStart = err.requestOptions.extra['requestStart'] as int?;
      final duration = requestStart != null
          ? DateTime.now().millisecondsSinceEpoch - requestStart
          : null;

      debugPrint('┌── API Error ────────────────────────────────────────');
      debugPrint('│ ${err.requestOptions.method} ${err.requestOptions.uri}');
      debugPrint('│ Request ID: ${err.requestOptions.extra['requestId']}');
      debugPrint('│ Status: ${err.response?.statusCode}');
      debugPrint('│ Type: ${err.type.name}');
      debugPrint('│ Message: ${err.message}');
      if (duration != null) {
        debugPrint('│ Duration: ${duration}ms');
      }
      debugPrint('└────────────────────────────────────────────────────');
    }
    handler.next(err);
  }

  Map<String, dynamic> _sanitizeHeaders(Map<String, dynamic> headers) {
    return headers.map(
      (key, value) => MapEntry(
        key,
        _sensitiveHeaders.contains(key.toLowerCase()) ? '[REDACTED]' : value,
      ),
    );
  }

  dynamic _sanitizeBody(dynamic body) {
    if (body is Map) {
      return body.map(
        (key, value) => MapEntry(
          key,
          _sensitiveFields.contains(key.toString().toLowerCase())
              ? '[REDACTED]'
              : _sanitizeBody(value),
        ),
      );
    }
    if (body is List) {
      return body.map(_sanitizeBody).toList();
    }
    return body;
  }
}
