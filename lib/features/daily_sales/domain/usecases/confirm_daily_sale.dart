import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/daily_sales_repository.dart';
import 'base_usecase.dart';

class ConfirmDailySaleParams {
  final int saleId;
  final List<DailySaleConfirmLine> items;
  final String otpCode;
  final File proofOfPurchase;

  const ConfirmDailySaleParams({
    required this.saleId,
    required this.items,
    required this.otpCode,
    required this.proofOfPurchase,
  });
}

/// Confirms a pending sale by submitting the scanned serial numbers.
class ConfirmDailySale implements UseCase<DailySale, ConfirmDailySaleParams> {
  final DailySalesRepository _repository;

  const ConfirmDailySale(this._repository);

  @override
  Future<Either<Failure, DailySale>> call(
    ConfirmDailySaleParams params,
  ) async {
    return _repository.confirmSale(
      saleId: params.saleId,
      items: params.items,
      otpCode: params.otpCode,
      proofOfPurchase: params.proofOfPurchase,
    );
  }
}
