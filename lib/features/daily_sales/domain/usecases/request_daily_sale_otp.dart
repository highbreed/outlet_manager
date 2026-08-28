import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/daily_sales_repository.dart';
import 'base_usecase.dart';

/// Sends (or resends) a customer OTP by SMS ahead of confirming a sale.
class RequestDailySaleOtp implements UseCase<DailySaleOtpResult, int> {
  final DailySalesRepository _repository;

  const RequestDailySaleOtp(this._repository);

  @override
  Future<Either<Failure, DailySaleOtpResult>> call(int saleId) async {
    return _repository.requestOtp(saleId);
  }
}
