import 'package:freezed_annotation/freezed_annotation.dart';

part 'face_pose.freezed.dart';

/// A single face observation, mapped from ML Kit's `Face` type — kept as
/// our own type (not the raw MLKit type) so services/notifiers/tests never
/// depend on the ML Kit package directly.
@freezed
class FacePose with _$FacePose {
  const factory FacePose({
    required double boundingBoxLeft,
    required double boundingBoxTop,
    required double boundingBoxWidth,
    required double boundingBoxHeight,
    required double frameWidth,
    required double frameHeight,
    required double yawDegrees,
    required double pitchDegrees,
    required double rollDegrees,
    double? leftEyeOpenProbability,
    double? rightEyeOpenProbability,
    required int? trackingId,
  }) = _FacePose;

  const FacePose._();

  double get boundingBoxArea => boundingBoxWidth * boundingBoxHeight;

  double get frameArea => frameWidth * frameHeight;

  double get faceAreaRatio => frameArea == 0 ? 0 : boundingBoxArea / frameArea;

  double get centerX => boundingBoxLeft + boundingBoxWidth / 2;

  double get centerY => boundingBoxTop + boundingBoxHeight / 2;

  /// How far the face's center is from the frame's center, as a ratio of
  /// frame width — resolution-independent, matches
  /// [BiometricConfig.faceCenterToleranceRatio].
  double get centerOffsetRatio {
    if (frameWidth == 0) return 0;
    final frameCenterX = frameWidth / 2;
    final frameCenterY = frameHeight / 2;
    final dx = centerX - frameCenterX;
    final dy = centerY - frameCenterY;
    final distance = (dx.abs() + dy.abs()) / 2; // cheap approximation, not true euclidean
    return distance / frameWidth;
  }

  /// Average of both eyes' open probability, when both are available.
  double? get averageEyeOpenProbability {
    final left = leftEyeOpenProbability;
    final right = rightEyeOpenProbability;
    if (left == null || right == null) return null;
    return (left + right) / 2;
  }
}
