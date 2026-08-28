import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/daily_sales_repository.dart';
import 'base_usecase.dart';

/// Cancels a pending sale (e.g. the customer backs out before paying).
class CancelDailySale implements UseCase<DailySale, int> {
  final DailySalesRepository _repository;

  const CancelDailySale(this._repository);

  @override
  Future<Either<Failure, DailySale>> call(int saleId) async {
    return _repository.cancelSale(saleId);
  }
}
