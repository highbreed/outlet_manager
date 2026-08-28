import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_exceptions.dart';
import '../models/models.dart';

/// Response for `POST /daily-sales/{id}/request-otp` and
/// `POST /daily-sales/{id}/verify-otp` — both return the same shape.
class DailySaleOtpResponse {
  final String message;
  final int expiresInMinutes;

  const DailySaleOtpResponse({
    required this.message,
    required this.expiresInMinutes,
  });

  factory DailySaleOtpResponse.fromJson(Map<String, dynamic> json) {
    return DailySaleOtpResponse(
      message: json['message'] as String,
      expiresInMinutes: json['expires_in_minutes'] as int,
    );
  }
}

/// Response for `GET /daily-sales`: items + pagination meta.
class DailySalesListResult {
  final List<DailySaleModel> items;
  final int page;
  final int size;
  final int total;
  final int pages;
  final bool hasPrevious;
  final bool hasNext;

  const DailySalesListResult({
    required this.items,
    required this.page,
    required this.size,
    required this.total,
    required this.pages,
    required this.hasPrevious,
    required this.hasNext,
  });

  factory DailySalesListResult.fromJson(Map<String, dynamic> json) {
    final meta = json['meta'] as Map<String, dynamic>? ?? {};
    return DailySalesListResult(
      items: (json['items'] as List<dynamic>? ?? [])
          .map((e) => DailySaleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: meta['page'] as int? ?? 1,
      size: meta['size'] as int? ?? 20,
      total: meta['total'] as int? ?? 0,
      pages: meta['pages'] as int? ?? 0,
      hasPrevious: meta['has_previous'] as bool? ?? false,
      hasNext: meta['has_next'] as bool? ?? false,
    );
  }
}

/// Remote data source for `/api/v1/daily-sales`.
class DailySalesRemoteDataSource {
  final Dio _dio;

  const DailySalesRemoteDataSource(this._dio);

  /// GET /daily-sales
  Future<DailySalesListResult> listSales({
    int page = 1,
    int size = 20,
    int? outletId,
    int? userId,
    String? status,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.dailySales,
        queryParameters: {
          'page': page,
          'size': size,
          if (outletId != null) 'outlet_id': outletId,
          if (userId != null) 'user_id': userId,
          if (status != null) 'status': status,
        },
      );
      return DailySalesListResult.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// GET /daily-sales/{sale_id}
  Future<DailySaleModel> getSale(int saleId) async {
    try {
      final response = await _dio.get(ApiEndpoints.dailySaleDetail(saleId));
      return DailySaleModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// POST /daily-sales
  Future<DailySaleModel> createSale({
    required String customerName,
    String? customerPhone,
    required List<({String barcode, int quantity})> items,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.dailySales,
        data: {
          'customer_name': customerName,
          if (customerPhone != null && customerPhone.isNotEmpty)
            'customer_phone': customerPhone,
          'items': [
            for (final item in items)
              {'barcode': item.barcode, 'quantity': item.quantity},
          ],
        },
      );
      return DailySaleModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// POST /daily-sales/{sale_id}/request-otp
  Future<DailySaleOtpResponse> requestOtp(int saleId) async {
    try {
      final response = await _dio.post(ApiEndpoints.dailySaleRequestOtp(saleId));
      return DailySaleOtpResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// POST /daily-sales/{sale_id}/verify-otp
  Future<DailySaleOtpResponse> verifyOtp({
    required int saleId,
    required String otpCode,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.dailySaleVerifyOtp(saleId),
        data: {'otp_code': otpCode},
      );
      return DailySaleOtpResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// POST /daily-sales/{sale_id}/confirm
  ///
  /// Multipart: `items` is JSON-encoded into a form field (rather than sent
  /// as a JSON body) because the request also carries the proof-of-purchase
  /// file, per the backend's breaking change to this endpoint.
  Future<DailySaleModel> confirmSale({
    required int saleId,
    required List<({int itemId, List<String> serialNumbers})> items,
    required String otpCode,
    required File proofOfPurchase,
  }) async {
    try {
      final formData = FormData.fromMap({
        'items': jsonEncode({
          'items': [
            for (final item in items)
              {'item_id': item.itemId, 'serial_numbers': item.serialNumbers},
          ],
        }),
        'otp_code': otpCode,
        'proof_of_purchase': await MultipartFile.fromFile(
          proofOfPurchase.path,
          filename: proofOfPurchase.path.split('/').last,
        ),
      });
      final response = await _dio.post(
        ApiEndpoints.dailySaleConfirm(saleId),
        data: formData,
      );
      return DailySaleModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// POST /daily-sales/{sale_id}/cancel
  Future<DailySaleModel> cancelSale(int saleId) async {
    try {
      final response = await _dio.post(ApiEndpoints.dailySaleCancel(saleId));
      return DailySaleModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }
}
