import 'dart:typed_data';

import 'face_pose.dart';

/// The selected best frame from a passed liveness challenge, ready for
/// image processing. Deliberately NOT a freezed class — avoids deep
/// equality cost over the byte array, and this type is never persisted or
/// round-tripped through JSON, only passed synchronously from capture to
/// [FaceImageProcessor].
class CapturedFaceFrame {
  final Uint8List bytes;
  final int width;
  final int height;
  final FacePose pose;

  /// Degrees to rotate the image to correct for sensor/device orientation
  /// (0/90/180/270) — set by the camera service, applied by the image
  /// processor.
  final int rotationDegrees;

  const CapturedFaceFrame({
    required this.bytes,
    required this.width,
    required this.height,
    required this.pose,
    required this.rotationDegrees,
  });
}
