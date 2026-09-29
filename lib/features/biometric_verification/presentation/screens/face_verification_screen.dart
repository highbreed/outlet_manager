import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/permissions/permissions.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/widgets/permission_widgets.dart';
import '../../domain/entities/entities.dart';
import '../../providers/biometric_capture_notifier.dart';
import '../../providers/biometric_service_providers.dart';
import '../widgets/biometric_camera_preview.dart';
import '../widgets/biometric_progress_indicator.dart';
import '../widgets/biometric_result_view.dart';
import '../widgets/face_guide_overlay.dart';
import '../widgets/liveness_instruction_banner.dart';

/// Pushed via `verifyBiometric(context, purpose: ...)` — see
/// `biometric_verification_gate.dart`, the only entry point Attendance
/// code should use. Pops a [BiometricVerificationOutcome] (or `null` if
/// the user backs out before completing).
class FaceVerificationScreen extends ConsumerStatefulWidget {
  final BiometricPurpose purpose;

  const FaceVerificationScreen({super.key, required this.purpose});

  @override
  ConsumerState<FaceVerificationScreen> createState() => _FaceVerificationScreenState();
}

class _FaceVerificationScreenState extends ConsumerState<FaceVerificationScreen> {
  bool _permissionChecked = false;
  bool _permissionGranted = false;

  // Captured in initState, not read via `ref` in dispose(): Riverpod's
  // ConsumerStatefulElement marks itself disposed *before* calling
  // State.dispose() (confirmed on-device, same crash reproduced in
  // FaceRegistrationScreen — "Cannot use ref after the widget was
  // disposed" thrown from inside this dispose()), so any
  // ref.invalidate(...) call here throws. The underlying container is
  // still perfectly usable at this point; only the element-bound `ref`
  // wrapper refuses it.
  late final ProviderContainer _container;

  @override
  void initState() {
    super.initState();
    _container = ProviderScope.containerOf(context, listen: false);
    _checkPermissionAndStart();
  }

  @override
  void dispose() {
    // The notifier and every service below are now keepAlive (see their
    // doc comments for why) — reset them explicitly here so leaving this
    // screen still means "fresh session next time", same as autoDispose
    // used to give for free. Camera service first, since it owns real
    // hardware and is the one whose premature disposal was actually
    // observed on-device.
    _container.invalidate(biometricCaptureNotifierProvider);
    _container.invalidate(biometricCameraServiceProvider);
    _container.invalidate(faceDetectionServiceProvider);
    _container.invalidate(faceQualityServiceProvider);
    _container.invalidate(activeLivenessServiceProvider);
    _container.invalidate(livenessServiceProvider);
    _container.invalidate(livenessChallengeGeneratorProvider);
    _container.invalidate(faceImageProcessorProvider);
    debugPrint('[DIAG-face-verify] dispose() called, mounted was $mounted');
    super.dispose();
  }

  Future<void> _checkPermissionAndStart() async {
    final hasPermission = await ref.read(permissionServiceProvider).hasCameraPermission();
    if (!mounted) return;
    if (hasPermission) {
      setState(() {
        _permissionChecked = true;
        _permissionGranted = true;
      });
      unawaited(_start());
      return;
    }
    await showPermissionRequest(
      context,
      permission: AppPermissionType.camera,
      customRationale:
          'Outlet Manager needs camera access to verify your identity before clocking in.',
      onGranted: () {
        if (!mounted) return;
        setState(() {
          _permissionChecked = true;
          _permissionGranted = true;
        });
        unawaited(_start());
      },
      onDenied: () {
        if (!mounted) return;
        setState(() {
          _permissionChecked = true;
          _permissionGranted = false;
        });
      },
    );
  }

  Future<void> _start() {
    return ref
        .read(biometricCaptureNotifierProvider.notifier)
        .start(purpose: widget.purpose);
  }

  void _onFrame(CameraImage image) {
    final description = ref.read(biometricCameraServiceProvider).controller?.description;
    if (description == null) return;
    ref.read(biometricCaptureNotifierProvider.notifier).onFrame(
      image,
      sensorOrientation: description.sensorOrientation,
      lensDirection: description.lensDirection,
    );
  }

  void _popWithOutcome(BiometricCaptureState state) {
    final outcome = BiometricVerificationOutcome(
      verified: state.phase == BiometricPhase.verified,
      verificationId: state.verificationId,
      errorReason: state.errorReason,
    );
    final navigator = Navigator.of(context);
    debugPrint(
      '[DIAG-face-verify] _popWithOutcome calling pop: outcome=$outcome '
      'canPop=${navigator.canPop()}',
    );
    navigator.pop(outcome);
    debugPrint('[DIAG-face-verify] _popWithOutcome pop() call returned');
  }

  @override
  Widget build(BuildContext context) {
    if (!_permissionChecked) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (!_permissionGranted) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Camera permission is required to verify your identity.',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Back'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final state = ref.watch(biometricCaptureNotifierProvider);

    ref.listen(biometricCaptureNotifierProvider, (previous, next) {
      debugPrint(
        '[DIAG-face-verify] ref.listen fired: previousPhase=${previous?.phase} '
        'nextPhase=${next.phase} mounted=$mounted',
      );
      if (next.phase == BiometricPhase.verified &&
          previous?.phase != BiometricPhase.verified) {
        debugPrint('[DIAG-face-verify] scheduling delayed pop in 800ms');
        Future.delayed(const Duration(milliseconds: 800), () {
          debugPrint('[DIAG-face-verify] delayed callback firing, mounted=$mounted');
          if (mounted) _popWithOutcome(next);
        });
      }
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          BiometricCameraPreview(
            cameraService: ref.read(biometricCameraServiceProvider),
            onFrame: _onFrame,
            onLifecyclePause: () =>
                ref.read(biometricCaptureNotifierProvider.notifier).cancel(),
            onLifecycleResume: _start,
            overlayBuilder: (context) => FaceGuideOverlay(
              aligned: state.phase == BiometricPhase.ready ||
                  state.phase == BiometricPhase.challengeRunning,
            ),
          ),
          if (state.isTerminal)
            BiometricResultView(state: state, onRetry: _start)
          else
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BiometricProgressIndicator(state: state),
                    const SizedBox(height: 16),
                    LivenessInstructionBanner(state: state),
                  ],
                ),
              ),
            ),
          if (state.isTerminal)
            Positioned(
              top: 8,
              right: 8,
              child: SafeArea(
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => _popWithOutcome(state),
                ),
              ),
            )
          else
            Positioned(
              top: 8,
              left: 8,
              child: SafeArea(
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(null),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
