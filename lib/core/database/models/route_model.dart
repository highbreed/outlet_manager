import 'package:isar_community/isar.dart';

part 'route_model.g.dart';

@collection
class RouteModel {
  Id? id;

  @Index()
  late String localId;

  String? serverId;

  late String name;

  @Index()
  late int dayOfWeek; // 1 = Monday, 7 = Sunday

  late String outletsJson; // Serialized List<RouteOutlet>

  late bool isActive;

  @Enumerated(EnumType.name)
  late SyncState syncState;

  DateTime? syncedAt;
}

enum SyncState { localOnly, syncing, synced, syncFailed, needsAttention }
