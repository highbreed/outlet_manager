import 'package:isar_community/isar.dart';

part 'stock_take_entry_model.g.dart';

@collection
class StockTakeEntryModel {
  Id? id;

  @Index()
  late String localId; // UUID

  String? serverId;

  @Index()
  late String sessionId; // Links to ClockInSessionModel.localId

  @Index()
  late String outletId;

  @Index()
  @Enumerated(EnumType.name)
  late StockTakeType type;

  late String productId;
  late String productName;
  late String productCode;

  // Values based on type
  int? valueInt; // quantity, facingCount
  double? valueDouble; // shelfSpaceCm, competitorSpaceCm
  String? valueText; // shelfPosition, notes

  String? metadataJson; // Additional type-specific data

  @Index()
  late DateTime recordedAt;

  double? latitude;
  double? longitude;

  @Enumerated(EnumType.name)
  late SyncState syncState;

  DateTime? syncedAt;
}

enum StockTakeType { stockCount, shelfShare, facings }

enum SyncState { localOnly, syncing, synced, syncFailed, needsAttention }
