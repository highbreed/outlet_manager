import 'package:camera/camera.dart';

import '../domain/config/biometric_config.dart';
import '../domain/entities/face_pose.dart';
import '../domain/entities/face_quality_failure_reason.dart';
import '../domain/entities/face_quality_result.dart';
import 'face_quality_service.dart';

class DefaultFaceQualityService implements FaceQualityService {
  final BiometricConfig config;

  DefaultFaceQualityService({this.config = const BiometricConfig()});

  @override
  FaceQualityResult evaluate(FacePose pose, {CameraImage? frame}) {
    final brightness = frame == null ? null : _estimateBrightness(frame);

    if (pose.faceAreaRatio < config.minFaceAreaRatio) {
      return FaceQualityResult(
        acceptable: false,
        failureReason: FaceQualityFailureReason.faceTooSmall,
        brightness: brightness,
        faceAreaRatio: pose.faceAreaRatio,
      );
    }
    if (pose.faceAreaRatio > config.maxFaceAreaRatio) {
      return FaceQualityResult(
        acceptable: false,
        failureReason: FaceQualityFailureReason.faceTooLarge,
        brightness: brightness,
        faceAreaRatio: pose.faceAreaRatio,
      );
    }
    if (pose.centerOffsetRatio > config.faceCenterToleranceRatio) {
      return FaceQualityResult(
        acceptable: false,
        failureReason: FaceQualityFailureReason.notCentered,
        brightness: brightness,
        faceAreaRatio: pose.faceAreaRatio,
      );
    }
    if (pose.yawDegrees.abs() > config.alignedYawToleranceDegrees ||
        pose.pitchDegrees.abs() > config.alignedPitchToleranceDegrees ||
        pose.rollDegrees.abs() > config.alignedRollToleranceDegrees) {
      return FaceQualityResult(
        acceptable: false,
        failureReason: FaceQualityFailureReason.excessiveRotation,
        brightness: brightness,
        faceAreaRatio: pose.faceAreaRatio,
      );
    }
    if (brightness != null && brightness < config.minBrightness) {
      return FaceQualityResult(
        acceptable: false,
        failureReason: FaceQualityFailureReason.tooDark,
        brightness: brightness,
        faceAreaRatio: pose.faceAreaRatio,
      );
    }
    if (brightness != null && brightness > config.maxBrightness) {
      return FaceQualityResult(
        acceptable: false,
        failureReason: FaceQualityFailureReason.tooBright,
        brightness: brightness,
        faceAreaRatio: pose.faceAreaRatio,
      );
    }

    return FaceQualityResult(
      acceptable: true,
      brightness: brightness,
      faceAreaRatio: pose.faceAreaRatio,
    );
  }

  /// Cheap brightness estimate: the Y (luma) plane of a YUV image already
  /// encodes per-pixel brightness directly — average a sparse sample of it
  /// rather than every byte, since this runs once per analyzed frame.
  double _estimateBrightness(CameraImage frame) {
    final yPlane = frame.planes.first;
    final bytes = yPlane.bytes;
    if (bytes.isEmpty) return 0;
    const sampleStride = 37; // arbitrary prime, avoids periodic-pattern bias
    var sum = 0;
    var count = 0;
    for (var i = 0; i < bytes.length; i += sampleStride) {
      sum += bytes[i];
      count++;
    }
    return count == 0 ? 0 : sum / count;
  }
}
