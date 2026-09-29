import 'package:fpdart/fpdart.dart';
import '../../../../core/core.dart';
import '../../data/models/proposed_order_model.dart';
import '../entities/entities.dart';

// Re-export proposed order types for consumers
export '../../data/models/proposed_order_model.dart'
    show
        RefillStrategy,
        ProposedOrderJobResponse,
        ProposedOrderProgressResponse,
        ProposedOrderDetail,
        ProposedOrderStatus,
        ProposedOrderLineItem,
        ConvertToSalesOrderResult;

/// Serial scan data for batch uploads
class SerialScanData {
  final String serialNumber;
  final String deviceScanId;
  final DateTime deviceScannedAt;
  final int? scanSequence;

  const SerialScanData({
    required this.serialNumber,
    required this.deviceScanId,
    required this.deviceScannedAt,
    this.scanSequence,
  });
}

/// Batch upload result
class BatchUploadResult {
  final int totalSubmitted;
  final int created;
  final int duplicatesSkipped;
  final int crossItemDuplicates;
  final int urlRejected;
  final int errors;
  final int newTotal;
  final List<SerialException> exceptions;

  const BatchUploadResult({
    required this.totalSubmitted,
    required this.created,
    required this.duplicatesSkipped,
    required this.crossItemDuplicates,
    required this.urlRejected,
    required this.errors,
    required this.newTotal,
    required this.exceptions,
  });

  bool get hasErrors => errors > 0 || exceptions.isNotEmpty;
  bool get allSucceeded => created == totalSubmitted;
}

/// Serial exception details
class SerialException {
  final String serialNumber;
  final SerialStatus status;
  final String message;

  const SerialException({
    required this.serialNumber,
    required this.status,
    required this.message,
  });
}

/// Sync result
class SyncResult {
  final int synced;
  final int failed;
  final int pending;
  final List<String> errors;

  const SyncResult({
    required this.synced,
    required this.failed,
    required this.pending,
    this.errors = const [],
  });

  bool get hasErrors => failed > 0 || errors.isNotEmpty;
  bool get allSynced => pending == 0 && failed == 0;
}

/// Validation result
class ValidationResult {
  final bool isValid;
  final String? message;
  final ValidationType type;

  const ValidationResult._({
    required this.isValid,
    this.message,
    required this.type,
  });

  factory ValidationResult.valid() =>
      const ValidationResult._(isValid: true, type: ValidationType.valid);

  factory ValidationResult.invalid(String message) => ValidationResult._(
    isValid: false,
    message: message,
    type: ValidationType.invalid,
  );

  factory ValidationResult.duplicate(String message) => ValidationResult._(
    isValid: false,
    message: message,
    type: ValidationType.duplicate,
  );

  factory ValidationResult.duplicateCrossItem(String message) =>
      ValidationResult._(
        isValid: false,
        message: message,
        type: ValidationType.duplicateCrossItem,
      );
}

/// Validation type
enum ValidationType { valid, invalid, duplicate, duplicateCrossItem }

/// Stock take repository interface
abstract class StockTakeRepository {
  // Brand & Warehouse
  Future<Either<Failure, AgentBrand>> getAgentBrands(int agentId);
  Future<Either<Failure, List<Warehouse>>> getCustomerWarehouses(
    int customerId,
  );

  /// Get current agent's global brand assignments
  Future<Either<Failure, AgentBrand>> getMyBrands();

  /// Get agent's brands for the active stock count session
  Future<Either<Failure, AgentBrand>> getActiveSessionBrands();

  /// Get agent's customer-specific brands for the active stock count session
  Future<Either<Failure, AgentCustomerBrands>> getActiveSessionCustomerBrands();

  /// Get agent's brands for a specific customer
  Future<Either<Failure, AgentCustomerBrands>> getMyBrandsForCustomer(
    int customerId,
  );

  // Customer Products (Catalogue)
  /// Uses the /product-catalogue endpoint, scoped to [customerId] only -
  /// unlike [getActiveSessionCatalogue]/[findProductByBarcode]/
  /// [searchProducts], this doesn't require an active stock take session,
  /// so it's the right choice for callers (e.g. Daily Sales) that need an
  /// outlet's catalogue independent of any stock count in progress.
  Future<Either<Failure, List<CustomerProduct>>> getCustomerProducts(
    int customerId, {
    int? brandId,
    String? search,
    int page = 1,
    int size = 100,
  });

  /// Get products catalogue for the active stock take session
  /// Uses the /stock-counts/me/active/catalogue endpoint which includes barcode
  Future<Either<Failure, List<CustomerProduct>>> getActiveSessionCatalogue({
    String? search,
    String? itemCode,
    String? itemName,
    String? barcode,
    String? itemGroup,
    String? itemSubGroup2,
    String? itemSubGroup3,
    String? modelNumber,
    String? productStatus,
    int? brandId,
    int page = 1,
    int size = 200,
  });

  /// Search for a product by barcode against the live, session-scoped
  /// catalogue. Not cached locally - always hits the backend.
  Future<Either<Failure, CustomerProduct?>> findProductByBarcode(
    String barcode,
  );

  /// Search for products against the live, session-scoped catalogue.
  /// Not cached locally - always hits the backend.
  Future<Either<Failure, List<CustomerProduct>>> searchProducts(
    String searchTerm,
  );

  // Session Management
  Future<Either<Failure, StockTakeSession>> startSession({
    required int customerId,
    required String visitLocalId,
    int? visitServerId,
    required int warehouseId,
    String? notes,
  });

  /// Get active/paused sessions for a customer (any visit, any day) —
  /// a session isn't hidden just because it was started on an earlier
  /// visit; the agent sees and resumes it explicitly instead.
  Future<Either<Failure, List<StockTakeSession>>> getActiveSessions(
    int customerId,
  );

  /// Get all active sessions (any customer, any visit)
  /// Used to find resumable sessions after logout/login.
  Future<Either<Failure, List<StockTakeSession>>> getAllActiveSessions();

  /// Get completed sessions for a customer within a date range
  Future<Either<Failure, List<StockTakeSession>>> getCompletedSessions(
    int customerId, {
    DateTime? since,
  });

  /// Fetch today's sessions from backend and sync to local storage
  /// Returns completed sessions for the specified customer from today
  Future<Either<Failure, List<StockTakeSession>>> fetchTodaysSessions(
    int customerId,
  );

  Future<Either<Failure, StockTakeSession>> getSession(String sessionLocalId);

  /// Re-validate a cached session against the backend's current state
  /// before trusting it as resumable (e.g. before opening its counting
  /// screen). Sessions are day-scoped server-side and get auto-cancelled
  /// there if left open past midnight; unlike [getSession], this checks
  /// with the backend rather than trusting whatever is cached locally.
  Future<Either<Failure, StockTakeSession>> validateSession(
    String sessionLocalId,
  );

  Future<Either<Failure, StockTakeSession>> pauseSession(String sessionLocalId);

  Future<Either<Failure, StockTakeSession>> resumeSession(
    String sessionLocalId,
  );

  Future<Either<Failure, StockTakeSession>> completeSession(
    String sessionLocalId,
  );

  /// Sync all pending items and serials to server without completing the session
  Future<Either<Failure, int>> syncSessionItems(String sessionLocalId);

  Future<Either<Failure, StockTakeSession>> cancelSession(
    String sessionLocalId,
    String reason,
  );

  // Item Management
  /// Adds [product] to the session. The full product (not just its id) is
  /// required because products are no longer cached locally - the caller
  /// already has it in memory from a live search/barcode lookup, and it's
  /// used to populate the item's denormalized fields without a network
  /// round trip, preserving offline-add support.
  Future<Either<Failure, StockTakeItem>> addProduct({
    required String sessionLocalId,
    required CustomerProduct product,
  });

  Future<Either<Failure, List<StockTakeItem>>> getSessionItems(
    String sessionLocalId,
  );

  Future<Either<Failure, StockTakeItem>> getItem(String itemLocalId);

  Future<Either<Failure, StockTakeItem>> completeItem(String itemLocalId);

  Future<Either<Failure, void>> deleteItem(String itemLocalId);

  // Serial Scanning
  Future<Either<Failure, SerialNumberEntry>> addSerial({
    required String sessionLocalId,
    required String itemLocalId,
    required String serialNumberRaw,
    required String serialNumberNorm,
    required String deviceScanId,
    required DateTime deviceScannedAt,
    int? scanSequence,
  });

  Future<Either<Failure, BatchUploadResult>> addSerialsBatch({
    required String sessionLocalId,
    required String itemLocalId,
    required List<SerialScanData> serials,
  });

  Future<Either<Failure, List<SerialNumberEntry>>> getItemSerials(
    String itemLocalId,
  );

  Future<Either<Failure, void>> deleteSerial(
    String serialLocalId,
    String reason,
  );

  /// Pushes an item's pending (unsynced) serials to the server immediately,
  /// rather than waiting for session completion - e.g. when the user taps
  /// "Done" on the serial-scan screen. If the session or item hasn't synced
  /// to the server yet, this is a no-op: the normal completion/background
  /// sync flow will pick these serials up once it has.
  Future<Either<Failure, void>> syncItemSerials(String itemLocalId);

  // Validation
  Future<Either<Failure, ValidationResult>> validateSerial(
    String serialNumber,
    String sessionLocalId,
  );

  // Sync
  Future<Either<Failure, SyncResult>> syncOfflineData();

  // Proposed Orders
  /// Generate a proposed order for a visit after all stock take sessions are completed
  Future<Either<Failure, ProposedOrderJobResponse>> generateProposedOrder({
    required int visitId,
    RefillStrategy strategy,
    bool notifyOnComplete,
    String? customerEmail,
    bool autoSendEmail,
  });

  /// Get the progress of a proposed order generation job
  Future<Either<Failure, ProposedOrderProgressResponse>>
  getProposedOrderProgress({required int visitId, required String jobId});

  /// Get proposed order detail for a visit
  /// GET /visits/{visit_id}/proposed-order
  Future<Either<Failure, ProposedOrderDetail>> getProposedOrderDetail({
    required int visitId,
  });

  /// Generate PDF for a proposed order (background task)
  /// POST /visits/{visit_id}/proposed-order/generate-pdf
  Future<Either<Failure, ProposedOrderJobResponse>> generateProposedOrderPdf({
    required int visitId,
  });

  /// Download the generated PDF for a proposed order
  /// GET /visits/{visit_id}/proposed-order/download-pdf
  Future<Either<Failure, List<int>>> downloadProposedOrderPdf({
    required int visitId,
  });

  /// Get PDF generation progress
  /// GET /visits/{visit_id}/proposed-order/pdf-progress/{job_id}
  Future<Either<Failure, ProposedOrderProgressResponse>>
  getProposedOrderPdfProgress({required int visitId, required String jobId});

  /// Convert a proposed order into a real sales order
  /// POST /proposed-orders/{order_id}/convert-to-order
  Future<Either<Failure, ConvertToSalesOrderResult>>
  convertProposedOrderToSalesOrder({required int orderId, String? notes});
}
