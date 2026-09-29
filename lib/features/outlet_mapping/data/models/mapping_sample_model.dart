import 'package:isar_community/isar.dart';

part 'mapping_sample_model.g.dart';

/// Isar collection for individual mapping GPS observations (spec §22).
/// Same pending→syncing→synced(→failed) shape as `LocationPingModel`,
/// kept as its own collection/type deliberately (spec §5 — mapping never
/// reuses the attendance queue).
@collection
class MappingSampleModel {
  Id? id;

  @Index(unique: true)
  late String localId;

  @Index()
  late int footprintId;

  /// Backend dedup key together with [footprintId] — immutable once
  /// generated (spec §11/§23).
  @Index(unique: true)
  late String clientSampleId;

  late int sequence;

  late double latitude;
  late double longitude;
  late double accuracyM;
  @Index()
  late DateTime recordedAt;

  // Diagnostic only — see MappingSample's doc comment. Never read for any
  // accept/reject/enforcement decision.
  double? altitudeM;
  double? verticalAccuracyM;
  String? floorLabel;
  double? speedMps;
  double? headingDeg;
  String? provider;
  bool? isMock;

  @Enumerated(EnumType.name)
  @Index(composite: [CompositeIndex('footprintId')])
  late MappingSampleSyncStateModel syncState;

  late int attemptCount;
  DateTime? lastAttemptAt;
  String? lastError;

  late DateTime createdAt;
}

enum MappingSampleSyncStateModel { pending, syncing, synced, failed }
