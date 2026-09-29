import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:outlet_manager/core/network/failures.dart';
import 'package:outlet_manager/features/outlet_mapping/data/datasources/outlet_mapping_remote_datasource.dart';
import 'package:outlet_manager/features/outlet_mapping/data/models/mapping_response_models.dart';
import 'package:outlet_manager/features/outlet_mapping/data/repositories/outlet_mapping_repository_impl.dart';
import 'package:outlet_manager/features/outlet_mapping/domain/entities/mapping_sample.dart';

class _MockRemoteDataSource extends Mock implements OutletMappingRemoteDataSource {}

/// §31 of the hardening pass: optional GPS fields (`altitude_m`,
/// `vertical_accuracy_m`, `floor_label`, `speed_mps`, `heading_deg`,
/// `provider`, `is_mock`) must be OMITTED from the wire payload when the
/// plugin didn't actually supply them — never fabricated as `0`/`false`/
/// `null`-valued-but-present keys. Covers `OutletMappingRepositoryImpl
/// .uploadSamples`'s wire-map construction directly, since that's the one
/// place this feature builds the `/samples` request body.
void main() {
  late _MockRemoteDataSource remote;
  late OutletMappingRepositoryImpl repository;

  setUpAll(() {
    registerFallbackValue(<Map<String, dynamic>>[]);
  });

  setUp(() {
    remote = _MockRemoteDataSource();
    repository = OutletMappingRepositoryImpl(remote);
  });

  UploadSamplesResponse buildResponse() => UploadSamplesResponse(
        received: 1,
        acceptedNew: 1,
        duplicates: 0,
        totalSamples: 1,
        serverTime: DateTime.now(),
      );

  MappingSample bareSample() {
    final now = DateTime.now();
    return MappingSample(
      localId: 'local-1',
      footprintId: 1,
      clientSampleId: 'client-1',
      sequence: 0,
      latitude: -1.28,
      longitude: 36.81,
      accuracyM: 6.5,
      recordedAt: now,
      createdAt: now,
      // altitudeM/verticalAccuracyM/floorLabel/speedMps/headingDeg/
      // provider/isMock all deliberately left unset (null).
    );
  }

  test('a sample with no optional GPS fields omits every optional key entirely', () async {
    when(() => remote.uploadSamples(footprintId: any(named: 'footprintId'), samples: any(named: 'samples')))
        .thenAnswer((_) async => buildResponse());

    await repository.uploadSamples(footprintId: 1, samples: [bareSample()]);

    final captured = verify(
      () => remote.uploadSamples(footprintId: 1, samples: captureAny(named: 'samples')),
    ).captured;
    final wireSamples = captured.single as List<Map<String, dynamic>>;
    final map = wireSamples.single;

    for (final key in [
      'altitude_m',
      'vertical_accuracy_m',
      'floor_label',
      'speed_mps',
      'heading_deg',
      'provider',
      'is_mock',
    ]) {
      expect(
        map.containsKey(key),
        isFalse,
        reason: '$key must be absent, not present-as-null/0/false, when the plugin never supplied it',
      );
    }

    // Required fields are still present with the exact backend names
    // (spec §25 — flat latitude/longitude, no nested coords object).
    expect(map['client_sample_id'], 'client-1');
    expect(map['latitude'], -1.28);
    expect(map['longitude'], 36.81);
    expect(map['accuracy_m'], 6.5);
    expect(map['sequence'], 0);
    expect(map.containsKey('recorded_at'), isTrue);
  });

  test('a sample with every optional GPS field populated sends all of them with real values', () async {
    when(() => remote.uploadSamples(footprintId: any(named: 'footprintId'), samples: any(named: 'samples')))
        .thenAnswer((_) async => buildResponse());

    final now = DateTime.now();
    final fullSample = MappingSample(
      localId: 'local-2',
      footprintId: 1,
      clientSampleId: 'client-2',
      sequence: 1,
      latitude: -1.28,
      longitude: 36.81,
      accuracyM: 6.5,
      recordedAt: now,
      createdAt: now,
      altitudeM: 1650.2,
      verticalAccuracyM: 4.0,
      floorLabel: '2',
      speedMps: 1.3,
      headingDeg: 88.0,
      provider: 'fused',
      isMock: false,
    );

    await repository.uploadSamples(footprintId: 1, samples: [fullSample]);

    final captured = verify(
      () => remote.uploadSamples(footprintId: 1, samples: captureAny(named: 'samples')),
    ).captured;
    final map = (captured.single as List<Map<String, dynamic>>).single;

    expect(map['altitude_m'], 1650.2);
    expect(map['vertical_accuracy_m'], 4.0);
    expect(map['floor_label'], '2');
    expect(map['speed_mps'], 1.3);
    expect(map['heading_deg'], 88.0);
    expect(map['provider'], 'fused');
    // isMock: false is a REAL, meaningfully-supplied value (the plugin
    // positively reported "not mocked") — distinct from never having been
    // populated at all, so it must still be sent, not treated as falsy-
    // therefore-omit.
    expect(map.containsKey('is_mock'), isTrue);
    expect(map['is_mock'], isFalse);
  });

  test('a repository-layer DioException is mapped to a Failure, never rethrown raw', () async {
    when(() => remote.uploadSamples(footprintId: any(named: 'footprintId'), samples: any(named: 'samples')))
        .thenThrow(
      DioException(requestOptions: RequestOptions(path: ''), type: DioExceptionType.connectionError),
    );

    final result = await repository.uploadSamples(footprintId: 1, samples: [bareSample()]);

    expect(result.isLeft(), isTrue);
    result.fold((failure) => expect(failure, isA<Failure>()), (_) => fail('expected a Left'));
  });
}
