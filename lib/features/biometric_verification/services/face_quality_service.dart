import 'package:camera/camera.dart';

import '../domain/config/biometric_config.dart';
import '../domain/entities/face_pose.dart';
import '../domain/entities/face_quality_result.dart';

/// Evaluates whether a detected face is good enough to proceed (size,
/// centering, rotation, brightness) — no UI copy here, that belongs to
/// the presentation layer. See [BiometricConfig] for the thresholds this
/// checks against.
abstract class FaceQualityService {
  FaceQualityResult evaluate(FacePose pose, {CameraImage? frame});
}
