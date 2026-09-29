import 'package:flutter_test/flutter_test.dart';
import 'package:outlet_manager/features/outlet_mapping/providers/mapping_session_notifier.dart';

/// §30 of the hardening pass: the `max_samples` guard itself
/// (`BackgroundGeolocationService._handleMappingSample`'s
/// `_mappingSampleCount >= _mappingMaxSamples` check) is a two-integer
/// comparison reachable only via the native Transistorsoft plugin's
/// location callback — per the hardening request's own instruction not to
/// test that plugin's static platform API directly, it is not exercised
/// here. What *was* an actual, fixable correctness gap — the seed value
/// fed into that gate on resume, and when the cached server total is
/// allowed to move — is pulled out as pure functions in
/// mapping_session_notifier.dart and is fully covered below.
void main() {
  group('resumeSampleCountFloor (spec §30)', () {
    test('no server total yet — local count alone is the seed', () {
      expect(resumeSampleCountFloor(5, null), 5);
    });

    test('local count ahead of the last-known server total — local wins', () {
      expect(resumeSampleCountFloor(10, 5), 10);
    });

    test(
      'server total ahead of local — e.g. a synced row was deleted locally '
      'after upload — server figure wins so the seed never undercounts',
      () {
        expect(resumeSampleCountFloor(5, 10), 10);
      },
    );

    test('equal — either value is correct, no undercount either way', () {
      expect(resumeSampleCountFloor(7, 7), 7);
    });

    test('boundary: seed at maxSamples - 1 still leaves exactly one slot', () {
      const maxSamples = 2000;
      final seed = resumeSampleCountFloor(maxSamples - 1, null);
      expect(seed, maxSamples - 1);
      expect(seed < maxSamples, isTrue, reason: 'one more sample must still be acceptable');
    });

    test('boundary: seed at maxSamples leaves no slot', () {
      const maxSamples = 2000;
      final seed = resumeSampleCountFloor(maxSamples, null);
      expect(seed >= maxSamples, isTrue, reason: 'the native gate must reject further samples');
    });
  });

  group('shouldUpdateServerTotal (spec §30)', () {
    test('no report — never updates', () {
      expect(shouldUpdateServerTotal(5, null), isFalse);
    });

    test('first report ever (null current) — always updates', () {
      expect(shouldUpdateServerTotal(null, 20), isTrue);
    });

    test('report strictly greater than current — updates', () {
      expect(shouldUpdateServerTotal(20, 25), isTrue);
    });

    test('report equal to current — no-op, not a "newer" figure', () {
      expect(shouldUpdateServerTotal(20, 20), isFalse);
    });

    test('report less than current — never moves backward', () {
      expect(shouldUpdateServerTotal(20, 15), isFalse);
    });
  });
}
