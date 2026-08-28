import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/stock_take_repository.dart';
import 'base_usecase.dart';

class GetActiveSessionsParams {
  final int customerId;

  const GetActiveSessionsParams({required this.customerId});
}

/// Use case to get all active stock take sessions for a customer
class GetActiveSessions
    implements UseCase<List<StockTakeSession>, GetActiveSessionsParams> {
  final StockTakeRepository _repository;

  const GetActiveSessions(this._repository);

  @override
  Future<Either<Failure, List<StockTakeSession>>> call(
    GetActiveSessionsParams params,
  ) async {
    return _repository.getActiveSessions(params.customerId);
  }
}
