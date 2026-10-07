import 'dart:ffi';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:outlet_manager/features/location_tracking/data/datasources/headless_ping_staging_store.dart';
import 'package:outlet_manager/features/location_tracking/domain/entities/location_ping.dart';

/// Regression coverage for `HeadlessPingStagingStore` — the second,
/// independently-opened Isar instance the headless heartbeat task stages
/// pings into, so it never has to open the same file the foreground app's
/// `IsarDatabase` opens at startup (see that class's own doc comment for
/// the field bug this avoids). These tests exercise the real Isar core
/// (same pattern as `test/core/database/isar_database_test.dart`), not a
/// mock.
void main() {
  late Directory tempDir;
  var seq = 0;

  LocationPing ping({DateTime? recordedAt}) {
    seq++;
    return LocationPing(
      localId: 'ping-$seq',
      latitude: -1.3,
      longitude: 36.8,
      accuracyMeters: 10,
      pingSource: PingSource.background,
      recordedAt: recordedAt ?? DateTime.now(),
    );
  }

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    final home = Platform.environment['HOME'];
    final dylibPath =
        '$home/.pub-cache/hosted/pub.dev/isar_community_flutter_libs-3.3.2/macos/libisar.dylib';
    if (File(dylibPath).existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.current(): dylibPath});
    }

    tempDir = await Directory.systemTemp.createTemp(
      'headless_ping_staging_store_test',
    );

    const channel = MethodChannel('plugins.flutter.io/path_provider');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          if (call.method == 'getApplicationDocumentsDirectory') {
            return tempDir.path;
          }
          return null;
        });
  });

  tearDown(() async {
    await HeadlessPingStagingStore.close();
  });

  test(
    'stage then drain delivers the ping and leaves nothing staged for a '
    'follow-up drain',
    () async {
      final p = ping();
      await HeadlessPingStagingStore.stage(p);

      final received = <LocationPing>[];
      await HeadlessPingStagingStore.drainInto((ping) async {
        received.add(ping);
      });

      expect(received.map((e) => e.localId), [p.localId]);

      final secondPass = <LocationPing>[];
      await HeadlessPingStagingStore.drainInto((ping) async {
        secondPass.add(ping);
      });
      expect(secondPass, isEmpty);
    },
  );

  test(
    'a row whose consume() throws stays staged; a row that succeeds does '
    'not get redelivered',
    () async {
      final a = ping();
      final b = ping();
      await HeadlessPingStagingStore.stage(a);
      await HeadlessPingStagingStore.stage(b);

      await HeadlessPingStagingStore.drainInto((p) async {
        if (p.localId == a.localId) {
          throw Exception('simulated consume failure for $a');
        }
      });

      final retry = <LocationPing>[];
      await HeadlessPingStagingStore.drainInto((p) async {
        retry.add(p);
      });

      expect(retry.map((e) => e.localId), [a.localId]);
    },
  );

  test(
    'a row still staged after its delete did not actually commit (crash '
    'between consume succeeding and the delete landing) is safely '
    'redelivered on the next drain, never silently lost',
    () async {
      final a = ping();
      final b = ping();
      await HeadlessPingStagingStore.stage(a);
      await HeadlessPingStagingStore.stage(b);

      await HeadlessPingStagingStore.drainInto((p) async {
        // Both succeed from the consumer's point of view.
      });

      // Simulate "the delete transaction for A never actually committed"
      // (e.g. the process died right after consume() returned) by
      // re-staging it — indistinguishable, from the store's perspective,
      // from a delete that silently failed to persist.
      await HeadlessPingStagingStore.stage(a);

      final redelivered = <LocationPing>[];
      await HeadlessPingStagingStore.drainInto((p) async {
        redelivered.add(p);
      });

      // Only A reappears — B's delete genuinely landed the first time.
      expect(redelivered.map((e) => e.localId), [a.localId]);
    },
  );

  test(
    'concurrent drainInto calls share one in-flight drain and never '
    'double-process the same row',
    () async {
      final a = ping();
      final b = ping();
      await HeadlessPingStagingStore.stage(a);
      await HeadlessPingStagingStore.stage(b);

      final seen1 = <String>[];
      final seen2 = <String>[];
      await Future.wait([
        HeadlessPingStagingStore.drainInto((p) async {
          seen1.add(p.localId);
        }),
        HeadlessPingStagingStore.drainInto((p) async {
          seen2.add(p.localId);
        }),
      ]);

      final allSeen = [...seen1, ...seen2];
      expect(allSeen.toSet(), {a.localId, b.localId});
      expect(allSeen.length, 2); // no duplicate processing across the pair.
    },
  );

  test(
    'drainInto delivers staged pings oldest-captured-first',
    () async {
      final now = DateTime.now();
      final newer = ping(recordedAt: now);
      final older = ping(recordedAt: now.subtract(const Duration(minutes: 10)));
      // Stage newer first to confirm ordering comes from recordedAt, not
      // insertion order.
      await HeadlessPingStagingStore.stage(newer);
      await HeadlessPingStagingStore.stage(older);

      final order = <String>[];
      await HeadlessPingStagingStore.drainInto((p) async {
        order.add(p.localId);
      });

      expect(order, [older.localId, newer.localId]);
    },
  );

  test(
    'a staged row older than the retention window is dropped by drainInto '
    'without ever reaching consume()',
    () async {
      final stale = ping(
        recordedAt: DateTime.now().subtract(const Duration(days: 30)),
      );
      await HeadlessPingStagingStore.stage(stale);

      var consumeCalls = 0;
      await HeadlessPingStagingStore.drainInto((p) async {
        consumeCalls++;
      });

      expect(consumeCalls, 0);

      // Confirm it's actually gone, not just skipped this pass.
      final secondPass = <String>[];
      await HeadlessPingStagingStore.drainInto((p) async {
        secondPass.add(p.localId);
      });
      expect(secondPass, isEmpty);
    },
  );

  test(
    'staging more than the row cap drops the oldest rows beyond it',
    () async {
      final originalCap = HeadlessPingStagingStore.maxStagedRows;
      HeadlessPingStagingStore.maxStagedRows = 3;
      addTearDown(() {
        HeadlessPingStagingStore.maxStagedRows = originalCap;
      });

      final now = DateTime.now();
      final pings = [
        for (var i = 0; i < 5; i++) ping(recordedAt: now.add(Duration(minutes: i))),
      ];
      for (final p in pings) {
        await HeadlessPingStagingStore.stage(p);
      }

      final remaining = <String>[];
      await HeadlessPingStagingStore.drainInto((p) async {
        remaining.add(p.localId);
      });

      // The 2 oldest (index 0 and 1) should have been dropped to stay at
      // the cap of 3; the 3 newest survive.
      expect(remaining, [
        pings[2].localId,
        pings[3].localId,
        pings[4].localId,
      ]);
    },
  );

  test('stage() called twice with the same localId upserts, not throws', () async {
    final first = ping();
    await HeadlessPingStagingStore.stage(first);
    final second = first.copyWith(latitude: -1.99);
    await HeadlessPingStagingStore.stage(second); // Must not throw.

    final rows = <LocationPing>[];
    await HeadlessPingStagingStore.drainInto((p) async {
      rows.add(p);
    });

    expect(rows.length, 1);
    expect(rows.single.latitude, -1.99);
  });
}
