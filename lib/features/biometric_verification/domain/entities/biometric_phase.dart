/// The biometric capture state machine's phases. Kept small and linear —
/// specific failure detail (no face vs. multiple faces vs. camera error,
/// etc.) lives in [BiometricErrorReason], carried alongside [error]/
/// [rejected], not as additional top-level phases.
enum BiometricPhase {
  idle,
  initializing,
  waitingForFace,
  aligning,
  ready,
  challengeRunning,
  capturing,
  processing,
  uploading,
  verified,
  rejected,
  error,
}
