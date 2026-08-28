import 'package:isar_community/isar.dart';

part 'permission_cache_model.g.dart';

@collection
class PermissionCacheModel {
  Id? id;

  @Index(unique: true)
  late String userId;

  late String permissionsJson; // Serialized List<FeaturePermission>

  late int version; // Server-provided version

  @Index()
  late DateTime updatedAt;

  late DateTime expiresAt;
}
