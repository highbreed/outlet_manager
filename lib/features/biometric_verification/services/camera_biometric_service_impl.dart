import 'dart:developer' as developer;
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;

import '../domain/entities/captured_face_frame.dart';
import '../domain/entities/face_pose.dart';
import 'biometric_camera_service.dart';

/// `camera`-package-backed implementation. Buffers the most recent frame
/// it has forwarded to the caller's `onFrame` callback so
/// [captureStillFrame] can convert *that* frame (the one the caller
/// already validated pose/quality against) rather than triggering a
/// separate `takePicture()` call, which would stop the image stream and
/// introduce a capture-time gap between "this frame passed liveness" and
/// "this is the frame we uploaded."
///
/// NEEDS ON-DEVICE VALIDATION (see the Phase 4 plan's device-testing
/// section): `CameraImage` plane layout/rotation varies by OEM camera
/// HAL. The YUV420→RGB conversion below follows the standard
/// `camera`+`image` package recipe, but hasn't been exercised on
/// Honeywell/Samsung hardware yet.
class CameraBiometricServiceImpl implements BiometricCameraService {
  CameraController? _controller;
  CameraImage? _latestFrame;
  bool _streaming = false;

  @override
  bool get isInitialized => _controller?.value.isInitialized ?? false;

  @override
  CameraController? get controller => _controller;

  @override
  Future<void> initialize() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
      (c) => c.lensDirection == CameraLensDirection.front,
      orElse: () => cameras.first,
    );
    final controller = CameraController(
      front,
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );
    await controller.initialize();
    _controller = controller;
  }

  @override
  Future<void> dispose() async {
    await stopFrameStream();
    await _controller?.dispose();
    _controller = null;
    _latestFrame = null;
  }

  @override
  Future<void> startFrameStream(void Function(CameraImage image) onFrame) async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      throw StateError('BiometricCameraService.startFrameStream called before initialize()');
    }
    if (_streaming) return;
    _streaming = true;
    await controller.startImageStream((image) {
      _latestFrame = image;
      onFrame(image);
    });
  }

  @override
  Future<void> stopFrameStream() async {
    if (!_streaming) return;
    _streaming = false;
    try {
      await _controller?.stopImageStream();
    } catch (e) {
      // Already stopped / controller disposed underneath us — non-fatal.
      developer.log(
        '[CameraBiometricServiceImpl] stopImageStream failed: $e',
        name: 'CameraBiometricServiceImpl',
      );
    }
  }

  @override
  Future<CapturedFaceFrame> captureStillFrame({required FacePose pose}) async {
    final frame = _latestFrame;
    final controller = _controller;
    if (frame == null || controller == null) {
      throw StateError('captureStillFrame called with no buffered frame');
    }
    final bytes = _yuv420ToJpegBytes(frame);
    final sensorOrientation = controller.description.sensorOrientation;
    return CapturedFaceFrame(
      bytes: bytes,
      width: frame.width,
      height: frame.height,
      pose: pose,
      rotationDegrees: sensorOrientation,
    );
  }

  @override
  Future<void> pause() => stopFrameStream();

  @override
  Future<void> resume() async {
    // Deliberately does not re-`initialize()` — see [pause]'s doc comment
    // on `BiometricCameraService` for why recreating the controller here
    // is what caused the CameraX rebind race. The controller (and its
    // Preview/ImageCapture bindings) simply stayed alive through pause;
    // only the image stream needs restarting, and only if something is
    // still listening (BiometricCameraPreview restarts it itself via
    // startFrameStream, so this is a no-op in that path — kept for any
    // other caller that might call resume() standalone).
    if (_controller == null || !isInitialized) {
      await initialize();
    }
  }

  /// Standard `camera`+`image` YUV420→JPEG conversion. Returns full-size
  /// JPEG bytes — cropping/resizing to the target output size happens
  /// later in `FaceImageProcessor`, not here; this only needs to produce
  /// a decodable image.
  Uint8List _yuv420ToJpegBytes(CameraImage image) {
    final width = image.width;
    final height = image.height;
    final yPlane = image.planes[0];
    final uPlane = image.planes[1];
    final vPlane = image.planes[2];

    final rgbImage = img.Image(width: width, height: height);

    final yRowStride = yPlane.bytesPerRow;
    final uvRowStride = uPlane.bytesPerRow;
    final uvPixelStride = uPlane.bytesPerPixel ?? 1;

    for (var y = 0; y < height; y++) {
      final yRowOffset = y * yRowStride;
      final uvRowOffset = (y ~/ 2) * uvRowStride;
      for (var x = 0; x < width; x++) {
        final yIndex = yRowOffset + x;
        final uvIndex = uvRowOffset + (x ~/ 2) * uvPixelStride;

        final yValue = yPlane.bytes[yIndex];
        final uValue = uPlane.bytes[uvIndex];
        final vValue = vPlane.bytes[uvIndex];

        final r = (yValue + 1.402 * (vValue - 128)).clamp(0, 255).toInt();
        final g = (yValue - 0.344136 * (uValue - 128) - 0.714136 * (vValue - 128))
            .clamp(0, 255)
            .toInt();
        final b = (yValue + 1.772 * (uValue - 128)).clamp(0, 255).toInt();

        rgbImage.setPixelRgb(x, y, r, g, b);
      }
    }

    return img.encodeJpg(rgbImage, quality: 90);
  }
}
