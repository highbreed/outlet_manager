import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../repositories/stock_take_repository.dart';
import 'base_usecase.dart';

class SyncItemSerialsParams {
  final String itemLocalId;

  const SyncItemSerialsParams({required this.itemLocalId});
}

/// Use case to push an item's pending serials to the server immediately,
/// rather than waiting for session completion.
class SyncItemSerials implements UseCase<void, SyncItemSerialsParams> {
  final StockTakeRepository _repository;

  const SyncItemSerials(this._repository);

  @override
  Future<Either<Failure, void>> call(SyncItemSerialsParams params) async {
    return _repository.syncItemSerials(params.itemLocalId);
  }
}
