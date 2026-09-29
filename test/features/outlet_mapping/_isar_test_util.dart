import 'dart:ffi';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:outlet_manager/core/database/isar_database.dart';

/// Makes `IsarDatabase.getInstance()` — the REAL production singleton
/// every outlet_mapping datasource actually calls, unmodified — usable
/// inside `flutter test`. The only thing blocking it there is
/// `path_provider`'s platform channel having no real OS behind it; this
/// mocks just that one channel to return a temp directory, then lets Isar
/// open for real with the app's real, full schema list.
///
/// This means these tests exercise the SAME query chains
/// (`.where()...findFirst()` etc.) already compiling and running inside
/// `lib/`, rather than a parallel hand-rolled Isar setup — genuine
/// integration coverage of `MappingSessionLocalDataSource`/
/// `MappingSampleLocalDataSource` exactly as production uses them.
Future<Isar> setUpTestIsar() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Outside a real app bundle, Isar's native loader looks for
  // `libisar.dylib` next to the running executable and finds nothing —
  // point it explicitly at the version pinned in pubspec.yaml, already
  // present in pub-cache for exactly this reason (the plugin package
  // ships one per platform).
  final home = Platform.environment['HOME'];
  final dylibPath =
      '$home/.pub-cache/hosted/pub.dev/isar_community_flutter_libs-3.3.0-dev.1/macos/libisar.dylib';
  if (File(dylibPath).existsSync()) {
    await Isar.initializeIsarCore(libraries: {Abi.current(): dylibPath});
  }

  final dir = await Directory.systemTemp.createTemp('outlet_mapping_isar_test');

  const channel = MethodChannel('plugins.flutter.io/path_provider');
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (call) async {
    if (call.method == 'getApplicationDocumentsDirectory') {
      return dir.path;
    }
    return null;
  });

  return IsarDatabase.getInstance();
}

Future<void> tearDownTestIsar() async {
  await IsarDatabase.close();
}

/// For suites with many tests that would otherwise each pay a full Isar
/// native-core init/dispose cycle (`setUpTestIsar`/`tearDownTestIsar` per
/// test) — observed to reliably crash the `flutter test` shell subprocess
/// with a segfault during finalization once a file accumulates enough of
/// those cycles (11+), always AFTER every test has already passed. Call
/// `setUpTestIsar()` once via `setUpAll`, this via `tearDown` (clears rows
/// between tests for isolation without reopening the native core), and
/// `tearDownTestIsar()` once via `tearDownAll` instead.
Future<void> clearTestIsarData() async {
  final isar = await IsarDatabase.getInstance();
  await isar.writeTxn(() => isar.clear());
}
