import 'package:flutter/material.dart';

import 'domain/entities/biometric_purpose.dart';
import 'domain/entities/biometric_verification_outcome.dart';
import 'presentation/screens/face_verification_screen.dart';

/// The ONLY entry point Attendance code (daily_route's clock-in flow)
/// should use — pushes the camera/liveness screen and awaits its typed
/// result. No ML Kit/camera/liveness types leak past this function; see
/// the "Phase 4" plan's "Architectural boundary" section.
///
/// Returns `null` if the user backed out before completing (e.g. denied
/// camera permission and tapped back) — callers should treat that the
/// same as an unverified result (don't proceed with clock-in), but may
/// want to show different copy than an explicit rejection.
///
/// Deliberately pushed on the ROOT `Navigator` directly (bypassing
/// GoRouter's declarative route table — `/biometrics/verify` is no
/// longer a `GoRoute`) rather than via `GoRouter.push()`. Confirmed
/// on-device with heavy instrumentation: FaceVerificationScreen's own
/// pop/dispose lifecycle completed perfectly every time (pop() called,
/// canPop==true, dispose() ran cleanly right after) — success was never
/// in doubt — yet the caller's `await verifyBiometric(...)` never
/// resumed, so the clock-in POST that's supposed to follow a successful
/// verify was never reached. Root cause: `redirect`'s `refreshListenable`
/// re-evaluates every ~5s throughout the whole verification flow (the
/// location/full-screen-intent permission pollers call notifyListeners()
/// on every tick, not just on change — see
/// `_LocationPermissionRefreshListenable`'s own doc comment in
/// router_provider.dart). Re-running `redirect` mid-push, even when it
/// returns null (no navigation change), can make GoRouter rebuild the
/// pushed route's Page with a new identity, silently orphaning the
/// original `push()` call's Completer — the real Navigator still pops
/// correctly, but nothing is left to resolve the caller's Future.
/// Registration never hit this because `FaceRegistrationScreen` doesn't
/// depend on a push() return value at all — it signals completion by
/// invalidating `biometricStatusProvider`, which the router's redirect
/// itself reacts to. Verification has no equivalent signal to fall back
/// on, so it needs a push/pop mechanism GoRouter's redirect churn can't
/// disrupt — a plain root-Navigator push, entirely outside GoRouter's
/// route table, is immune to this by construction.
Future<BiometricVerificationOutcome?> verifyBiometric(
  BuildContext context, {
  required BiometricPurpose purpose,
}) {
  return Navigator.of(context, rootNavigator: true).push<BiometricVerificationOutcome>(
    MaterialPageRoute(
      builder: (_) => FaceVerificationScreen(purpose: purpose),
      fullscreenDialog: true,
    ),
  );
}
