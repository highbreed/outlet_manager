import 'package:flutter_test/flutter_test.dart';
import 'package:outlet_manager/features/outlet_mapping/data/models/mapping_response_models.dart';

void main() {
  group('parseBackendTimestamp (spec §13)', () {
    test('offset-less timestamp is interpreted as Africa/Nairobi (UTC+3)', () {
      final parsed = parseBackendTimestamp('2026-09-25T10:02:11.482000');
      // 10:02:11 at UTC+3 == 07:02:11 UTC.
      expect(parsed.isUtc, isTrue);
      expect(parsed.hour, 7);
      expect(parsed.minute, 2);
    });

    test('timestamp with an explicit offset parses normally, not as Nairobi', () {
      final parsed = parseBackendTimestamp('2026-09-25T10:02:11.497000+03:00');
      expect(parsed.hour, 7); // same instant as above, offset already applied
    });

    test('Z-suffixed UTC timestamp parses normally', () {
      final parsed = parseBackendTimestamp('2026-09-25T07:02:11.000Z');
      expect(parsed.hour, 7);
    });

    test('two representations of the same instant are equal', () {
      final withOffset = parseBackendTimestamp('2026-09-25T10:02:11.000000+03:00');
      final withoutOffset = parseBackendTimestamp('2026-09-25T10:02:11.000000');
      expect(withOffset, withoutOffset);
    });
  });

  group('StartCaptureResponse.fromJson', () {
    test('falls back to conservative defaults when limits is missing (spec §36)', () {
      final response = StartCaptureResponse.fromJson({
        'footprint_id': 12,
        'status': 'CAPTURING',
        'capture_started_at': '2026-09-25T10:02:11+03:00',
        'server_time': '2026-09-25T10:02:11+03:00',
      });
      expect(response.limits.minSamples, 20);
      expect(response.limits.maxSamples, lessThanOrEqualTo(2000));
    });

    test('uses backend-provided limits when present, never a hardcoded override', () {
      final response = StartCaptureResponse.fromJson({
        'footprint_id': 12,
        'status': 'CAPTURING',
        'capture_started_at': '2026-09-25T10:02:11+03:00',
        'server_time': '2026-09-25T10:02:11+03:00',
        'limits': {
          'min_samples': 55,
          'min_duration_seconds': 120.0,
          'max_batch': 77,
          'max_samples': 4000,
        },
      });
      expect(response.limits.minSamples, 55);
      expect(response.limits.maxBatch, 77);
      expect(response.limits.maxSamples, 4000);
    });
  });
}
