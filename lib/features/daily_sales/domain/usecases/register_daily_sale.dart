import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/daily_sales_repository.dart';
import 'base_usecase.dart';

class RegisterDailySaleParams {
  final String customerName;
  final String? customerPhone;
  final List<DailySaleCartLine> items;

  const RegisterDailySaleParams({
    required this.customerName,
    this.customerPhone,
    required this.items,
  });
}

/// Registers a new pending sale from a scanned/picked cart.
class RegisterDailySale
    implements UseCase<DailySale, RegisterDailySaleParams> {
  final DailySalesRepository _repository;

  const RegisterDailySale(this._repository);

  @override
  Future<Either<Failure, DailySale>> call(
    RegisterDailySaleParams params,
  ) async {
    return _repository.createSale(
      customerName: params.customerName,
      customerPhone: params.customerPhone,
      items: params.items,
    );
  }
}
