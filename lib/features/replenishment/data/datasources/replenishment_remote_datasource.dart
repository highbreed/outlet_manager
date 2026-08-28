import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_exceptions.dart';

double _toDouble(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0;
  return 0;
}

int _toInt(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

/// One suggested reorder line, part of [ReplenishmentOrder].
class ReplenishmentOrderItem {
  final int id;
  final String itemCode;
  final String? itemName;
  final String? modelNumber;
  final int currentStock;
  final int minStockLevel;
  final int maxStockLevel;
  final int proposedQuantity;
  final double unitPrice;
  final double lineTotal;
  final int? triggeredByDailySalesId;
  final String? updatedAt;

  const ReplenishmentOrderItem({
    required this.id,
    required this.itemCode,
    this.itemName,
    this.modelNumber,
    this.currentStock = 0,
    this.minStockLevel = 0,
    this.maxStockLevel = 0,
    this.proposedQuantity = 0,
    this.unitPrice = 0,
    this.lineTotal = 0,
    this.triggeredByDailySalesId,
    this.updatedAt,
  });

  factory ReplenishmentOrderItem.fromJson(Map<String, dynamic> json) {
    return ReplenishmentOrderItem(
      id: _toInt(json['id']),
      itemCode: json['item_code'] as String? ?? '',
      itemName: json['item_name'] as String?,
      modelNumber: json['model_number'] as String?,
      currentStock: _toInt(json['current_stock']),
      minStockLevel: _toInt(json['min_stock_level']),
      maxStockLevel: _toInt(json['max_stock_level']),
      proposedQuantity: _toInt(json['proposed_quantity']),
      unitPrice: _toDouble(json['unit_price']),
      lineTotal: _toDouble(json['line_total']),
      triggeredByDailySalesId: json['triggered_by_daily_sales_id'] == null
          ? null
          : _toInt(json['triggered_by_daily_sales_id']),
      updatedAt: json['updated_at'] as String?,
    );
  }
}

/// A visit's live suggested-reorder list — a snapshot, not a workflow
/// object (no draft/sent/accepted status), recomputed automatically every
/// time a sale is confirmed at this outlet visit.
class ReplenishmentOrder {
  final int id;
  final int outletVisitId;
  final int customerId;
  final int salesAgentId;
  final String refillStrategy;
  final int totalItems;
  final int totalQuantity;
  final double estimatedTotal;
  final String currency;
  final List<ReplenishmentOrderItem> items;
  final String? createdAt;
  final String? updatedAt;

  const ReplenishmentOrder({
    required this.id,
    required this.outletVisitId,
    required this.customerId,
    required this.salesAgentId,
    this.refillStrategy = 'to_max',
    this.totalItems = 0,
    this.totalQuantity = 0,
    this.estimatedTotal = 0,
    this.currency = 'KES',
    this.items = const [],
    this.createdAt,
    this.updatedAt,
  });

  factory ReplenishmentOrder.fromJson(Map<String, dynamic> json) {
    return ReplenishmentOrder(
      id: _toInt(json['id']),
      outletVisitId: _toInt(json['outlet_visit_id']),
      customerId: _toInt(json['customer_id']),
      salesAgentId: _toInt(json['sales_agent_id']),
      refillStrategy: json['refill_strategy'] as String? ?? 'to_max',
      totalItems: _toInt(json['total_items']),
      totalQuantity: _toInt(json['total_quantity']),
      estimatedTotal: _toDouble(json['estimated_total']),
      currency: json['currency'] as String? ?? 'KES',
      items: (json['items'] as List<dynamic>? ?? [])
          .map(
            (e) => ReplenishmentOrderItem.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}

/// Remote data source for the (read-only) replenishment feature — there is
/// no create/update call, orders are computed server-side as a side effect
/// of `POST /daily-sales/{id}/confirm`.
class ReplenishmentRemoteDataSource {
  final Dio _dio;

  const ReplenishmentRemoteDataSource(this._dio);

  /// The caller's own active (clocked-in) visit's live reorder list.
  /// GET /replenishment/current
  Future<ReplenishmentOrder> fetchCurrent() async {
    try {
      final response = await _dio.get(ApiEndpoints.replenishmentCurrent);
      return ReplenishmentOrder.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// A specific visit's live reorder list, by visit ID.
  /// GET /replenishment/visits/{visit_id}
  Future<ReplenishmentOrder> fetchByVisit(int visitId) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.replenishmentByVisit(visitId),
      );
      return ReplenishmentOrder.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }
}
