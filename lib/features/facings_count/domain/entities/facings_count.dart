import 'package:freezed_annotation/freezed_annotation.dart';

part 'facings_count.freezed.dart';

/// Facings count status — matches backend session workflow
/// (in_progress -> submitted -> approved | rejected)
enum FacingsCountStatus { inProgress, submitted, approved, rejected }

/// Sync state for offline operations (matches shelf_share pattern)
enum FacingsSyncState { pending, syncing, synced, failed }

/// Domain entity for a horizontal facings count
@freezed
class FacingsCount with _$FacingsCount {
  const factory FacingsCount({
    /// Local UUID for offline-first
    required String localId,

    /// Server ID (null until synced)
    int? serverId,

    /// Visit context (clock-in traceability)
    required String visitLocalId,
    int? visitServerId,

    /// Customer/outlet info (not echoed back by the API — kept locally)
    required int customerId,
    required String customerCode,
    required String customerName,

    /// Agent info ("my user ID")
    required int salesAgentId,

    /// Count status
    required FacingsCountStatus status,

    /// Item groups with facing counts
    required List<FacingsCountItem> items,

    /// Timestamps
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? submittedAt,
    DateTime? approvedAt,

    /// Sync state
    required FacingsSyncState syncState,
    String? syncError,
    DateTime? lastSyncedAt,
  }) = _FacingsCount;

  const FacingsCount._();

  bool get isInProgress => status == FacingsCountStatus.inProgress;
  bool get isSubmitted => status == FacingsCountStatus.submitted;
  bool get isApproved => status == FacingsCountStatus.approved;
  bool get isRejected => status == FacingsCountStatus.rejected;
  bool get canEdit => isInProgress;
  bool get isSynced => syncState == FacingsSyncState.synced;
  bool get hasSyncError => syncState == FacingsSyncState.failed;

  String get statusDisplayName {
    switch (status) {
      case FacingsCountStatus.inProgress:
        return 'In Progress';
      case FacingsCountStatus.submitted:
        return 'Submitted';
      case FacingsCountStatus.approved:
        return 'Approved';
      case FacingsCountStatus.rejected:
        return 'Rejected';
    }
  }

  /// Total number of item groups in this count
  int get totalItemGroups => items.length;

  /// Total facings across all item groups
  int get totalFacings => items.fold(0, (sum, i) => sum + i.quantity);

  /// Whether this count has any item groups added
  bool get hasData => items.isNotEmpty;

  bool get isToday {
    final now = DateTime.now();
    return createdAt.year == now.year &&
        createdAt.month == now.month &&
        createdAt.day == now.day;
  }
}

/// A single item group's facings count entry
@freezed
class FacingsCountItem with _$FacingsCountItem {
  const factory FacingsCountItem({
    required int itemGroupId,
    required String itemGroupCode,
    required String itemGroupName,
    required int quantity,
  }) = _FacingsCountItem;

  const FacingsCountItem._();
}
