import 'package:freezed_annotation/freezed_annotation.dart';

import 'face_quality_failure_reason.dart';

part 'face_quality_result.freezed.dart';

/// Structured quality-check result — no UI copy here, that's the
/// presentation layer's job. Produced by `FaceQualityService.evaluate`.
@freezed
class FaceQualityResult with _$FaceQualityResult {
  const factory FaceQualityResult({
    required bool acceptable,
    @Default(FaceQualityFailureReason.none) FaceQualityFailureReason failureReason,
    double? brightness,
    double? blurScore,
    double? faceAreaRatio,
  }) = _FaceQualityResult;
}
