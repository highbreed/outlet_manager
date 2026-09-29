import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../services/biometric_camera_service.dart';

/// Renders the live front-camera feed and owns the
/// `WidgetsBindingObserver` lifecycle handling the Phase 4 plan requires:
/// backgrounding pauses the camera and notifies [onLifecyclePause] (the
/// capture notifier treats this as "cancel the current challenge, start
/// fresh on return" — never resume a half-completed liveness sequence),
/// returning to foreground calls [onLifecycleResume].
///
/// Deliberately does not itself run face detection — that's wired in by
/// the capture notifier via [onFrame], keeping this widget a thin
/// preview + lifecycle shell.
class BiometricCameraPreview extends StatefulWidget {
  final BiometricCameraService cameraService;
  final void Function(CameraImage image)? onFrame;
  final VoidCallback? onLifecyclePause;
  final VoidCallback? onLifecycleResume;
  final Widget Function(BuildContext context)? overlayBuilder;

  const BiometricCameraPreview({
    super.key,
    required this.cameraService,
    this.onFrame,
    this.onLifecyclePause,
    this.onLifecycleResume,
    this.overlayBuilder,
  });

  @override
  State<BiometricCameraPreview> createState() => _BiometricCameraPreviewState();
}

class _BiometricCameraPreviewState extends State<BiometricCameraPreview>
    with WidgetsBindingObserver {
  bool _ready = false;
  Object? _initError;
  // Tracks an in-flight [BiometricCameraService.pause] so a quick
  // resume-after-pause (a brief `inactive` blip, not a real backgrounding)
  // waits for the old CameraController to actually finish disposing
  // before re-initializing. Framework lifecycle callbacks are
  // synchronous/`void`, so without this, `_start()` on resume can race
  // `pause()`'s still-in-flight teardown — confirmed on-device: CameraX
  // then throws "No supported surface combination... attempting to bind
  // too many use cases" because the old surfaces are still registered.
  Future<void>? _pauseFuture;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _start();
  }

  Future<void> _start() async {
    try {
      if (!widget.cameraService.isInitialized) {
        await widget.cameraService.initialize();
      }
      final onFrame = widget.onFrame;
      if (onFrame != null) {
        await widget.cameraService.startFrameStream(onFrame);
      }
      // A later retry (e.g. onLifecycleResume, or the camera being busy on
      // the very first attempt right after a process restart) must clear
      // any error from an earlier failed attempt — otherwise a
      // subsequently-successful open still shows "Camera unavailable"
      // forever, since build() checks _initError before _ready.
      if (mounted) setState(() {
        _ready = true;
        _initError = null;
      });
    } catch (e) {
      if (mounted) setState(() => _initError = e);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        _pauseFuture = widget.cameraService.pause();
        widget.onLifecyclePause?.call();
        if (mounted) setState(() => _ready = false);
        break;
      case AppLifecycleState.resumed:
        _resumeAfterPause();
        break;
    }
  }

  Future<void> _resumeAfterPause() async {
    final pauseFuture = _pauseFuture;
    _pauseFuture = null;
    if (pauseFuture != null) await pauseFuture;
    await _start();
    widget.onLifecycleResume?.call();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.cameraService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_initError != null) {
      return const ColoredBox(
        color: Colors.black,
        child: Center(
          child: Text(
            'Camera unavailable',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
    final controller = widget.cameraService.controller;
    if (!_ready || controller == null || !controller.value.isInitialized) {
      return const ColoredBox(
        color: Colors.black,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        CameraPreview(controller),
        if (widget.overlayBuilder != null) widget.overlayBuilder!(context),
      ],
    );
  }
}
