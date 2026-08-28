import 'package:isar_community/isar.dart';

part 'attachment_model.g.dart';

@collection
class AttachmentModel {
  Id? id;

  @Index()
  late String localId; // UUID

  String? serverId; // Backend ID after upload

  @Index()
  late String entityType; // 'complaint', 'order', etc.

  @Index()
  late String entityId; // Parent entity localId

  late String localPath; // File path on device
  String? remoteUrl; // URL after upload

  late String mimeType; // image/jpeg, etc.
  late int sizeBytes;
  late String sha256; // File hash for integrity

  @Enumerated(EnumType.name)
  late AttachmentStatus status;

  @Index()
  late DateTime createdAt;

  DateTime? uploadedAt;
}

enum AttachmentStatus { pending, uploading, uploaded, failed }
