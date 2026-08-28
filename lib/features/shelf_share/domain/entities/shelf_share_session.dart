import 'package:freezed_annotation/freezed_annotation.dart';

part 'shelf_share_session.freezed.dart';

/// Shelf share session status
enum ShelfShareStatus { inProgress, submitted, approved, rejected }

/// Domain entity for a shelf share session
@freezed
class ShelfShareSession with _$ShelfShareSession {
  const factory ShelfShareSession({
    /// Local UUID for offline-first
    required String localId,

    /// Server ID (null until synced)
    int? serverId,

    /// Visit context
    required String visitLocalId,
    int? visitServerId,

    /// Customer/outlet info
    required int customerId,
    required String customerCode,
    required String customerName,

    /// Agent info
    required int salesAgentId,

    /// Session status
    required ShelfShareStatus status,

    /// Item groups with brand entries
    required List<ShelfShareItemGroup> itemGroups,

    /// Notes
    String? notes,

    /// Timestamps
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? submittedAt,
    DateTime? approvedAt,

    /// Sync state
    required SyncState syncState,
    String? syncError,
    DateTime? lastSyncedAt,
  }) = _ShelfShareSession;

  const ShelfShareSession._();

  bool get isInProgress => status == ShelfShareStatus.inProgress;
  bool get isSubmitted => status == ShelfShareStatus.submitted;
  bool get isApproved => status == ShelfShareStatus.approved;
  bool get isRejected => status == ShelfShareStatus.rejected;
  bool get canEdit => isInProgress;
  bool get isSynced => syncState == SyncState.synced;
  bool get hasSyncError => syncState == SyncState.failed;

  /// Total number of item groups with data
  int get completedItemGroups =>
      itemGroups.where((g) => g.brandEntries.isNotEmpty).length;

  /// Total number of brand entries across all groups
  int get totalBrandEntries =>
      itemGroups.fold(0, (sum, g) => sum + g.brandEntries.length);

  /// Whether this session has any data entered
  bool get hasData => itemGroups.any((g) => g.brandEntries.isNotEmpty);

  String get statusDisplayName {
    switch (status) {
      case ShelfShareStatus.inProgress:
        return 'In Progress';
      case ShelfShareStatus.submitted:
        return 'Submitted';
      case ShelfShareStatus.approved:
        return 'Approved';
      case ShelfShareStatus.rejected:
        return 'Rejected';
    }
  }
}

/// Sync state for offline operations (matches stock_take pattern)
enum SyncState { pending, syncing, synced, failed }

/// A group of brand entries within a shelf share session
@freezed
class ShelfShareItemGroup with _$ShelfShareItemGroup {
  const factory ShelfShareItemGroup({
    /// The item group ID (references ItemGroup entity)
    required int itemGroupId,

    /// The item group name (denormalized for display)
    required String itemGroupName,

    /// Brand entries for this item group
    required List<ShelfShareBrandEntry> brandEntries,
  }) = _ShelfShareItemGroup;

  const ShelfShareItemGroup._();

  /// Total facings for this group
  int get totalFacings => brandEntries.fold(0, (sum, e) => sum + e.facings);

  /// Calculate shelf share percentage for a brand
  double brandSharePercent(int brandId) {
    if (totalFacings == 0) return 0.0;
    final entry = brandEntries.where((e) => e.brandId == brandId).firstOrNull;
    if (entry == null) return 0.0;
    return (entry.facings / totalFacings) * 100;
  }
}

/// A single brand's facing count within an item group
@freezed
class ShelfShareBrandEntry with _$ShelfShareBrandEntry {
  const factory ShelfShareBrandEntry({
    /// Brand reference
    required int brandId,
    required String brandName,

    /// Number of facings on shelf
    required int facings,

    /// Optional notes
    String? notes,
  }) = _ShelfShareBrandEntry;

  const ShelfShareBrandEntry._();
}
