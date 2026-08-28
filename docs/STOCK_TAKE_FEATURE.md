# Stock Take Feature - Technical Specification

**Version:** 1.0  
**Date:** February 3, 2026  
**Status:** Planning Phase

---

## Table of Contents

1. [Overview](#overview)
2. [Business Rules](#business-rules)
3. [Architecture](#architecture)
4. [Database Schema](#database-schema)
5. [API Integration](#api-integration)
6. [Domain Layer](#domain-layer)
7. [Use Cases](#use-cases)
8. [UI/UX Flows](#uiux-flows)
9. [Validation Rules](#validation-rules)
10. [State Management](#state-management)
11. [Offline Support](#offline-support)
12. [Implementation Phases](#implementation-phases)

---

## Overview

The Stock Take feature enables sales agents to perform inventory counts at customer outlets during scheduled visits. Agents scan product models and their serial numbers, validate against assigned brands, and generate replenishment orders based on min/max stock levels.

### Key Features

- ✅ Clock-in requirement (must be at outlet visit)
- ✅ Multi-warehouse support (display + back_store)
- ✅ Brand-restricted scanning
- ✅ Serial number validation (no duplicates, no barcodes, no URLs)
- ✅ Batch scanning support
- ✅ Offline-first architecture
- ✅ Proposed order generation
- ✅ Session pause/resume capability

---

## Business Rules

### 1. Access Control

**Agent Brand Assignment:**
- Agents can be assigned one or multiple brands
- Agents can only scan products from their assigned brands
- System must validate product brand before allowing scan
- Check endpoint: `GET /agents/{agent_id}/brands`

**Visit Requirement:**
- Agent must be clocked into an outlet visit
- Stock take session linked to `outlet_visit_id`
- Cannot start session without active visit

### 2. Warehouse Management

**Warehouse Types:**
- **Display Warehouse**: On-shelf/display inventory
- **Back Store Warehouse**: Back room/storage inventory

**Per-Customer Configuration:**
- Customer can have:
  - Display warehouse only
  - Back store warehouse only  
  - Both display and back store warehouses

**Session Rules:**
- One session per warehouse type
- Agent can run parallel sessions for different warehouses
- Each session tracks its own products and serials
- `warehouse_id` required when starting session

### 3. Product & Serial Validation

**Product Selection:**
- Products filtered by:
  1. Customer's product catalogue
  2. Agent's assigned brands
  3. Active products only

**Serial Number Rules:**
- Must be unique within the session (across all items)
- Cannot be a barcode (purely numeric 8-13 digits)
- Cannot be a URL/link
- Minimum 5 characters
- Alphanumeric with allowed special chars: `-`, `_`
- Case-insensitive comparison

**Duplicate Detection:**
- Check within current session only
- Cross-item duplicate detection (serial scanned under wrong product)
- Real-time validation before adding to local DB

### 4. Min/Max Stock Levels

**Level Tiers:**
- **ZC (Zone Controller)**: Default levels
- **CSH (Cash)**: Customer-specific levels (requires approval)
- **APP (Approved)**: Final approved levels

**Replenishment Calculation:**
- Strategy: `to_max` or `to_min`
- `to_max`: order_qty = max_level - current_stock
- `to_min`: order_qty = min_level - current_stock
- Uses highest approved tier available

---

## Architecture

### Module Structure

```
lib/features/stock_take/
├── data/
│   ├── datasources/
│   │   ├── stock_take_local_datasource.dart
│   │   └── stock_take_remote_datasource.dart
│   ├── models/
│   │   ├── stock_take_session_model.dart       # @collection
│   │   ├── stock_take_item_model.dart          # @collection
│   │   ├── serial_number_entry_model.dart      # @collection
│   │   ├── warehouse_model.dart                # @collection (cached)
│   │   └── agent_brand_model.dart              # @collection (cached)
│   └── repositories/
│       └── stock_take_repository_impl.dart
├── domain/
│   ├── entities/
│   │   ├── stock_take_session.dart
│   │   ├── stock_take_item.dart
│   │   ├── serial_number_entry.dart
│   │   ├── warehouse.dart
│   │   ├── agent_brand.dart
│   │   └── proposed_order.dart
│   ├── repositories/
│   │   └── stock_take_repository.dart
│   └── usecases/
│       ├── get_agent_brands.dart
│       ├── get_customer_warehouses.dart
│       ├── start_stock_take_session.dart
│       ├── get_active_sessions.dart
│       ├── pause_session.dart
│       ├── resume_session.dart
│       ├── add_product_to_session.dart
│       ├── search_products.dart
│       ├── add_serial_number.dart
│       ├── validate_serial_number.dart
│       ├── delete_serial.dart
│       ├── complete_item.dart
│       ├── complete_session.dart
│       ├── generate_proposed_order.dart
│       └── sync_offline_data.dart
├── presentation/
│   ├── screens/
│   │   ├── stock_take_dashboard_screen.dart    # Session overview
│   │   ├── warehouse_selection_screen.dart     # Choose warehouse
│   │   ├── session_active_screen.dart          # Active session view
│   │   ├── product_search_screen.dart          # Search/scan product
│   │   ├── serial_scanner_screen.dart          # Scan serials
│   │   └── proposed_order_screen.dart          # Generated order
│   ├── widgets/
│   │   ├── session_card.dart
│   │   ├── warehouse_selector.dart
│   │   ├── product_search_bar.dart
│   │   ├── product_card.dart
│   │   ├── serial_input_field.dart
│   │   ├── serial_number_list.dart
│   │   ├── validation_indicator.dart
│   │   └── stock_level_indicator.dart
│   └── providers/
│       └── stock_take_providers.dart
└── stock_take.dart                              # Barrel export
```

---

## Database Schema

### 1. AgentBrandModel (Cached)

```dart
@collection
class AgentBrandModel {
  Id id = Isar.autoIncrement;
  
  @Index()
  late int agentId;                 // Sales agent ID
  
  late bool isAllBrands;            // Access to all brands
  late List<int> brandIds;          // Assigned brand IDs
  late List<String> brandNames;     // Brand names (for display)
  late List<String> brandCodes;     // Brand codes
  
  DateTime cachedAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
```

### 2. WarehouseModel (Cached)

```dart
@collection
class WarehouseModel {
  Id id = Isar.autoIncrement;
  
  @Index()
  late int serverId;                // Backend warehouse ID
  
  late String warehouseName;
  late String warehouseCode;
  String? sapWarehouseCode;
  
  @Enumerated(EnumType.name)
  late WarehouseType warehouseType; // display or back_store
  
  String? location;
  late bool isActive;
  
  DateTime cachedAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}

enum WarehouseType { display, backStore }
```

### 3. StockTakeSessionModel

```dart
@collection
class StockTakeSessionModel {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String localId;              // UUID
  
  @Index()
  int? serverId;                    // Backend session ID
  
  @Index()
  late String visitLocalId;         // FK to OutletVisit
  int? visitServerId;
  
  @Index()
  late int customerId;              // Customer ID
  
  late String outletCode;
  late String outletName;
  
  @Index()
  late int warehouseId;             // Warehouse being counted
  
  late String warehouseName;
  
  @Enumerated(EnumType.name)
  late WarehouseType warehouseType;
  
  late DateTime startedAt;
  DateTime? pausedAt;
  DateTime? resumedAt;
  DateTime? completedAt;
  
  @Index()
  @Enumerated(EnumType.name)
  late StockTakeStatus status;      // active, paused, completed, cancelled
  
  late int salesAgentId;            // Agent who created session
  late int totalProducts;           // Count of unique products
  late int totalSerials;            // Count of all serial numbers
  
  String? notes;
  String? sapStockTakeCode;         // SAP stock take reference
  
  @Index()
  @Enumerated(EnumType.name)
  late SyncState syncState;         // pending, syncing, synced, failed
  
  String? syncError;
  DateTime? lastSyncedAt;
  
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}

enum StockTakeStatus { active, paused, completed, cancelled }
```

### 4. StockTakeItemModel

```dart
@collection
class StockTakeItemModel {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String localId;              // UUID
  
  int? serverId;                    // Backend item ID
  
  @Index()
  late String sessionLocalId;       // FK to StockTakeSession
  
  late int customerProductId;       // Product catalogue ID
  late int brandId;                 // Product brand ID
  late String brandName;
  
  late String itemCode;             // SAP item code
  late String itemName;
  String? itemDescription;
  String? category;
  
  late int serialCount;             // Count of serials for this item
  
  late int minStockLevel;           // From catalogue
  late int maxStockLevel;
  
  @Enumerated(EnumType.name)
  late ItemCountStatus status;      // in_progress, completed
  
  DateTime startedAt = DateTime.now();
  DateTime? completedAt;
  DateTime updatedAt = DateTime.now();
  
  @Index()
  @Enumerated(EnumType.name)
  late SyncState syncState;
  
  String? syncError;
}

enum ItemCountStatus { inProgress, completed }
```

### 5. SerialNumberEntryModel

```dart
@collection
class SerialNumberEntryModel {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String localId;              // UUID
  
  int? serverId;                    // Backend serial ID
  
  @Index()
  late String sessionLocalId;       // FK to StockTakeSession
  
  @Index()
  late String itemLocalId;          // FK to StockTakeItem
  
  late String serialNumberRaw;      // Original input (preserves case)
  
  @Index(unique: true, composite: [CompositeIndex('sessionLocalId')])
  late String serialNumberNorm;     // Normalized (uppercase) for uniqueness
  
  late String deviceScanId;         // Unique scan ID from device
  late DateTime deviceScannedAt;    // When scanned on device
  int? scanSequence;                // Order within batch
  
  @Enumerated(EnumType.name)
  late SerialStatus status;         // valid, duplicate, invalid, pending
  
  String? validationError;
  
  DateTime scannedAt = DateTime.now();
  
  @Index()
  @Enumerated(EnumType.name)
  late SyncState syncState;
  
  String? syncError;
}

enum SerialStatus { 
  valid, 
  duplicate, 
  duplicateCrossItem, 
  invalid, 
  pendingValidation 
}
```

### 6. ProposedOrderModel (Future - Phase 5)

```dart
@collection
class ProposedOrderModel {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String localId;
  int? serverId;
  
  @Index()
  late String sessionLocalId;
  
  late int customerId;
  late int warehouseId;
  
  @Enumerated(EnumType.name)
  late ProposedOrderStatus status;
  
  @Enumerated(EnumType.name)
  late RefillStrategy refillStrategy;
  
  late int totalItems;
  late int totalQuantity;
  late double estimatedTotal;
  late String currency;
  
  String? quotationNumber;
  int? quotationDocEntry;
  String? salesOrderNumber;
  
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  
  @Index()
  @Enumerated(EnumType.name)
  late SyncState syncState;
}

enum ProposedOrderStatus { draft, quoted, sent, accepted, rejected, ordered }
enum RefillStrategy { toMax, toMin }
```

---

## API Integration

### Backend Endpoints

**Base URL:** `/api/v1`

#### Setup & Configuration

| Method | Endpoint | Purpose |
|--------|----------|---------|
| GET | `/agents/{agent_id}/brands` | Get agent's assigned brands |
| GET | `/warehouses?customer_id={id}` | Get customer's warehouses |
| GET | `/product-catalogue?customer_id={id}&brand_id={id}` | Get products for scanning |

#### Session Management

| Method | Endpoint | Purpose |
|--------|----------|---------|
| POST | `/stock-counts` | Start new session |
| GET | `/stock-counts?customer_id={id}&status={status}` | List sessions |
| GET | `/stock-counts/{session_id}` | Get session details |
| POST | `/stock-counts/{session_id}/pause` | Pause session |
| POST | `/stock-counts/{session_id}/resume` | Resume session |
| POST | `/stock-counts/{session_id}/complete` | Complete session |
| POST | `/stock-counts/{session_id}/cancel` | Cancel session |

#### Item Management

| Method | Endpoint | Purpose |
|--------|----------|---------|
| POST | `/stock-counts/{session_id}/items` | Add product to session |
| GET | `/stock-counts/{session_id}/items` | List session items |
| GET | `/stock-counts/{session_id}/items/{item_id}` | Get item details |
| POST | `/stock-counts/{session_id}/items/{item_id}/complete` | Complete item count |
| DELETE | `/stock-counts/{session_id}/items/{item_id}` | Remove item |

#### Serial Scanning

| Method | Endpoint | Purpose |
|--------|----------|---------|
| POST | `/stock-counts/{session_id}/items/{item_id}/serials` | Add single serial |
| POST | `/stock-counts/{session_id}/items/{item_id}/serials/batch` | Batch upload serials |
| GET | `/stock-counts/{session_id}/items/{item_id}/serials` | List serials |
| DELETE | `/stock-counts/{session_id}/items/{item_id}/serials/{serial_id}` | Delete serial |

#### Offline Sync

| Method | Endpoint | Purpose |
|--------|----------|---------|
| POST | `/stock-counts/offline-sync` | Sync offline data |

#### Proposed Orders

| Method | Endpoint | Purpose |
|--------|----------|---------|
| POST | `/stock-counts/{session_id}/proposed-order/generate` | Generate order |
| GET | `/stock-counts/{session_id}/proposed-order/progress/{job_id}` | Poll job status |
| GET | `/stock-counts/{session_id}/proposed-order` | Get proposed order |
| POST | `/stock-counts/{session_id}/proposed-order/send-email` | Send quotation |

### API Request/Response Examples

**Start Session:**
```json
POST /stock-counts
{
  "customer_id": 123,
  "outlet_visit_id": 456,
  "warehouse_id": 1,
  "notes": "Monthly stock count - Display warehouse"
}

Response (201):
{
  "id": 1,
  "customer_id": 123,
  "outlet_visit_id": 456,
  "warehouse_id": 1,
  "sales_agent_id": 5,
  "status": "in_progress",
  "started_at": "2026-02-03T10:00:00Z",
  "total_products_counted": 0,
  "total_serials_scanned": 0
}
```

**Add Product:**
```json
POST /stock-counts/1/items
{
  "customer_product_id": 42
}

Response (201):
{
  "id": 1,
  "stock_count_session_id": 1,
  "customer_product_id": 42,
  "item_code": "TV-55-SAM-001",
  "item_name": "55 inch Smart TV Samsung",
  "counted_quantity": 0,
  "status": "in_progress",
  "min_stock_level": 2,
  "max_stock_level": 10
}
```

**Batch Upload Serials:**
```json
POST /stock-counts/1/items/1/serials/batch
{
  "serials": [
    {
      "serial_number": "SN-2026-ABC123",
      "device_scan_id": "scan-uuid-001",
      "device_scanned_at": "2026-02-03T10:15:00Z",
      "scan_sequence": 1
    },
    {
      "serial_number": "SN-2026-ABC124",
      "device_scan_id": "scan-uuid-002",
      "device_scanned_at": "2026-02-03T10:15:02Z",
      "scan_sequence": 2
    }
  ]
}

Response (202):
{
  "total_submitted": 2,
  "created": 2,
  "duplicates_skipped": 0,
  "cross_item_duplicates": 0,
  "url_rejected": 0,
  "errors": 0,
  "new_total": 2,
  "exceptions": []
}
```

---

## Domain Layer

### Entities

```dart
// warehouse.dart
class Warehouse {
  final int id;
  final String warehouseName;
  final String warehouseCode;
  final String? sapWarehouseCode;
  final WarehouseType warehouseType;
  final String? location;
  final bool isActive;
  
  bool get isDisplay => warehouseType == WarehouseType.display;
  bool get isBackStore => warehouseType == WarehouseType.backStore;
}

// agent_brand.dart
class AgentBrand {
  final int agentId;
  final bool isAllBrands;
  final List<Brand> brands;
  
  bool canAccessBrand(int brandId) {
    return isAllBrands || brands.any((b) => b.id == brandId);
  }
}

class Brand {
  final int id;
  final String name;
  final String code;
}

// stock_take_session.dart
class StockTakeSession {
  final String localId;
  final int? serverId;
  final String visitLocalId;
  final int? visitServerId;
  final int customerId;
  final String outletCode;
  final String outletName;
  final int warehouseId;
  final String warehouseName;
  final WarehouseType warehouseType;
  final int salesAgentId;
  final DateTime startedAt;
  final DateTime? pausedAt;
  final DateTime? completedAt;
  final StockTakeStatus status;
  final int totalProducts;
  final int totalSerials;
  final String? notes;
  final SyncState syncState;
  
  bool get isActive => status == StockTakeStatus.active;
  bool get isPaused => status == StockTakeStatus.paused;
  bool get isCompleted => status == StockTakeStatus.completed;
  bool get canAddItems => isActive || isPaused;
  bool get canSyncToServer => visitServerId != null;
}

// stock_take_item.dart
class StockTakeItem {
  final String localId;
  final int? serverId;
  final String sessionLocalId;
  final int customerProductId;
  final int brandId;
  final String brandName;
  final String itemCode;
  final String itemName;
  final String? itemDescription;
  final int serialCount;
  final int minStockLevel;
  final int maxStockLevel;
  final ItemCountStatus status;
  final DateTime startedAt;
  final DateTime? completedAt;
  
  bool get isCompleted => status == ItemCountStatus.completed;
  bool get isBelowMin => serialCount < minStockLevel;
  bool get isAboveMax => serialCount > maxStockLevel;
  bool get isInRange => serialCount >= minStockLevel && serialCount <= maxStockLevel;
}

// serial_number_entry.dart
class SerialNumberEntry {
  final String localId;
  final int? serverId;
  final String sessionLocalRaw;      // Original input
  final String serialNumberNorm;     // Normalized (uppercase)
  final String deviceScanId;
  final DateTime deviceScannedAt;
  final int? scanSequence;
  final SerialStatus status;
  final String? validationError;
  final DateTime scannedAt;
  
  /// Display-friendly serial number (uses raw)
  String get displaySerial => serialNumberRaws;
  final String? validationError;
  final DateTime scannedAt;
  
  bool get isValid => status == SerialStatus.valid;
  bool get isDuplicate => status == SerialStatus.duplicate || 
                          status == SerialStatus.duplicateCrossItem;
}
```

### Repository Interface

```dart
abstract class StockTakeRepository {
  // Brand & Warehouse
  Future<Either<Failure, AgentBrand>> getAgentBrands(int agentId);
  Future<Either<Failure, List<Warehouse>>> getCustomerWarehouses(int customerId);
  
  // Session Management
  Future<Either<Failure, StockTakeSession>> startSession({
    required int customerId,
    required String visitLocalId,
    int? visitServerId,
    required int warehouseId,
    String? notes,
  });
  
  Future<Either<Failure, List<StockTakeSession>>> getActiveSessions(int customerId);
  Future<Either<Failure, StockTakeSession>> getSession(String sessionLocalId);
  Future<Either<Failure, StockTakeSession>> pauseSession(String sessionLocalId);
  Future<Either<Failure, StockTakeSession>> resumeSession(String sessionLocalId);
  Future<Either<Failure, StockTakeSession>> completeSession(String sessionLocalId);
  Future<Either<Failure, StockTakeSession>> cancelSession(String sessionLocalId, String reason);
  
  // Item Management
  Future<Either<Failure, StockTakeItem>> addProduct({
    required String sessionLocalId,
    required int customerProductId,
  });
  
  Future<Either<Failure, List<StockTakeItem>>> getSessionItems(String sessionLocalId);
  Future<Either<Failure, StockTakeItem>> completeItem(String itemLocalId);
  Future<Either<Failure, void>> deleteItem(String itemLocalId);
  
  // Serial Scanning
  Future<Either<Failure, SerialNumberEntry>> addSerial({
    required String sessionLocalId,
    required String itemLocalId,Raw,
    required String serialNumberNorm
    required String serialNumber,
    required String deviceScanId,
    required DateTime deviceScannedAt,
    int? scanSequence,
  });
  
  Future<Either<Failure, BatchUploadResult>> addSerialsBatch({
    required String sessionLocalId,
    required String itemLocalId,
    required List<SerialScanData> serials,
  });
  
  Future<Either<Failure, List<SerialNumberEntry>>> getItemSerials(String itemLocalId);
  Future<Either<Failure, void>> deleteSerial(String serialLocalId, String reason);
  
  // Validation
  Future<Either<Failure, ValidationResult>> validateSerial(
    String serialNumber,
    String sessionLocalId,
  );
  
  // Sync
  Future<Either<Failure, SyncResult>> syncOfflineData();
  
  // Proposed Orders (Future)
  Future<Either<Failure, String>> generateProposedOrder({
    required String sessionLocalId,
    RefillStrategy strategy = RefillStrategy.toMax,
  });
  
  Future<Either<Failure, ProposedOrder>> getProposedOrder(String sessionLocalId);
}
```

---

## Use Cases

### 1. GetAgentBrands

```dart
class GetAgentBrandsUseCase {
  final StockTakeRepository _repository;
  
  Future<Either<Failure, AgentBrand>> call(int agentId) async {
    return await _repository.getAgentBrands(agentId);
  }
}
```

### 2. GetCustomerWarehouses

```dart
class GetCustomerWarehousesUseCase {
  final StockTakeRepository _repository;
  
  Future<Either<Failure, List<Warehouse>>> call(int customerId) async {
    return await _repository.getCustomerWarehouses(customerId);
  }
}
```

### 3. StartStockTakeSession

```dart
class StartStockTakeSessionUseCase {
  final StockTakeRepository _repository;
  final OutletVisitRepository _visitRepository;
  
  Future<Either<Failure, StockTakeSession>> call({
    required int customerId,
    required int warehouseId,
    String? notes,
  }) async { AND visit
    // Scope check prevents blocking new sessions from old visits
    final existingSessions = await _repository.getActiveSessions(customerId);
    final hasActiveSession = existingSessions.fold(
      (l) => false,
      (sessions) => sessions.any((s) => 
        s.warehouseId == warehouseId && 
        (s.visitLocalId == activeVisit.localId || 
         (s.visitServerId != null && s.visitServerId == activeVisit.serverId)) &&
        (s.isActive || s.isPaused)
      ),
    );
    
    if (hasActiveSession) {
      return Left(ConflictFailure(
        message: 'Active session already exists for this warehouse in current visit'
      ));
    }
    
    // 3. Start new session locally
    // Note: If visitServerId exists and online, repository will POST to server
    // Otherwise, session remains local-only until visit is synced
    return await _repository.startSession(
      customerId: customerId,
      visitLocalId: activeVisit.localId,
      visitServerId: activeVisit.serverady exists for this warehouse'
      ));
    }
    
    // 3. Start new session
    return await _repository.startSession(
      customerId: customerId,
      visitLocalId: activeVisit.localId,
      warehouseId: warehouseId,
      notes: notes,
    );
  }
}
```

### 4. AddProductToSession

```dart
class AddProductToSessionUseCase {
  final StockTakeRepository _repository;
  
  Future<Either<Failure, StockTakeItem>> call({
    required String sessionLocalId,
    required int customerProductId,
    required int productBrandId,
    required AgentBrand agentBrands,
  }) async {
    // 1. Validate agent can access this brand
    if (!agentBrands.canAccessBrand(productBrandId)) {
      return Left(ForbiddenFailure(
        message: 'You do not have access to this brand'
      ));
    }
    
    // 2. Add product to session
    return await _repository.addProduct(
      sessionLocalId: sessionLocalId,
      customerProductId: customerProductId,
    );
  }
}
```

### 5. ValidateSerialNumber

```dart
class ValidateSerialNumberUseCase {
  final StockTakeRepository _repository;
  
  Future<Either<Failure, ValidationResult>> call(
    String serialNumber,
    String sessionLocalId,
  ) async {
    // 1. Check format
    if (!_isValidFormat(serialNumber)) {
      return Right(ValidationResult.invalid(
       Check for barcode (purely numeric 8-13 digits only)
    if (RegExp(r'^\d{8,13}$').hasMatch(serial)) {
      return false; // Reject common barcode formats
    }
    
    // Not a URL
    if (serial.contains('://') || 
        serial.toLowerCase().startsWith('http') ||
        serial.contains('www.')) {
      return false;
    }
    
    // Minimum length
    if (serial.length < 5) return false;
    
    // Alphanumeric with dashes/underscores only
    // Not a URL
    if (serial.contains('://') || serial.toLowerCase().startsWith('http')) {
      return false;
    }
    
    // Minimum length
    if (serial.length < 5) return false;
    
    // Alphanumeric with dashes/underscores
    if (!RegExp(r'^[A-Z0-9\-_]+$', caseSensitive: false).hasMatch(serial)) {
      return false;
    }
    
    return true;
  }
}
```

### 6. AddSerialNumber

```dart
class AddSerialNumberUseCase {
  final ValidateSerialNumberUseCase _validateUseCase;
  final StockTakeRepository _repository;
  
  Future<Either<Failure, SerialNumberEntry>> call({
    required String sessionLocalId,
    required String itemLocalId,
    required String serialNumber,
  }) async {
    // 1. Validate format and uniqueness
    final validation = await _validateUseCase(serialNumber, sessionLocalId);
    
    final validationResult = validation.fold(
      (failure) => null,
      (result) => result,
    );
    
    if (validationRaw: serialNumber.trim(),           // Preserve original
      serialNumberNorm: serialNumber.trim().toUpperCase(), // For uniquenessd) {
      return Left(ValidationFailure(
        message: validationResult?.message ?? 'Validation failed'
      ));
    }
    
    // 2. Add serial to database
    return await _repository.addSerial(
      sessionLocalId: sessionLocalId,
      itemLocalId: itemLocalId,
      serialNumber: serialNumber.toUpperCase(), // Normalize
      deviceScanId: const Uuid().v4(),
      deviceScannedAt: DateTime.now(),
    );
  }
}
```

---

## UI/UX Flows

### Flow 1: Starting a Stock Take Session

```
┌─────────────────────────────────────┐
│   Active Visit Screen               │
│   (Agent clocked into outlet)       │
│                                     │
│   [Start Stock Take] button         │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│   Warehouse Selection Screen        │
│                                     │
│   Customer: ABC Store               │
│   Warehouses available:             │
│                                     │
│   ○ Display Warehouse               │
│   ○ Back Store Warehouse            │
│                                     │
│   [Start Session]                   │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│   Stock Take Dashboard              │
│                                     │
│   Session: Display Warehouse        │
│   Started: 10:00 AM                 │
│   Products: 0                       │
│   Serials: 0                        │
│                                     │
│   [Add Product] [Complete Session]  │
└─────────────────────────────────────┘
```

### Flow 2: Scanning Products and Serials

```
┌─────────────────────────────────────┐
│   Stock Take Dashboard              │
│                                     │
│   [Add Product] clicked             │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│   Product Search Screen             │
│                                     │
│   🔍 Search by name/code            │
│   📷 Scan product barcode           │
│                                     │
│   Filtered by: Agent's brands       │
│                                     │
│   Results:                          │
│   • Samsung 55" TV (SAM-001)        │
│   • Samsung 65" TV (SAM-002)        │
└──────────────┬──────────────────────┘
               │ (Product selected)
               ▼
┌─────────────────────────────────────┐
│   Serial Scanner Screen             │
│                                     │
│   Product: Samsung 55" TV           │
│   Min: 5 | Max: 20                  │
│   ────────────────────────────      │
│   Current: 0 serials                │
│                                     │
│   📷 Camera view                    │
│   OR                                │
│   ⌨️ Manual input: [________]       │
│                                     │
│   Scanned serials:                  │
│   ✓ SN-2026-ABC123                  │
│   ✓ SN-2026-ABC124                  │
│   ✗ SN-2026-ABC125 (duplicate)      │
│                                     │
│   [Done] [Cancel]                   │
└─────────────────────────────────────┘
```

### Flow 3: Session Completion and Order Generation

```
┌─────────────────────────────────────┐
│   Stock Take Dashboard              │
│                                     │
│   Products: 5 (all completed)       │
│   Serials: 47                       │
│                                     │
│   [Complete Session] clicked        │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│   Confirmation Dialog               │
│                                     │
│   Complete stock take session?      │
│                                     │
│   • 5 products counted              │
│   • 47 serial numbers scanned       │
│                                     │
│   [Cancel] [Complete]               │
└──────────────┬──────────────────────┘
               │ (Complete clicked)
               ▼
┌─────────────────────────────────────┐
│   Session Completed                 │
│                                     │
│   ✓ Session completed successfully  │
│                                     │
│   [Generate Order] [View Details]   │
└──────────────┬──────────────────────┘
               │ (Generate Order)
               ▼
┌─────────────────────────────────────┐
│   Order Generation Progress         │
│                                     │
│   Calculating replenishment...      │
│   ████████░░░░░░░░░░ 45%            │
│                                     │
│   Processing item 3 of 5            │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│   Proposed Order Screen             │
│                                     │
│   Total Items: 3                    │
│   Total Quantity: 23 units          │
│   Estimated: KES 145,000            │
│                                     │
│   Samsung 55" TV                    │
│   Current: 8 | Min: 5 | Max: 20     │
│   Order: 12 units                   │
│                                     │
│   [Send Quotation] [Edit]           │
└─────────────────────────────────────┘
```

---

## Validation Rules

### Serial Number Validation

```dart
class SerialNumberValidator {
  /// Validates serial number format
  static ValidationResult validateFormat(String serial) {
    // Remove whitespace
    serial = serial.trim(); only)
    if (RegExp(r'^\d{8,13}$').hasMatch(serial)) {
      return ValidationResult.invalid('Barcodes not allowed (8-13 digit numbers)
    if (serial.length < 5) {
      return ValidationResult.invalid('Serial too short (min 5 characters)');
    }
    
    if (serial.length > 100) {
      return ValidationResult.invalid('Serial too long (max 100 characters)');
    }
    
    // Check for barcode (purely numeric 8-13 digits)
    if (RegExp(r'^\d{8,13}$').hasMatch(serial)) {
      return ValidationResult.invalid('Barcodes not allowed');
    }
    
    // Check for URL
    if (serial.toLowerCase().startsWith('http') || 
        serial.contains('://') ||
        serial.contains('www.')) {
      return ValidationResult.invalid('URLs not allowed');
    }
    
    // Check allowed characters (alphanumeric + dash + underscore)
    if (!RegExp(r'^[A-Z0-9\-_]+$', caseSensitive: false).hasMatch(serial)) {
      return ValidationResult.invalid(
        'Only letters, numbers, dashes and underscores allowed'
      );
    }
    
    return ValidationResult.valid();
  }
  
  /// Checks for duplicate in session
  statiNormalize for comparison
    final normalizedSerial = serial.trim().toUpperCase();
    
    final existing = await isar.serialNumberEntryModels
        .filter()
        .sessionLocalIdEqualTo(sessionLocalId)
        .serialNumberNormEqualTo(normalizedSerial
    
    final existing = await isar.serialNumberEntryModels
        .filter()
        .sessionLocalIdEqualTo(sessionLocalId)
        .serialNumberEqualTo(normalizedSerial, caseSensitive: false)
        .findFirst();
    
    if (existing != null) {
      return ValidationResult.duplicate('Serial already scanned in this session');
    }
    
    return ValidationResult.valid();
  }
  
  /// Checks for cross-item duplicate
  static Future<ValidationResult> checkCrossItemDuplicate(
    Isar isar,rim().toUpperCase();
    
    final existing = await isar.serialNumberEntryModels
        .filter()
        .sessionLocalIdEqualTo(sessionLocalId)
        .serialNumberNormEqualTo(normalizedSerial
    
    final existing = await isar.serialNumberEntryModels
        .filter()
        .sessionLocalIdEqualTo(sessionLocalId)
        .serialNumberEqualTo(normalizedSerial, caseSensitive: false)
        .findFirst();
    
    if (existing != null && existing.itemLocalId != currentItemLocalId) {
      return ValidationResult.duplicateCrossItem(
        'Serial scanned under different product'
      );
    }
    
    return ValidationResult.valid();
  }
}

class ValidationResult {
  final bool isValid;
  final String? message;
  final ValidationType type;
  
  ValidationResult.valid() 
      : isValid = true, 
        message = null, 
        type = ValidationType.valid;
  
  ValidationResult.invalid(this.message) 
      : isValid = false, 
        type = ValidationType.invalid;
  
  ValidationResult.duplicate(this.message) 
      : isValid = false, 
        type = ValidationType.duplicate;
  
  ValidationResult.duplicateCrossItem(this.message) 
      : isValid = false, 
        type = ValidationType.duplicateCrossItem;
}

enum ValidationType { 
  valid, 
  invalid, 
  duplicate, 
  duplicateCrossItem 
}
```

---

## State Management

### Riverpod Providers

```dart
// Agent brands (cached)
@riverpod
Future<AgentBrand> agentBrands(Ref ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) throw Exception('Not authenticated');
  
  final repository = ref.watch(stockTakeRepositoryProvider);
  final result = await repository.getAgentBrands(user.id);
  
  return result.fold(
    (failure) => throw failure,
    (brands) => brands,
  );
}

// Customer warehouses
@riverpod
Future<List<Warehouse>> customerWarehouses(Ref ref, int customerId) async {
  final repository = ref.watch(stockTakeRepositoryProvider);
  final result = await repository.getCustomerWarehouses(customerId);
  
  return result.fold(
    (failure) => throw failure,
    (warehouses) => warehouses,
  );
}

// Active sessions for customer
@riverpod
Future<List<StockTakeSession>> activeSessions(Ref ref, int customerId) async {
  final repository = ref.watch(stockTakeRepositoryProvider);
  final result = await repository.getActiveSessions(customerId);
  
  return result.fold(
    (failure) => throw failure,
    (sessions) => sessions,
  );
}

// Current session
@riverpod
class CurrentStockTakeSession extends _$CurrentStockTakeSession {
  @override
  FutureOr<StockTakeSession?> build() async {
    // Return null initially, set when session started
    return null;
  }
  
  Future<void> startSession({
    required int customerId,
    required int warehouseId,
    String? notes,
  }) async {
    state = const AsyncLoading();
    
    final useCase = ref.read(startStockTakeSessionUseCaseProvider);
    final result = await useCase(
      customerId: customerId,
      warehouseId: warehouseId,
      notes: notes,
    );
    
    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (session) => AsyncData(session),
    );
  }
  
  Future<void> pauseSession() async {
    final session = state.value;
    if (session == null) return;
    
    state = const AsyncLoading();
    
    final repository = ref.read(stockTakeRepositoryProvider);
    final result = await repository.pauseSession(session.localId);
    
    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (updated) => AsyncData(updated),
    );
  }
  
  Future<void> resumeSession() async {
    final session = state.value;
    if (session == null) return;
    
    state = const AsyncLoading();
    
    final repository = ref.read(stockTakeRepositoryProvider);
    final result = await repository.resumeSession(session.localId);
    
    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (updated) => AsyncData(updated),
    );
  }
  
  Future<void> completeSession() async {
    final session = state.value;
    if (session == null) return;
    
    state = const AsyncLoading();
    
    final repository = ref.read(stockTakeRepositoryProvider);
    final result = await repository.completeSession(session.localId);
    
    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (updated) => AsyncData(updated),
    );
    
    // Invalidate active sessions
    ref.invalidate(activeSessionsProvider);
  }
}

// Session items
@riverpod
class SessionItems extends _$SessionItems {
  @override
  FutureOr<List<StockTakeItem>> build(String sessionLocalId) async {
    final repository = ref.watch(stockTakeRepositoryProvider);
    final result = await repository.getSessionItems(sessionLocalId);
    
    return result.fold(
      (failure) => throw failure,
      (items) => items,
    );
  }
  
  Future<void> addProduct(int customerProductId) async {
    final repository = ref.read(stockTakeRepositoryProvider);
    final agentBrands = await ref.read(agentBrandsProvider.future);
    
    // Will validate brand access in use case
    final useCase = ref.read(addProductToSessionUseCaseProvider);
    final result = await useCase(
      sessionLocalId: sessionLocalId,
      customerProductId: customerProductId,
      agentBrands: agentBrands,
    );
    
    result.fold(
      (failure) => throw failure,
      (_) => ref.invalidateSelf(), // Refresh list
    );
  }
}

// Item serials
@riverpod
class ItemSerials extends _$ItemSerials {
  @override
  FutureOr<List<SerialNumberEntry>> build(String itemLocalId) async {
    final repository = ref.watch(stockTakeRepositoryProvider);
    final result = await repository.getItemSerials(itemLocalId);
    
    return result.fold(
      (failure) => throw failure,
      (serials) => serials,
    );
  }
  
  Future<void> addSerial({
    required String sessionLocalId,
    required String serialNumber,
  }) async {
    final useCase = ref.read(addSerialNumberUseCaseProvider);
    final result = await useCase(
      sessionLocalId: sessionLocalId,
      itemLocalId: itemLocalId,
      serialNumber: serialNumber,
    );
    
    result.fold(
      (failure) => throw failure,
      (_) {
        ref.invalidateSelf(); // Refresh list
        // Update session totals
        ref.invalidate(currentStockTakeSessionProvider);
      },
    );
  }
}
```

---

## Offline Support

### Sync Strategy

**Local-First Operations:**
1. Event-driven sync with exponential backoff
4. Manual sync option available

**Sync Triggers:**
- Connectivity restored (online event)
- Session paused/completed
- Item completed
- Queue size exceeds 200 items
- Periodic check every 2-5 minutes (only if queue not empty)
- Manual sync button
3. Background sync attempts every 30 seconds
4. Manual sync option available

**Sync Queue:**
```dart
@collection
class SyncQueueModel {
  Id id = Isar.autoIncrement;
  
  @Enumerated(EnumType.name)
  late SyncOperation operation;    // session_start, item_add, serial_batch
  
  late String entityType;          // session, item, serial
  late String entityLocalId;
  
  late String payload;             // JSON data
  
  late int retryCount;
  late int maxRetries;
  
  DateTime createdAt = DateTime.now();
  DateTime? lastAttemptAt;
  
  @Index()
  @Enumerated(EnumType.name)
  late SyncStatus status;          // pending, syncing, synced, failed
  
  String? errorMessage;
}

enum SyncOperation { 
  sessionStart, 
  sessionPause, 
  sessionResume,
  sessionComplete,
  itemAdd, 
  itemComplete,
  serialSingle,
  serialBatch 
}
```

**Batch Sync Logic:**
```dart
class OfflineSyncService {
  final Isar _isar;
  final StockTakeRemoteDataSource _remoteDataSource;
  
  Future<SyncResult> syncPendingOperations() async {
    final pending = await _isar.syncQueueModels
        .filter()
        .statusEqualTo(SyncStatus.pending)
        .or()
        .statusEqualTo(SyncStatus.failed)
        .and()
        .retryCountLessThan(maxRetries)
        .sortByCreatedAt()
        .findAll();
    
    int synced = 0;
    int failed = 0;
    
    for (final operation in pending) {
      try {
        await _syncOperation(operation);
        
        operation.status = SyncStatus.synced;
        operation.lastAttemptAt = DateTime.now();
        await _isar.writeTxn(() => _isar.syncQueueModels.put(operation));
        
        synced++;
      } catch (e) {
        operation.status = SyncStatus.failed;
        operation.retryCount++;
        operation.errorMessage = e.toString();
        operation.lastAttemptAt = DateTime.now();
        await _isar.writeTxn(() => _isar.syncQueueModels.put(operation));
        
        failed++;
      }
    }
    
    return SyncResult(synced: synced, failed: failed, pending: pending.length);
  }
  
  Future<void> _syncOperation(SyncQueueModel operation) async {
    final payload = jsonDecode(operation.payload);
    
    switch (operation.operation) {
      case SyncOperation.serialBatch:
        await _remoteDataSource.batchUploadSerials(
          sessionId: payload['session_id'],
          itemId: payload['item_id'],
          serials: payload['serials'],
        );
        break;
      // ... other operations
    }
  }
} with normalized fields)
- [ ] Add `salesAgentId` to session model
- [ ] Add `serialNumberRaw` + `serialNumberNorm` to serial model
- [ ] Implement local datasource with case-insensitive queries
- [ ] Implement remote datasource with API integration
- [ ] Add visit dependency checks (`visitServerId` validation)
- [ ] Create domain entities with `canSyncToServer` helpers
- [ ] Implement repository (offline-first pattern)
- [ ] Write repository unit tests

**Deliverables:**
- Fully functional data layer
- Visit dependency resolution logic
- Normalized serial uniqueness working
**Tasks:**
- [ ] Create Isar collections (7 models)
- [ ] Implement local datasource
- [ ] Implement remote datasource with API integration
- [ ] Create domain entities
- [ ] Implement repository (offline-first pattern)
- [ ] Write repository unit tests

**Deliverables:**
- Fully functional data layer
- 80%+ test coverage
- Documentation for API integration

### Phase 2: Domain Logic (Days 4-5)

**Tasks:**
- [ ] Implement all use cases (13 use cases)
- [ ] Add validation logic
- [ ] Create value objects
- [ ] Write use case tests

**Deliverables:**
- Complete business logic layer
- Validation rules implemented
- All use cases tested

### Phase 3: State Management (Days 6-7)

**Tasks:**
- [ ] Create Riverpod providers
- [ ] Implement state notifiers
- [ ] Add provider tests
- [ ] Setup dependency injection

**Deliverables:**
- Complete provider layer
- State management tested
- Provider documentation

### Phase 4: UI - Session Management (Days 8-10)

**Tasks:**
- [ ] Stock take dashboard screen
- [ ] Warehouse selection screen
- [ ] Session active screen
- [ ] Pause/resume functionality
- [ ] Session completion flow

**Deliverables:**
- Session management UI complete
- Navigation setup
- Widget tests

### Phase 5: UI - Product & Serial Scanning (Days 11-14)

**Tasks:**
- [ ] Product search screen
- [ ] Camera scanner integration
- [ ] Serial scanner screen
- [ ] Manual input with validation
- [ ] Real-time duplicate detection
- [ ] Serial list with delete

**Dependencies:**
- `mobile_scanner: ^5.0.0`

**Deliverables:**
- Complete scanning UI
- Camera integration working
- Validation feedback live

### Phase 6: UI - Order Generation (Days 15-17)

**Tasks:** with priority ordering
- [ ] Event-driven sync triggers (connectivity, user actions, queue threshold)
- [ ] Exponential backoff on failures (reuse existing pattern)
- [ ] Visit dependency resolution (wait for `visitServerId`)
- [ ] Batch response mapping to local statuses
- [ ] Connectivity monitoring integration
- [ ] Conflict resolution
- [ ] Idempotency key generation per request

**Deliverables:**
- Offline support working with event-driven sync (not fixed interval)
- Dependency resolution tested (session waits for visit sync)
- Sync status indicators with proper error states
- Error recovery with exponential backoffegrated
- Order review workflow

### Phase 7: Offline Sync (Days 18-19)

**Tasks:**
- [ ] Sync queue implementation
- [ ] Background sync service
- [ ] Connectivity monitoring
- [ ] Conflict resolution
- [ ] Retry logic

**Deliverables:**
- Offline support working
- Sync status indicators
- Error recovery tested

### Phase 8: Testing & Polish (Days 20-22)

**Tasks:**
- [ ] End-to-end testing
- [ ] Performance optimization
- [ ] Error handling refinement
- [ ] UI polish
- [ ] Documentation

**Deliverables:**
- Production-ready feature
- Complete documentation
- Test coverage >85%

---

## Success Criteria

### Functional Requirements

- ✅ Agent can only start session when clocked in
- ✅ Agent can select warehouse type (display/back store)
- ✅ Agent can only scan products from assigned brands
- ✅ Serial numbers validated (no duplicates, no barcodes, no URLs)
- ✅ Session can be paused and resumed
- ✅ Multiple sessions can run in parallel (different warehouses)
- ✅ Proposed order generated with min/max logic
- ✅ Offline scanning with background sync

### Non-Functional Requirements
Backend Alignment Notes

### Status Mapping
 *(Current: delete only, with reason)*
3. **Photo Evidence:** Require photo of serial number sticker?
4. **Server ID Blocking:** Should app prevent serial scanning until item has `serverId`, or queue locally? *(Current: queue locally)*
5. **Multiple Agents:** Can multiple agents count same outlet simultaneously? *(Current: blocked by visit scope)*
6. **Numeric Serials:** Are numeric serials outside 8-13 digits valid? *(Current: allowed if not in 8-13 range)*
- `completed`
- `cancelled`

**Mobile enums:**
```dart
enum StockTakeStatus { active, paused, completed, cancelled }
enum SyncState { pending, syncing, synced, failed }
```

**Critical:** Never mix business status with sync state. Keep them separate.

### Visit Dependency Resolution

1. Session created locally immediately (offline-first)
2. If `visitServerId != null` and online → POST to `/stock-counts` now
3. If `visitServerId == null` → queue as `SyncOperation.sessionStart`
4. Queue processes after visit sync completes and provides `visitServerId`

### API Preferences

- Use `GET /agents/me/brands` (JWT-based) instead of `/agents/{id}/brands`
- All entities include `local_id` + `device_id` for idempotency
- Server validates product catalogue access (mobile check is UX optimization only)

### Batch Upload Behavior

After batch response:
- Mark uploaded serials as `SyncState.synced`
- If backend reports duplicates → update local `SerialStatus` + `validationError`
- **Do not delete** rejected serials (agents need visibility)

### Sync Strategy

**Event-driven with backoff** (not fixed interval):
- Connectivity events
- User actions (pause/complete)
- Queue threshold (> 200 items)
- Periodic check (2-5 min) only if queue non-empty
- Exponential backoff on failures

### Serial Uniqueness

- Store both `serialNumberRaw` (original) and `serialNumberNorm` (uppercase)
- Apply unique index on `serialNumberNorm + sessionLocalId`
- Display uses raw, queries use normalized

---

## 
- ⚡ Serial validation < 100ms
- 📱 Offline mode supports 500+ scans
- 🔄 Sync completes within 5 seconds (100 serials)
- 📊 Database queries < 50ms
- 💾 Efficient storage (< 1MB per session)
- 🎯 Barcode scan success rate > 95%

---

## Open Questions

1. **Session Timeout:** Should inactive sessions auto-pause after X minutes?
2. **Serial Edit:** Can agents edit/delete serials after scanning?
3. **Photo Evidence:** Require photo of serial number sticker?
4. **Partial Sync:** Sync session incrementally or wait for completion?
5. **Multiple Agents:** Can multiple agents count same outlet simultaneously?

---

## Notes

- Use `mobile_scanner` package for camera scanning
- Leverage existing `OutletVisit` data for validation
- Reuse authentication and sync patterns from daily_route module
- Consider adding analytics for scan performance metrics

---

**Document Owner:** Development Team  
**Last Updated:** February 3, 2026  
**Next Review:** After Phase 1 completion
