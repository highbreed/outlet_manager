import 'package:isar_community/isar.dart';

part 'entity_id_map_model.g.dart';

@collection
class EntityIdMapModel {
  Id? id;

  @Index()
  late String entityType; // 'clock_session', 'order', 'complaint', etc.

  @Index(unique: true, composite: [CompositeIndex('entityType')])
  late String localId; // Local UUID

  String? serverId; // Backend ID (null until synced)

  DateTime? syncedAt;
}
