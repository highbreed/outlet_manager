import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/stock_take_repository.dart';
import 'base_usecase.dart';

class GetSessionItemsParams {
  final String sessionLocalId;

  const GetSessionItemsParams({required this.sessionLocalId});
}

/// Use case to get all items in a stock take session
class GetSessionItems
    implements UseCase<List<StockTakeItem>, GetSessionItemsParams> {
  final StockTakeRepository _repository;

  const GetSessionItems(this._repository);

  @override
  Future<Either<Failure, List<StockTakeItem>>> call(
    GetSessionItemsParams params,
  ) async {
    return _repository.getSessionItems(params.sessionLocalId);
  }
}
