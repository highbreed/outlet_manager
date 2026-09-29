import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/permissions/permissions.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/widgets/permission_widgets.dart';
import '../../domain/entities/entities.dart';
import '../../providers/biometric_registration_notifier.dart';
import '../../providers/biometric_service_providers.dart';
import '../../providers/biometric_status_provider.dart';
import '../widgets/biometric_camera_preview.dart';
import '../widgets/biometric_result_view.dart';
import '../widgets/face_guide_overlay.dart';
import '../widgets/liveness_instruction_banner.dart';

/// Pops `bool` — `true` once enrollment succeeds, `false`/`null`
/// otherwise. Callers should re-check `BiometricEnrollmentStatus` (not
/// just trust a `true` pop) before treating the employee as enrolled —
/// see the "Phase 4" plan's "Registration authorization" section.
///
/// [mandatory] is true when reached via the login-time enrollment gate
/// (`router_provider.dart`) — there is nothing below this screen in the
/// nav stack to pop back to, so the skippable close button is hidden and
/// completion is signaled by invalidating `biometricStatusProvider`
/// (which the gate's redirect listenable reacts to) rather than by
/// popping. See the "Phase 5" plan's section A.5.
class FaceRegistrationScreen extends ConsumerStatefulWidget {
  const FaceRegistrationScreen({super.key, this.mandatory = false});

  final bool mandatory;

  @override
  ConsumerState<FaceRegistrationScreen> createState() => _FaceRegistrationScreenState();
}

class _FaceRegistrationScreenState extends ConsumerState<FaceRegistrationScreen> {
  bool _permissionChecked = false;
  bool _permissionGranted = false;

  // Captured in initState, not read via `ref` in dispose(): Riverpod's
  // ConsumerStatefulElement marks itself disposed *before* calling
  // State.dispose() (confirmed on-device — "Cannot use ref after the
  // widget was disposed" thrown from inside this dispose()), so any
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
    _container.invalidate(biometricRegistrationNotifierProvider);
    _container.invalidate(biometricCameraServiceProvider);
    _container.invalidate(faceDetectionServiceProvider);
    _container.invalidate(faceQualityServiceProvider);
    _container.invalidate(activeLivenessServiceProvider);
    _container.invalidate(livenessServiceProvider);
    _container.invalidate(livenessChallengeGeneratorProvider);
    _container.invalidate(faceImageProcessorProvider);
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
          'Outlet Manager needs camera access to register your face for clock-in verification.',
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
    return ref.read(biometricRegistrationNotifierProvider.notifier).start();
  }

  void _popEnrolled() {
    // Runs from a Future.delayed callback (900ms after the verified phase
    // is reached) — by the time it fires the screen may already be
    // disposed (e.g. the user backed out, or something else navigated
    // away first). Confirmed on-device: ref.invalidate here threw the
    // same "Cannot use ref after the widget was disposed" error dispose()
    // did, for the same reason (see _container's doc comment above) — use
    // the captured container instead, which works regardless of the
    // element's disposed state.
    _container.invalidate(biometricStatusProvider);
    if (mounted && Navigator.of(context).canPop()) {
      Navigator.of(context).pop(true);
    }
  }

  void _onFrame(CameraImage image) {
    final description = ref.read(biometricCameraServiceProvider).controller?.description;
    if (description == null) return;
    ref.read(biometricRegistrationNotifierProvider.notifier).onFrame(
      image,
      sensorOrientation: description.sensorOrientation,
      lensDirection: description.lensDirection,
    );
  }

  String _poseInstruction(RegistrationPose pose) => switch (pose) {
    RegistrationPose.frontal => 'Look straight ahead',
    RegistrationPose.left => 'Turn your head slightly left',
    RegistrationPose.right => 'Turn your head slightly right',
  };

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
                Text(
                  widget.mandatory
                      ? 'Camera permission is required to register your face '
                          'before you can continue.'
                      : 'Camera permission is required to register your face.',
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                if (Navigator.of(context).canPop())
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Back'),
                  ),
              ],
            ),
          ),
        ),
      );
    }

    final notifier = ref.watch(biometricRegistrationNotifierProvider.notifier);
    final state = ref.watch(biometricRegistrationNotifierProvider);

    ref.listen(biometricRegistrationNotifierProvider, (previous, next) {
      if (next.phase == BiometricPhase.verified && previous?.phase != BiometricPhase.verified) {
        Future.delayed(const Duration(milliseconds: 900), _popEnrolled);
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
                ref.read(biometricRegistrationNotifierProvider.notifier).cancel(),
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
                    if (widget.mandatory)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Text(
                          'Face registration is required before you can continue.',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    if (state.phase != BiometricPhase.challengeRunning)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          _poseInstruction(notifier.currentPose),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    LivenessInstructionBanner(state: state),
                  ],
                ),
              ),
            ),
          if (!widget.mandatory)
            Positioned(
              top: 8,
              left: 8,
              child: SafeArea(
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
