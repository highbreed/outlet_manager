import 'package:dio/dio.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_exceptions.dart';
import '../models/models.dart';

/// Remote data source for stock take API integration
class StockTakeRemoteDataSource {
  final Dio _dio;

  const StockTakeRemoteDataSource(this._dio);

  // ============================================================================
  // Brands
  // ============================================================================

  /// Fetch agent brands from server
  /// GET /agents/{agent_id}/brands
  Future<AgentBrandModel> fetchAgentBrands(int agentId) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.agents}/$agentId${ApiEndpoints.agentBrands}',
      );

      return AgentBrandModel.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Fetch current agent's global brands
  /// GET /brands/me
  Future<AgentBrandModel> fetchMyBrands() async {
    try {
      final response = await _dio.get(ApiEndpoints.brandsMe);
      return AgentBrandModel.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Fetch agent's brands for active stock count session
  /// GET /stock-counts/me/active/brands
  Future<AgentBrandModel> fetchActiveSessionBrands() async {
    try {
      final response = await _dio.get(ApiEndpoints.stockCountsMyActiveBrands);
      return AgentBrandModel.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Fetch agent's customer-specific brands for active stock count session
  /// GET /stock-counts/me/active/customer-brands
  Future<AgentCustomerBrandsResponse> fetchActiveSessionCustomerBrands() async {
    try {
      final response = await _dio.get(
        ApiEndpoints.stockCountsMyActiveCustomerBrands,
      );
      return AgentCustomerBrandsResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Fetch agent's brands for a specific customer
  /// GET /brands/me/customers/{customer_id}
  Future<AgentCustomerBrandsResponse> fetchMyBrandsForCustomer(
    int customerId,
  ) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.brandsMeCustomers}/$customerId',
      );
      return AgentCustomerBrandsResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  // ============================================================================
  // Warehouses
  // ============================================================================

  /// Fetch warehouses from server
  /// GET /warehouses
  Future<List<WarehouseModel>> fetchWarehouses({int? customerId}) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.warehouses,
        queryParameters: {if (customerId != null) 'customer_id': customerId},
      );

      // API returns paginated response with 'items' array
      final List<dynamic> data =
          response.data['items'] ?? response.data['warehouses'] ?? [];
      return data.map((json) => WarehouseModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Alias for backward compatibility
  Future<List<WarehouseModel>> fetchCustomerWarehouses(int customerId) async {
    return fetchWarehouses(customerId: customerId);
  }

  // ============================================================================
  // Product Catalogue
  // ============================================================================

  /// Fetch customer product catalogue
  /// GET /product-catalogue?customer_id={customer_id}
  Future<List<CustomerProductModel>> fetchCustomerProducts({
    required int customerId,
    int? brandId,
    String? search,
    int page = 1,
    int size = 100,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.productCatalogue,
        queryParameters: {
          'customer_id': customerId,
          if (brandId != null) 'brand_id': brandId,
          if (search != null) 'search': search,
          'page': page,
          'size': size,
        },
      );

      final List<dynamic> data = response.data['items'] ?? [];
      return data.map((json) => CustomerProductModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Fetch product catalogue for active stock take session
  /// GET /stock-counts/me/active/catalogue
  /// Returns paginated list of products for the customer with active session
  Future<List<CustomerProductModel>> fetchActiveSessionCatalogue({
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
    int size = 100,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.stockCountsMyActiveCatalogue,
        queryParameters: {
          if (search != null && search.isNotEmpty) 'search': search,
          if (itemCode != null && itemCode.isNotEmpty) 'item_code': itemCode,
          if (itemName != null && itemName.isNotEmpty) 'item_name': itemName,
          if (barcode != null && barcode.isNotEmpty) 'barcode': barcode,
          if (itemGroup != null && itemGroup.isNotEmpty)
            'item_group': itemGroup,
          if (itemSubGroup2 != null && itemSubGroup2.isNotEmpty)
            'item_sub_group_2': itemSubGroup2,
          if (itemSubGroup3 != null && itemSubGroup3.isNotEmpty)
            'item_sub_group_3': itemSubGroup3,
          if (modelNumber != null && modelNumber.isNotEmpty)
            'model_number': modelNumber,
          if (productStatus != null && productStatus.isNotEmpty)
            'product_status': productStatus,
          if (brandId != null) 'brand_id': brandId,
          'page': page,
          'size': size,
        },
      );

      final List<dynamic> data = response.data['items'] ?? [];
      return data.map((json) => CustomerProductModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  // ============================================================================
  // Sessions
  // ============================================================================

  /// Get current user's active stock take session
  /// GET /stock-counts/me/active
  /// Returns null if no active session
  Future<Map<String, dynamic>?> getMyActiveSession() async {
    try {
      final response = await _dio.get(ApiEndpoints.stockCountsMyActive);
      return response.data;
    } on DioException catch (e) {
      // 404 means no active session - not an error
      if (e.response?.statusCode == 404) {
        return null;
      }
      throw NetworkException.fromDioException(e);
    }
  }

  /// Validate a cached session against the backend's current state.
  /// GET /stock-counts/{session_id}/validate
  ///
  /// Sessions are day-scoped server-side: if this agent never completed a
  /// session before midnight, the backend auto-cancels it the next time
  /// anything asks about it and reports that as this call's result (status
  /// `cancelled`, `partial_reason` starting with "Carried over from"). The
  /// app has no other way to learn that a session it still has cached as
  /// active/paused was closed out from under it.
  ///
  /// Returns null if the session doesn't exist, or belongs to a different
  /// agent (both cases the backend reports as a 404 to avoid confirming
  /// another agent's session ID exists) - treat that the same as "no longer
  /// valid, drop it".
  Future<Map<String, dynamic>?> validateSession(int sessionId) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.stockCounts}/$sessionId/validate',
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      throw NetworkException.fromDioException(e);
    }
  }

  /// Get today's stock take sessions for the current user's route
  /// GET /visits/routes/today/sessions
  /// Returns list of sessions created today for visits on the user's route
  Future<List<Map<String, dynamic>>> getTodaysSessions() async {
    try {
      final response = await _dio.get(ApiEndpoints.visitsTodaySessions);
      final List<dynamic> data = response.data ?? [];
      return data.cast<Map<String, dynamic>>();
    } on DioException catch (e) {
      // 404 means no sessions - return empty list
      if (e.response?.statusCode == 404) {
        return [];
      }
      throw NetworkException.fromDioException(e);
    }
  }

  /// Create session on server
  /// POST /stock-counts
  Future<Map<String, dynamic>> createSession({
    required int visitId,
    required int warehouseId,
    required String deviceSessionId,
    String? notes,
  }) async {
    try {
      final body = <String, dynamic>{
        'outlet_visit_id': visitId,
        'warehouse_id': warehouseId,
        'device_session_id': deviceSessionId,
        'notes': notes,
      };

      final response = await _dio.post(ApiEndpoints.stockCounts, data: body);

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Get session details
  /// GET /stock-counts/{session_id}
  Future<Map<String, dynamic>> getSession(int sessionId) async {
    try {
      final response = await _dio.get('${ApiEndpoints.stockCounts}/$sessionId');

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// List sessions with filters
  /// GET /stock-counts
  Future<Map<String, dynamic>> listSessions({
    int? customerId,
    String? status,
    int? agentId,
    DateTime? fromDate,
    DateTime? toDate,
    int page = 1,
    int size = 20,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.stockCounts,
        queryParameters: {
          if (customerId != null) 'customer_id': customerId,
          if (status != null) 'status': status,
          if (agentId != null) 'agent_id': agentId,
          if (fromDate != null) 'from_date': fromDate.toIso8601String(),
          if (toDate != null) 'to_date': toDate.toIso8601String(),
          'page': page,
          'size': size,
        },
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Pause session on server
  /// POST /stock-counts/{session_id}/pause
  Future<Map<String, dynamic>> pauseSession(int sessionId) async {
    try {
      final response = await _dio.post(
        '${ApiEndpoints.stockCounts}/$sessionId/pause',
      );
      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Resume session on server
  /// POST /stock-counts/{session_id}/resume
  Future<Map<String, dynamic>> resumeSession(int sessionId) async {
    try {
      final response = await _dio.post(
        '${ApiEndpoints.stockCounts}/$sessionId/resume',
      );
      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Complete session on server
  /// POST /stock-counts/{session_id}/complete
  Future<Map<String, dynamic>> completeSession(
    int sessionId, {
    String? notes,
  }) async {
    try {
      final response = await _dio.post(
        '${ApiEndpoints.stockCounts}/$sessionId/complete',
        data: {if (notes != null) 'notes': notes},
      );
      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Cancel session on server
  /// POST /stock-counts/{session_id}/cancel
  Future<Map<String, dynamic>> cancelSession(
    int sessionId, {
    String? reason,
  }) async {
    try {
      final response = await _dio.post(
        '${ApiEndpoints.stockCounts}/$sessionId/cancel',
        data: {if (reason != null) 'reason': reason},
      );
      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  // ============================================================================
  // Items
  // ============================================================================

  /// Add item to session on server, identified by SAP item code - the same
  /// value for a product at every outlet, unlike `customer_product_id`
  /// (a row id in the outlet-specific catalogue table). The backend
  /// resolves it against the session's own customer_id, so the client
  /// never has to track which outlet's catalogue row applies.
  /// POST /stock-counts/{session_id}/items
  Future<Map<String, dynamic>> addItem({
    required int sessionId,
    required String itemCode,
  }) async {
    try {
      final response = await _dio.post(
        '${ApiEndpoints.stockCounts}/$sessionId${ApiEndpoints.stockCountItems}',
        data: {'item_code': itemCode},
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// List session items
  /// GET /stock-counts/{session_id}/items
  Future<Map<String, dynamic>> listSessionItems(
    int sessionId, {
    int page = 1,
    int size = 100,
  }) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.stockCounts}/$sessionId${ApiEndpoints.stockCountItems}',
        queryParameters: {'page': page, 'size': size},
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Get item details
  /// GET /stock-counts/{session_id}/items/{item_id}
  Future<Map<String, dynamic>> getItem(int sessionId, int itemId) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.stockCounts}/$sessionId${ApiEndpoints.stockCountItems}/$itemId',
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Update item
  /// PATCH /stock-counts/{session_id}/items/{item_id}
  Future<Map<String, dynamic>> updateItem({
    required int sessionId,
    required int itemId,
    int? countedQuantity,
    String? notes,
  }) async {
    try {
      final response = await _dio.patch(
        '${ApiEndpoints.stockCounts}/$sessionId${ApiEndpoints.stockCountItems}/$itemId',
        data: {
          if (countedQuantity != null) 'counted_quantity': countedQuantity,
          if (notes != null) 'notes': notes,
        },
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Complete item counting
  /// POST /stock-counts/{session_id}/items/{item_id}/complete
  Future<Map<String, dynamic>> completeItem(int sessionId, int itemId) async {
    try {
      final response = await _dio.post(
        '${ApiEndpoints.stockCounts}/$sessionId${ApiEndpoints.stockCountItems}/$itemId/complete',
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Delete item from session
  /// DELETE /stock-counts/{session_id}/items/{item_id}
  Future<void> deleteItem(int sessionId, int itemId) async {
    try {
      await _dio.delete(
        '${ApiEndpoints.stockCounts}/$sessionId${ApiEndpoints.stockCountItems}/$itemId',
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  // ============================================================================
  // Serial Numbers
  // ============================================================================

  /// Add single serial to item, identified by SAP item code in the URL.
  /// If [itemCode] hasn't been added to this session yet, the backend
  /// materializes it first (same as [addItem]) before attaching the serial
  /// - a scan-first UX can call this directly without a separate add-item
  /// round trip.
  /// POST /stock-counts/{session_id}/items/{item_code}/serials
  Future<Map<String, dynamic>> addSerial({
    required int sessionId,
    required String itemCode,
    required String serialNumber,
    required String deviceScanId,
    required DateTime deviceScannedAt,
    int? scanSequence,
  }) async {
    try {
      final response = await _dio.post(
        '${ApiEndpoints.stockCounts}/$sessionId${ApiEndpoints.stockCountItems}/$itemCode${ApiEndpoints.stockCountSerials}',
        data: {
          'serial_number': serialNumber,
          'device_scan_id': deviceScanId,
          'device_scanned_at': deviceScannedAt.toIso8601String(),
          if (scanSequence != null) 'scan_sequence': scanSequence,
        },
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Upload serials batch to server, identified by SAP item code in the
  /// URL - auto-materializes the item into the session if it isn't there
  /// yet, same as [addSerial].
  /// POST /stock-counts/{session_id}/items/{item_code}/serials/batch
  Future<Map<String, dynamic>> uploadSerialsBatch({
    required int sessionId,
    required String itemCode,
    required List<Map<String, dynamic>> serials,
  }) async {
    try {
      final response = await _dio.post(
        '${ApiEndpoints.stockCounts}/$sessionId${ApiEndpoints.stockCountItems}/$itemCode${ApiEndpoints.serialsBatch}',
        data: {
          'serials': serials
              .map(
                (s) => {
                  'serial_number': s['serial_number'],
                  'device_scan_id': s['device_scan_id'],
                  'device_scanned_at': s['device_scanned_at'],
                  if (s['scan_sequence'] != null)
                    'scan_sequence': s['scan_sequence'],
                },
              )
              .toList(),
        },
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// List item serials, identified by SAP item code in the URL. Unlike the
  /// scan endpoints above, this does not auto-create the item - an
  /// [itemCode] never added to this session returns a 404.
  /// GET /stock-counts/{session_id}/items/{item_code}/serials
  Future<Map<String, dynamic>> listItemSerials(
    int sessionId,
    String itemCode, {
    String? status,
    int page = 1,
    int size = 100,
  }) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.stockCounts}/$sessionId${ApiEndpoints.stockCountItems}/$itemCode${ApiEndpoints.stockCountSerials}',
        queryParameters: {
          if (status != null) 'status': status,
          'page': page,
          'size': size,
        },
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Delete serial, identified by SAP item code in the URL. Like list, does
  /// not auto-create the item.
  /// DELETE /stock-counts/{session_id}/items/{item_code}/serials/{serial_id}
  Future<void> deleteSerial({
    required int sessionId,
    required String itemCode,
    required int serialId,
    String? reason,
  }) async {
    try {
      await _dio.delete(
        '${ApiEndpoints.stockCounts}/$sessionId${ApiEndpoints.stockCountItems}/$itemCode${ApiEndpoints.stockCountSerials}/$serialId',
        data: {if (reason != null) 'reason': reason},
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  // ============================================================================
  // Offline Sync
  // ============================================================================

  /// Sync offline data to server
  /// POST /stock-counts/offline-sync
  Future<Map<String, dynamic>> syncOfflineData({
    required String deviceId,
    required DateTime syncTimestamp,
    required List<Map<String, dynamic>> sessions,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.offlineSync,
        data: {
          'device_id': deviceId,
          'sync_timestamp': syncTimestamp.toIso8601String(),
          'sessions': sessions,
        },
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  // ============================================================================
  // Proposed Orders
  // ============================================================================

  /// Generate proposed order from stock count session
  /// POST /stock-counts/{session_id}/proposed-order/generate
  Future<Map<String, dynamic>> generateProposedOrder({
    required int sessionId,
    String refillStrategy = 'to_max',
    String? customerEmail,
    bool autoSendEmail = false,
  }) async {
    try {
      final response = await _dio.post(
        '${ApiEndpoints.stockCounts}/$sessionId/proposed-order/generate',
        data: {
          'refill_strategy': refillStrategy,
          if (customerEmail != null) 'customer_email': customerEmail,
          'auto_send_email': autoSendEmail,
        },
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Get proposed order generation job progress
  /// GET /stock-counts/{session_id}/proposed-order/progress/{job_id}
  Future<Map<String, dynamic>> getProposedOrderProgress(
    int sessionId,
    String jobId,
  ) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.stockCounts}/$sessionId/proposed-order/progress/$jobId',
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Get proposed order for session
  /// GET /stock-counts/{session_id}/proposed-order
  Future<Map<String, dynamic>> getSessionProposedOrder(int sessionId) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.stockCounts}/$sessionId/proposed-order',
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// List proposed orders
  /// GET /proposed-orders
  Future<Map<String, dynamic>> listProposedOrders({
    required int customerId,
    String? orderStatus,
    int page = 1,
    int size = 20,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.proposedOrders,
        queryParameters: {
          'customer_id': customerId,
          if (orderStatus != null) 'order_status': orderStatus,
          'page': page,
          'size': size,
        },
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Get proposed order by ID
  /// GET /proposed-orders/{order_id}
  Future<Map<String, dynamic>> getProposedOrder(int orderId) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.proposedOrders}/$orderId',
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Send quotation email
  /// POST /stock-counts/{session_id}/proposed-order/send-email
  ///
  /// Not currently reachable from the UI, and not a straightforward fit if
  /// it were: it's scoped by stock-count `sessionId`, but the proposed
  /// order screens/models are all visit-consolidated (`ProposedOrderDetail`
  /// has no `sessionId` field — a visit's order can span several completed
  /// sessions). This is almost certainly a leftover from an earlier,
  /// single-session-per-order design that predates that consolidation.
  /// There's no visit- or order-scoped email endpoint anywhere in this
  /// datasource to resend/email a visit-level proposed order with — that
  /// needs a real backend endpoint (e.g. `POST
  /// /proposed-orders/{order_id}/send-email`) before an "Email"/"Resend"
  /// action can be added to `ProposedOrderDetailScreen`. For now the
  /// customer is already emailed automatically at proposed-order creation
  /// time via `auto_send_email` (see generateProposedOrder /
  /// generateVisitProposedOrder below), reflected in that screen's
  /// customerEmail/emailSentAt "Sent" chip.
  Future<Map<String, dynamic>> sendQuotationEmail({
    required int sessionId,
    required String email,
    List<String>? cc,
    String? message,
    bool includePdf = true,
  }) async {
    try {
      final response = await _dio.post(
        '${ApiEndpoints.stockCounts}/$sessionId/proposed-order/send-email',
        data: {
          'email': email,
          if (cc != null) 'cc': cc,
          if (message != null) 'message': message,
          'include_pdf': includePdf,
        },
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Update customer response on proposed order
  /// PATCH /proposed-orders/{order_id}/customer-response
  Future<Map<String, dynamic>> updateCustomerResponse({
    required int orderId,
    required String response, // 'accepted' or 'rejected'
    String? notes,
  }) async {
    try {
      final apiResponse = await _dio.patch(
        '${ApiEndpoints.proposedOrders}/$orderId/customer-response',
        data: {'response': response, if (notes != null) 'notes': notes},
      );

      return apiResponse.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Convert proposed order to sales order
  /// POST /proposed-orders/{order_id}/convert-to-order
  Future<Map<String, dynamic>> convertToSalesOrder({
    required int orderId,
    String? notes,
  }) async {
    try {
      final response = await _dio.post(
        '${ApiEndpoints.proposedOrders}/$orderId/convert-to-order',
        data: {if (notes != null) 'notes': notes},
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  // ============================================================================
  // Visit Proposed Order Generation
  // ============================================================================

  /// Generate a proposed order for a visit (all sessions combined)
  /// POST /visits/{visit_id}/proposed-order/generate
  Future<Map<String, dynamic>> generateVisitProposedOrder({
    required int visitId,
    required String refillStrategy,
    bool notifyOnComplete = true,
    String? customerEmail,
    bool autoSendEmail = false,
  }) async {
    try {
      final url =
          '${ApiEndpoints.visits}/$visitId${ApiEndpoints.proposedOrderGenerate}';
      print('[RemoteDS] POST $url');
      print(
        '[RemoteDS] Body: refill_strategy=$refillStrategy, notify_on_complete=$notifyOnComplete, customer_email=$customerEmail',
      );

      final response = await _dio.post(
        url,
        data: {
          'refill_strategy': refillStrategy,
          'notify_on_complete': notifyOnComplete,
          if (customerEmail != null) 'customer_email': customerEmail,
          'auto_send_email': autoSendEmail,
        },
      );

      print('[RemoteDS] Response status: ${response.statusCode}');
      print('[RemoteDS] Response data: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      print('[RemoteDS] DioException: ${e.type} - ${e.message}');
      print('[RemoteDS] Response: ${e.response?.data}');
      throw NetworkException.fromDioException(e);
    } catch (e) {
      print('[RemoteDS] Exception: $e');
      rethrow;
    }
  }

  /// Get visit proposed order generation progress
  /// GET /visits/{visit_id}/proposed-order/progress/{job_id}
  Future<Map<String, dynamic>> getVisitProposedOrderProgress({
    required int visitId,
    required String jobId,
  }) async {
    try {
      final url =
          '${ApiEndpoints.visits}/$visitId${ApiEndpoints.proposedOrderProgress}/$jobId';
      print('[RemoteDS] GET $url');

      final response = await _dio.get(url);

      print('[RemoteDS] Progress response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      print('[RemoteDS] Progress DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    } catch (e) {
      print('[RemoteDS] Progress Exception: $e');
      rethrow;
    }
  }

  // ============================================================================
  // Event Logs
  // ============================================================================

  /// Get visit proposed order detail
  /// GET /visits/{visit_id}/proposed-order
  Future<Map<String, dynamic>> getVisitProposedOrder({
    required int visitId,
  }) async {
    try {
      final url = '${ApiEndpoints.visits}/$visitId/proposed-order';
      print('[RemoteDS] GET $url');

      final response = await _dio.get(url);

      print('[RemoteDS] Visit proposed order response: ${response.statusCode}');
      return response.data;
    } on DioException catch (e) {
      print(
        '[RemoteDS] Visit proposed order DioException: ${e.type} - ${e.message}',
      );
      throw NetworkException.fromDioException(e);
    }
  }

  // ============================================================================
  // Event Logs (continued)
  // ============================================================================

  /// Generate PDF for a visit's proposed order (background task)
  /// POST /visits/{visit_id}/proposed-order/generate-pdf
  Future<Map<String, dynamic>> generateProposedOrderPdf({
    required int visitId,
  }) async {
    try {
      final url = '${ApiEndpoints.visits}/$visitId/proposed-order/generate-pdf';
      print('[RemoteDS] POST $url');

      final response = await _dio.post(url);

      print('[RemoteDS] Generate PDF response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      print('[RemoteDS] Generate PDF DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }

  /// Download the generated PDF for a visit's proposed order
  /// GET /visits/{visit_id}/proposed-order/download-pdf
  /// Returns the raw PDF bytes
  Future<List<int>> downloadProposedOrderPdf({required int visitId}) async {
    try {
      final url = '${ApiEndpoints.visits}/$visitId/proposed-order/download-pdf';
      print('[RemoteDS] GET $url (download)');

      final response = await _dio.get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );

      print('[RemoteDS] Download PDF response: ${response.data?.length} bytes');
      return response.data!;
    } on DioException catch (e) {
      print('[RemoteDS] Download PDF DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }

  /// Get PDF generation progress
  /// GET /visits/{visit_id}/proposed-order/pdf-progress/{job_id}
  Future<Map<String, dynamic>> getProposedOrderPdfProgress({
    required int visitId,
    required String jobId,
  }) async {
    try {
      final url =
          '${ApiEndpoints.visits}/$visitId/proposed-order/pdf-progress/$jobId';
      print('[RemoteDS] GET $url');

      final response = await _dio.get(url);

      print('[RemoteDS] PDF progress response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      print('[RemoteDS] PDF progress DioException: ${e.type} - ${e.message}');
      throw NetworkException.fromDioException(e);
    }
  }

  // ============================================================================
  // Event Logs
  // ============================================================================

  /// List session events
  /// GET /stock-counts/{session_id}/events
  Future<Map<String, dynamic>> listSessionEvents(
    int sessionId, {
    int page = 1,
    int size = 50,
  }) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.stockCounts}/$sessionId/events',
        queryParameters: {'page': page, 'size': size},
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }
}
