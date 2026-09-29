import 'package:isar_community/isar.dart';

part 'mapping_session_model.g.dart';

/// Isar collection for the durable local mapping-session record (spec
/// §18). At most one row with a non-terminal [localState] should exist at
/// a time (enforced at the repository layer, spec §33) — Isar itself
/// doesn't express that constraint.
@collection
class MappingSessionModel {
  Id? id;

  @Index(unique: true)
  late String localId;

  @Index()
  late int footprintId;

  late int mappingRequestId;

  @Index()
  late String visitLocalId;

  late String outletId;
  late String outletCode;
  late String outletName;

  /// Security-critical — see [MappingSession.ownerUserId]'s doc comment.
  @Index()
  late String ownerUserId;

  @Enumerated(EnumType.name)
  @Index()
  late MappingLocalStateModel localState;

  late DateTime startedAt;
  DateTime? serverTimeAtStart;
  DateTime? lastSampleAt;
  DateTime? captureFinishedLocalAt;

  late int nextSequence;

  late int minSamples;
  late double minDurationSeconds;
  late int maxBatch;
  late int maxSamples;
  int? recommendedIntervalMs;
  int? lastKnownServerTotalSamples;

  late double preMappingDistanceFilter;
  late double preMappingHeartbeatInterval;
  String? preMappingExtrasJson;

  late int configVersion;

  @Enumerated(EnumType.name)
  MappingFailureCodeModel? failureCode;
  String? failureMessage;

  late DateTime createdAt;
  late DateTime updatedAt;
}

enum MappingLocalStateModel {
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
  cancelled,
}

enum MappingFailureCodeModel {
  mockLocationExcessive,
  insufficientSamples,
  captureTooShort,
  poorGpsQuality,
  degenerateGeometry,
  areaTooLarge,
}
