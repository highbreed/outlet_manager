import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:outlet_manager/core/location/background_geolocation_service.dart';
import 'package:outlet_manager/core/network/failures.dart';
import 'package:outlet_manager/features/outlet_mapping/data/datasources/mapping_sample_local_datasource.dart';
import 'package:outlet_manager/features/outlet_mapping/data/datasources/mapping_session_local_datasource.dart';
import 'package:outlet_manager/features/outlet_mapping/data/models/mapping_response_models.dart';
import 'package:outlet_manager/features/outlet_mapping/domain/entities/mapping_capture_limits.dart';
import 'package:outlet_manager/features/outlet_mapping/domain/entities/mapping_enums.dart';
import 'package:outlet_manager/features/outlet_mapping/domain/entities/mapping_session.dart';
import 'package:outlet_manager/features/outlet_mapping/domain/repositories/outlet_mapping_repository.dart';
import 'package:outlet_manager/features/outlet_mapping/services/mapping_recovery_coordinator.dart';

class _MockSessionDs extends Mock implements MappingSessionLocalDataSource {}

class _MockSampleDs extends Mock implements MappingSampleLocalDataSource {}

class _MockRepository extends Mock implements OutletMappingRepository {}

class _MockLocationService extends Mock implements BackgroundGeolocationService {}

MappingSession _session({
  MappingLocalState state = MappingLocalState.capturing,
  String ownerUserId = 'user-1',
}) {
  final now = DateTime.now();
  return MappingSession(
    localId: 'local-1',
    footprintId: 12,
    mappingRequestId: 7,
    visitLocalId: 'visit-1',
    outletId: 'outlet-1',
    outletCode: 'CL0001',
    outletName: 'Test Outlet',
    ownerUserId: ownerUserId,
    localState: state,
    startedAt: now,
    limits: const MappingCaptureLimits.fallbackDefaults(),
    preMappingDistanceFilter: 50.0,
    preMappingHeartbeatInterval: 60.0,
    createdAt: now,
    updatedAt: now,
  );
}

CaptureStatusResponse _status(MappingFootprintStatus status) {
  final now = DateTime.now();
  return CaptureStatusResponse(
    footprintId: 12,
    mappingRequestId: 7,
    mappingRequestStatus: MappingRequestStatus.open,
    status: status,
    samplesReceived: 5,
    captureStartedAt: now,
    serverTime: now,
  );
}

void main() {
  late _MockSessionDs sessionDs;
  late _MockSampleDs sampleDs;
  late _MockRepository repository;
  late _MockLocationService locationService;
  late MappingRecoveryCoordinator coordinator;

  setUp(() {
    sessionDs = _MockSessionDs();
    sampleDs = _MockSampleDs();
    repository = _MockRepository();
    locationService = _MockLocationService();
    coordinator = MappingRecoveryCoordinator(
      sessionLocalDataSource: sessionDs,
      sampleLocalDataSource: sampleDs,
      repository: repository,
      locationService: locationService,
    );
    when(() => locationService.isMappingActive).thenReturn(false);
    when(() => locationService.stopMappingCapture()).thenAnswer((_) async {});
    when(() => sampleDs.deleteUnsentForFootprint(any())).thenAnswer((_) async {});
  });

  test('no active session -> MappingRecoveryNone, still ensures normal config', () async {
    when(() => sessionDs.getActiveForUser('user-1')).thenAnswer((_) async => null);

    final result = await coordinator.recover('user-1');

    expect(result, isA<MappingRecoveryNone>());
    verifyNever(() => locationService.stopMappingCapture()); // isMappingActive was false
  });

  test('backend still CAPTURING + local state was capturing -> resumable, explicit resume required (spec §56)', () async {
    final session = _session(state: MappingLocalState.capturing);
    when(() => sessionDs.getActiveForUser('user-1')).thenAnswer((_) async => session);
    when(() => repository.getCaptureStatus(12))
        .thenAnswer((_) async => Right(_status(MappingFootprintStatus.capturing)));

    final result = await coordinator.recover('user-1');

    expect(result, isA<MappingRecoveryResumable>());
    final resumable = result as MappingRecoveryResumable;
    expect(resumable.promptExplicitResume, isTrue,
        reason: 'must never silently re-enable high-frequency collection (spec §56)');
  });

  test('backend still CAPTURING + local state already uploadPending -> resumable WITHOUT prompting (spec §55)', () async {
    final session = _session(state: MappingLocalState.uploadPending);
    when(() => sessionDs.getActiveForUser('user-1')).thenAnswer((_) async => session);
    when(() => repository.getCaptureStatus(12))
        .thenAnswer((_) async => Right(_status(MappingFootprintStatus.capturing)));

    final result = await coordinator.recover('user-1');

    final resumable = result as MappingRecoveryResumable;
    expect(resumable.promptExplicitResume, isFalse,
        reason: 'employee already finished walking — resume draining toward /finish automatically');
  });

  test('backend PENDING_REVIEW -> terminal, GPS engine restored', () async {
    final session = _session(state: MappingLocalState.submitting);
    when(() => sessionDs.getActiveForUser('user-1')).thenAnswer((_) async => session);
    when(() => repository.getCaptureStatus(12))
        .thenAnswer((_) async => Right(_status(MappingFootprintStatus.pendingReview)));
    when(() => locationService.isMappingActive).thenReturn(true);

    final result = await coordinator.recover('user-1');

    expect(result, isA<MappingRecoveryTerminal>());
    expect((result as MappingRecoveryTerminal).resolvedState, MappingLocalState.pendingReview);
    verify(() => locationService.stopMappingCapture()).called(1);
  });

  test('backend ABANDONED -> terminal abandoned, unsent samples discarded, synced kept', () async {
    final session = _session();
    when(() => sessionDs.getActiveForUser('user-1')).thenAnswer((_) async => session);
    when(() => repository.getCaptureStatus(12))
        .thenAnswer((_) async => Right(_status(MappingFootprintStatus.abandoned)));

    final result = await coordinator.recover('user-1');

    expect((result as MappingRecoveryTerminal).resolvedState, MappingLocalState.abandoned);
    verify(() => sampleDs.deleteUnsentForFootprint(12)).called(1);
  });

  test('capture-status call fails (e.g. 404/403) -> error result, never guessed as still open', () async {
    final session = _session();
    when(() => sessionDs.getActiveForUser('user-1')).thenAnswer((_) async => session);
    when(() => repository.getCaptureStatus(12))
        .thenAnswer((_) async => const Left(OutletMappingFailure.notFound()));

    final result = await coordinator.recover('user-1');

    expect(result, isA<MappingRecoveryError>());
  });
}
