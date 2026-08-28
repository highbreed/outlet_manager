import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../domain/entities/customer.dart';
import '../../domain/entities/product.dart';

/// Paginated response from /sales/customers
class SalesCustomersResponse {
  final List<SalesCustomer> items;
  final int page;
  final int size;
  final int totalCount;
  final int totalPages;

  const SalesCustomersResponse({
    required this.items,
    required this.page,
    required this.size,
    required this.totalCount,
    required this.totalPages,
  });

  bool get hasMore => page < totalPages;

  factory SalesCustomersResponse.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>? ?? [];
    final meta = json['meta'] as Map<String, dynamic>? ?? {};

    return SalesCustomersResponse(
      items: itemsJson
          .map(
            (item) => SalesCustomer.fromApiJson(item as Map<String, dynamic>),
          )
          .toList(),
      page: meta['page'] as int? ?? 1,
      size: meta['size'] as int? ?? 20,
      totalCount: meta['total_count'] as int? ?? 0,
      totalPages: meta['total_pages'] as int? ?? 1,
    );
  }
}

/// Paginated response from /sales/products
class SalesProductsResponse {
  final List<SalesProduct> items;
  final int page;
  final int size;
  final int totalCount;
  final int totalPages;
  final int maxPageSize;

  const SalesProductsResponse({
    required this.items,
    required this.page,
    required this.size,
    required this.totalCount,
    required this.totalPages,
    required this.maxPageSize,
  });

  bool get hasMore => page < totalPages;

  factory SalesProductsResponse.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>? ?? [];
    final meta = json['meta'] as Map<String, dynamic>? ?? {};

    final parsedItems = itemsJson
        .asMap()
        .entries
        .map(
          (entry) => SalesProduct.fromApiJson(
            entry.value as Map<String, dynamic>,
            id: entry.key + 1,
          ),
        )
        .toList();

    return SalesProductsResponse(
      items: parsedItems,
      page: meta['page'] as int? ?? 1,
      size: meta['size'] as int? ?? 20,
      totalCount: meta['total_count'] as int? ?? parsedItems.length,
      totalPages: meta['total_pages'] as int? ?? 1,
      maxPageSize: meta['max_page_size'] as int? ?? 20,
    );
  }
}

class SalesProductFiltersResponse {
  final List<String> brands;
  final List<String> categories;

  const SalesProductFiltersResponse({
    required this.brands,
    required this.categories,
  });

  factory SalesProductFiltersResponse.fromJson(Map<String, dynamic> json) {
    final brands = (json['brands'] as List<dynamic>? ?? [])
        .map((e) => e.toString())
        .where((e) => e.trim().isNotEmpty)
        .toList();
    final categories = (json['categories'] as List<dynamic>? ?? [])
        .map((e) => e.toString())
        .where((e) => e.trim().isNotEmpty)
        .toList();
    return SalesProductFiltersResponse(brands: brands, categories: categories);
  }
}

class SalesWarehouse {
  final int id;
  final String warehouseCode;
  final String warehouseName;
  final String? sapWarehouseCode;
  final String? warehouseType;
  final bool isActive;

  const SalesWarehouse({
    required this.id,
    required this.warehouseCode,
    required this.warehouseName,
    this.sapWarehouseCode,
    this.warehouseType,
    this.isActive = true,
  });

  factory SalesWarehouse.fromJson(Map<String, dynamic> json) => SalesWarehouse(
    id: json['id'] as int? ?? 0,
    warehouseCode: json['warehouse_code'] as String? ?? '',
    warehouseName: json['warehouse_name'] as String? ?? '',
    sapWarehouseCode: json['sap_warehouse_code'] as String?,
    warehouseType: json['warehouse_type'] as String?,
    isActive: json['is_active'] as bool? ?? true,
  );
}

class SubmitQuotationItemRequest {
  final String itemCode;
  final int quantity;

  const SubmitQuotationItemRequest({
    required this.itemCode,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
    'item_code': itemCode,
    'quantity': quantity,
  };
}

class SubmitQuotationRequest {
  final String cardCode;
  final String warehouseCode;
  final String? lpoNumber;
  final String? comments;
  final String? remarks;
  final List<SubmitQuotationItemRequest> items;

  const SubmitQuotationRequest({
    required this.cardCode,
    required this.warehouseCode,
    this.lpoNumber,
    this.comments,
    this.remarks,
    required this.items,
  });

  Map<String, dynamic> toJson() => {
    'card_code': cardCode,
    'warehouse_code': warehouseCode,
    'lpo_number': lpoNumber ?? '',
    'comments': comments ?? '',
    'remarks': remarks ?? '',
    'items': items.map((e) => e.toJson()).toList(),
  };
}

class SubmitQuotationResponse {
  final int id;
  final int sapDocNum;
  final String cardCode;
  final String cardName;
  final String customerType;
  final String warehouseCode;
  final String? lpoNumber;
  final String? totalAmount;
  final String? currency;
  final String status;
  final DateTime? createdAt;
  final List<SubmitQuotationLineItemResponse> items;

  const SubmitQuotationResponse({
    required this.id,
    required this.sapDocNum,
    required this.cardCode,
    required this.cardName,
    required this.customerType,
    required this.warehouseCode,
    required this.lpoNumber,
    required this.totalAmount,
    required this.currency,
    required this.status,
    required this.createdAt,
    required this.items,
  });

  static int _toInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString()) ?? 0;
  }

  factory SubmitQuotationResponse.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>? ?? [];
    return SubmitQuotationResponse(
      id: _toInt(json['id']),
      sapDocNum: _toInt(json['sap_doc_num']),
      cardCode: json['card_code'] as String? ?? '',
      cardName: json['card_name'] as String? ?? '',
      customerType: json['customer_type'] as String? ?? '',
      warehouseCode: json['warehouse_code'] as String? ?? '',
      lpoNumber: json['lpo_number'] as String?,
      totalAmount: json['total_amount']?.toString(),
      currency: json['currency'] as String?,
      status: json['status'] as String? ?? 'draft',
      createdAt: DateTime.tryParse(json['created_at'] as String? ?? ''),
      items: itemsJson
          .map(
            (e) => SubmitQuotationLineItemResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }
}

class SubmitQuotationLineItemResponse {
  final int id;
  final int lineNum;
  final String itemCode;
  final String itemName;
  final String? modelNumber;
  final String? barcode;
  final double quantity;
  final double unitPrice;
  final double lineTotal;

  const SubmitQuotationLineItemResponse({
    required this.id,
    required this.lineNum,
    required this.itemCode,
    required this.itemName,
    this.modelNumber,
    this.barcode,
    required this.quantity,
    required this.unitPrice,
    required this.lineTotal,
  });

  static double _toDouble(dynamic value) {
    if (value == null) return 0;
    if (value is num) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0;
  }

  static int _toInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString()) ?? 0;
  }

  factory SubmitQuotationLineItemResponse.fromJson(Map<String, dynamic> json) {
    return SubmitQuotationLineItemResponse(
      id: _toInt(json['id']),
      lineNum: _toInt(json['line_num']),
      itemCode: json['item_code'] as String? ?? '',
      itemName: json['item_name'] as String? ?? '',
      modelNumber: json['model_number'] as String?,
      barcode: json['barcode'] as String?,
      quantity: _toDouble(json['quantity']),
      unitPrice: _toDouble(json['unit_price']),
      lineTotal: _toDouble(json['line_total']),
    );
  }
}

class SalesQuotationsResponse {
  final List<SubmitQuotationResponse> items;

  const SalesQuotationsResponse({required this.items});

  factory SalesQuotationsResponse.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>? ?? [];
    return SalesQuotationsResponse(
      items: itemsJson
          .map(
            (e) => SubmitQuotationResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

class ConvertQuotationToOrderRequest {
  final String lpoNumber;
  final String warehouseCode;
  final String comments;

  const ConvertQuotationToOrderRequest({
    required this.lpoNumber,
    required this.warehouseCode,
    required this.comments,
  });

  Map<String, dynamic> toJson() => {
    'lpo_number': lpoNumber,
    'warehouse_code': warehouseCode,
    'comments': comments,
  };
}

class SubmitDirectOrderRequest {
  final String cardCode;
  final String? lpoNumber;
  final String? comments;
  final String? remarks;
  final List<SubmitQuotationItemRequest> items;

  const SubmitDirectOrderRequest({
    required this.cardCode,
    this.lpoNumber,
    this.comments,
    this.remarks,
    required this.items,
  });

  // Deliberately no warehouse_code: the backend resolves the warehouse
  // server-side from the customer's SAP sales territory and ignores it
  // even if sent.
  Map<String, dynamic> toJson() => {
    'card_code': cardCode,
    'lpo_number': lpoNumber ?? '',
    'comments': comments ?? '',
    'remarks': remarks ?? '',
    'items': items.map((e) => e.toJson()).toList(),
  };
}

/// Thrown for the two documented business-rule rejections on
/// POST /sales/orders/direct (both HTTP 409): CASH_REQUIRES_QUOTATION and
/// CREDIT_LIMIT_EXCEEDED. Kept distinct from [NetworkException] so the UI
/// can react specifically (offer the quotation flow, show credit exposure
/// numbers) instead of showing a generic error message.
class DirectOrderException implements Exception {
  final String code;
  final String message;
  final Map<String, dynamic>? details;

  const DirectOrderException({
    required this.code,
    required this.message,
    this.details,
  });

  @override
  String toString() => message;
}

class DirectOrderResponse {
  final int id;
  final int sapDocNum;
  final String cardCode;
  final String cardName;
  final String customerType;
  final String warehouseCode;
  final String? warehouseName;
  final String? lpoNumber;
  final String? totalAmount;
  final String? currency;
  final String source;
  final String status; // 'posted' | 'failed'
  final String? sapErrorMessage;
  final DateTime? createdAt;
  final List<SubmitQuotationLineItemResponse> items;

  const DirectOrderResponse({
    required this.id,
    required this.sapDocNum,
    required this.cardCode,
    required this.cardName,
    required this.customerType,
    required this.warehouseCode,
    this.warehouseName,
    required this.lpoNumber,
    required this.totalAmount,
    required this.currency,
    required this.source,
    required this.status,
    this.sapErrorMessage,
    required this.createdAt,
    required this.items,
  });

  bool get isPosted => status == 'posted';

  static int _toInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString()) ?? 0;
  }

  factory DirectOrderResponse.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>? ?? [];
    return DirectOrderResponse(
      id: _toInt(json['id']),
      sapDocNum: _toInt(json['sap_doc_num']),
      cardCode: json['card_code'] as String? ?? '',
      cardName: json['card_name'] as String? ?? '',
      customerType: json['customer_type'] as String? ?? '',
      warehouseCode: json['warehouse_code'] as String? ?? '',
      warehouseName: json['warehouse_name'] as String?,
      lpoNumber: json['lpo_number'] as String?,
      totalAmount: json['total_amount']?.toString(),
      currency: json['currency'] as String?,
      source: json['source'] as String? ?? 'direct',
      status: json['status'] as String? ?? 'posted',
      sapErrorMessage: json['sap_error_message'] as String?,
      createdAt: DateTime.tryParse(json['created_at'] as String? ?? ''),
      items: itemsJson
          .map(
            (e) => SubmitQuotationLineItemResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }
}

/// Remote data source for sales customers API
class SalesCustomerRemoteDataSource {
  final Dio _dio;

  const SalesCustomerRemoteDataSource(this._dio);

  /// Fetch customers with optional filtering
  /// GET /sales/customers
  Future<SalesCustomersResponse> fetchCustomers({
    String? cardCode,
    String? cardName,
    String? customerType,
    int page = 1,
    int size = 20,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.salesCustomers,
        queryParameters: {
          if (cardCode != null && cardCode.isNotEmpty) 'card_code': cardCode,
          if (cardName != null && cardName.isNotEmpty) 'card_name': cardName,
          if (customerType != null && customerType.isNotEmpty)
            'customer_type': customerType,
          'page': page,
          'size': size,
        },
      );

      return SalesCustomersResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Fetch products with customer-specific pricing
  /// GET /sales/products
  Future<SalesProductsResponse> fetchProducts({
    required String cardCode,
    String? search,
    String? category,
    String? brand,
    int page = 1,
    int size = 20,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.salesProducts,
        queryParameters: {
          'card_code': cardCode,
          if (search != null && search.isNotEmpty) 'search': search,
          if (category != null && category.isNotEmpty) 'category': category,
          if (brand != null && brand.isNotEmpty) 'brand': brand,
          'page': page,
          'size': size,
        },
      );

      return SalesProductsResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  Future<SalesProductFiltersResponse> fetchProductFilters({
    String? cardCode,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.salesProductFilters,
        queryParameters: {
          if (cardCode != null && cardCode.isNotEmpty) 'card_code': cardCode,
        },
      );

      return SalesProductFiltersResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  Future<List<SalesWarehouse>> fetchWarehouses() async {
    try {
      final response = await _dio.get(ApiEndpoints.warehouses);
      final body = response.data as Map<String, dynamic>? ?? {};
      final items = body['items'] as List<dynamic>? ?? [];
      return items
          .map((e) => SalesWarehouse.fromJson(e as Map<String, dynamic>))
          .where((w) => w.isActive)
          .toList();
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  Future<SubmitQuotationResponse> submitQuotation(
    SubmitQuotationRequest request,
  ) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.salesQuotations,
        data: request.toJson(),
      );
      return SubmitQuotationResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Create a sales order directly, without a preceding quotation.
  /// Credit customers only — the backend rejects cash customers with
  /// CASH_REQUIRES_QUOTATION and over-limit customers with
  /// CREDIT_LIMIT_EXCEEDED (both surfaced as [DirectOrderException]).
  Future<DirectOrderResponse> submitDirectOrder(
    SubmitDirectOrderRequest request,
  ) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.salesOrdersDirect,
        data: request.toJson(),
      );
      return DirectOrderResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        final data = e.response?.data;
        final detail = data is Map ? data['detail'] : null;
        if (detail is Map) {
          final code = detail['code'] as String?;
          if (code == 'CASH_REQUIRES_QUOTATION' ||
              code == 'CREDIT_LIMIT_EXCEEDED') {
            throw DirectOrderException(
              code: code!,
              message: detail['message'] as String? ??
                  'Order was rejected: $code',
              details: detail['details'] as Map<String, dynamic>?,
            );
          }
        }
      }
      throw NetworkException.fromDioException(e);
    }
  }

  Future<SalesQuotationsResponse> fetchQuotations({
    int page = 1,
    int size = 50,
    String? cardCode,
    int? salesAgentId,
    int? createdByUserId,
    DateTime? dateFrom,
    DateTime? dateTo,
    String? status,
    String? customerType,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.salesQuotations,
        queryParameters: {
          'page': page,
          'size': size,
          if (cardCode != null && cardCode.isNotEmpty) 'card_code': cardCode,
          if (salesAgentId != null) 'sales_agent_id': salesAgentId,
          if (createdByUserId != null) 'created_by_user_id': createdByUserId,
          if (dateFrom != null) 'date_from': dateFrom.toIso8601String(),
          if (dateTo != null) 'date_to': dateTo.toIso8601String(),
          if (status != null && status.isNotEmpty) 'status': status,
          if (customerType != null && customerType.isNotEmpty)
            'customer_type': customerType,
        },
      );
      return SalesQuotationsResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  Future<void> convertQuotationToOrder({
    required int quotationId,
    required ConvertQuotationToOrderRequest request,
  }) async {
    try {
      await _dio.post(
        '${ApiEndpoints.salesQuotations}/$quotationId/convert-to-order',
        data: request.toJson(),
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }
}
