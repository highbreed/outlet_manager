import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:outlet_manager/core/network/failures.dart';
import 'package:outlet_manager/features/outlet_mapping/data/datasources/mapping_sample_local_datasource.dart';
import 'package:outlet_manager/features/outlet_mapping/data/datasources/mapping_session_local_datasource.dart';
import 'package:outlet_manager/features/outlet_mapping/data/models/mapping_response_models.dart';
import 'package:outlet_manager/features/outlet_mapping/domain/entities/mapping_capture_limits.dart';
import 'package:outlet_manager/features/outlet_mapping/domain/entities/mapping_enums.dart';
import 'package:outlet_manager/features/outlet_mapping/domain/entities/mapping_sample.dart';
import 'package:outlet_manager/features/outlet_mapping/domain/entities/mapping_session.dart';
import 'package:outlet_manager/features/outlet_mapping/domain/repositories/outlet_mapping_repository.dart';
import 'package:outlet_manager/features/outlet_mapping/services/mapping_uploader.dart';

import '_isar_test_util.dart';

class _MockRepository extends Mock implements OutletMappingRepository {}

MappingSample _sample({
  required String localId,
  required String clientSampleId,
  required int sequence,
  int footprintId = 1,
  DateTime? recordedAt,
}) {
  final now = DateTime.now();
  return MappingSample(
    localId: localId,
    footprintId: footprintId,
    clientSampleId: clientSampleId,
    sequence: sequence,
    latitude: -1.28,
    longitude: 36.81,
    accuracyM: 6.5,
    recordedAt: recordedAt ?? now,
    createdAt: now,
  );
}

MappingSession _session({
  required String localId,
  required String ownerUserId,
  int footprintId = 1,
}) {
  final now = DateTime.now();
  return MappingSession(
    localId: localId,
    footprintId: footprintId,
    mappingRequestId: 7,
    visitLocalId: 'visit-$localId',
    outletId: 'outlet-1',
    outletCode: 'CL0001',
    outletName: 'Test Outlet',
    ownerUserId: ownerUserId,
    localState: MappingLocalState.capturing,
    startedAt: now,
    limits: const MappingCaptureLimits.fallbackDefaults(),
    preMappingDistanceFilter: 50.0,
    preMappingHeartbeatInterval: 60.0,
    createdAt: now,
    updatedAt: now,
  );
}

void main() {
  // One Isar native-core init/dispose cycle for the whole file rather than
  // per test — see clearTestIsarData's doc comment in _isar_test_util.dart:
  // many per-test cycles in one process risks segfaulting the flutter
  // test shell subprocess during finalization.
  setUpAll(setUpTestIsar);
  tearDownAll(tearDownTestIsar);
  tearDown(clearTestIsarData);

  group('§7 Persist before upload', () {
    test('a saved sample reads back with the exact id/sequence/pending state, no network involved', () async {
      final ds = MappingSampleLocalDataSource();
      await ds.save(_sample(localId: 'a', clientSampleId: 'client-A', sequence: 5));

      final pending = await ds.getPendingForFootprint(1, limit: 10);

      expect(pending, hasLength(1));
      expect(pending.single.clientSampleId, 'client-A');
      expect(pending.single.sequence, 5);
      expect(pending.single.syncState, MappingSampleSyncState.pending);
    });
  });

  group('§8 UUID stability', () {
    test('clientSampleId is unchanged after a simulated failed-then-requeried cycle', () async {
      final ds = MappingSampleLocalDataSource();
      await ds.save(_sample(localId: 'a', clientSampleId: 'stable-id', sequence: 0));

      await ds.markBatchSyncing(['a']);
      await ds.markBatchFailed(['a'], 'network error');

      final requeried = await ds.getPendingForFootprint(1, limit: 10);
      expect(requeried.single.clientSampleId, 'stable-id',
          reason: 'client_sample_id must never change across a retry cycle');
      expect(requeried.single.syncState, MappingSampleSyncState.failed);
      expect(requeried.single.attemptCount, 1);
    });
  });

  group('§9 Sequence recovery', () {
    test('nextSequence derives from the highest PERSISTED sample, not a separate counter', () async {
      final ds = MappingSampleLocalDataSource();
      for (var i = 0; i <= 3; i++) {
        await ds.save(_sample(localId: 'sample-$i', clientSampleId: 'client-$i', sequence: i));
      }

      // Simulate losing all in-memory/cached session state — recovery has
      // nothing but the persisted rows to go on.
      final highest = await ds.getHighestSequence(1);
      final nextSequence = highest + 1;
      expect(nextSequence, 4);

      final newSample = _sample(localId: 'sample-4', clientSampleId: 'client-4', sequence: nextSequence);
      await ds.save(newSample);

      final all = await ds.getPendingForFootprint(1, limit: 10);
      expect(all.map((s) => s.sequence).toSet(), {0, 1, 2, 3, 4});
      expect(all.where((s) => s.sequence == 4).single.clientSampleId, 'client-4');
    });

    test('recovery never resets to zero for a footprint that already has samples', () async {
      final ds = MappingSampleLocalDataSource();
      await ds.save(_sample(localId: 'a', clientSampleId: 'client-a', sequence: 67));

      final nextSequence = await ds.getHighestSequence(1) + 1;

      expect(nextSequence, 68, reason: 'must not reset to 0 after a simulated process interruption');
    });
  });

  group('§10 Drain ordering', () {
    test('pending samples are returned oldest-first by recordedAt, regardless of insertion/sequence order', () async {
      final ds = MappingSampleLocalDataSource();
      final base = DateTime(2026, 9, 25, 10, 0, 0);
      // Deliberately inserted out of both sequence and time order.
      await ds.save(_sample(
          localId: 's4', clientSampleId: 'c4', sequence: 4, recordedAt: base.add(const Duration(seconds: 4))));
      await ds.save(_sample(
          localId: 's2', clientSampleId: 'c2', sequence: 2, recordedAt: base.add(const Duration(seconds: 2))));
      await ds.save(_sample(
          localId: 's3', clientSampleId: 'c3', sequence: 3, recordedAt: base.add(const Duration(seconds: 3))));
      await ds.save(_sample(
          localId: 's1', clientSampleId: 'c1', sequence: 1, recordedAt: base.add(const Duration(seconds: 1))));

      final drained = await ds.getPendingForFootprint(1, limit: 10);

      expect(drained.map((s) => s.clientSampleId).toList(), ['c1', 'c2', 'c3', 'c4'],
          reason: 'oldest mapping evidence (by recordedAt) must upload first');
    });
  });

  group('Trail view (getAllForFootprint)', () {
    test('returns every sample regardless of sync state, oldest-sequence-first', () async {
      final ds = MappingSampleLocalDataSource();
      await ds.save(_sample(localId: 's2', clientSampleId: 'c2', sequence: 2));
      await ds.save(_sample(localId: 's0', clientSampleId: 'c0', sequence: 0));
      await ds.save(_sample(localId: 's1', clientSampleId: 'c1', sequence: 1));
      await ds.markBatchSyncing(['s0']);
      await ds.markBatchSynced(['s0']);
      await ds.markBatchSyncing(['s1']);
      await ds.markBatchFailed(['s1'], 'network error');

      final all = await ds.getAllForFootprint(1);

      expect(all.map((s) => s.clientSampleId).toList(), ['c0', 'c1', 'c2'],
          reason: 'the trail must plot every captured point in walking order, not just pending/failed ones');
      expect(all.map((s) => s.syncState).toList(),
          [MappingSampleSyncState.synced, MappingSampleSyncState.failed, MappingSampleSyncState.pending]);
    });

    test('a different footprint never contributes points to this one', () async {
      final ds = MappingSampleLocalDataSource();
      await ds.save(_sample(localId: 'a', clientSampleId: 'a', sequence: 0, footprintId: 1));
      await ds.save(_sample(localId: 'b', clientSampleId: 'b', sequence: 0, footprintId: 2));

      final forFootprint1 = await ds.getAllForFootprint(1);

      expect(forFootprint1.map((s) => s.clientSampleId).toList(), ['a']);
    });
  });

  group('§11 Ownership isolation', () {
    test("querying User B's active session never returns User A's, and User A's work stays recoverable", () async {
      final sessionDs = MappingSessionLocalDataSource();
      await sessionDs.save(_session(localId: 'session-a', ownerUserId: 'user-A'));

      final forUserB = await sessionDs.getActiveForUser('user-B');
      expect(forUserB, isNull);

      final forUserA = await sessionDs.getActiveForUser('user-A');
      expect(forUserA, isNotNull);
      expect(forUserA!.localId, 'session-a');
    });

    test('two different users can each have their own active session simultaneously, fully isolated', () async {
      final sessionDs = MappingSessionLocalDataSource();
      await sessionDs.save(_session(localId: 'session-a', ownerUserId: 'user-A', footprintId: 1));
      await sessionDs.save(_session(localId: 'session-b', ownerUserId: 'user-B', footprintId: 2));

      final forUserA = await sessionDs.getActiveForUser('user-A');
      final forUserB = await sessionDs.getActiveForUser('user-B');

      expect(forUserA!.footprintId, 1);
      expect(forUserB!.footprintId, 2);
    });
  });

  group('§12/§13 Uploader against real persistence', () {
    late _MockRepository repository;
    late MappingUploader uploader;

    setUp(() {
      repository = _MockRepository();
      uploader = MappingUploader(
        repository: repository,
        localDataSource: MappingSampleLocalDataSource(),
      );
    });

    test('§12 a successful batch (with duplicates) marks ALL rows synced — duplicates are not retried', () async {
      final ds = MappingSampleLocalDataSource();
      for (var i = 0; i < 5; i++) {
        await ds.save(_sample(localId: 'r$i', clientSampleId: 'c$i', sequence: i));
      }

      when(() => repository.uploadSamples(footprintId: any(named: 'footprintId'), samples: any(named: 'samples')))
          .thenAnswer((_) async => Right(UploadSamplesResponse(
                received: 5,
                acceptedNew: 3,
                duplicates: 2,
                totalSamples: 100,
                serverTime: DateTime.now(),
              )));

      final result = await uploader.drain(1, maxBatch: 200);

      expect(result.queueEmpty, isTrue);
      expect(result.batchesSent, 1);
      final remaining = await ds.countPendingForFootprint(1);
      expect(remaining, 0, reason: 'duplicates count as successful idempotent delivery, not failures');
    });

    test('§13 a failed batch leaves rows retryable with unchanged client_sample_id and sequence', () async {
      final ds = MappingSampleLocalDataSource();
      await ds.save(_sample(localId: 'a', clientSampleId: 'stable-c', sequence: 9));

      when(() => repository.uploadSamples(footprintId: any(named: 'footprintId'), samples: any(named: 'samples')))
          .thenAnswer((_) async => const Left(NetworkFailure.connectionError()));

      final result = await uploader.drain(1, maxBatch: 200);

      expect(result.queueEmpty, isFalse);
      expect(result.batchesFailed, 1);
      final stillPending = await ds.getPendingForFootprint(1, limit: 10);
      expect(stillPending, hasLength(1));
      expect(stillPending.single.clientSampleId, 'stable-c');
      expect(stillPending.single.sequence, 9);
      expect(stillPending.single.syncState, MappingSampleSyncState.failed);
    });

    test('§13 a conflict-shaped failure (OutletMappingFailure) is surfaced as terminal, not silently dropped', () async {
      final ds = MappingSampleLocalDataSource();
      await ds.save(_sample(localId: 'a', clientSampleId: 'c', sequence: 0));

      when(() => repository.uploadSamples(footprintId: any(named: 'footprintId'), samples: any(named: 'samples')))
          .thenAnswer((_) async => const Left(OutletMappingFailure.conflict(code: 'CAPTURE_ABANDONED')));

      final result = await uploader.drain(1, maxBatch: 200);

      expect(result.terminalFailure, isA<OutletMappingFailure>());
    });
  });
}
