/// Backend-authoritative footprint status (`outlet_footprints.status`).
/// Do not add values here beyond what the backend contract defines.
enum MappingFootprintStatus {
  capturing,
  pendingReview,
  captureFailed,
  abandoned,
  rejected,
  active,
  superseded;

  static MappingFootprintStatus fromWire(String value) => switch (value) {
    'CAPTURING' => capturing,
    'PENDING_REVIEW' => pendingReview,
    'CAPTURE_FAILED' => captureFailed,
    'ABANDONED' => abandoned,
    'REJECTED' => rejected,
    'ACTIVE' => active,
    'SUPERSEDED' => superseded,
    _ => throw ArgumentError('Unknown MappingFootprintStatus: $value'),
  };

  /// Backend-terminal states — no further client operation (upload/finish/
  /// abandon) is valid against a footprint in one of these.
  bool get isServerTerminal =>
      this != capturing;
}

/// Backend-authoritative mapping request status (`mapping_requests.status`).
enum MappingRequestStatus {
  open,
  fulfilled,
  cancelled;

  static MappingRequestStatus fromWire(String value) => switch (value) {
    'OPEN' => open,
    'FULFILLED' => fulfilled,
    'CANCELLED' => cancelled,
    _ => throw ArgumentError('Unknown MappingRequestStatus: $value'),
  };
}

/// Backend `/finish` failure codes. Diagnostic only — Flutter never
/// branches its own logic on these beyond selecting display copy; the
/// backend has already made the accept/reject decision by the time one of
/// these is returned. Do not invent additional codes.
enum MappingFailureCode {
  mockLocationExcessive,
  insufficientSamples,
  captureTooShort,
  poorGpsQuality,
  degenerateGeometry,
  areaTooLarge;

  static MappingFailureCode? fromWire(String? value) => switch (value) {
    null => null,
    'MOCK_LOCATION_EXCESSIVE' => mockLocationExcessive,
    'INSUFFICIENT_SAMPLES' => insufficientSamples,
    'CAPTURE_TOO_SHORT' => captureTooShort,
    'POOR_GPS_QUALITY' => poorGpsQuality,
    'DEGENERATE_GEOMETRY' => degenerateGeometry,
    'AREA_TOO_LARGE' => areaTooLarge,
    _ => null, // Unknown code from a future backend version — degrade to generic copy, never throw.
  };

  /// Plain-language, employee-facing copy — never the raw code or backend
  /// technical message verbatim in UI chrome (see spec §112).
  String get displayMessage => switch (this) {
    mockLocationExcessive =>
      'The location information could not be verified. Please try again.',
    insufficientSamples => 'Not enough location readings were collected.',
    captureTooShort => 'The mapping session ended too soon.',
    poorGpsQuality => 'GPS accuracy was too low during the mapping.',
    degenerateGeometry => 'The outlet area was not sufficiently covered.',
    areaTooLarge => 'The recorded area appears larger than expected.',
  };
}

/// This app's own local capture state machine (§20/§21 of the spec) —
/// distinct from [MappingFootprintStatus] (backend) and
/// [MappingSampleSyncState] (per-sample upload state). See
/// [MappingSessionState] for the full three-axis split.
enum MappingLocalState {
  idle,
  preparing,
  capturing,
  captureFinishedLocal,
  uploadPending,
  submitting,
  finishResultUnknown,
  pendingReview,
  captureFailed,
  abandoning,
  abandoned,
  cancelled;

  bool get isTerminal =>
      this == pendingReview ||
      this == captureFailed ||
      this == abandoned ||
      this == cancelled;

  /// Whether the mapping GPS consumer should be actively sampling while in
  /// this local state.
  bool get isActivelyCapturing => this == capturing;
}

/// Per-sample upload state — identical shape to
/// `LocationPingSyncState`/`LocationPingSyncStateModel`, deliberately kept
/// as its own type rather than shared: a mapping sample and a location
/// ping are different entities that happen to have the same lifecycle
/// shape, not the same thing.
enum MappingSampleSyncState { pending, syncing, synced, failed }
