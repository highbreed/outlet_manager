import '../../domain/entities/shelf_share_session.dart';
import 'shelf_share_session_model.dart';

/// Extension to map ShelfShareSessionModel to domain entity
extension ShelfShareSessionModelMapper on ShelfShareSessionModel {
  ShelfShareSession toEntity() {
    return ShelfShareSession(
      localId: localId,
      serverId: serverId,
      visitLocalId: visitLocalId,
      visitServerId: visitServerId,
      customerId: customerId,
      customerCode: customerCode,
      customerName: customerName,
      salesAgentId: salesAgentId,
      status: _mapStatus(status),
      itemGroups: itemGroups.map((g) => g.toEntity()).toList(),
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
      submittedAt: submittedAt,
      approvedAt: approvedAt,
      syncState: _mapSyncState(syncState),
      syncError: syncError,
      lastSyncedAt: lastSyncedAt,
    );
  }

  static ShelfShareStatus _mapStatus(ShelfShareModelStatus status) {
    switch (status) {
      case ShelfShareModelStatus.inProgress:
        return ShelfShareStatus.inProgress;
      case ShelfShareModelStatus.submitted:
        return ShelfShareStatus.submitted;
      case ShelfShareModelStatus.approved:
        return ShelfShareStatus.approved;
      case ShelfShareModelStatus.rejected:
        return ShelfShareStatus.rejected;
    }
  }

  static SyncState _mapSyncState(ShelfShareSyncState state) {
    switch (state) {
      case ShelfShareSyncState.pending:
        return SyncState.pending;
      case ShelfShareSyncState.syncing:
        return SyncState.syncing;
      case ShelfShareSyncState.synced:
        return SyncState.synced;
      case ShelfShareSyncState.failed:
        return SyncState.failed;
    }
  }
}

/// Extension to map ShelfShareItemGroupModel to domain entity
extension ShelfShareItemGroupModelMapper on ShelfShareItemGroupModel {
  ShelfShareItemGroup toEntity() {
    return ShelfShareItemGroup(
      itemGroupId: itemGroupId,
      itemGroupName: itemGroupName,
      brandEntries: brandEntries.map((e) => e.toEntity()).toList(),
    );
  }
}

/// Extension to map ShelfShareBrandEntryModel to domain entity
extension ShelfShareBrandEntryModelMapper on ShelfShareBrandEntryModel {
  ShelfShareBrandEntry toEntity() {
    return ShelfShareBrandEntry(
      brandId: brandId,
      brandName: brandName,
      facings: facings,
      notes: notes,
    );
  }
}

/// Extension to map domain entities back to models (for saving)
extension ShelfShareItemGroupToModel on ShelfShareItemGroup {
  ShelfShareItemGroupModel toModel() {
    return ShelfShareItemGroupModel.create(
      itemGroupId: itemGroupId,
      itemGroupName: itemGroupName,
      brandEntries: brandEntries.map((e) => e.toModel()).toList(),
    );
  }
}

extension ShelfShareBrandEntryToModel on ShelfShareBrandEntry {
  ShelfShareBrandEntryModel toModel() {
    return ShelfShareBrandEntryModel.create(
      brandId: brandId,
      brandName: brandName,
      facings: facings,
      notes: notes,
    );
  }
}
