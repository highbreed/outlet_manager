import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';

/// One `{barcode, quantity}` line submitted when registering a sale.
typedef DailySaleCartLine = ({String barcode, int quantity});

/// One `{item_id, serial_numbers}` line submitted when confirming a sale.
typedef DailySaleConfirmLine = ({int itemId, List<String> serialNumbers});

/// Repository for the `/api/v1/daily-sales` in-store sales flow.
///
/// `createSale`, `confirmSale` and `cancelSale` are atomic server-side
/// operations (the backend validates barcodes/clock-in/serial counts as a
/// single request) so they always hit the network directly — there is no
/// offline write path for them. `getSale`/`listSales` fall back to a local
/// read cache when offline.
abstract class DailySalesRepository {
  Future<Either<Failure, DailySalesPage>> listSales({
    int page = 1,
    int size = 20,
    int? outletId,
    int? userId,
    DailySaleStatus? status,
  });

  Future<Either<Failure, DailySale>> getSale(int saleId);

  Future<Either<Failure, DailySale>> createSale({
    required String customerName,
    String? customerPhone,
    required List<DailySaleCartLine> items,
  });

  Future<Either<Failure, DailySale>> confirmSale({
    required int saleId,
    required List<DailySaleConfirmLine> items,
    required String otpCode,
    required File proofOfPurchase,
  });

  Future<Either<Failure, DailySale>> cancelSale(int saleId);

  Future<Either<Failure, DailySaleOtpResult>> requestOtp(int saleId);

  Future<Either<Failure, DailySaleOtpResult>> verifyOtp({
    required int saleId,
    required String otpCode,
  });
}
