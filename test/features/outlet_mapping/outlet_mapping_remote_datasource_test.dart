import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:outlet_manager/features/outlet_mapping/data/datasources/outlet_mapping_remote_datasource.dart';

class _MockDio extends Mock implements Dio {}

class _FakeRequestOptions extends Fake implements RequestOptions {}

void main() {
  setUpAll(() {
    registerFallbackValue(_FakeRequestOptions());
  });

  group('OutletMappingRemoteDataSourceImpl.startCapture — exact wire payload', () {
    late _MockDio dio;
    late OutletMappingRemoteDataSourceImpl datasource;

    setUp(() {
      dio = _MockDio();
      datasource = OutletMappingRemoteDataSourceImpl(dio);
    });

    test('visit_id is sent as a JSON integer, not a string (spec contract §A)', () async {
      when(() => dio.post(any(), data: any(named: 'data'))).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
          data: {
            'footprint_id': 12,
            'status': 'CAPTURING',
            'capture_started_at': '2026-09-25T10:02:11+03:00',
            'server_time': '2026-09-25T10:02:11+03:00',
          },
        ),
      );

      await datasource.startCapture(requestId: 7, visitId: 4821);

      final captured = verify(
        () => dio.post(any(), data: captureAny(named: 'data')),
      ).captured;
      final body = captured.single as Map<String, dynamic>;

      expect(body.containsKey('visit_id'), isTrue);
      expect(body['visit_id'], isA<int>(),
          reason: 'backend request-body visit_id fields are integers in this backend '
              'family — see daily_route_repository_impl.dart\'s closeRoute() precedent');
      expect(body['visit_id'], 4821);
      expect(body['visit_id'], isNot(isA<String>()));
    });

    test('POSTs to the correct request-scoped captures endpoint', () async {
      when(() => dio.post(any(), data: any(named: 'data'))).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
          data: {
            'footprint_id': 12,
            'status': 'CAPTURING',
            'capture_started_at': '2026-09-25T10:02:11+03:00',
            'server_time': '2026-09-25T10:02:11+03:00',
          },
        ),
      );

      await datasource.startCapture(requestId: 7, visitId: 4821);

      final path = verify(() => dio.post(captureAny(), data: any(named: 'data'))).captured.single as String;
      expect(path, '/outlet-mapping/requests/7/captures');
    });
  });
}
