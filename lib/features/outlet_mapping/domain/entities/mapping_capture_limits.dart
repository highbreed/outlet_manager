/// Backend-authoritative capture limits from `/captures`' `limits` object
/// (spec §15/§36). Never hardcoded as business rules elsewhere — every
/// consumer reads these off the cached session.
class MappingCaptureLimits {
  final int minSamples;
  final double minDurationSeconds;
  final int maxBatch;
  final int maxSamples;

  const MappingCaptureLimits({
    required this.minSamples,
    required this.minDurationSeconds,
    required this.maxBatch,
    required this.maxSamples,
  });

  /// Conservative fallback, used only if a `/captures` response is ever
  /// missing `limits` entirely (spec §36 — "document fallback behavior if
  /// limits is missing"). Deliberately more conservative than the
  /// documented current server defaults, never looser.
  const MappingCaptureLimits.fallbackDefaults()
      : minSamples = 20,
        minDurationSeconds = 90.0,
        maxBatch = 100,
        maxSamples = 1000;

  factory MappingCaptureLimits.fromJson(Map<String, dynamic> json) {
    return MappingCaptureLimits(
      minSamples: json['min_samples'] as int,
      minDurationSeconds: (json['min_duration_seconds'] as num).toDouble(),
      maxBatch: json['max_batch'] as int,
      maxSamples: json['max_samples'] as int,
    );
  }
}

/// `summary` object on a successful `/finish` response — the only source
/// of a genuinely backend-accepted sample count (spec §74/§51).
class MappingCaptureSummary {
  final int samplesReceived;
  final int samplesAccepted;
  final double durationSeconds;
  final double? areaM2;

  const MappingCaptureSummary({
    required this.samplesReceived,
    required this.samplesAccepted,
    required this.durationSeconds,
    this.areaM2,
  });

  factory MappingCaptureSummary.fromJson(Map<String, dynamic> json) {
    return MappingCaptureSummary(
      samplesReceived: json['samples_received'] as int,
      samplesAccepted: json['samples_accepted'] as int,
      durationSeconds: (json['duration_s'] as num).toDouble(),
      areaM2: (json['area_m2'] as num?)?.toDouble(),
    );
  }
}
