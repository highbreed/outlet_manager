import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';

import '../database/isar_database.dart';

/// Provides the Isar database instance
final isarProvider = Provider<Future<Isar>>((ref) async {
  return IsarDatabase.getInstance();
});

/// Provides the IsarDatabase wrapper
final isarDatabaseProvider = Provider<IsarDatabase>((ref) {
  return IsarDatabase();
});

/// Provides a synchronous Isar instance (use with caution, prefer isarProvider)
/// This is useful for widgets that need immediate access after initialization
final isarInstanceProvider = Provider<Isar?>((ref) {
  throw UnimplementedError('Must be overridden with actual Isar instance');
});
