import 'dart:developer' as developer;
import 'dart:typed_data';
import 'dart:ui' show Size;

import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import '../domain/entities/face_pose.dart';
import 'face_detection_service.dart';

/// ML Kit-backed implementation, configured for real-time use
/// (`performanceMode: FaceDetectorMode.fast`, classification + tracking
/// enabled for eye-open probabilities and per-face IDs, contours off —
/// not needed here and meaningfully more expensive).
///
/// NEEDS ON-DEVICE VALIDATION: the `CameraImage` → `InputImage`
/// conversion (YUV_420_888 multi-plane → NV21 single-buffer) is the
/// standard community recipe for Android, but camera plane layout varies
/// by OEM HAL — see the Phase 4 plan's device-testing section. iOS is not
/// handled here (bgra8888 path) since this phase targets Android field
/// devices only.
class MlkitFaceDetectionService implements FaceDetectionService {
  final FaceDetector _detector = FaceDetector(
    options: FaceDetectorOptions(
      performanceMode: FaceDetectorMode.fast,
      enableClassification: true, // eye-open probabilities
      enableTracking: true, // stable per-face trackingId across frames
      enableContours: false,
      enableLandmarks: false,
      minFaceSize: 0.1,
    ),
  );

  bool _processing = false;

  @override
  Future<void> dispose() => _detector.close();

  @override
  Future<List<FacePose>?> processFrame(
    CameraImage image, {
    required int sensorOrientation,
    required CameraLensDirection lensDirection,
  }) async {
    if (_processing) return null; // throttle guard — discard, don't queue
    _processing = true;
    try {
      final inputImage = _toInputImage(image, sensorOrientation);
      if (inputImage == null) return null;

      final faces = await _detector.processImage(inputImage);
      return faces
          .map((face) => _toFacePose(face, image.width.toDouble(), image.height.toDouble()))
          .toList(growable: false);
    } catch (e, st) {
      developer.log(
        '[MlkitFaceDetectionService] processFrame failed: $e',
        name: 'MlkitFaceDetectionService',
        error: e,
        stackTrace: st,
      );
      return null;
    } finally {
      _processing = false;
    }
  }

  FacePose _toFacePose(Face face, double frameWidth, double frameHeight) {
    final box = face.boundingBox;
    return FacePose(
      boundingBoxLeft: box.left,
      boundingBoxTop: box.top,
      boundingBoxWidth: box.width,
      boundingBoxHeight: box.height,
      frameWidth: frameWidth,
      frameHeight: frameHeight,
      // Negated: confirmed on-device (SM-A165F) that ML Kit's raw
      // headEulerAngleY sign is inverted relative to what every yaw
      // consumer in this codebase assumes (LocalActiveLivenessService's
      // turnLeft/turnRight checks, BiometricRegistrationNotifier's
      // RegistrationPose.left/.right pose-capture checks) — a physical
      // "turn right" produced consistently negative raw values (down to
      // -12.7 degrees) against a turnRight check requiring >= +15
      // degrees, so the action could never be satisfied. Negating here,
      // once at the source, fixes every consumer instead of flipping
      // comparisons in multiple places.
      yawDegrees: -(face.headEulerAngleY ?? 0),
      pitchDegrees: face.headEulerAngleX ?? 0,
      rollDegrees: face.headEulerAngleZ ?? 0,
      leftEyeOpenProbability: face.leftEyeOpenProbability,
      rightEyeOpenProbability: face.rightEyeOpenProbability,
      trackingId: face.trackingId,
    );
  }

  InputImage? _toInputImage(CameraImage image, int sensorOrientation) {
    final rotation = InputImageRotationValue.fromRawValue(sensorOrientation) ??
        InputImageRotation.rotation0deg;

    if (image.planes.length == 1) {
      // Already a single-plane format (e.g. nv21 on some devices/plugin
      // configurations) — pass through directly.
      final format = InputImageFormatValue.fromRawValue(image.format.raw) ??
          InputImageFormat.nv21;
      return InputImage.fromBytes(
        bytes: image.planes.first.bytes,
        metadata: InputImageMetadata(
          size: Size(image.width.toDouble(), image.height.toDouble()),
          rotation: rotation,
          format: format,
          bytesPerRow: image.planes.first.bytesPerRow,
        ),
      );
    }

    // Multi-plane YUV_420_888 (our CameraController is configured with
    // ImageFormatGroup.yuv420) — convert to a single NV21 buffer, the
    // standard approach for feeding ML Kit's Android detector.
    final nv21 = _yuv420ToNv21(image);
    if (nv21 == null) return null;
    return InputImage.fromBytes(
      bytes: nv21,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: InputImageFormat.nv21,
        bytesPerRow: image.width,
      ),
    );
  }

  Uint8List? _yuv420ToNv21(CameraImage image) {
    try {
      final width = image.width;
      final height = image.height;
      final ySize = width * height;
      final uvSize = width * height ~/ 2;
      final nv21 = Uint8List(ySize + uvSize);

      final yPlane = image.planes[0];
      final uPlane = image.planes[1];
      final vPlane = image.planes[2];

      var offset = 0;
      for (var row = 0; row < height; row++) {
        final rowStart = row * yPlane.bytesPerRow;
        nv21.setRange(offset, offset + width, yPlane.bytes, rowStart);
        offset += width;
      }

      final uvRowStride = uPlane.bytesPerRow;
      final uvPixelStride = uPlane.bytesPerPixel ?? 1;
      for (var row = 0; row < height ~/ 2; row++) {
        for (var col = 0; col < width ~/ 2; col++) {
          final uvIndex = row * uvRowStride + col * uvPixelStride;
          // NV21 interleaves V then U.
          nv21[offset++] = vPlane.bytes[uvIndex];
          nv21[offset++] = uPlane.bytes[uvIndex];
        }
      }
      return nv21;
    } catch (e) {
      developer.log(
        '[MlkitFaceDetectionService] YUV420->NV21 conversion failed: $e',
        name: 'MlkitFaceDetectionService',
      );
      return null;
    }
  }
}
