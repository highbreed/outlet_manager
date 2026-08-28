import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_exceptions.dart';

double _toDouble(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0;
  return 0;
}

double? _toDoubleOrNull(dynamic value) {
  if (value == null) return null;
  return _toDouble(value);
}

int _toInt(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

/// One product's contribution to the agent's confirmed sales for the month,
/// part of [SalesPerformanceResponse].
class SalesPerformanceProduct {
  final String itemCode;
  final String? productName;
  final String? modelNo;
  final String? brand;
  final String? itemGroup1;
  final String? itemGroup2;
  final String? itemGroup3;
  final int quantitySold;
  final double amountSold;
  final double incentiveEarned;

  const SalesPerformanceProduct({
    required this.itemCode,
    this.productName,
    this.modelNo,
    this.brand,
    this.itemGroup1,
    this.itemGroup2,
    this.itemGroup3,
    this.quantitySold = 0,
    this.amountSold = 0,
    this.incentiveEarned = 0,
  });

  factory SalesPerformanceProduct.fromJson(Map<String, dynamic> json) {
    return SalesPerformanceProduct(
      itemCode: json['item_code'] as String? ?? '',
      productName: json['product_name'] as String?,
      modelNo: json['model_no'] as String?,
      brand: json['brand'] as String?,
      itemGroup1: json['item_group1'] as String?,
      itemGroup2: json['item_group2'] as String?,
      itemGroup3: json['item_group3'] as String?,
      quantitySold: _toInt(json['quantity_sold']),
      amountSold: _toDouble(json['amount_sold']),
      incentiveEarned: _toDouble(json['incentive_earned']),
    );
  }
}

/// The agent's own confirmed-sales performance for a month, from
/// `GET /sales/my-performance`. `targetQuantity`/`achievementPercentage`
/// are `null` when no `@SLSTGT` target rows exist for the period — that's
/// a normal state, not an error.
class SalesPerformanceResponse {
  final int salesAgentId;
  final int year;
  final int month;
  final String? cardCode;
  final int totalQuantitySold;
  final double totalAmountSold;
  final double totalIncentiveEarned;
  final double? targetQuantity;
  final double? achievementPercentage;

  /// Currency-denominated target for the period (e.g. "KES 12.4M this
  /// month"), distinct from [targetQuantity]'s unit count. `null` until the
  /// backend adds this — reads from a `target_amount` JSON key as a
  /// best-guess mirroring `target_quantity`'s naming; update the key here
  /// once the real field lands if it's named differently.
  final double? targetAmount;

  final List<SalesPerformanceProduct> products;

  const SalesPerformanceResponse({
    required this.salesAgentId,
    required this.year,
    required this.month,
    this.cardCode,
    this.totalQuantitySold = 0,
    this.totalAmountSold = 0,
    this.totalIncentiveEarned = 0,
    this.targetQuantity,
    this.achievementPercentage,
    this.targetAmount,
    this.products = const [],
  });

  bool get hasTarget => targetQuantity != null;

  bool get hasTargetAmount => targetAmount != null;

  factory SalesPerformanceResponse.fromJson(Map<String, dynamic> json) {
    return SalesPerformanceResponse(
      salesAgentId: _toInt(json['sales_agent_id']),
      year: _toInt(json['year']),
      month: _toInt(json['month']),
      cardCode: json['card_code'] as String?,
      totalQuantitySold: _toInt(json['total_quantity_sold']),
      totalAmountSold: _toDouble(json['total_amount_sold']),
      totalIncentiveEarned: _toDouble(json['total_incentive_earned']),
      targetQuantity: _toDoubleOrNull(json['target_quantity']),
      achievementPercentage: _toDoubleOrNull(json['achievement_percentage']),
      targetAmount: _toDoubleOrNull(json['target_amount']),
      products: (json['products'] as List<dynamic>? ?? [])
          .map(
            (e) => SalesPerformanceProduct.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

/// Remote data source for the agent's own sales performance summary.
class SalesPerformanceRemoteDataSource {
  final Dio _dio;

  const SalesPerformanceRemoteDataSource(this._dio);

  /// Fetch the agent's confirmed-sales performance for a month, optionally
  /// scoped to one of their actively-assigned outlets.
  /// GET /sales/my-performance
  Future<SalesPerformanceResponse> fetchMyPerformance({
    required int year,
    required int month,
    String? cardCode,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.salesMyPerformance,
        queryParameters: {
          'year': year,
          'month': month,
          if (cardCode != null && cardCode.isNotEmpty) 'card_code': cardCode,
        },
      );

      return SalesPerformanceResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }
}
