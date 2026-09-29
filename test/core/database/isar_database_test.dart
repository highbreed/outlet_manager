import 'dart:ffi';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:outlet_manager/core/database/isar_database.dart';

/// Regression coverage for the in-flight-open dedup in
/// `IsarDatabase.getInstance()` (see its own doc comment for the full
/// reasoning). Without it, a caller retrying after a `Future.timeout()` on
/// a slow-but-not-actually-hung open — or simply two callers racing during
/// app startup, e.g. `AppInitializationService._initializeDatabase()` and
/// `_initializeSyncService()` — would each call `Isar.open()` for the same
/// name while the first call is still pending. That either races at the
/// native mdbx layer or throws `IsarError('Instance has already been
/// opened.')` once the first call's `IsarImpl` constructor registers the
/// name in Isar's static `_instances` map.
///
/// These tests exercise the real `getInstance()` against the real native
/// Isar core (same pattern as
/// `test/features/outlet_mapping/_isar_test_util.dart`), not a mock, so a
/// regression here would actually surface as a thrown `IsarError` or a
/// hang rather than a silently-wrong assertion.
void main() {
  late Directory tempDir;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    // Outside a real app bundle, Isar's native loader looks for
    // `libisar.dylib` next to the running executable and finds nothing —
    // point it explicitly at the version pinned in pubspec.yaml.
    final home = Platform.environment['HOME'];
    final dylibPath =
        '$home/.pub-cache/hosted/pub.dev/isar_community_flutter_libs-3.3.0-dev.1/macos/libisar.dylib';
    if (File(dylibPath).existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.current(): dylibPath});
    }

    tempDir = await Directory.systemTemp.createTemp('isar_database_test');

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
    'concurrent getInstance() calls issued before the first resolves '
    'share one underlying open instead of racing a second Isar.open()',
    () async {
      final future1 = IsarDatabase.getInstance();
      final future2 = IsarDatabase.getInstance();

      final results = await Future.wait([future1, future2]);

      expect(identical(results[0], results[1]), isTrue);
    },
  );

  test(
    'getInstance() called again after a successful open returns the same '
    'cached instance, no re-open',
    () async {
      final first = await IsarDatabase.getInstance();
      final second = await IsarDatabase.getInstance();

      expect(identical(first, second), isTrue);
    },
  );
}
