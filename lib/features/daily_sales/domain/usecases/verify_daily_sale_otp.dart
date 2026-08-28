import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/daily_sales_repository.dart';
import 'base_usecase.dart';

class VerifyDailySaleOtpParams {
  final int saleId;
  final String otpCode;

  const VerifyDailySaleOtpParams({
    required this.saleId,
    required this.otpCode,
  });
}

/// Frontend precheck of a customer's entered OTP, ahead of the final
/// `confirm` call (which re-validates the code itself). Used to give fast
/// feedback before the agent bothers attaching a proof-of-purchase photo.
class VerifyDailySaleOtp
    implements UseCase<DailySaleOtpResult, VerifyDailySaleOtpParams> {
  final DailySalesRepository _repository;

  const VerifyDailySaleOtp(this._repository);

  @override
  Future<Either<Failure, DailySaleOtpResult>> call(
    VerifyDailySaleOtpParams params,
  ) async {
    return _repository.verifyOtp(
      saleId: params.saleId,
      otpCode: params.otpCode,
    );
  }
}
