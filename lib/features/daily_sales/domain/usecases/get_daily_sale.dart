import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/daily_sales_repository.dart';
import 'base_usecase.dart';

/// Fetches a single sale by id.
class GetDailySale implements UseCase<DailySale, int> {
  final DailySalesRepository _repository;

  const GetDailySale(this._repository);

  @override
  Future<Either<Failure, DailySale>> call(int saleId) async {
    return _repository.getSale(saleId);
  }
}
