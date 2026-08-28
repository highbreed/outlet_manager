import 'package:isar_community/isar.dart';

part 'shelf_share_session_model.g.dart';

/// Session status aligned with backend
enum ShelfShareModelStatus {
  inProgress, // Backend: in_progress
  submitted,
  approved,
  rejected,
}

/// Sync state for offline operations
enum ShelfShareSyncState { pending, syncing, synced, failed }

/// Embedded brand entry within an item group
@embedded
class ShelfShareBrandEntryModel {
  late int brandId;
  late String brandName;
  late int facings;
  String? notes;

  ShelfShareBrandEntryModel();

  factory ShelfShareBrandEntryModel.create({
    required int brandId,
    required String brandName,
    required int facings,
    String? notes,
  }) {
    return ShelfShareBrandEntryModel()
      ..brandId = brandId
      ..brandName = brandName
      ..facings = facings
      ..notes = notes;
  }

  factory ShelfShareBrandEntryModel.fromJson(Map<String, dynamic> json) {
    return ShelfShareBrandEntryModel()
      ..brandId = json['brand_id'] as int
      ..brandName = json['brand_name'] as String? ?? ''
      ..facings = (json['quantity'] ?? json['facings'] ?? 0) as int
      ..notes = json['notes'] as String?;
  }

  Map<String, dynamic> toJson() => {
    'brand_id': brandId,
    'brand_name': brandName,
    'quantity': facings,
    if (notes != null) 'notes': notes,
  };
}

/// Embedded item group within a shelf share session
@embedded
class ShelfShareItemGroupModel {
  late int itemGroupId;
  late String itemGroupName;
  late List<ShelfShareBrandEntryModel> brandEntries;

  ShelfShareItemGroupModel();

  factory ShelfShareItemGroupModel.create({
    required int itemGroupId,
    required String itemGroupName,
    List<ShelfShareBrandEntryModel>? brandEntries,
  }) {
    return ShelfShareItemGroupModel()
      ..itemGroupId = itemGroupId
      ..itemGroupName = itemGroupName
      ..brandEntries = brandEntries ?? [];
  }

  factory ShelfShareItemGroupModel.fromJson(Map<String, dynamic> json) {
    // Server returns 'brands', local uses 'brand_entries'
    final brandsJson =
        (json['brands'] ?? json['brand_entries']) as List<dynamic>?;
    final entries =
        brandsJson
            ?.map(
              (e) =>
                  ShelfShareBrandEntryModel.fromJson(e as Map<String, dynamic>),
            )
            .toList() ??
        [];
    return ShelfShareItemGroupModel()
      ..itemGroupId = json['item_group_id'] as int
      ..itemGroupName = json['item_group_name'] as String? ?? ''
      ..brandEntries = entries;
  }

  Map<String, dynamic> toJson() => {
    'item_group_id': itemGroupId,
    'item_group_name': itemGroupName,
    'brands': brandEntries.map((e) => e.toJson()).toList(),
  };

  /// Total facings for this group
  int get totalFacings => brandEntries.fold(0, (sum, e) => sum + e.facings);
}

/// Isar collection for shelf share sessions
@collection
class ShelfShareSessionModel {
  Id id = Isar.autoIncrement;

  @Index()
  late String localId; // UUID

  @Index()
  int? serverId; // Backend session ID

  @Index()
  late String visitLocalId;
  int? visitServerId;

  @Index()
  late int customerId;

  late String customerCode;
  late String customerName;
  late int salesAgentId;

  @Index()
  @Enumerated(EnumType.name)
  late ShelfShareModelStatus status;

  /// Embedded item groups with brand entries
  late List<ShelfShareItemGroupModel> itemGroups;

  String? notes;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  DateTime? submittedAt;
  DateTime? approvedAt;

  @Index()
  @Enumerated(EnumType.name)
  late ShelfShareSyncState syncState;

  String? syncError;
  DateTime? lastSyncedAt;

  ShelfShareSessionModel();

  /// Create new local session
  factory ShelfShareSessionModel.create({
    required String localId,
    required String visitLocalId,
    int? visitServerId,
    required int customerId,
    required String customerCode,
    required String customerName,
    required int salesAgentId,
    String? notes,
  }) {
    final now = DateTime.now();
    return ShelfShareSessionModel()
      ..localId = localId
      ..visitLocalId = visitLocalId
      ..visitServerId = visitServerId
      ..customerId = customerId
      ..customerCode = customerCode
      ..customerName = customerName
      ..salesAgentId = salesAgentId
      ..status = ShelfShareModelStatus.inProgress
      ..itemGroups = []
      ..notes = notes
      ..syncState = ShelfShareSyncState.pending
      ..createdAt = now
      ..updatedAt = now;
  }

  /// Create from API response
  factory ShelfShareSessionModel.fromJson(Map<String, dynamic> json) {
    final now = DateTime.now();

    final groups =
        (json['item_groups'] as List<dynamic>?)
            ?.map(
              (e) =>
                  ShelfShareItemGroupModel.fromJson(e as Map<String, dynamic>),
            )
            .toList() ??
        [];

    return ShelfShareSessionModel()
      ..serverId = json['id'] as int
      ..localId = json['device_session_id'] as String? ?? 'remote_${json['id']}'
      ..visitLocalId =
          json['visit_local_id'] as String? ??
          'remote_visit_${json['outlet_visit_id'] ?? 0}'
      ..visitServerId = json['outlet_visit_id'] as int?
      ..customerId = json['customer_id'] as int
      ..customerCode = json['outlet_code'] as String? ?? ''
      ..customerName = json['outlet_name'] as String? ?? ''
      ..salesAgentId = json['sales_agent_id'] as int? ?? 0
      ..status = _parseStatus(json['status'] as String? ?? 'in_progress')
      ..itemGroups = groups
      ..notes = json['notes'] as String?
      ..syncState = ShelfShareSyncState.synced
      ..lastSyncedAt = now
      ..submittedAt = json['submitted_at'] != null
          ? DateTime.parse(json['submitted_at'] as String)
          : null
      ..approvedAt = json['approved_at'] != null
          ? DateTime.parse(json['approved_at'] as String)
          : null
      ..createdAt = json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : now
      ..updatedAt = json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : now;
  }

  /// Convert to JSON for API requests (create)
  Map<String, dynamic> toCreateJson() => {
    'outlet_visit_id': visitServerId,
    'customer_id': customerId,
    'device_session_id': localId,
    'notes': "none",
  };

  /// Convert to JSON for API update (save progress)
  Map<String, dynamic> toUpdateJson() => {
    'item_groups': itemGroups.map((g) => g.toJson()).toList(),
    if (notes != null) 'notes': notes,
  };

  static ShelfShareModelStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'in_progress':
        return ShelfShareModelStatus.inProgress;
      case 'submitted':
        return ShelfShareModelStatus.submitted;
      case 'approved':
        return ShelfShareModelStatus.approved;
      case 'rejected':
        return ShelfShareModelStatus.rejected;
      default:
        return ShelfShareModelStatus.inProgress;
    }
  }

  String get statusString {
    switch (status) {
      case ShelfShareModelStatus.inProgress:
        return 'in_progress';
      case ShelfShareModelStatus.submitted:
        return 'submitted';
      case ShelfShareModelStatus.approved:
        return 'approved';
      case ShelfShareModelStatus.rejected:
        return 'rejected';
    }
  }

  bool get isInProgress => status == ShelfShareModelStatus.inProgress;
  bool get isSubmitted => status == ShelfShareModelStatus.submitted;
  bool get canEdit => isInProgress;
}
