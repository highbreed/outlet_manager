import '../models/models.dart';
import '../../domain/entities/entities.dart' as domain;

/// Mapper for Warehouse
extension WarehouseModelMapper on WarehouseModel {
  domain.Warehouse toEntity() {
    return domain.Warehouse(
      id: serverId,
      warehouseName: warehouseName,
      warehouseCode: warehouseCode,
      sapWarehouseCode: sapWarehouseCode,
      warehouseType: warehouseType == WarehouseType.display
          ? domain.WarehouseType.display
          : domain.WarehouseType.backStore,
      location: location,
      isActive: isActive,
    );
  }
}

/// Mapper for CustomerProduct
extension CustomerProductModelMapper on CustomerProductModel {
  domain.CustomerProduct toEntity() {
    return domain.CustomerProduct(
      id: serverId,
      customerId: customerId,
      brandId: brandId,
      brandName: brandName,
      itemCode: itemCode,
      itemName: itemName,
      itemDescription: itemDescription,
      barcode: barcode,
      itemGroup: itemGroup,
      modelNumber: modelNumber,
      productStatus: productStatus,
      approvalStatus: approvalStatus,
      minOnshelfQty: effectiveMinOnshelf,
      maxOnshelfQty: effectiveMaxOnshelf,
      minBackstoreQty: effectiveMinBackstore,
      maxBackstoreQty: effectiveMaxBackstore,
      isActive: isActive,
    );
  }
}

/// Mapper for AgentBrand
extension AgentBrandModelMapper on AgentBrandModel {
  domain.AgentBrand toEntity() {
    return domain.AgentBrand(
      agentId: agentId,
      isAllBrands: isAllBrands,
      brands: List.generate(
        brandIds.length,
        (i) => domain.Brand(
          id: brandIds[i],
          name: brandNames[i],
          code: brandCodes[i],
        ),
      ),
    );
  }
}

/// Mapper for AgentCustomerBrandsResponse
extension AgentCustomerBrandsResponseMapper on AgentCustomerBrandsResponse {
  domain.AgentCustomerBrands toEntity() {
    return domain.AgentCustomerBrands(
      agentId: agentId,
      agentName: agentName,
      hasGlobalAllBrands: hasGlobalAllBrands,
      customerAssignments: customerAssignments
          .map((a) => a.toEntity())
          .toList(),
    );
  }
}

/// Mapper for CustomerBrandInfo
extension CustomerBrandInfoMapper on CustomerBrandInfo {
  domain.CustomerBrandAssignment toEntity() {
    return domain.CustomerBrandAssignment(
      customerId: customerId,
      customerName: customerName,
      customerCardCode: customerCardCode,
      isAllBrands: isAllBrands,
      brands: brands.map((b) => b.toEntity()).toList(),
    );
  }
}

/// Mapper for BrandInfo
extension BrandInfoMapper on BrandInfo {
  domain.Brand toEntity() {
    return domain.Brand(id: id, name: name, code: code);
  }
}

/// Mapper for StockTakeSession
extension StockTakeSessionModelMapper on StockTakeSessionModel {
  domain.StockTakeSession toEntity() {
    return domain.StockTakeSession(
      localId: localId,
      serverId: serverId,
      visitLocalId: visitLocalId,
      visitServerId: visitServerId,
      customerId: customerId,
      outletCode: outletCode,
      outletName: outletName,
      warehouseId: warehouseId,
      warehouseName: warehouseName,
      warehouseType: warehouseType == WarehouseType.display
          ? domain.WarehouseType.display
          : domain.WarehouseType.backStore,
      salesAgentId: salesAgentId,
      startedAt: startedAt,
      pausedAt: pausedAt,
      resumedAt: resumedAt,
      completedAt: completedAt,
      status: _mapStatus(status),
      totalProducts: totalProducts,
      totalSerials: totalSerials,
      notes: notes,
      sapStockTakeCode: sapStockTakeCode,
      syncState: _mapSyncState(syncState),
      syncError: syncError,
      lastSyncedAt: lastSyncedAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static domain.StockTakeStatus _mapStatus(StockTakeStatus status) {
    switch (status) {
      case StockTakeStatus.active:
        return domain.StockTakeStatus.active;
      case StockTakeStatus.paused:
        return domain.StockTakeStatus.paused;
      case StockTakeStatus.completed:
        return domain.StockTakeStatus.completed;
      case StockTakeStatus.cancelled:
        return domain.StockTakeStatus.cancelled;
    }
  }

  static domain.SyncState _mapSyncState(SyncState state) {
    switch (state) {
      case SyncState.pending:
        return domain.SyncState.pending;
      case SyncState.syncing:
        return domain.SyncState.syncing;
      case SyncState.synced:
        return domain.SyncState.synced;
      case SyncState.failed:
        return domain.SyncState.failed;
    }
  }
}

/// Mapper for StockTakeItem
extension StockTakeItemModelMapper on StockTakeItemModel {
  domain.StockTakeItem toEntity() {
    return domain.StockTakeItem(
      localId: localId,
      serverId: serverId,
      sessionLocalId: sessionLocalId,
      customerProductId: customerProductId,
      brandId: brandId,
      brandName: brandName,
      itemCode: itemCode,
      itemName: itemName,
      itemDescription: itemDescription,
      category: category,
      modelNumber: modelNumber,
      serialCount: serialCount,
      minStockLevel: minStockLevel,
      maxStockLevel: maxStockLevel,
      status: status == ItemCountStatus.completed
          ? domain.ItemCountStatus.completed
          : domain.ItemCountStatus.inProgress,
      startedAt: startedAt,
      completedAt: completedAt,
      updatedAt: updatedAt,
    );
  }
}

/// Mapper for SerialNumberEntry
extension SerialNumberEntryModelMapper on SerialNumberEntryModel {
  domain.SerialNumberEntry toEntity() {
    return domain.SerialNumberEntry(
      localId: localId,
      serverId: serverId,
      sessionLocalId: sessionLocalId,
      itemLocalId: itemLocalId,
      serialNumberRaw: serialNumberRaw,
      serialNumberNorm: serialNumberNorm,
      deviceScanId: deviceScanId,
      deviceScannedAt: deviceScannedAt,
      scanSequence: scanSequence,
      status: _mapSerialStatus(status),
      validationError: validationError,
      scannedAt: scannedAt,
    );
  }

  static domain.SerialStatus _mapSerialStatus(SerialStatus status) {
    switch (status) {
      case SerialStatus.valid:
        return domain.SerialStatus.valid;
      case SerialStatus.duplicate:
        return domain.SerialStatus.duplicate;
      case SerialStatus.duplicateCrossItem:
        return domain.SerialStatus.duplicateCrossItem;
      case SerialStatus.invalid:
        return domain.SerialStatus.invalid;
      case SerialStatus.pendingValidation:
        return domain.SerialStatus.pendingValidation;
    }
  }
}
