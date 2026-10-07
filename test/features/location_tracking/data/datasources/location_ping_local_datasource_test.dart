import 'dart:ffi';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:outlet_manager/core/database/isar_database.dart';
import 'package:outlet_manager/features/location_tracking/data/datasources/location_ping_local_datasource.dart';
import 'package:outlet_manager/features/location_tracking/domain/entities/location_ping.dart';

/// Regression coverage for the `savePing()` upsert fix — plain `put()` on a
/// model with `id: null` throws on a `localId` unique-index collision
/// instead of replacing (the generated index is `unique: true, replace:
/// false`). This never mattered while every caller always built a
/// brand-new UUID, but `HeadlessPingStagingStore.drainInto` now replays
/// drained pings through this method, where a redundant re-drain (e.g. a
/// crash between "wrote here" and "deleted from staging") makes a
/// `localId` collision a real, expected case that must be a harmless
/// no-op, not a thrown error.
void main() {
  late Directory tempDir;
  final datasource = LocationPingLocalDataSource();

  LocationPing ping({required String localId, double latitude = -1.3}) {
    return LocationPing(
      localId: localId,
      latitude: latitude,
      longitude: 36.8,
      accuracyMeters: 10,
      pingSource: PingSource.background,
      recordedAt: DateTime.now(),
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
      'location_ping_local_datasource_test',
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
    await IsarDatabase.close();
  });

  test(
    'savePing() called twice with the same localId upserts rather than '
    'throwing, and leaves exactly one row reflecting the second save',
    () async {
      const localId = 'duplicate-localid';
      await datasource.savePing(ping(localId: localId, latitude: -1.1));

      // Must not throw — this is the exact scenario a redundant staging
      // drain replay triggers.
      await datasource.savePing(ping(localId: localId, latitude: -2.2));

      final result = await datasource.getPingByLocalId(localId);
      expect(result, isNotNull);
      expect(result!.latitude, -2.2);

      final pending = await datasource.getPendingPings();
      expect(pending.where((p) => p.localId == localId).length, 1);
    },
  );
}
