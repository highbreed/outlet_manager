import 'package:camera/camera.dart';

import '../domain/entities/face_pose.dart';

/// Real-time face detection. Owns the "discard if still processing"
/// throttle guard internally — callers should feed it every camera frame
/// without their own throttling; [processFrame] returns `null` for a
/// frame it chose to skip (previous frame still processing), which the
/// caller should treat as "no update this tick", not an error.
abstract class FaceDetectionService {
  Future<void> dispose();

  Future<List<FacePose>?> processFrame(
    CameraImage image, {
    required int sensorOrientation,
    required CameraLensDirection lensDirection,
  });
}
