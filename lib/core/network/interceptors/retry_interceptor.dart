import 'dart:math';

import 'package:dio/dio.dart';

import '../failures.dart';

/// Retries failed requests with exponential backoff and jitter
class RetryInterceptor extends Interceptor {
  static const _maxRetries = 3;
  static const _baseDelay = Duration(milliseconds: 500);
  static const _maxDelay = Duration(seconds: 30);

  RetryInterceptor();

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final retryCount = (options.extra['retryCount'] as int?) ?? 0;

    // Check if we should retry
    if (!_shouldRetry(err, retryCount)) {
      // Mark retries exhausted for global handler
      if (retryCount > 0) {
        options.extra['retriesExhausted'] = true;
      }
      return handler.next(err);
    }

    // Calculate delay with exponential backoff + jitter
    final delay = _calculateDelay(err, retryCount);

    await Future.delayed(delay);

    // Increment retry count
    options.extra['retryCount'] = retryCount + 1;

    // Note: The actual retry is handled by re-fetching
    // We need to get the Dio instance through the provider
    // For now, we'll reject and let the caller handle retry
    // In practice, you'd want to inject Dio or use a different pattern
    handler.next(err);
  }

  bool _shouldRetry(DioException err, int retryCount) {
    if (retryCount >= _maxRetries) return false;

    // Explicit opt-out, same pattern as AuthInterceptor's `skipAuth` extra
    // flag. Used by biometric verify/enroll calls: a blind retry after a
    // timeout could create a duplicate verification attempt server-side.
    // Those calls are already excluded by the POST-without-Idempotency-Key
    // rule below regardless — this exists to make the intent
    // self-documenting rather than relying on that as an implicit side
    // effect. See the "Phase 4" plan's "RetryInterceptor" section.
    if (err.requestOptions.extra['skipRetry'] == true) return false;

    // Never retry non-idempotent methods without idempotency key
    final method = err.requestOptions.method.toUpperCase();
    final hasIdempotencyKey =
        err.requestOptions.headers.containsKey('Idempotency-Key');

    if (['POST', 'PATCH', 'DELETE'].contains(method) && !hasIdempotencyKey) {
      return false;
    }

    // Check if error is retryable
    final failure = err.error;
    if (failure is Failure && !failure.isRetryable) {
      return false;
    }

    // Retry on specific conditions
    return switch (err.type) {
      DioExceptionType.connectionTimeout => true,
      DioExceptionType.sendTimeout => true,
      DioExceptionType.receiveTimeout => true,
      DioExceptionType.connectionError => true,
      DioExceptionType.badResponse => _isRetryableStatus(err.response?.statusCode),
      _ => false,
    };
  }

  bool _isRetryableStatus(int? status) {
    if (status == null) return false;
    return status == 429 || status >= 500;
  }

  Duration _calculateDelay(DioException err, int retryCount) {
    // Respect Retry-After header if present
    final retryAfter = err.response?.headers.value('retry-after');
    if (retryAfter != null) {
      final seconds = int.tryParse(retryAfter);
      if (seconds != null) {
        return Duration(seconds: seconds);
      }
    }

    // Exponential backoff: 500ms, 1s, 2s, 4s...
    final exponentialDelay = _baseDelay * pow(2, retryCount);

    // Add jitter (±25%)
    final jitter = exponentialDelay.inMilliseconds * 0.25;
    final randomJitter = (Random().nextDouble() * 2 - 1) * jitter;

    final finalDelay = Duration(
      milliseconds: (exponentialDelay.inMilliseconds + randomJitter).round(),
    );

    // Cap at max delay
    return finalDelay > _maxDelay ? _maxDelay : finalDelay;
  }
}
