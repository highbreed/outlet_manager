import 'package:camera/camera.dart';

import '../domain/entities/captured_face_frame.dart';
import '../domain/entities/face_pose.dart';

/// Owns the front-camera lifecycle for biometric capture. Concrete impl
/// (`CameraBiometricServiceImpl`) wraps the `camera` package; kept behind
/// this interface so nothing outside `services/` depends on `camera`
/// directly, and so it's mockable in tests.
abstract class BiometricCameraService {
  bool get isInitialized;

  /// Exposed only so the preview widget can render `CameraPreview(controller)`
  /// — no other code should reach into controller internals.
  CameraController? get controller;

  /// Opens the front camera. Must be called before [startFrameStream]/
  /// [captureStillFrame].
  Future<void> initialize();

  /// Releases the camera. Safe to call even if never initialized.
  Future<void> dispose();

  /// Starts delivering frames to [onFrame] for live detection. The
  /// camera's own frame rate is NOT the same as detection cadence —
  /// [FaceDetectionService] is responsible for throttling/discarding
  /// frames it can't keep up with; this just forwards everything the
  /// camera produces.
  Future<void> startFrameStream(void Function(CameraImage image) onFrame);

  Future<void> stopFrameStream();

  /// Captures a single high(er)-quality still frame once a challenge has
  /// passed, for [FaceImageProcessor] to crop/compress. [pose] is the
  /// last known-good pose (used to pick crop parameters), not re-detected
  /// from the still itself.
  Future<CapturedFaceFrame> captureStillFrame({required FacePose pose});

  /// Called on `AppLifecycleState.paused`/`inactive`/etc — stops the frame
  /// stream but deliberately does NOT dispose/recreate the underlying
  /// `CameraController`. Confirmed on-device: disposing and later
  /// re-`initialize()`-ing a fresh `CameraController` races CameraX's
  /// global `ProcessCameraProvider` — the old controller's use cases
  /// (Preview/ImageCapture/ImageAnalysis) aren't reliably unbound by the
  /// time `dispose()`'s Future resolves, so the new controller's
  /// `startImageStream()` throws "No supported surface combination...
  /// attempting to bind too many use cases". Keeping one controller alive
  /// for the screen's lifetime and only stop/starting its image stream
  /// avoids CameraX use-case rebinding entirely for a pause/resume cycle;
  /// the camera hardware is only actually released in [dispose]. Callers
  /// (the capture notifier) still treat a background/foreground cycle as
  /// inherently ending the current challenge — see the Phase 4 plan's
  /// "Camera lifecycle" section — that's a capture-session policy, not a
  /// hardware-release requirement.
  Future<void> pause();

  Future<void> resume();
}
