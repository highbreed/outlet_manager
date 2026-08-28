import 'package:isar_community/isar.dart';

part 'route_activation_model.g.dart';

@collection
class RouteActivationModel {
  Id? id;

  @Index()
  late String localId;

  String? serverId;

  @Index()
  late String routeId;

  late String userId;

  @Index()
  late DateTime activatedAt;

  DateTime? deactivatedAt;

  @Enumerated(EnumType.name)
  late RouteActivationStatus status;

  @Enumerated(EnumType.name)
  late SyncState syncState;

  DateTime? syncedAt;
}

enum RouteActivationStatus { active, completed, cancelled }

enum SyncState { localOnly, syncing, synced, syncFailed, needsAttention }
