import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../repositories/stock_take_repository.dart';
import 'base_usecase.dart';

class DeleteSerialParams {
  final String serialLocalId;
  final String reason;

  const DeleteSerialParams({required this.serialLocalId, required this.reason});
}

/// Use case to delete a serial number from a stock take item
class DeleteSerial implements UseCase<void, DeleteSerialParams> {
  final StockTakeRepository _repository;

  const DeleteSerial(this._repository);

  @override
  Future<Either<Failure, void>> call(DeleteSerialParams params) async {
    return _repository.deleteSerial(params.serialLocalId, params.reason);
  }
}
