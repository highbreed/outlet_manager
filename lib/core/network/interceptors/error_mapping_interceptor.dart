import 'package:dio/dio.dart';

import '../error_envelope.dart';
import '../failures.dart';

/// Maps DioExceptions to typed Failure objects
class ErrorMappingInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final failure = _mapToFailure(err);

    // Wrap failure in DioException for downstream handling
    handler.reject(DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      error: failure,
      type: err.type,
    ));
  }

  Failure _mapToFailure(DioException err) {
    final requestId = err.requestOptions.extra['requestId'] as String?;

    // Network-level failures (no response)
    if (err.response == null) {
      return switch (err.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout =>
          NetworkFailure.timeout(requestId: requestId),
        DioExceptionType.connectionError =>
          NetworkFailure.connectionError(requestId: requestId),
        DioExceptionType.badCertificate =>
          NetworkFailure.sslError(requestId: requestId),
        _ => UnknownFailure(
            message: err.message ?? 'Unknown error',
            requestId: requestId,
          ),
      };
    }

    final statusCode = err.response!.statusCode ?? 0;
    final body = err.response!.data;

    // Parse backend error envelope
    final errorEnvelope = _parseErrorEnvelope(body);

    return switch (statusCode) {
      401 => _mapAuthFailure(errorEnvelope, requestId),
      403 => _mapForbiddenFailure(errorEnvelope, requestId),
      404 => _mapNotFoundFailure(errorEnvelope, requestId),
      409 => _mapConflictFailure(errorEnvelope, requestId),
      422 => _mapValidationFailure(errorEnvelope, requestId),
      429 => _mapRateLimitFailure(errorEnvelope, err.response!.headers, requestId),
      >= 500 => _mapServerFailure(statusCode, errorEnvelope, requestId),
      _ => UnknownFailure(
          message: errorEnvelope?.message ?? 'Unexpected error',
          requestId: requestId,
        ),
    };
  }

  ErrorEnvelope? _parseErrorEnvelope(dynamic body) {
    if (body is! Map<String, dynamic>) return null;
    final error = body['error'];
    if (error is Map<String, dynamic>) {
      try {
        return ErrorEnvelope.fromJson(error);
      } catch (_) {
        return null;
      }
    }
    // Some endpoints (e.g. FastAPI's default validation/HTTPException
    // handler) return {"detail": "..."} instead of the {"error": {...}}
    // envelope above. Treat that message as the envelope message so it
    // still reaches the UI instead of falling back to a generic default.
    final detail = body['detail'];
    if (detail is String && detail.isNotEmpty) {
      return ErrorEnvelope(code: 'unknown', message: detail);
    }
    return null;
  }

  AuthFailure _mapAuthFailure(ErrorEnvelope? envelope, String? requestId) {
    return switch (envelope?.code) {
      'TOKEN_EXPIRED' => AuthFailure.tokenExpired(requestId: requestId),
      'SESSION_REVOKED' => AuthFailure.sessionRevoked(
          reason: envelope?.message,
          requestId: requestId,
        ),
      _ => AuthFailure.invalidCredentials(
          message: envelope?.message ?? 'Invalid email or password',
          requestId: requestId,
        ),
    };
  }

  ForbiddenFailure _mapForbiddenFailure(
      ErrorEnvelope? envelope, String? requestId) {
    return switch (envelope?.code) {
      'ACCOUNT_DISABLED' =>
        ForbiddenFailure.accountDisabled(requestId: requestId),
      'INSUFFICIENT_PERMISSIONS' => ForbiddenFailure.insufficientPermissions(
          requiredPermission:
              envelope?.details?['required_permission']?.toString() ?? 'unknown',
          requestId: requestId,
        ),
      _ => ForbiddenFailure.resourceForbidden(requestId: requestId),
    };
  }

  ValidationFailure _mapValidationFailure(
      ErrorEnvelope? envelope, String? requestId) {
    final fields = <String, List<String>>{};
    final fieldErrors = envelope?.details?['fields'];
    if (fieldErrors is Map) {
      fieldErrors.forEach((key, value) {
        if (value is List) {
          fields[key.toString()] = value.map((e) => e.toString()).toList();
        }
      });
    }
    return ValidationFailure(
      message: envelope?.message ?? 'Validation failed',
      fieldErrors: fields,
      requestId: requestId,
    );
  }

  RateLimitFailure _mapRateLimitFailure(
    ErrorEnvelope? envelope,
    Headers headers,
    String? requestId,
  ) {
    final retryAfter = envelope?.retryAfter ??
        int.tryParse(headers.value('retry-after') ?? '') ??
        60;
    return RateLimitFailure(
      retryAfter: Duration(seconds: retryAfter),
      requestId: requestId,
    );
  }

  ServerFailure _mapServerFailure(
      int status, ErrorEnvelope? envelope, String? requestId) {
    return switch (status) {
      502 => ServerFailure.badGateway(requestId: requestId),
      503 => ServerFailure.serviceUnavailable(
          retryAfter: envelope?.retryAfter != null
              ? Duration(seconds: envelope!.retryAfter!)
              : null,
          requestId: requestId,
        ),
      _ => ServerFailure.internalError(requestId: requestId),
    };
  }

  NotFoundFailure _mapNotFoundFailure(
      ErrorEnvelope? envelope, String? requestId) {
    return NotFoundFailure(
      resourceType: envelope?.details?['resource_type']?.toString() ?? 'resource',
      resourceId: envelope?.details?['resource_id']?.toString() ?? 'unknown',
      requestId: requestId,
    );
  }

  ConflictFailure _mapConflictFailure(
      ErrorEnvelope? envelope, String? requestId) {
    return switch (envelope?.code) {
      'VERSION_MISMATCH' => ConflictFailure.versionMismatch(
          serverVersion:
              (envelope?.details?['server_version'] as int?) ?? 0,
          requestId: requestId,
        ),
      'DUPLICATE_ENTRY' => ConflictFailure.duplicateEntry(
          field: envelope?.details?['field']?.toString() ?? 'unknown',
          requestId: requestId,
        ),
      'CONCURRENT_SESSION' =>
        ConflictFailure.concurrentSession(requestId: requestId),
      _ => ConflictFailure.duplicateEntry(
          field: 'unknown',
          requestId: requestId,
        ),
    };
  }
}
