/// Typed reasons the capture flow can fail — never raw strings.
/// Presentation code converts these to user-facing copy; services/domain
/// code only ever produces/consumes the typed value.
enum BiometricErrorReason {
  cameraPermissionDenied,
  cameraUnavailable,
  noFace,
  multipleFaces,
  faceNotAligned,
  poorImageQuality,
  livenessFailed,
  challengeExpired,
  networkUnavailable,
  requestTimeout,
  serverError,
  faceNotMatched,
  // 409 NO_PROFILE / RE_ENROLLMENT_REQUIRED / NO_TEMPLATE — screens react
  // by invalidating biometricStatusProvider and rerouting to registration.
  needsRegistration,
  // 409 PROFILE_REVOKED / MODEL_VERSION_MISMATCH — not self-recoverable;
  // screens show non-retryable "contact your supervisor" copy.
  contactSupervisor,
  // 503 MODEL_UNAVAILABLE / BIOMETRIC_BUSY / BIOMETRIC_UNAVAILABLE /
  // PROCESSING_ERROR — transient, retryable after a delay.
  technicallyUnavailable,
  // 429 BIOMETRIC_RATE_LIMITED.
  rateLimited,
  // 403 DEVICE_NOT_REGISTERED.
  deviceNotRegistered,
  // 404 BIOMETRICS_DISABLED — hide biometric UI entirely.
  biometricsDisabled,
  unknown,
}
