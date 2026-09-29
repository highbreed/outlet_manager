import 'dart:typed_data';

import '../../domain/entities/biometric_purpose.dart';
import '../../domain/entities/liveness_challenge.dart';

class BiometricStatusResponseData {
  final String status;
  final bool canEnroll;
  final bool requiresEnrollment;
  final bool clockInVerificationRequired;
  final bool? modelCompatible;
  final DateTime? enrolledAt;
  final DateTime? lastVerifiedAt;

  const BiometricStatusResponseData({
    required this.status,
    required this.canEnroll,
    required this.requiresEnrollment,
    required this.clockInVerificationRequired,
    this.modelCompatible,
    this.enrolledAt,
    this.lastVerifiedAt,
  });
}

class BiometricVerifyResponseData {
  final bool success;
  final bool verified;
  final String? verificationId;
  final String? reason;
  final DateTime? expiresAt;
  final bool replayed;

  const BiometricVerifyResponseData({
    required this.success,
    required this.verified,
    this.verificationId,
    this.reason,
    this.expiresAt,
    this.replayed = false,
  });
}

class BiometricEnrollResponseData {
  final bool success;
  final bool enrolled;
  final String status;
  final String? reason;
  final String? failedPose;

  const BiometricEnrollResponseData({
    required this.success,
    required this.enrolled,
    required this.status,
    this.reason,
    this.failedPose,
  });
}

/// No try/catch here, same convention as `LocationPingRemoteDataSource` —
/// `DioException`s propagate to the repository layer for conversion to
/// `Either<Failure, T>`.
abstract class BiometricRemoteDatasource {
  Future<BiometricStatusResponseData> getStatus();

  Future<LivenessChallenge> requestChallenge({
    required BiometricPurpose purpose,
    required String deviceId,
  });

  Future<BiometricVerifyResponseData> verify({
    required String challengeId,
    required String verificationRequestId,
    required BiometricPurpose purpose,
    required String deviceId,
    required Uint8List image,
    String? captureSessionId,
  });

  Future<BiometricEnrollResponseData> enroll({
    required String challengeId,
    required String deviceId,
    required Uint8List frontalImage,
    required Uint8List leftImage,
    required Uint8List rightImage,
    String? captureSessionId,
  });
}
