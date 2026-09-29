import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/network/failures.dart';
import '../../domain/entities/biometric_enrollment_outcome.dart';
import '../../domain/entities/biometric_enrollment_status.dart';
import '../../domain/entities/biometric_purpose.dart';
import '../../domain/entities/biometric_status.dart';
import '../../domain/entities/biometric_verification_outcome.dart';
import '../../domain/entities/liveness_challenge.dart';
import '../../domain/entities/registration_pose.dart';
import '../../domain/repositories/biometric_repository.dart';
import '../datasources/biometric_remote_datasource.dart';

/// `DioException` handling here mirrors
/// `OutletVisitRepositoryImpl._mapDioError`'s established pattern for the
/// `{"detail": {"error": "<CODE>", "message": "..."}}` envelope shape
/// (see `lib/features/daily_route/data/repositories/outlet_visit_repository_impl.dart`)
/// — confirmed the generic `ErrorMappingInterceptor` does NOT parse this
/// shape (it only reads `body['error']` as a map, or `body['detail']` as
/// a plain string), so this repository does its own raw-body parsing
/// rather than relying on the interceptor for biometric-specific codes.
class BiometricRepositoryImpl implements BiometricRepository {
  final BiometricRemoteDatasource _datasource;

  BiometricRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, BiometricStatus>> getStatus() async {
    try {
      final response = await _datasource.getStatus();
      return Right(
        BiometricStatus(
          status: BiometricEnrollmentStatus.fromWireValue(response.status),
          canEnroll: response.canEnroll,
          requiresEnrollment: response.requiresEnrollment,
          clockInVerificationRequired: response.clockInVerificationRequired,
          modelCompatible: response.modelCompatible,
          enrolledAt: response.enrolledAt,
          lastVerifiedAt: response.lastVerifiedAt,
        ),
      );
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, LivenessChallenge>> requestChallenge({
    required BiometricPurpose purpose,
    required String deviceId,
  }) async {
    try {
      final challenge = await _datasource.requestChallenge(
        purpose: purpose,
        deviceId: deviceId,
      );
      return Right(challenge);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BiometricVerificationOutcome>> verifyFace({
    required String captureSessionId,
    required String challengeId,
    required String verificationRequestId,
    required BiometricPurpose purpose,
    required String deviceId,
    required Uint8List image,
  }) async {
    try {
      final response = await _datasource.verify(
        challengeId: challengeId,
        verificationRequestId: verificationRequestId,
        purpose: purpose,
        deviceId: deviceId,
        image: image,
        captureSessionId: captureSessionId,
      );

      if (response.verified) {
        return Right(
          BiometricVerificationOutcome(
            verified: true,
            verificationId: response.verificationId,
            verificationExpiresAt: response.expiresAt,
          ),
        );
      }

      // A business-logic non-match (or other named rejection) — a real
      // 200-level response, not a transport error. Never let this be
      // confused with NetworkFailure/ServerFailure.
      return Left(_mapVerifyReason(response.reason));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BiometricEnrollmentOutcome>> registerFace({
    required String captureSessionId,
    required String challengeId,
    required String deviceId,
    required Uint8List frontalImage,
    required Uint8List leftImage,
    required Uint8List rightImage,
  }) async {
    try {
      final response = await _datasource.enroll(
        challengeId: challengeId,
        deviceId: deviceId,
        frontalImage: frontalImage,
        leftImage: leftImage,
        rightImage: rightImage,
        captureSessionId: captureSessionId,
      );

      if (response.enrolled) {
        return Right(
          BiometricEnrollmentOutcome(
            enrolled: true,
            status: BiometricEnrollmentStatus.fromWireValue(response.status),
          ),
        );
      }

      // A 200-level rejection (nothing stored) — see the per-reason table
      // in the "Phase 5" plan's enroll section.
      return Left(_mapEnrollReason(response.reason, response.failedPose));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  Failure _mapVerifyReason(String? reason) {
    return switch (reason) {
      'FACE_NOT_MATCHED' => const BiometricVerificationFailure.faceNotMatched(),
      'NO_FACE' => const BiometricVerificationFailure.invalidImage(
          message: 'No face found. Please try again.',
        ),
      'MULTIPLE_FACES' => const BiometricVerificationFailure.invalidImage(
          message: 'Only one person should be visible. Please try again.',
        ),
      'LOW_QUALITY' => const BiometricVerificationFailure.invalidImage(
          message: 'Move closer or improve lighting, then try again.',
        ),
      _ => const BiometricVerificationFailure.faceNotMatched(),
    };
  }

  Failure _mapEnrollReason(String? reason, String? failedPoseWire) {
    final failedPose = RegistrationPose.fromWireValue(failedPoseWire);
    final poseLabel = switch (failedPose) {
      RegistrationPose.frontal => 'frontal',
      RegistrationPose.left => 'left-turn',
      RegistrationPose.right => 'right-turn',
      null => null,
    };
    return switch (reason) {
      'NO_FACE' => BiometricVerificationFailure.invalidImage(
          message: poseLabel != null
              ? 'No face found in the $poseLabel photo. Please try again.'
              : 'No face found. Please try again.',
        ),
      'MULTIPLE_FACES' => const BiometricVerificationFailure.invalidImage(
          message: 'Only you should be in the photo. Please try again.',
        ),
      'LOW_QUALITY' => const BiometricVerificationFailure.invalidImage(
          message: 'Move closer or improve lighting, then try again.',
        ),
      'ENROLLMENT_INCONSISTENT' => const BiometricVerificationFailure.invalidImage(
          message: "Photos don't look like the same person. Please try again.",
        ),
      _ => const BiometricVerificationFailure.invalidImage(),
    };
  }

  Failure _mapDioError(DioException e) {
    final requestId = e.requestOptions.extra['requestId'] as String? ?? const Uuid().v4();

    if (e.response == null) {
      return switch (e.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout =>
          NetworkFailure.timeout(requestId: requestId),
        DioExceptionType.connectionError =>
          NetworkFailure.connectionError(requestId: requestId),
        _ => UnknownFailure(message: e.message ?? 'Unknown network error', requestId: requestId),
      };
    }

    final statusCode = e.response!.statusCode ?? 0;
    final raw = e.response!.data;

    // Real contract's envelope: {"detail": {"error": "<CODE>", "message": "..."}}
    // — the same shape OutletVisitRepositoryImpl._mapDioError already
    // parses for GEOFENCE_VIOLATION etc. {"detail": "<string>"} (auth/
    // permission/password-change) and {"error": {...}} (validation/
    // upgrade/500) are the other two shapes the contract documents.
    final Map<String, dynamic> data = () {
      if (raw is Map && raw['detail'] is Map) {
        return Map<String, dynamic>.from(raw['detail'] as Map);
      }
      if (raw is Map && raw['error'] is Map) {
        return Map<String, dynamic>.from(raw['error'] as Map);
      }
      if (raw is Map) {
        return Map<String, dynamic>.from(raw);
      }
      return <String, dynamic>{};
    }();

    final errorCode = (data['error'] as String?) ?? (data['type'] as String?);
    final message = data['message'] as String? ??
        (raw is Map && raw['detail'] is String ? raw['detail'] as String : null);

    Duration? retryAfter() {
      final headerValue = e.response!.headers.value('retry-after');
      final parsed = headerValue != null ? int.tryParse(headerValue) : null;
      return parsed != null ? Duration(seconds: parsed) : null;
    }

    switch (errorCode) {
      case 'DEVICE_NOT_REGISTERED':
        return BiometricVerificationFailure.deviceNotRegistered(
          message: message ?? 'Device not registered. Please try again.',
          requestId: requestId,
        );
      case 'ENROLLMENT_NOT_ALLOWED':
        return BiometricVerificationFailure.enrollmentNotAllowed(
          message: message ?? 'Already registered. Ask your supervisor to reset.',
          requestId: requestId,
        );
      case 'NO_PROFILE':
        return BiometricVerificationFailure.noProfile(
          message: message ?? 'Face not registered for this account',
          requestId: requestId,
        );
      case 'RE_ENROLLMENT_REQUIRED':
        return BiometricVerificationFailure.reEnrollmentRequired(
          message: message ?? 'Your face registration was reset — please register again',
          requestId: requestId,
        );
      case 'PROFILE_REVOKED':
        return BiometricVerificationFailure.profileRevoked(
          message: message ??
              'Face verification disabled for your account — contact your supervisor',
          requestId: requestId,
        );
      case 'NO_TEMPLATE':
        return BiometricVerificationFailure.noTemplate(
          message: message ?? 'Face registration is incomplete — please register again',
          requestId: requestId,
        );
      case 'MODEL_VERSION_MISMATCH':
        return BiometricVerificationFailure.modelVersionMismatch(
          message: message ??
              'Face registration needs to be renewed — contact your supervisor',
          requestId: requestId,
        );
      case 'BIOMETRICS_DISABLED':
        return BiometricVerificationFailure.biometricsDisabled(
          message: message ?? 'Face verification is not available',
          requestId: requestId,
        );
      case 'CHALLENGE_INVALID':
        return BiometricVerificationFailure.challengeInvalid(
          message: message ?? 'Something went wrong. Please try again.',
          requestId: requestId,
        );
      case 'CHALLENGE_EXPIRED':
        return BiometricVerificationFailure.challengeExpired(
          message: message ?? 'Liveness check expired. Please try again.',
          requestId: requestId,
        );
      case 'CHALLENGE_USED':
        return BiometricVerificationFailure.challengeUsed(
          message: message ?? 'Please try again.',
          requestId: requestId,
        );
      case 'ENROLLMENT_CONFLICT':
        return BiometricVerificationFailure.enrollmentConflict(
          message: message ?? 'Registration already completed on another device',
          requestId: requestId,
        );
      case 'VERIFICATION_REQUEST_CONFLICT':
        return BiometricVerificationFailure.verificationRequestConflict(
          message: message ?? 'Something went wrong. Please try again.',
          requestId: requestId,
        );
      case 'INVALID_IMAGE':
        return BiometricVerificationFailure.invalidImage(
          message: message ?? 'Something went wrong capturing your photo. Please try again.',
          requestId: requestId,
        );
      case 'IMAGE_TOO_LARGE':
        return BiometricVerificationFailure.imageTooLarge(
          message: message ?? 'Something went wrong capturing your photo. Please try again.',
          requestId: requestId,
        );
      case 'BIOMETRIC_RATE_LIMITED':
        return BiometricVerificationFailure.biometricRateLimited(
          retryAfter: retryAfter() ?? const Duration(seconds: 60),
          message: message ?? 'Too many attempts. Please try again shortly.',
          requestId: requestId,
        );
      case 'MODEL_UNAVAILABLE':
      case 'BIOMETRIC_BUSY':
      case 'BIOMETRIC_UNAVAILABLE':
      case 'PROCESSING_ERROR':
        final technicalReason = switch (errorCode) {
          'MODEL_UNAVAILABLE' => BiometricTechnicalUnavailableReason.modelUnavailable,
          'BIOMETRIC_BUSY' => BiometricTechnicalUnavailableReason.biometricBusy,
          'PROCESSING_ERROR' => BiometricTechnicalUnavailableReason.processingError,
          _ => BiometricTechnicalUnavailableReason.biometricUnavailable,
        };
        // BUSY defaults to a 2s backoff, MODEL/others 30s, per the
        // contract — only used when the server doesn't send Retry-After.
        final defaultDelay = technicalReason == BiometricTechnicalUnavailableReason.biometricBusy
            ? const Duration(seconds: 2)
            : const Duration(seconds: 30);
        return BiometricVerificationFailure.technicallyUnavailable(
          reason: technicalReason,
          retryAfter: retryAfter() ?? defaultDelay,
          message: message ?? 'Face verification temporarily unavailable',
          requestId: requestId,
        );
    }

    // No biometric-specific code matched — fall back to generic HTTP-status
    // mapping (auth/permission/validation/rate-limit/server), same shape
    // as ErrorMappingInterceptor's own switch, since this repository does
    // its own parsing rather than trusting `e.error`.
    return switch (statusCode) {
      401 => AuthFailure.tokenExpired(requestId: requestId),
      403 => ForbiddenFailure.resourceForbidden(
          message: message ?? 'Face verification not available for your account',
          requestId: requestId,
        ),
      404 => NotFoundFailure(
          resourceType: 'resource',
          resourceId: 'unknown',
          requestId: requestId,
        ),
      422 => ValidationFailure(
          message: message ?? 'Validation failed',
          fieldErrors: const {},
          requestId: requestId,
        ),
      429 => RateLimitFailure(
          retryAfter: retryAfter() ?? const Duration(seconds: 60),
          requestId: requestId,
        ),
      >= 500 => ServerFailure.internalError(requestId: requestId),
      _ => UnknownFailure(message: message ?? 'Unexpected error', requestId: requestId),
    };
  }
}
