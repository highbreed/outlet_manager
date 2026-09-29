import 'mapping_enums.dart';

/// Embedded in a visit/route response's `mapping_request` field — null
/// when the outlet doesn't currently need mapping. See spec §14.
class MappingRequest {
  final int requestId;
  final int? footprintId;
  final MappingFootprintStatus? footprintStatus;

  const MappingRequest({
    required this.requestId,
    this.footprintId,
    this.footprintStatus,
  });

  factory MappingRequest.fromJson(Map<String, dynamic> json) {
    return MappingRequest(
      requestId: json['request_id'] as int,
      footprintId: json['footprint_id'] as int?,
      footprintStatus: json['footprint_status'] != null
          ? MappingFootprintStatus.fromWire(json['footprint_status'] as String)
          : null,
    );
  }

  /// §14's exact offer condition, evaluated alongside `visit.status ==
  /// inProgress` by the caller (this type doesn't know about visit status).
  bool get isOfferable => footprintStatus != MappingFootprintStatus.pendingReview;
}
