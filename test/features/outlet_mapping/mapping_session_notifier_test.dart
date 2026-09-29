import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:outlet_manager/core/location/background_geolocation_service.dart';
import 'package:outlet_manager/core/network/failures.dart';
import 'package:outlet_manager/core/providers/location_providers.dart';
import 'package:outlet_manager/features/auth/data/auth_controller.dart';
import 'package:outlet_manager/features/auth/data/auth_state.dart';
import 'package:outlet_manager/features/auth/domain/user.dart';
import 'package:outlet_manager/features/daily_route/domain/entities/outlet_visit.dart';
import 'package:outlet_manager/features/outlet_mapping/data/datasources/mapping_sample_local_datasource.dart';
import 'package:outlet_manager/features/outlet_mapping/data/datasources/mapping_session_local_datasource.dart';
import 'package:outlet_manager/features/outlet_mapping/data/models/mapping_response_models.dart';
import 'package:outlet_manager/features/outlet_mapping/domain/config/mapping_config.dart';
import 'package:outlet_manager/features/outlet_mapping/domain/entities/mapping_capture_limits.dart';
import 'package:outlet_manager/features/outlet_mapping/domain/entities/mapping_enums.dart';
import 'package:outlet_manager/features/outlet_mapping/domain/entities/mapping_sample.dart';
import 'package:outlet_manager/features/outlet_mapping/domain/entities/mapping_session.dart';
import 'package:outlet_manager/features/outlet_mapping/domain/repositories/outlet_mapping_repository.dart';
import 'package:outlet_manager/features/outlet_mapping/providers/mapping_session_notifier.dart';
import 'package:outlet_manager/features/outlet_mapping/providers/outlet_mapping_service_providers.dart';

import '_isar_test_util.dart';

/// State-machine tests for `MappingSessionNotifier` (hardening-pass
/// sections 14-22). Per the hardening request's own instruction, the
/// native Transistorsoft plugin's static platform API is never exercised
/// directly — `BackgroundGeolocationService` is mocked at that one
/// boundary. Everything else (Isar persistence, `MappingUploader`,
/// `MappingRecoveryCoordinator`) runs for REAL against the same temp-Isar
/// harness `mapping_persistence_test.dart` already validated, wired
/// through a real `ProviderContainer` — only the network boundary
/// (`OutletMappingRepository`) and the plugin boundary
/// (`BackgroundGeolocationService`) are mocked, per "abstract/mock only
/// the smallest boundary necessary."
class _MockRepository extends Mock implements OutletMappingRepository {}

class _MockLocationService extends Mock implements BackgroundGeolocationService {}

class _FakeAuthController extends AuthController {
  _FakeAuthController(this._state);
  final AuthState _state;
  @override
  AuthState build() => _state;
}

final _testUser = User(
  id: 501,
  email: 'agent@example.com',
  fullName: 'Test Agent',
  isActive: true,
  isVerified: true,
  createdAt: DateTime(2026, 1, 1),
  updatedAt: DateTime(2026, 1, 1),
);
const _testUserId = '501';

OutletVisit _visit({String? serverId = '4821'}) => OutletVisit(
      localId: 'visit-local-1',
      serverId: serverId,
      dailyRouteLocalId: 'route-local-1',
      outletId: 'outlet-1',
      outletCode: 'CL000001',
      outletName: 'Test Outlet',
      outletLatitude: -1.2921,
      outletLongitude: 36.8219,
      visitOrder: 1,
      allocatedMinutes: 30,
      visitType: VisitType.scheduled,
      status: VisitStatus.inProgress,
    );

MappingSession _seedSession({
  required int footprintId,
  required MappingLocalState localState,
  int? lastKnownServerTotalSamples,
}) {
  final now = DateTime.now();
  return MappingSession(
    localId: 'session-$footprintId',
    footprintId: footprintId,
    mappingRequestId: 9,
    visitLocalId: 'visit-local-1',
    outletId: 'outlet-1',
    outletCode: 'CL000001',
    outletName: 'Test Outlet',
    ownerUserId: _testUserId,
    localState: localState,
    startedAt: now,
    limits: const MappingCaptureLimits(
      minSamples: 20,
      minDurationSeconds: 90,
      maxBatch: 100,
      maxSamples: 2000,
    ),
    lastKnownServerTotalSamples: lastKnownServerTotalSamples,
    preMappingDistanceFilter: 50.0,
    preMappingHeartbeatInterval: 60.0,
    createdAt: now,
    updatedAt: now,
  );
}

MappingSample _pendingSample({required int footprintId, int sequence = 0}) {
  final now = DateTime.now();
  return MappingSample(
    localId: 'sample-$footprintId-$sequence',
    footprintId: footprintId,
    clientSampleId: 'client-$footprintId-$sequence',
    sequence: sequence,
    latitude: -1.28,
    longitude: 36.81,
    accuracyM: 6.5,
    recordedAt: now,
    createdAt: now,
  );
}

StartCaptureResponse _startResponse({int footprintId = 55, int maxSamples = 2000, bool resumed = false}) {
  final now = DateTime.now();
  return StartCaptureResponse(
    footprintId: footprintId,
    status: MappingFootprintStatus.capturing,
    captureStartedAt: now,
    resumed: resumed,
    serverTime: now,
    limits: MappingCaptureLimits(
      minSamples: 20,
      minDurationSeconds: 90,
      maxBatch: 100,
      maxSamples: maxSamples,
    ),
  );
}

void _stubLocationService(_MockLocationService loc, {bool isMappingActive = false}) {
  when(() => loc.mappingSampleCapturedEvents).thenAnswer((_) => const Stream.empty());
  when(
    () => loc.startMappingCapture(
      footprintId: any(named: 'footprintId'),
      startSequence: any(named: 'startSequence'),
      currentSampleCount: any(named: 'currentSampleCount'),
      maxSamples: any(named: 'maxSamples'),
      minSampleIntervalMs: any(named: 'minSampleIntervalMs'),
      mappingDistanceFilterMeters: any(named: 'mappingDistanceFilterMeters'),
      duplicateSuppressionMeters: any(named: 'duplicateSuppressionMeters'),
    ),
  ).thenAnswer((_) async {});
  when(() => loc.stopMappingCapture()).thenAnswer((_) async {});
  when(() => loc.isMappingActive).thenReturn(isMappingActive);
}

void main() {
  // One Isar native-core init/dispose cycle for the whole file rather than
  // per test — see clearTestIsarData's doc comment: many per-test cycles
  // in one process reliably segfaults the flutter test shell subprocess
  // during finalization, always after every test has already passed.
  setUpAll(setUpTestIsar);
  tearDownAll(tearDownTestIsar);
  tearDown(clearTestIsarData);

  late _MockRepository repo;
  late _MockLocationService loc;

  ProviderContainer buildContainer({
    AuthState? authState,
    MappingConfig? config,
  }) {
    final container = ProviderContainer(
      overrides: [
        outletMappingRepositoryProvider.overrideWithValue(repo),
        backgroundGeolocationServiceProvider.overrideWithValue(loc),
        authControllerProvider.overrideWith(
          () => _FakeAuthController(authState ?? AuthState.authenticated(user: _testUser)),
        ),
        if (config != null) mappingConfigProvider.overrideWithValue(config),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUp(() {
    repo = _MockRepository();
    loc = _MockLocationService();
    _stubLocationService(loc);
  });

  group('§14 Start', () {
    test('success creates a capturing session and enters mapping mode', () async {
      when(
        () => repo.startCapture(
          requestId: any(named: 'requestId'),
          visitId: any(named: 'visitId'),
        ),
      ).thenAnswer((_) async => Right(_startResponse()));

      final container = buildContainer();
      final notifier = container.read(mappingSessionNotifierProvider.notifier);

      final result = await notifier.startMapping(requestId: 9, visit: _visit());

      expect(result, isTrue);
      final state = container.read(mappingSessionNotifierProvider);
      expect(state.session, isNotNull);
      expect(state.session!.localState, MappingLocalState.capturing);
      expect(state.session!.footprintId, 55);
      expect(state.session!.ownerUserId, _testUserId);
      expect(state.errorMessage, isNull);
      verify(() => repo.startCapture(requestId: 9, visitId: 4821)).called(1);
      verify(
        () => loc.startMappingCapture(
          footprintId: 55,
          startSequence: any(named: 'startSequence'),
          currentSampleCount: any(named: 'currentSampleCount'),
          maxSamples: 2000,
          minSampleIntervalMs: any(named: 'minSampleIntervalMs'),
          mappingDistanceFilterMeters: any(named: 'mappingDistanceFilterMeters'),
          duplicateSuppressionMeters: any(named: 'duplicateSuppressionMeters'),
        ),
      ).called(1);
    });

    test(
      'resumed=true reconciles nextSequence/sampleCount/startedAt against the backend '
      '(e.g. after an uninstall wiped local Isar state)',
      () async {
        final backendStartedAt = DateTime.now().subtract(const Duration(minutes: 40));
        when(
          () => repo.startCapture(
            requestId: any(named: 'requestId'),
            visitId: any(named: 'visitId'),
          ),
        ).thenAnswer((_) async => Right(_startResponse(resumed: true)));
        when(() => repo.getCaptureStatus(55)).thenAnswer(
          (_) async => Right(
            CaptureStatusResponse(
              footprintId: 55,
              mappingRequestId: 9,
              mappingRequestStatus: MappingRequestStatus.open,
              status: MappingFootprintStatus.capturing,
              samplesReceived: 150,
              captureStartedAt: backendStartedAt,
              serverTime: DateTime.now(),
            ),
          ),
        );

        final container = buildContainer();
        final notifier = container.read(mappingSessionNotifierProvider.notifier);

        final result = await notifier.startMapping(requestId: 9, visit: _visit());

        expect(result, isTrue);
        final state = container.read(mappingSessionNotifierProvider);
        // No local rows exist (nothing was seeded) — reconciliation must
        // come entirely from the backend's capture-status figure.
        expect(state.localSampleCount, 150);
        expect(state.session!.nextSequence, 150);
        expect(state.session!.startedAt, backendStartedAt,
            reason: 'elapsed time must reflect the real total capture duration, not reset to 0:00');
        expect(state.session!.lastKnownServerTotalSamples, 150);
        verify(
          () => loc.startMappingCapture(
            footprintId: 55,
            startSequence: 150,
            currentSampleCount: 150,
            maxSamples: any(named: 'maxSamples'),
            minSampleIntervalMs: any(named: 'minSampleIntervalMs'),
            mappingDistanceFilterMeters: any(named: 'mappingDistanceFilterMeters'),
            duplicateSuppressionMeters: any(named: 'duplicateSuppressionMeters'),
          ),
        ).called(1);
      },
    );

    test('resumed=true but capture-status reconciliation fails — mapping still starts, local-only numbers', () async {
      when(
        () => repo.startCapture(
          requestId: any(named: 'requestId'),
          visitId: any(named: 'visitId'),
        ),
      ).thenAnswer((_) async => Right(_startResponse(resumed: true)));
      when(() => repo.getCaptureStatus(55))
          .thenAnswer((_) async => const Left(NetworkFailure.timeout()));

      final container = buildContainer();
      final notifier = container.read(mappingSessionNotifierProvider.notifier);

      final result = await notifier.startMapping(requestId: 9, visit: _visit());

      expect(result, isTrue, reason: 'a reconciliation failure must not block starting the capture');
      final state = container.read(mappingSessionNotifierProvider);
      expect(state.localSampleCount, 0);
      expect(state.session!.nextSequence, 0);
      expect(state.session!.lastKnownServerTotalSamples, isNull);
    });

    test('an unsynced visit (no parseable serverId) is refused before any network call', () async {
      final container = buildContainer();
      final notifier = container.read(mappingSessionNotifierProvider.notifier);

      final result = await notifier.startMapping(requestId: 9, visit: _visit(serverId: null));

      expect(result, isFalse);
      final state = container.read(mappingSessionNotifierProvider);
      expect(state.session, isNull);
      expect(state.errorMessage, contains('has not finished syncing'));
      verifyNever(
        () => repo.startCapture(
          requestId: any(named: 'requestId'),
          visitId: any(named: 'visitId'),
        ),
      );
    });
  });

  group('§15 Start Failure', () {
    test('a repository failure surfaces errorMessage, creates no session, never enters GPS mode', () async {
      when(
        () => repo.startCapture(
          requestId: any(named: 'requestId'),
          visitId: any(named: 'visitId'),
        ),
      ).thenAnswer((_) async => const Left(NetworkFailure.timeout()));

      final container = buildContainer();
      final notifier = container.read(mappingSessionNotifierProvider.notifier);

      final result = await notifier.startMapping(requestId: 9, visit: _visit());

      expect(result, isFalse);
      final state = container.read(mappingSessionNotifierProvider);
      expect(state.session, isNull);
      expect(state.errorMessage, isNotNull);
      verifyNever(
        () => loc.startMappingCapture(
          footprintId: any(named: 'footprintId'),
          startSequence: any(named: 'startSequence'),
          currentSampleCount: any(named: 'currentSampleCount'),
          maxSamples: any(named: 'maxSamples'),
          minSampleIntervalMs: any(named: 'minSampleIntervalMs'),
          mappingDistanceFilterMeters: any(named: 'mappingDistanceFilterMeters'),
          duplicateSuppressionMeters: any(named: 'duplicateSuppressionMeters'),
        ),
      );
    });
  });

  group('§16 Local Finish — empty queue', () {
    test('finishing with nothing pending drains instantly and submits /finish', () async {
      when(
        () => repo.startCapture(
          requestId: any(named: 'requestId'),
          visitId: any(named: 'visitId'),
        ),
      ).thenAnswer((_) async => Right(_startResponse()));
      when(() => repo.finishCapture(any())).thenAnswer(
        (_) async => Right(
          FinishCaptureResponse(
            footprintId: 55,
            status: MappingFootprintStatus.pendingReview,
            summary: const MappingCaptureSummary(
              samplesReceived: 30,
              samplesAccepted: 30,
              durationSeconds: 400,
            ),
          ),
        ),
      );

      final container = buildContainer();
      final notifier = container.read(mappingSessionNotifierProvider.notifier);
      await notifier.startMapping(requestId: 9, visit: _visit());

      await notifier.finishMapping();

      final state = container.read(mappingSessionNotifierProvider);
      expect(state.session!.localState, MappingLocalState.pendingReview);
      expect(state.finishSummary, isNotNull);
      verify(() => loc.stopMappingCapture()).called(1);
      verify(() => repo.finishCapture(55)).called(1);
    });
  });

  group('§17 Local Finish — pending queue', () {
    test('a batch that fails to upload leaves the session in uploadPending, /finish never called', () async {
      final sampleDs = MappingSampleLocalDataSource();
      await sampleDs.save(_pendingSample(footprintId: 55));

      final sessionDs = MappingSessionLocalDataSource();
      final session = _seedSession(footprintId: 55, localState: MappingLocalState.captureFinishedLocal);
      await sessionDs.save(session);

      when(() => repo.uploadSamples(footprintId: any(named: 'footprintId'), samples: any(named: 'samples')))
          .thenAnswer((_) async => const Left(NetworkFailure.timeout()));

      final container = buildContainer();
      final notifier = container.read(mappingSessionNotifierProvider.notifier);
      // Recover into this seeded session rather than starting fresh, so
      // the notifier's in-memory state points at the row just seeded.
      when(() => repo.getCaptureStatus(55)).thenAnswer(
        (_) async => Right(
          CaptureStatusResponse(
            footprintId: 55,
            mappingRequestId: 9,
            mappingRequestStatus: MappingRequestStatus.open,
            status: MappingFootprintStatus.capturing,
            samplesReceived: 0,
            captureStartedAt: DateTime.now(),
            serverTime: DateTime.now(),
          ),
        ),
      );
      await notifier.recoverForCurrentUser();
      // recovery for a non-walking local state auto-drains in the
      // background (spec §56) — give it a moment to run.
      await Future<void>.delayed(const Duration(milliseconds: 200));

      final state = container.read(mappingSessionNotifierProvider);
      expect(state.session!.localState, MappingLocalState.uploadPending);
      verifyNever(() => repo.finishCapture(any()));
    });
  });

  group('§18 Finish Timeout', () {
    test('a drain that never returns falls back to uploadPending once the configured timeout elapses', () async {
      final sampleDs = MappingSampleLocalDataSource();
      await sampleDs.save(_pendingSample(footprintId: 55));

      when(
        () => repo.startCapture(
          requestId: any(named: 'requestId'),
          visitId: any(named: 'visitId'),
        ),
      ).thenAnswer((_) async => Right(_startResponse()));

      // Never completes — proves the notifier's own .timeout() wrapper is
      // what ends the wait, not the uploader resolving.
      when(() => repo.uploadSamples(footprintId: any(named: 'footprintId'), samples: any(named: 'samples')))
          .thenAnswer((_) => Completer<Either<Failure, UploadSamplesResponse>>().future);

      final container = buildContainer(
        config: const MappingConfig(finishDrainTimeout: Duration(milliseconds: 100)),
      );
      final notifier = container.read(mappingSessionNotifierProvider.notifier);
      await notifier.startMapping(requestId: 9, visit: _visit());

      await notifier.finishMapping();

      final state = container.read(mappingSessionNotifierProvider);
      expect(state.session!.localState, MappingLocalState.uploadPending);
      verifyNever(() => repo.finishCapture(any()));
    });
  });

  group('§19 Abandon', () {
    test('stopMapping restores GPS, discards unsent samples, marks abandoned', () async {
      when(
        () => repo.startCapture(
          requestId: any(named: 'requestId'),
          visitId: any(named: 'visitId'),
        ),
      ).thenAnswer((_) async => Right(_startResponse()));
      when(() => repo.abandonCapture(any())).thenAnswer(
        (_) async => Right(
          AbandonCaptureResponse(
            footprintId: 55,
            status: MappingFootprintStatus.abandoned,
            mappingRequestStatus: MappingRequestStatus.open,
            serverTime: DateTime.now(),
          ),
        ),
      );

      final container = buildContainer();
      final notifier = container.read(mappingSessionNotifierProvider.notifier);
      await notifier.startMapping(requestId: 9, visit: _visit());

      final sampleDs = MappingSampleLocalDataSource();
      await sampleDs.save(_pendingSample(footprintId: 55));
      expect(await sampleDs.countPendingForFootprint(55), 1);

      await notifier.stopMapping();

      final state = container.read(mappingSessionNotifierProvider);
      expect(state.session!.localState, MappingLocalState.abandoned);
      expect(state.errorMessage, isNull);
      verify(() => loc.stopMappingCapture()).called(1);
      verify(() => repo.abandonCapture(55)).called(1);
      expect(await sampleDs.countPendingForFootprint(55), 0);
    });

    test('a failed abandonCapture call still discards unsent samples and marks abandoned locally', () async {
      when(
        () => repo.startCapture(
          requestId: any(named: 'requestId'),
          visitId: any(named: 'visitId'),
        ),
      ).thenAnswer((_) async => Right(_startResponse()));
      when(() => repo.abandonCapture(any())).thenAnswer((_) async => const Left(NetworkFailure.offline()));

      final container = buildContainer();
      final notifier = container.read(mappingSessionNotifierProvider.notifier);
      await notifier.startMapping(requestId: 9, visit: _visit());

      await notifier.stopMapping();

      final state = container.read(mappingSessionNotifierProvider);
      expect(state.session!.localState, MappingLocalState.abandoned);
      expect(state.errorMessage, isNotNull);
    });
  });

  group('§20 Recovery while still capturing', () {
    test('a still-walking session prompts explicit resume, never auto-resumes upload', () async {
      final sessionDs = MappingSessionLocalDataSource();
      await sessionDs.save(_seedSession(footprintId: 55, localState: MappingLocalState.capturing));

      when(() => repo.getCaptureStatus(55)).thenAnswer(
        (_) async => Right(
          CaptureStatusResponse(
            footprintId: 55,
            mappingRequestId: 9,
            mappingRequestStatus: MappingRequestStatus.open,
            status: MappingFootprintStatus.capturing,
            samplesReceived: 0,
            captureStartedAt: DateTime.now(),
            serverTime: DateTime.now(),
          ),
        ),
      );

      final container = buildContainer();
      final notifier = container.read(mappingSessionNotifierProvider.notifier);
      await notifier.recoverForCurrentUser();

      final state = container.read(mappingSessionNotifierProvider);
      expect(state.showResumePrompt, isTrue);
      expect(state.session!.localState, MappingLocalState.capturing);
      // No /finish or /samples call — never auto-drains while still
      // presented as "walking" (spec §55/§56).
      verifyNever(() => repo.finishCapture(any()));
      verifyNever(
        () => repo.uploadSamples(footprintId: any(named: 'footprintId'), samples: any(named: 'samples')),
      );
    });

    test('localSampleCount/pendingUploadCount are seeded from what is actually persisted, not left at 0', () async {
      final sessionDs = MappingSessionLocalDataSource();
      await sessionDs.save(_seedSession(footprintId: 55, localState: MappingLocalState.capturing));

      final sampleDs = MappingSampleLocalDataSource();
      await sampleDs.save(_pendingSample(footprintId: 55, sequence: 0));
      await sampleDs.save(_pendingSample(footprintId: 55, sequence: 1));
      await sampleDs.save(_pendingSample(footprintId: 55, sequence: 2));
      await sampleDs.markBatchSyncing(['sample-55-0']);
      await sampleDs.markBatchSynced(['sample-55-0']);

      when(() => repo.getCaptureStatus(55)).thenAnswer(
        (_) async => Right(
          CaptureStatusResponse(
            footprintId: 55,
            mappingRequestId: 9,
            mappingRequestStatus: MappingRequestStatus.open,
            status: MappingFootprintStatus.capturing,
            samplesReceived: 0,
            captureStartedAt: DateTime.now(),
            serverTime: DateTime.now(),
          ),
        ),
      );

      final container = buildContainer();
      final notifier = container.read(mappingSessionNotifierProvider.notifier);
      await notifier.recoverForCurrentUser();
      // _seedCountsAfterRecovery runs unawaited — give it a moment.
      await Future<void>.delayed(const Duration(milliseconds: 200));

      final state = container.read(mappingSessionNotifierProvider);
      expect(state.localSampleCount, 3, reason: 'all 3 rows exist locally regardless of sync state');
      expect(state.pendingUploadCount, 2, reason: 'only the 2 not-yet-synced rows are pending upload');
    });
  });

  group('§21 Recovery after walking already finished', () {
    test('a captureFinishedLocal session auto-resumes the drain toward /finish, no prompt', () async {
      final sessionDs = MappingSessionLocalDataSource();
      await sessionDs.save(
        _seedSession(footprintId: 55, localState: MappingLocalState.captureFinishedLocal),
      );

      when(() => repo.getCaptureStatus(55)).thenAnswer(
        (_) async => Right(
          CaptureStatusResponse(
            footprintId: 55,
            mappingRequestId: 9,
            mappingRequestStatus: MappingRequestStatus.open,
            status: MappingFootprintStatus.capturing,
            samplesReceived: 0,
            captureStartedAt: DateTime.now(),
            serverTime: DateTime.now(),
          ),
        ),
      );
      when(() => repo.finishCapture(55)).thenAnswer(
        (_) async => Right(
          FinishCaptureResponse(footprintId: 55, status: MappingFootprintStatus.pendingReview),
        ),
      );

      final container = buildContainer();
      final notifier = container.read(mappingSessionNotifierProvider.notifier);
      await notifier.recoverForCurrentUser();
      await Future<void>.delayed(const Duration(milliseconds: 200));

      final state = container.read(mappingSessionNotifierProvider);
      expect(state.showResumePrompt, isFalse);
      expect(state.session!.localState, MappingLocalState.pendingReview);
      verify(() => repo.finishCapture(55)).called(1);
    });
  });

  group('§22 Recovery finds a server-terminal footprint', () {
    test('a server-side pendingReview result resolves locally without any employee action', () async {
      final sessionDs = MappingSessionLocalDataSource();
      await sessionDs.save(_seedSession(footprintId: 55, localState: MappingLocalState.capturing));

      when(() => repo.getCaptureStatus(55)).thenAnswer(
        (_) async => Right(
          CaptureStatusResponse(
            footprintId: 55,
            mappingRequestId: 9,
            mappingRequestStatus: MappingRequestStatus.fulfilled,
            status: MappingFootprintStatus.pendingReview,
            samplesReceived: 40,
            captureStartedAt: DateTime.now(),
            serverTime: DateTime.now(),
            summary: const MappingCaptureSummary(
              samplesReceived: 40,
              samplesAccepted: 38,
              durationSeconds: 500,
            ),
          ),
        ),
      );

      final container = buildContainer();
      final notifier = container.read(mappingSessionNotifierProvider.notifier);
      await notifier.recoverForCurrentUser();
      // MappingRecoveryTerminal's cleanup (_persistAndMaybeCleanup) runs
      // unawaited in the notifier by design — give it a moment to settle
      // before the container disposes at teardown, same as the §21 test.
      await Future<void>.delayed(const Duration(milliseconds: 200));

      final state = container.read(mappingSessionNotifierProvider);
      expect(state.showResumePrompt, isFalse);
      expect(state.session!.localState, MappingLocalState.pendingReview);
      verify(() => loc.stopMappingCapture()).called(1);
    });
  });
}
