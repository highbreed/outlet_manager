import 'dart:math';
import 'dart:typed_data';

import 'package:uuid/uuid.dart';

import '../../domain/entities/biometric_purpose.dart';
import '../../domain/entities/liveness_action.dart';
import '../../domain/entities/liveness_challenge.dart';
import 'biometric_remote_datasource.dart';

/// Dev/debug-only fake — see the "Phase 4" plan's "Production safety"
/// section for the hard gate that keeps this from ever being selected in
/// a release build (`biometricRemoteDatasourceProvider` in
/// `biometric_repository_providers.dart` is the enforcement point, not
/// this class itself).
class FakeBiometricRemoteDatasource implements BiometricRemoteDatasource {
  /// Deterministic toggle for dev/manual testing — defaults to always
  /// passing so the happy path is exercisable without extra setup.
  final bool alwaysVerify;

  /// Canned `/status` response — defaults to "already active, not
  /// enforced" so dev builds don't get stuck on the mandatory registration
  /// gate by default. Override to exercise the gate.
  final BiometricStatusResponseData status;

  const FakeBiometricRemoteDatasource({
    this.alwaysVerify = true,
    this.status = const BiometricStatusResponseData(
      status: 'ACTIVE',
      canEnroll: false,
      requiresEnrollment: false,
      clockInVerificationRequired: false,
    ),
  });

  @override
  Future<BiometricStatusResponseData> getStatus() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return status;
  }

  @override
  Future<LivenessChallenge> requestChallenge({
    required BiometricPurpose purpose,
    required String deviceId,
  }) async {
    final actions = List<LivenessAction>.from(LivenessAction.values)..shuffle(Random());
    return LivenessChallenge(
      challengeId: const Uuid().v4(),
      actions: actions.take(3).toList(growable: false),
      expiresAt: DateTime.now().add(const Duration(seconds: 45)),
      purpose: purpose,
    );
  }

  @override
  Future<BiometricVerifyResponseData> verify({
    required String challengeId,
    required String verificationRequestId,
    required BiometricPurpose purpose,
    required String deviceId,
    required Uint8List image,
    String? captureSessionId,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return BiometricVerifyResponseData(
      success: true,
      verified: alwaysVerify,
      verificationId: alwaysVerify ? const Uuid().v4() : null,
      reason: alwaysVerify ? null : 'FACE_NOT_MATCHED',
      expiresAt: alwaysVerify ? DateTime.now().add(const Duration(seconds: 120)) : null,
    );
  }

  @override
  Future<BiometricEnrollResponseData> enroll({
    required String challengeId,
    required String deviceId,
    required Uint8List frontalImage,
    required Uint8List leftImage,
    required Uint8List rightImage,
    String? captureSessionId,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    return const BiometricEnrollResponseData(
      success: true,
      enrolled: true,
      status: 'ACTIVE',
    );
  }
}
