import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/stock_take_repository.dart';
import 'base_usecase.dart';

class GetItemSerialsParams {
  final String itemLocalId;

  const GetItemSerialsParams({required this.itemLocalId});
}

/// Use case to get all serial numbers for a stock take item
class GetItemSerials
    implements UseCase<List<SerialNumberEntry>, GetItemSerialsParams> {
  final StockTakeRepository _repository;

  const GetItemSerials(this._repository);

  @override
  Future<Either<Failure, List<SerialNumberEntry>>> call(
    GetItemSerialsParams params,
  ) async {
    return _repository.getItemSerials(params.itemLocalId);
  }
}
