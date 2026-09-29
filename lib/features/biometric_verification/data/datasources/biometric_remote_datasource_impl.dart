import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../domain/entities/biometric_purpose.dart';
import '../../domain/entities/liveness_action.dart';
import '../../domain/entities/liveness_challenge.dart';
import 'biometric_remote_datasource.dart';

class BiometricRemoteDatasourceImpl implements BiometricRemoteDatasource {
  final Dio _dio;

  BiometricRemoteDatasourceImpl(this._dio);

  @override
  Future<BiometricStatusResponseData> getStatus() async {
    final response = await _dio.get(ApiEndpoints.biometricStatus);
    final data = response.data as Map<String, dynamic>;
    return BiometricStatusResponseData(
      status: data['status'] as String,
      canEnroll: data['can_enroll'] as bool,
      requiresEnrollment: data['requires_enrollment'] as bool,
      clockInVerificationRequired: data['clock_in_verification_required'] as bool,
      modelCompatible: data['model_compatible'] as bool?,
      enrolledAt: data['enrolled_at'] != null
          ? DateTime.parse(data['enrolled_at'] as String)
          : null,
      lastVerifiedAt: data['last_verified_at'] != null
          ? DateTime.parse(data['last_verified_at'] as String)
          : null,
    );
  }

  @override
  Future<LivenessChallenge> requestChallenge({
    required BiometricPurpose purpose,
    required String deviceId,
  }) async {
    final response = await _dio.post(
      ApiEndpoints.biometricChallenge,
      data: {'purpose': purpose.wireValue, 'device_id': deviceId},
    );
    final data = response.data as Map<String, dynamic>;
    return LivenessChallenge(
      challengeId: data['challenge_id'] as String,
      actions: (data['actions'] as List)
          .map((a) => LivenessAction.fromWireValue(a as String))
          .toList(growable: false),
      expiresAt: DateTime.parse(data['expires_at'] as String),
      purpose: BiometricPurpose.fromWireValue(data['purpose'] as String),
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
    final formData = FormData.fromMap({
      'challenge_id': challengeId,
      'verification_request_id': verificationRequestId,
      'purpose': purpose.wireValue,
      'device_id': deviceId,
      'image': MultipartFile.fromBytes(image, filename: 'face.jpg'),
      if (captureSessionId != null) 'capture_session_id': captureSessionId,
    });
    // skipRetry: a blind auto-retry after a timeout could create a
    // duplicate verification attempt server-side — the "resend the
    // identical request" logic the real contract wants is deliberate,
    // notifier-level retry (same challenge/request id), not something
    // RetryInterceptor should ever do automatically. See the "Phase 4"
    // plan's "RetryInterceptor" section.
    final response = await _dio.post(
      ApiEndpoints.biometricVerify,
      data: formData,
      options: Options(extra: {'skipRetry': true}),
    );
    final data = response.data as Map<String, dynamic>;
    return BiometricVerifyResponseData(
      success: data['success'] as bool? ?? true,
      verified: data['verified'] as bool? ?? false,
      verificationId: data['verification_id'] as String?,
      reason: data['reason'] as String?,
      expiresAt: data['expires_at'] != null
          ? DateTime.parse(data['expires_at'] as String)
          : null,
      replayed: data['replayed'] as bool? ?? false,
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
    final formData = FormData.fromMap({
      'challenge_id': challengeId,
      'device_id': deviceId,
      'frontal_image': MultipartFile.fromBytes(frontalImage, filename: 'frontal.jpg'),
      'left_image': MultipartFile.fromBytes(leftImage, filename: 'left.jpg'),
      'right_image': MultipartFile.fromBytes(rightImage, filename: 'right.jpg'),
      if (captureSessionId != null) 'capture_session_id': captureSessionId,
    });
    final response = await _dio.post(
      ApiEndpoints.biometricEnroll,
      data: formData,
      options: Options(extra: {'skipRetry': true}),
    );
    final data = response.data as Map<String, dynamic>;
    return BiometricEnrollResponseData(
      success: data['success'] as bool? ?? true,
      enrolled: data['enrolled'] as bool? ?? false,
      status: data['status'] as String,
      reason: data['reason'] as String?,
      failedPose: data['failed_pose'] as String?,
    );
  }
}
