import '../../domain/entities/facings_count.dart';
import 'facings_count_model.dart';

/// Extension to map FacingsCountModel to domain entity
extension FacingsCountModelMapper on FacingsCountModel {
  FacingsCount toEntity() {
    return FacingsCount(
      localId: localId,
      serverId: serverId,
      visitLocalId: visitLocalId,
      visitServerId: visitServerId,
      customerId: customerId,
      customerCode: customerCode,
      customerName: customerName,
      salesAgentId: salesAgentId,
      status: _mapStatus(status),
      items: items.map((i) => i.toEntity()).toList(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      submittedAt: submittedAt,
      approvedAt: approvedAt,
      syncState: _mapSyncState(syncState),
      syncError: syncError,
      lastSyncedAt: lastSyncedAt,
    );
  }

  static FacingsCountStatus _mapStatus(FacingsCountModelStatus status) {
    switch (status) {
      case FacingsCountModelStatus.inProgress:
        return FacingsCountStatus.inProgress;
      case FacingsCountModelStatus.submitted:
        return FacingsCountStatus.submitted;
      case FacingsCountModelStatus.approved:
        return FacingsCountStatus.approved;
      case FacingsCountModelStatus.rejected:
        return FacingsCountStatus.rejected;
    }
  }

  static FacingsSyncState _mapSyncState(FacingsCountSyncState state) {
    switch (state) {
      case FacingsCountSyncState.pending:
        return FacingsSyncState.pending;
      case FacingsCountSyncState.syncing:
        return FacingsSyncState.syncing;
      case FacingsCountSyncState.synced:
        return FacingsSyncState.synced;
      case FacingsCountSyncState.failed:
        return FacingsSyncState.failed;
    }
  }
}

/// Extension to map FacingsCountItemModel to domain entity
extension FacingsCountItemModelMapper on FacingsCountItemModel {
  FacingsCountItem toEntity() {
    return FacingsCountItem(
      itemGroupId: itemGroupId,
      itemGroupCode: itemGroupCode,
      itemGroupName: itemGroupName,
      quantity: quantity,
    );
  }
}

/// Extension to map domain entities back to models (for saving)
extension FacingsCountItemToModel on FacingsCountItem {
  FacingsCountItemModel toModel() {
    return FacingsCountItemModel.create(
      itemGroupId: itemGroupId,
      itemGroupCode: itemGroupCode,
      itemGroupName: itemGroupName,
      quantity: quantity,
    );
  }
}
