import 'package:dio/dio.dart';

import 'failures.dart';

/// Network exception wrapper for Dio exceptions
class NetworkException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  const NetworkException({required this.message, this.statusCode, this.data});

  /// Convert DioException to NetworkException
  static NetworkException fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(
          message: 'Connection timeout',
          statusCode: error.response?.statusCode,
        );

      case DioExceptionType.badResponse:
        return NetworkException(
          message: _extractErrorMessage(error.response),
          statusCode: error.response?.statusCode,
          data: error.response?.data,
        );

      case DioExceptionType.cancel:
        return const NetworkException(message: 'Request cancelled');

      case DioExceptionType.connectionError:
        return const NetworkException(message: 'No internet connection');

      case DioExceptionType.badCertificate:
        return const NetworkException(
          message: 'Certificate verification failed',
        );

      case DioExceptionType.unknown:
        return NetworkException(
          message: error.message ?? 'Unknown error occurred',
        );
    }
  }

  /// Convert NetworkException to Failure
  Failure toFailure() {
    if (statusCode == 401) {
      return AuthFailure.tokenExpired(message: message);
    } else if (statusCode == 403) {
      return ForbiddenFailure.resourceForbidden(message: message);
    } else if (statusCode == 404) {
      return NotFoundFailure(
        resourceType: 'Resource',
        resourceId: 'unknown',
        message: message,
      );
    } else if (statusCode == 422) {
      return ValidationFailure(
        message: message,
        fieldErrors: data is Map<String, dynamic>
            ? (data as Map<String, dynamic>).map(
                (key, value) => MapEntry(
                  key,
                  value is List ? value.cast<String>() : [value.toString()],
                ),
              )
            : {},
      );
    } else if (statusCode != null && statusCode! >= 500) {
      return ServerFailure.internalError(message: message);
    } else {
      return NetworkFailure.connectionError(message: message);
    }
  }

  static String _extractErrorMessage(Response? response) {
    if (response?.data is Map) {
      final data = response!.data as Map;
      final detail = data['detail'];
      if (detail is Map) {
        final detailMessage = detail['message']?.toString();
        final detailError = detail['error']?.toString();
        final detailDetails = detail['details'];

        if (detailMessage != null && detailMessage.isNotEmpty) {
          if (detailError != null && detailError.isNotEmpty) {
            return '$detailMessage ($detailError)';
          }
          return detailMessage;
        }

        if (detailDetails is Map && detailDetails['item_code'] != null) {
          return 'Invalid item price for ${detailDetails['item_code']}';
        }

        if (detailError != null && detailError.isNotEmpty) {
          return detailError;
        }
      }

      return detail?.toString() ??
          data['message']?.toString() ??
          data['error']?.toString() ??
          'Request failed';
    }
    return 'Request failed with status ${response?.statusCode}';
  }

  @override
  String toString() => 'NetworkException($message, statusCode: $statusCode)';
}
