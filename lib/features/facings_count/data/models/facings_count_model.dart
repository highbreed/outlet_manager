import 'package:isar_community/isar.dart';

part 'facings_count_model.g.dart';

/// Session status aligned with backend (FacingsSessionStatus)
enum FacingsCountModelStatus {
  inProgress, // Backend: in_progress
  submitted,
  approved,
  rejected,
}

/// Sync state for offline operations
enum FacingsCountSyncState { pending, syncing, synced, failed }

/// Embedded item group facings entry (backend: FacingsEntry / FacingsEntryResponse)
@embedded
class FacingsCountItemModel {
  late int itemGroupId;
  late String itemGroupCode;
  late String itemGroupName;
  late int quantity;

  FacingsCountItemModel();

  factory FacingsCountItemModel.create({
    required int itemGroupId,
    required String itemGroupCode,
    required String itemGroupName,
    required int quantity,
  }) {
    return FacingsCountItemModel()
      ..itemGroupId = itemGroupId
      ..itemGroupCode = itemGroupCode
      ..itemGroupName = itemGroupName
      ..quantity = quantity;
  }

  factory FacingsCountItemModel.fromJson(Map<String, dynamic> json) {
    return FacingsCountItemModel()
      ..itemGroupId = json['item_group_id'] as int? ?? 0
      ..itemGroupCode = json['item_group_code'] as String? ?? ''
      ..itemGroupName = json['item_group_name'] as String? ?? ''
      ..quantity = json['facings_count'] as int? ?? 0;
  }

  Map<String, dynamic> toJson() => {
    'item_group_id': itemGroupId,
    'item_group_code': itemGroupCode,
    'item_group_name': itemGroupName,
    'facings_count': quantity,
  };
}

/// Isar collection for horizontal facings counts (backend: FacingsSession)
@collection
class FacingsCountModel {
  Id id = Isar.autoIncrement;

  @Index()
  late String localId; // UUID, sent as device_session_id

  @Index()
  int? serverId; // Backend session ID

  @Index()
  late String visitLocalId;
  int? visitServerId; // Backend: outlet_visit_id

  @Index()
  late int customerId;

  /// Not returned by the API — kept locally from creation time
  late String customerCode;
  late String customerName;

  @Index()
  late int salesAgentId;

  @Index()
  @Enumerated(EnumType.name)
  late FacingsCountModelStatus status;

  /// Embedded item groups with facing counts (backend: entries)
  late List<FacingsCountItemModel> items;

  @Index()
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  DateTime? submittedAt;
  DateTime? approvedAt;

  @Index()
  @Enumerated(EnumType.name)
  late FacingsCountSyncState syncState;

  String? syncError;
  DateTime? lastSyncedAt;

  FacingsCountModel();

  /// Create new local draft
  factory FacingsCountModel.create({
    required String localId,
    required String visitLocalId,
    int? visitServerId,
    required int customerId,
    required String customerCode,
    required String customerName,
    required int salesAgentId,
  }) {
    final now = DateTime.now();
    return FacingsCountModel()
      ..localId = localId
      ..visitLocalId = visitLocalId
      ..visitServerId = visitServerId
      ..customerId = customerId
      ..customerCode = customerCode
      ..customerName = customerName
      ..salesAgentId = salesAgentId
      ..status = FacingsCountModelStatus.inProgress
      ..items = []
      ..syncState = FacingsCountSyncState.pending
      ..createdAt = now
      ..updatedAt = now;
  }

  /// Create from API response (FacingsSessionResponse).
  /// Note: the API never returns customer_code/customer_name/visit_local_id —
  /// callers must restore those from the pre-existing local record after this.
  factory FacingsCountModel.fromJson(Map<String, dynamic> json) {
    final now = DateTime.now();

    final entries =
        (json['entries'] as List<dynamic>?)
            ?.map(
              (e) => FacingsCountItemModel.fromJson(e as Map<String, dynamic>),
            )
            .toList() ??
        [];

    return FacingsCountModel()
      ..serverId = json['id'] as int
      ..localId = json['device_session_id'] as String? ?? 'remote_${json['id']}'
      ..visitLocalId = 'remote_visit_${json['outlet_visit_id'] ?? 0}'
      ..visitServerId = json['outlet_visit_id'] as int?
      ..customerId = json['customer_id'] as int
      ..customerCode = ''
      ..customerName = ''
      ..salesAgentId = json['sales_agent_id'] as int? ?? 0
      ..status = _parseStatus(json['status'] as String? ?? 'in_progress')
      ..items = entries
      ..syncState = FacingsCountSyncState.synced
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

  /// Convert to JSON for API requests (create) — FacingsSessionCreate
  Map<String, dynamic> toCreateJson() => {
    'outlet_visit_id': visitServerId,
    'customer_id': customerId,
    'device_session_id': localId,
  };

  /// Convert to JSON for API update (save progress) — FacingsSessionUpdate
  Map<String, dynamic> toUpdateJson() => {
    'entries': items.map((i) => i.toJson()).toList(),
  };

  /// Convert to JSON for submit — FacingsSessionSubmit (entries required, min 1)
  Map<String, dynamic> toSubmitJson() => {
    'entries': items.map((i) => i.toJson()).toList(),
  };

  static FacingsCountModelStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'submitted':
        return FacingsCountModelStatus.submitted;
      case 'approved':
        return FacingsCountModelStatus.approved;
      case 'rejected':
        return FacingsCountModelStatus.rejected;
      case 'in_progress':
      default:
        return FacingsCountModelStatus.inProgress;
    }
  }

  bool get isInProgress => status == FacingsCountModelStatus.inProgress;
  bool get isSubmitted => status == FacingsCountModelStatus.submitted;
  bool get canEdit => isInProgress;
}
