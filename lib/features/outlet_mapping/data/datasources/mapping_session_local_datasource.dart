import 'dart:convert';

import 'package:isar_community/isar.dart';

import '../../../../core/database/isar_database.dart';
import '../../domain/entities/mapping_capture_limits.dart';
import '../../domain/entities/mapping_enums.dart';
import '../../domain/entities/mapping_session.dart';
import '../models/mapping_session_model.dart';

/// Local persistence for the durable mapping-session record (spec §18).
/// Same Isar-access convention as `LocationPingLocalDataSource` — get the
/// instance per call via [IsarDatabase.getInstance()], not injected.
class MappingSessionLocalDataSource {
  Future<Isar> get _isar => IsarDatabase.getInstance();

  Future<void> save(MappingSession session) async {
    final isar = await _isar;
    final existing =
        await isar.mappingSessionModels.where().localIdEqualTo(session.localId).findFirst();
    final model = _toModel(session, existingId: existing?.id);
    await isar.writeTxn(() => isar.mappingSessionModels.put(model));
  }

  /// At most one non-terminal session should exist (spec §33) — this is
  /// the query [MappingRecoveryCoordinator] uses on cold start, and the
  /// query the session notifier uses to refuse starting a second capture
  /// while one is already active.
  Future<MappingSession?> getActiveForUser(String ownerUserId) async {
    final isar = await _isar;
    final terminalStates = [
      MappingLocalStateModel.pendingReview,
      MappingLocalStateModel.captureFailed,
      MappingLocalStateModel.abandoned,
      MappingLocalStateModel.cancelled,
    ];
    final models = await isar.mappingSessionModels
        .where()
        .ownerUserIdEqualTo(ownerUserId)
        .sortByUpdatedAtDesc()
        .findAll();
    final active = models.where((m) => !terminalStates.contains(m.localState));
    return active.isEmpty ? null : _toEntity(active.first);
  }

  Future<MappingSession?> getByFootprintId(int footprintId) async {
    final isar = await _isar;
    final model =
        await isar.mappingSessionModels.where().footprintIdEqualTo(footprintId).findFirst();
    return model != null ? _toEntity(model) : null;
  }

  Future<MappingSession?> getByVisitLocalId(String visitLocalId) async {
    final isar = await _isar;
    final model = await isar.mappingSessionModels
        .where()
        .visitLocalIdEqualTo(visitLocalId)
        .sortByUpdatedAtDesc()
        .findFirst();
    return model != null ? _toEntity(model) : null;
  }

  /// All non-terminal sessions across ALL users on this device — used only
  /// by [MappingRecoveryCoordinator] to positively identify (and leave
  /// untouched) another user's still-queued session, per spec §19/§K.
  Future<List<MappingSession>> getAllNonTerminal() async {
    final isar = await _isar;
    final terminalStates = [
      MappingLocalStateModel.pendingReview,
      MappingLocalStateModel.captureFailed,
      MappingLocalStateModel.abandoned,
      MappingLocalStateModel.cancelled,
    ];
    final models = await isar.mappingSessionModels.where().findAll();
    return models
        .where((m) => !terminalStates.contains(m.localState))
        .map(_toEntity)
        .toList();
  }

  Future<void> delete(String localId) async {
    final isar = await _isar;
    final model =
        await isar.mappingSessionModels.where().localIdEqualTo(localId).findFirst();
    if (model?.id != null) {
      await isar.writeTxn(() => isar.mappingSessionModels.delete(model!.id!));
    }
  }

  MappingSessionModel _toModel(MappingSession s, {int? existingId}) {
    return MappingSessionModel()
      ..id = existingId
      ..localId = s.localId
      ..footprintId = s.footprintId
      ..mappingRequestId = s.mappingRequestId
      ..visitLocalId = s.visitLocalId
      ..outletId = s.outletId
      ..outletCode = s.outletCode
      ..outletName = s.outletName
      ..ownerUserId = s.ownerUserId
      ..localState = _toModelState(s.localState)
      ..startedAt = s.startedAt
      ..serverTimeAtStart = s.serverTimeAtStart
      ..lastSampleAt = s.lastSampleAt
      ..captureFinishedLocalAt = s.captureFinishedLocalAt
      ..nextSequence = s.nextSequence
      ..minSamples = s.limits.minSamples
      ..minDurationSeconds = s.limits.minDurationSeconds
      ..maxBatch = s.limits.maxBatch
      ..maxSamples = s.limits.maxSamples
      ..recommendedIntervalMs = s.recommendedIntervalMs
      ..lastKnownServerTotalSamples = s.lastKnownServerTotalSamples
      ..preMappingDistanceFilter = s.preMappingDistanceFilter
      ..preMappingHeartbeatInterval = s.preMappingHeartbeatInterval
      ..preMappingExtrasJson =
          s.preMappingExtras != null ? jsonEncode(s.preMappingExtras) : null
      ..configVersion = s.configVersion
      ..failureCode = s.failureCode != null ? _toModelFailureCode(s.failureCode!) : null
      ..failureMessage = s.failureMessage
      ..createdAt = s.createdAt
      ..updatedAt = s.updatedAt;
  }

  MappingSession _toEntity(MappingSessionModel m) {
    return MappingSession(
      localId: m.localId,
      footprintId: m.footprintId,
      mappingRequestId: m.mappingRequestId,
      visitLocalId: m.visitLocalId,
      outletId: m.outletId,
      outletCode: m.outletCode,
      outletName: m.outletName,
      ownerUserId: m.ownerUserId,
      localState: _toEntityState(m.localState),
      startedAt: m.startedAt,
      serverTimeAtStart: m.serverTimeAtStart,
      lastSampleAt: m.lastSampleAt,
      captureFinishedLocalAt: m.captureFinishedLocalAt,
      nextSequence: m.nextSequence,
      limits: MappingCaptureLimits(
        minSamples: m.minSamples,
        minDurationSeconds: m.minDurationSeconds,
        maxBatch: m.maxBatch,
        maxSamples: m.maxSamples,
      ),
      recommendedIntervalMs: m.recommendedIntervalMs,
      lastKnownServerTotalSamples: m.lastKnownServerTotalSamples,
      preMappingDistanceFilter: m.preMappingDistanceFilter,
      preMappingHeartbeatInterval: m.preMappingHeartbeatInterval,
      preMappingExtras: m.preMappingExtrasJson != null
          ? jsonDecode(m.preMappingExtrasJson!) as Map<String, dynamic>
          : null,
      configVersion: m.configVersion,
      failureCode: m.failureCode != null ? _toEntityFailureCode(m.failureCode!) : null,
      failureMessage: m.failureMessage,
      createdAt: m.createdAt,
      updatedAt: m.updatedAt,
    );
  }

  MappingLocalStateModel _toModelState(MappingLocalState s) =>
      MappingLocalStateModel.values.byName(s.name);
  MappingLocalState _toEntityState(MappingLocalStateModel s) =>
      MappingLocalState.values.byName(s.name);
  MappingFailureCodeModel _toModelFailureCode(MappingFailureCode c) =>
      MappingFailureCodeModel.values.byName(c.name);
  MappingFailureCode _toEntityFailureCode(MappingFailureCodeModel c) =>
      MappingFailureCode.values.byName(c.name);
}
