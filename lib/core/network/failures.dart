import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Base failure type - all API errors map to a subtype
abstract class Failure {
  String get message;
  String? get requestId;
  bool get isRetryable;

  /// User-friendly message for UI display
  String get displayMessage;
}

/// 401 - Authentication failed or token invalid
@freezed
abstract class AuthFailure with _$AuthFailure implements Failure {
  const AuthFailure._();

  const factory AuthFailure.invalidCredentials({
    @Default('Invalid email or password') String message,
    String? requestId,
  }) = InvalidCredentials;

  const factory AuthFailure.tokenExpired({
    @Default('Session expired') String message,
    String? requestId,
  }) = TokenExpired;

  const factory AuthFailure.sessionRevoked({
    String? reason,
    @Default('Session ended') String message,
    String? requestId,
  }) = SessionRevoked;

  const factory AuthFailure.biometricFailed({
    @Default('Biometric authentication failed') String message,
    String? requestId,
  }) = BiometricFailed;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => message;
}

/// 403 - Authenticated but not authorized
@freezed
abstract class ForbiddenFailure with _$ForbiddenFailure implements Failure {
  const ForbiddenFailure._();

  const factory ForbiddenFailure.insufficientPermissions({
    required String requiredPermission,
    @Default('You do not have permission to perform this action')
    String message,
    String? requestId,
  }) = InsufficientPermissions;

  const factory ForbiddenFailure.accountDisabled({
    @Default('Your account has been disabled') String message,
    String? requestId,
  }) = AccountDisabled;

  const factory ForbiddenFailure.resourceForbidden({
    @Default('Access denied') String message,
    String? requestId,
  }) = ResourceForbidden;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => message;
}

/// 422 - Validation errors with field-level details
@freezed
abstract class ValidationFailure with _$ValidationFailure implements Failure {
  const ValidationFailure._();

  const factory ValidationFailure({
    required String message,
    required Map<String, List<String>> fieldErrors,
    String? requestId,
  }) = _ValidationFailure;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => message;
}

/// 404 - Resource not found
@freezed
abstract class NotFoundFailure with _$NotFoundFailure implements Failure {
  const NotFoundFailure._();

  const factory NotFoundFailure({
    required String resourceType,
    required String resourceId,
    @Default('Resource not found') String message,
    String? requestId,
  }) = _NotFoundFailure;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => '$resourceType not found';
}

/// 409 - Conflict (optimistic locking, duplicate, etc.)
@freezed
abstract class ConflictFailure with _$ConflictFailure implements Failure {
  const ConflictFailure._();

  const factory ConflictFailure.versionMismatch({
    required int serverVersion,
    @Default('Data was modified by another user') String message,
    String? requestId,
  }) = VersionMismatch;

  const factory ConflictFailure.duplicateEntry({
    required String field,
    @Default('This entry already exists') String message,
    String? requestId,
  }) = DuplicateEntry;

  const factory ConflictFailure.concurrentSession({
    @Default('Logged in on another device') String message,
    String? requestId,
  }) = ConcurrentSession;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => message;
}

/// 429 - Rate limited
@freezed
abstract class RateLimitFailure with _$RateLimitFailure implements Failure {
  const RateLimitFailure._();

  const factory RateLimitFailure({
    required Duration retryAfter,
    @Default('Too many requests. Please wait.') String message,
    String? requestId,
  }) = _RateLimitFailure;

  @override
  bool get isRetryable => true;

  @override
  String get displayMessage =>
      'Too many requests. Please wait ${retryAfter.inSeconds}s.';
}

/// 5xx - Server errors
@freezed
abstract class ServerFailure with _$ServerFailure implements Failure {
  const ServerFailure._();

  const factory ServerFailure.internalError({
    @Default('Server error. Please try again later.') String message,
    String? requestId,
  }) = InternalError;

  const factory ServerFailure.serviceUnavailable({
    Duration? retryAfter,
    @Default('Service temporarily unavailable') String message,
    String? requestId,
  }) = ServiceUnavailable;

  const factory ServerFailure.badGateway({
    @Default('Unable to reach server') String message,
    String? requestId,
  }) = BadGateway;

  @override
  bool get isRetryable => true;

  @override
  String get displayMessage => message;
}

/// Network-level failures (no HTTP response)
@freezed
abstract class NetworkFailure with _$NetworkFailure implements Failure {
  const NetworkFailure._();

  const factory NetworkFailure.offline({
    @Default('No internet connection') String message,
    String? requestId,
  }) = Offline;

  const factory NetworkFailure.timeout({
    @Default('Request timed out') String message,
    String? requestId,
  }) = Timeout;

  const factory NetworkFailure.connectionError({
    String? details,
    @Default('Connection error') String message,
    String? requestId,
  }) = ConnectionError;

  const factory NetworkFailure.sslError({
    @Default('Security error') String message,
    String? requestId,
  }) = SslError;

  @override
  bool get isRetryable => this is! SslError;

  @override
  String get displayMessage => message;
}

/// Unknown/unexpected failures
@freezed
abstract class UnknownFailure with _$UnknownFailure implements Failure {
  const UnknownFailure._();

  const factory UnknownFailure({
    required String message,
    Object? originalError,
    String? requestId,
  }) = _UnknownFailure;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => 'Something went wrong. Please try again.';
}

// ============================================================================
// Domain-Specific Failures (Daily Route & Visits)
// ============================================================================

/// Route blocked by unclosed previous route
@freezed
abstract class RouteBlockedFailure
    with _$RouteBlockedFailure
    implements Failure {
  const RouteBlockedFailure._();

  const factory RouteBlockedFailure({
    required String blockedRouteId,
    required DateTime blockedRouteDate,
    required String blockedRouteStatus,
    @Default(true) bool requiresSupervisorOverride,
    @Default('You have an unclosed route from a previous day') String message,
    String? requestId,
  }) = _RouteBlockedFailure;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => message;
}

/// Geofence validation failed
@freezed
abstract class GeofenceViolationFailure
    with _$GeofenceViolationFailure
    implements Failure {
  const GeofenceViolationFailure._();

  const factory GeofenceViolationFailure({
    required double userLatitude,
    required double userLongitude,
    required double outletLatitude,
    required double outletLongitude,
    required double distanceMeters,
    required double requiredRadiusMeters,
    @Default(true) bool canRequestOverride,
    String? requestId,
  }) = _GeofenceViolationFailure;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage =>
      'You are ${distanceMeters.round()}m from the outlet. Maximum allowed: ${requiredRadiusMeters.round()}m';

  @override
  String get message => displayMessage;
}

/// GPS accuracy is too poor
@freezed
abstract class GpsAccuracyFailure with _$GpsAccuracyFailure implements Failure {
  const GpsAccuracyFailure._();

  const factory GpsAccuracyFailure({
    required double currentAccuracy,
    @Default(200.0) double requiredAccuracy,
    String? requestId,
  }) = _GpsAccuracyFailure;

  @override
  bool get isRetryable => true; // User can wait for better GPS signal

  @override
  String get displayMessage =>
      'GPS accuracy (${currentAccuracy.round()}m) is too low. Please wait for better signal.';

  @override
  String get message => displayMessage;
}

/// Another visit is already in progress
@freezed
abstract class VisitInProgressFailure
    with _$VisitInProgressFailure
    implements Failure {
  const VisitInProgressFailure._();

  const factory VisitInProgressFailure({
    required String activeVisitLocalId,
    required String activeOutletName,
    String? requestId,
  }) = _VisitInProgressFailure;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage =>
      'You are already clocked in at $activeOutletName';

  @override
  String get message => displayMessage;
}

/// Visit is in invalid state for the requested operation
@freezed
abstract class InvalidVisitStateFailure
    with _$InvalidVisitStateFailure
    implements Failure {
  const InvalidVisitStateFailure._();

  const factory InvalidVisitStateFailure({
    required String currentStatus,
    required String operation,
    String? requestId,
  }) = _InvalidVisitStateFailure;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => 'Cannot $operation: visit is $currentStatus';

  @override
  String get message => displayMessage;
}

/// Route is in invalid state for the requested operation
@freezed
abstract class InvalidRouteStateFailure
    with _$InvalidRouteStateFailure
    implements Failure {
  const InvalidRouteStateFailure._();

  const factory InvalidRouteStateFailure({
    required String currentStatus,
    required String operation,
    String? requestId,
  }) = _InvalidRouteStateFailure;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => 'Cannot $operation: route is $currentStatus';

  @override
  String get message => displayMessage;
}

// ============================================================================
// Domain-Specific Failures (Biometric Verification)
// ============================================================================
//
// Deliberately NOT reusing AuthFailure.biometricFailed above — that's
// grouped under the 401/"authentication failed" umbrella (session/token
// problems), which is semantically wrong for a face-match result. A
// failed verification is a business-logic outcome the backend returns on
// POST /biometrics/verify, not an auth failure — AuthInterceptor's
// proactive-refresh/force-logout handling has no bearing on it.
//
// Transport/server failures (timeout, 5xx, offline) are NOT modeled
// here — they continue through the existing NetworkFailure/
// ServerFailure/RateLimitFailure unchanged, which is what keeps "face
// didn't match" structurally distinct from "couldn't reach the server."
// Client-side pre-network states (noFace, multipleFaces, poorImageQuality,
// etc.) are also not Failure subtypes — they live in
// BiometricCaptureState.phase/BiometricErrorReason, converted to copy
// only in the presentation layer.
@freezed
abstract class BiometricVerificationFailure
    with _$BiometricVerificationFailure
    implements Failure {
  const BiometricVerificationFailure._();

  /// Backend returned verified:false — a genuine, business-logic
  /// non-match. Must never be conflated with a transport/server failure.
  /// No verificationId here — per the proposed contract, that token is
  /// only ever returned on a PASS.
  const factory BiometricVerificationFailure.faceNotMatched({
    @Default('We could not verify your face. Please try again.') String message,
    String? requestId,
  }) = FaceNotMatched;

  const factory BiometricVerificationFailure.challengeExpired({
    @Default('Liveness check expired. Please try again.') String message,
    String? requestId,
  }) = ChallengeExpired;

  /// The person/account isn't enrolled — not the device. Device
  /// registration and biometric enrollment are separate concepts; keep
  /// this named accordingly (not e.g. "deviceNotEnrolled").
  const factory BiometricVerificationFailure.notEnrolled({
    @Default('Face not registered for this account') String message,
    String? requestId,
  }) = NotEnrolled;

  // ── Identity/profile problems — no retry with the same
  // challenge/request; reroute to registration or show non-retryable
  // "contact supervisor" copy. Real backend codes: 409 NO_PROFILE,
  // RE_ENROLLMENT_REQUIRED, PROFILE_REVOKED, NO_TEMPLATE,
  // ENROLLMENT_NOT_ALLOWED, MODEL_VERSION_MISMATCH; 404 BIOMETRICS_DISABLED.

  /// 409 `NO_PROFILE` — no enrolled profile exists for this employee at
  /// all (distinct from [notEnrolled], which is the older/simpler
  /// provisional-contract variant — this is the real contract's code).
  /// Both map to "go to registration."
  const factory BiometricVerificationFailure.noProfile({
    @Default('Face not registered for this account') String message,
    String? requestId,
  }) = NoProfile;

  /// 409 `RE_ENROLLMENT_REQUIRED`.
  const factory BiometricVerificationFailure.reEnrollmentRequired({
    @Default('Your face registration was reset — please register again')
    String message,
    String? requestId,
  }) = ReEnrollmentRequired;

  /// 409 `PROFILE_REVOKED` — the employee can't fix this themselves.
  const factory BiometricVerificationFailure.profileRevoked({
    @Default('Face verification disabled for your account — contact your supervisor')
    String message,
    String? requestId,
  }) = ProfileRevoked;

  /// 409 `NO_TEMPLATE` (verify only) — profile exists but has no usable
  /// template; functionally the same recovery as [reEnrollmentRequired].
  const factory BiometricVerificationFailure.noTemplate({
    @Default('Face registration is incomplete — please register again')
    String message,
    String? requestId,
  }) = NoTemplate;

  /// 409 `ENROLLMENT_NOT_ALLOWED` (challenge/enroll, purpose=ENROLLMENT,
  /// profile already ACTIVE).
  const factory BiometricVerificationFailure.enrollmentNotAllowed({
    @Default('Already registered. Ask your supervisor to reset.') String message,
    String? requestId,
  }) = EnrollmentNotAllowed;

  /// 409 `MODEL_VERSION_MISMATCH` (verify) — needs a supervisor reset.
  const factory BiometricVerificationFailure.modelVersionMismatch({
    @Default('Face registration needs to be renewed — contact your supervisor')
    String message,
    String? requestId,
  }) = ModelVersionMismatch;

  /// 404 `BIOMETRICS_DISABLED` — biometrics not enabled on this server at
  /// all; hide biometric UI entirely, fall back to legacy clock-in.
  const factory BiometricVerificationFailure.biometricsDisabled({
    @Default('Face verification is not available') String message,
    String? requestId,
  }) = BiometricsDisabled;

  // ── Challenge/request problems — recoverable by starting over: a new
  // challenge, and (for verify) a new verification_request_id. Real
  // backend codes: 409 CHALLENGE_INVALID, CHALLENGE_EXPIRED (already
  // above), CHALLENGE_USED, ENROLLMENT_CONFLICT,
  // VERIFICATION_REQUEST_CONFLICT.

  /// 409 `CHALLENGE_INVALID` — from another user/device/purpose, or
  /// simply unknown to the server.
  const factory BiometricVerificationFailure.challengeInvalid({
    @Default('Something went wrong. Please try again.') String message,
    String? requestId,
  }) = ChallengeInvalid;

  /// 409 `CHALLENGE_USED` — a different request already consumed this
  /// challenge.
  const factory BiometricVerificationFailure.challengeUsed({
    @Default('Please try again.') String message,
    String? requestId,
  }) = ChallengeUsed;

  /// 409 `ENROLLMENT_CONFLICT` (enroll only) — another enrollment attempt
  /// finished first; refresh status rather than blindly retrying.
  const factory BiometricVerificationFailure.enrollmentConflict({
    @Default('Registration already completed on another device') String message,
    String? requestId,
  }) = EnrollmentConflict;

  /// 409 `VERIFICATION_REQUEST_CONFLICT` (verify only) — the app reused a
  /// request id with a different challenge; an app-side bug signal, not a
  /// user-facing distinction from [challengeInvalid].
  const factory BiometricVerificationFailure.verificationRequestConflict({
    @Default('Something went wrong. Please try again.') String message,
    String? requestId,
  }) = VerificationRequestConflict;

  // ── Image/encoding problems — real backend codes: 400 INVALID_IMAGE,
  // 413 IMAGE_TOO_LARGE.

  const factory BiometricVerificationFailure.invalidImage({
    @Default('Something went wrong capturing your photo. Please try again.')
    String message,
    String? requestId,
  }) = InvalidImage;

  const factory BiometricVerificationFailure.imageTooLarge({
    @Default('Something went wrong capturing your photo. Please try again.')
    String message,
    String? requestId,
  }) = ImageTooLarge;

  // ── Technical/retry problems — transient, never an identity failure.
  // The real contract treats MODEL_UNAVAILABLE / BIOMETRIC_BUSY /
  // BIOMETRIC_UNAVAILABLE / PROCESSING_ERROR identically (503, "technical,
  // retry after Retry-After"), so one variant with a sub-reason covers
  // all four rather than 4 near-identical factories.

  const factory BiometricVerificationFailure.technicallyUnavailable({
    required BiometricTechnicalUnavailableReason reason,
    Duration? retryAfter,
    @Default('Face verification temporarily unavailable') String message,
    String? requestId,
  }) = TechnicallyUnavailable;

  /// 403 `DEVICE_NOT_REGISTERED` — distinct handling from the generic
  /// technical-retry bucket: re-register the device, retry once.
  const factory BiometricVerificationFailure.deviceNotRegistered({
    @Default('Device not registered. Please try again.') String message,
    String? requestId,
  }) = DeviceNotRegistered;

  /// 429 `BIOMETRIC_RATE_LIMITED` — distinct from the generic
  /// [RateLimitFailure] so the UI can show biometric-specific copy.
  const factory BiometricVerificationFailure.biometricRateLimited({
    required Duration retryAfter,
    @Default('Too many attempts. Please try again shortly.') String message,
    String? requestId,
  }) = BiometricRateLimited;

  /// Returned when the *clock-in* endpoint (not /biometrics/verify)
  /// rejects a verification_id — see [BiometricClockInRejectionReason]
  /// for the 4 backend codes this maps from. Kept in this same failure
  /// group since all four are "why didn't clock-in succeed, biometrics-
  /// wise" — not a daily-route/location failure like
  /// GeofenceViolationFailure.
  const factory BiometricVerificationFailure.clockInRejected({
    required BiometricClockInRejectionReason reason,
    @Default('Verification could not be completed. Please try again.')
    String message,
    String? requestId,
  }) = ClockInRejected;

  @override
  bool get isRetryable =>
      this is TechnicallyUnavailable ||
      this is BiometricRateLimited ||
      this is DeviceNotRegistered;

  @override
  String get displayMessage => message;
}

/// The 4 codes the real contract treats identically ("technical, not an
/// identity failure" — 503 MODEL_UNAVAILABLE / BIOMETRIC_BUSY /
/// BIOMETRIC_UNAVAILABLE / PROCESSING_ERROR), kept as one Failure variant
/// with a sub-reason rather than 4 near-identical factories.
enum BiometricTechnicalUnavailableReason {
  modelUnavailable,
  biometricBusy,
  biometricUnavailable,
  processingError,
}

/// Reasons the *clock-in* endpoint can reject a `verification_id` — see
/// the "Phase 4" plan's "Backend coordination" section for the exact
/// backend codes these map from (BIOMETRIC_VERIFICATION_REQUIRED /
/// _EXPIRED / _INVALID / _ALREADY_USED).
enum BiometricClockInRejectionReason {
  /// Clock-in attempted with no verification_id at all — e.g. an old
  /// mobile build that predates this feature.
  verificationRequired,

  /// Valid at verify time, expired before clock-in consumed it (see
  /// BiometricConfig.verificationTokenValidity).
  verificationExpired,

  /// Doesn't exist, or doesn't match this user/purpose/device.
  verificationInvalid,

  /// Replay of a previously-consumed verification_id.
  verificationAlreadyUsed,
}

// ============================================================================
// Domain-Specific Failures (Outlet Mapping)
// ============================================================================
//
// Transport/server failures (timeout, 5xx, offline) continue through the
// existing NetworkFailure/ServerFailure/RateLimitFailure unchanged — same
// principle as BiometricVerificationFailure above.
@freezed
abstract class OutletMappingFailure
    with _$OutletMappingFailure
    implements Failure {
  const OutletMappingFailure._();

  /// 404 — request or visit not found.
  const factory OutletMappingFailure.notFound({
    @Default('Mapping request not found') String message,
    String? requestId,
  }) = OutletMappingNotFound;

  /// 403 — wrong owner, or missing `outlet:mapping:capture` permission.
  const factory OutletMappingFailure.forbidden({
    @Default('You are not authorized to map this outlet') String message,
    String? requestId,
  }) = OutletMappingForbidden;

  /// 409 `WRONG_OUTLET` / `VISIT_NOT_IN_PROGRESS` / `REQUEST_NOT_OPEN` /
  /// `AWAITING_REVIEW` / `CAPTURE_IN_PROGRESS` (start) and
  /// `CAPTURE_ABANDONED` / `CAPTURE_NOT_OPEN` / `VISIT_NOT_IN_PROGRESS`
  /// (sample upload) — kept as one variant with a code string rather than
  /// ~8 near-identical factories; callers branch on [code] only where the
  /// spec calls for different handling (see the notifier/uploader).
  const factory OutletMappingFailure.conflict({
    required String code,
    @Default('This mapping session cannot continue right now') String message,
    String? requestId,
  }) = OutletMappingConflict;

  /// 413 `TOO_MANY_SAMPLES`.
  const factory OutletMappingFailure.tooManySamples({
    @Default('Maximum mapping readings reached') String message,
    String? requestId,
  }) = OutletMappingTooManySamples;

  /// 422 — validation error on the request body itself (a client bug, not
  /// a user-facing scenario the spec calls out copy for).
  const factory OutletMappingFailure.validation({
    @Default('Invalid mapping request') String message,
    String? requestId,
  }) = OutletMappingValidation;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => message;
}

/// Lunch-break start/end rejected by the backend — always a 404/409 with a
/// specific `error` code from `{"detail":{"error":CODE,"message":...}}`.
/// One variant with a [code] field rather than 5 near-identical factories
/// (`LUNCH_ALREADY_TAKEN` / `NO_ROUTE_TODAY` / `ROUTE_CLOSED` /
/// `NO_LUNCH_BREAK` / `NO_SALES_AGENT`) — same shape as
/// [OutletMappingFailure.conflict]. The lunch break state itself is never
/// decided from this Failure; callers reconcile against a fresh
/// `dayStatusPollProvider` read regardless of whether this fires (see
/// `LunchBreakNotifier`).
@freezed
abstract class LunchBreakFailure with _$LunchBreakFailure implements Failure {
  const LunchBreakFailure._();

  const factory LunchBreakFailure.actionRejected({
    required String code,
    @Default('Lunch break action could not be completed') String message,
    String? requestId,
  }) = LunchBreakActionRejected;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => message;
}
