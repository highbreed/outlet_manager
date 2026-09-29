/// Every tunable value for the outlet-mapping capture pipeline, centralized
/// the same way `BiometricConfig` centralizes the biometric feature's
/// tunables — constructor parameters with documented defaults, not magic
/// numbers scattered through the code (spec §4's "make important values
/// configurable").
class MappingConfig {
  const MappingConfig({
    // GPS sampling (spec §33/§34) — overridden per-session by the
    // backend's `capture_guidance.recommended_interval_ms` when present.
    // Densified from 3.0/2000 to 2.0/1500 for small-outlet coverage —
    // still comfortably below the backend's 2,000-sample limit; subject
    // to further adjustment once field-tested across small/medium/large
    // outlets.
    this.mappingDistanceFilterMeters = 2.0,
    this.minSampleIntervalMs = 1500,

    // Same-spot rejection (spec §33's "optional duplicate suppression") —
    // a fix within this distance of the last STORED sample is dropped
    // even if the interval/distanceFilter gates above already passed.
    // Densified from ~1.0m alongside the two tunables above.
    this.duplicateSuppressionMeters = 0.75,

    // Finalisation (spec §O) — how long `finishing` waits for the queue to
    // drain before giving up and falling back to `uploadPending` rather
    // than blocking the employee indefinitely.
    this.finishDrainTimeout = const Duration(seconds: 20),

    // Opportunistic upload (spec §31) — how often the notifier attempts a
    // drain while actively capturing, independent of the
    // connectivity-restored trigger.
    this.opportunisticUploadInterval = const Duration(seconds: 30),
  });

  final double mappingDistanceFilterMeters;
  final int minSampleIntervalMs;
  final double duplicateSuppressionMeters;
  final Duration finishDrainTimeout;
  final Duration opportunisticUploadInterval;
}
