import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_envelope.freezed.dart';

/// Parsed backend error envelope
@freezed
abstract class ErrorEnvelope with _$ErrorEnvelope {
  const factory ErrorEnvelope({
    required String code,
    required String message,
    Map<String, dynamic>? details,
    int? retryAfter,
    String? requestId,
  }) = _ErrorEnvelope;

  factory ErrorEnvelope.fromJson(Map<String, dynamic> json) {
    return ErrorEnvelope(
      code: json['code'] as String? ?? 'unknown',
      message: json['message'] as String? ?? 'Unknown error',
      details: json['details'] as Map<String, dynamic>?,
      retryAfter: json['retry_after'] as int?,
      requestId: json['request_id'] as String?,
    );
  }
}