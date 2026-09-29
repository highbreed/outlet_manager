import '../../domain/entities/mapping_capture_limits.dart';
import '../../domain/entities/mapping_enums.dart';

/// Parses a backend timestamp per spec §13: an offset-less timestamp means
/// Africa/Nairobi (UTC+3), never arbitrary device-local time. A timestamp
/// WITH an offset (e.g. `server_time`) parses normally via [DateTime.parse].
DateTime parseBackendTimestamp(String value) {
  final hasOffset = RegExp(r'(Z|[+-]\d{2}:?\d{2})$').hasMatch(value);
  if (hasOffset) return DateTime.parse(value).toUtc();
  // No offset present — the backend's own rule is that this means
  // Africa/Nairobi (UTC+3). Append the fixed offset explicitly rather than
  // letting Dart's default (naive-local) interpretation apply.
  return DateTime.parse('$value+03:00').toUtc();
}

DateTime? parseBackendTimestampOrNull(String? value) =>
    value == null ? null : parseBackendTimestamp(value);

/// `POST /outlet-mapping/requests/{request_id}/captures` response.
class StartCaptureResponse {
  final int footprintId;
  final MappingFootprintStatus status;
  final DateTime captureStartedAt;
  final bool resumed;
  final DateTime serverTime;
  final MappingCaptureLimits limits;
  final String? instructions;

  const StartCaptureResponse({
    required this.footprintId,
    required this.status,
    required this.captureStartedAt,
    required this.resumed,
    required this.serverTime,
    required this.limits,
    this.instructions,
  });

  factory StartCaptureResponse.fromJson(Map<String, dynamic> json) {
    return StartCaptureResponse(
      footprintId: json['footprint_id'] as int,
      status: MappingFootprintStatus.fromWire(json['status'] as String),
      captureStartedAt: parseBackendTimestamp(json['capture_started_at'] as String),
      resumed: json['resumed'] as bool? ?? false,
      serverTime: parseBackendTimestamp(json['server_time'] as String),
      limits: json['limits'] != null
          ? MappingCaptureLimits.fromJson(json['limits'] as Map<String, dynamic>)
          : const MappingCaptureLimits.fallbackDefaults(),
      instructions: json['instructions'] as String?,
    );
  }
}

/// `POST /outlet-footprints/{footprint_id}/samples` response.
class UploadSamplesResponse {
  final int received;
  final int acceptedNew;
  final int duplicates;
  final int totalSamples;
  final DateTime serverTime;

  const UploadSamplesResponse({
    required this.received,
    required this.acceptedNew,
    required this.duplicates,
    required this.totalSamples,
    required this.serverTime,
  });

  factory UploadSamplesResponse.fromJson(Map<String, dynamic> json) {
    return UploadSamplesResponse(
      received: json['received'] as int,
      acceptedNew: json['accepted_new'] as int,
      duplicates: json['duplicates'] as int,
      totalSamples: json['total_samples'] as int,
      serverTime: parseBackendTimestamp(json['server_time'] as String),
    );
  }
}

/// `POST /outlet-footprints/{footprint_id}/finish` response.
class FinishCaptureResponse {
  final int footprintId;
  final MappingFootprintStatus status;
  final MappingFailureCode? failureCode;
  final String? message;
  final MappingCaptureSummary? summary;

  const FinishCaptureResponse({
    required this.footprintId,
    required this.status,
    this.failureCode,
    this.message,
    this.summary,
  });

  factory FinishCaptureResponse.fromJson(Map<String, dynamic> json) {
    return FinishCaptureResponse(
      footprintId: json['footprint_id'] as int,
      status: MappingFootprintStatus.fromWire(json['status'] as String),
      failureCode: MappingFailureCode.fromWire(json['failure_code'] as String?),
      message: json['message'] as String?,
      summary: json['summary'] != null
          ? MappingCaptureSummary.fromJson(json['summary'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// `GET /outlet-footprints/{footprint_id}/capture-status` response.
/// Read-only, used only for reconciliation (spec §54) — never polled.
class CaptureStatusResponse {
  final int footprintId;
  final int mappingRequestId;
  final MappingRequestStatus mappingRequestStatus;
  final MappingFootprintStatus status;
  final int samplesReceived;
  final DateTime captureStartedAt;
  final DateTime? lastSampleAt;
  final DateTime? captureFinishedAt;
  final MappingFailureCode? failureCode;
  final String? message;
  final MappingCaptureSummary? summary;
  final DateTime serverTime;

  const CaptureStatusResponse({
    required this.footprintId,
    required this.mappingRequestId,
    required this.mappingRequestStatus,
    required this.status,
    required this.samplesReceived,
    required this.captureStartedAt,
    this.lastSampleAt,
    this.captureFinishedAt,
    this.failureCode,
    this.message,
    this.summary,
    required this.serverTime,
  });

  factory CaptureStatusResponse.fromJson(Map<String, dynamic> json) {
    return CaptureStatusResponse(
      footprintId: json['footprint_id'] as int,
      mappingRequestId: json['mapping_request_id'] as int,
      mappingRequestStatus:
          MappingRequestStatus.fromWire(json['mapping_request_status'] as String),
      status: MappingFootprintStatus.fromWire(json['status'] as String),
      samplesReceived: json['samples_received'] as int,
      captureStartedAt: parseBackendTimestamp(json['capture_started_at'] as String),
      lastSampleAt: parseBackendTimestampOrNull(json['last_sample_at'] as String?),
      captureFinishedAt:
          parseBackendTimestampOrNull(json['capture_finished_at'] as String?),
      failureCode: MappingFailureCode.fromWire(json['failure_code'] as String?),
      message: json['message'] as String?,
      summary: json['summary'] != null
          ? MappingCaptureSummary.fromJson(json['summary'] as Map<String, dynamic>)
          : null,
      serverTime: parseBackendTimestamp(json['server_time'] as String),
    );
  }
}

/// `POST /outlet-footprints/{footprint_id}/abandon` response.
class AbandonCaptureResponse {
  final int footprintId;
  final MappingFootprintStatus status;
  final MappingRequestStatus mappingRequestStatus;
  final String? message;
  final DateTime serverTime;

  const AbandonCaptureResponse({
    required this.footprintId,
    required this.status,
    required this.mappingRequestStatus,
    this.message,
    required this.serverTime,
  });

  factory AbandonCaptureResponse.fromJson(Map<String, dynamic> json) {
    return AbandonCaptureResponse(
      footprintId: json['footprint_id'] as int,
      status: MappingFootprintStatus.fromWire(json['status'] as String),
      mappingRequestStatus:
          MappingRequestStatus.fromWire(json['mapping_request_status'] as String),
      message: json['message'] as String?,
      serverTime: parseBackendTimestamp(json['server_time'] as String),
    );
  }
}
