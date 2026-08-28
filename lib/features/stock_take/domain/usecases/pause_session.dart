import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/stock_take_repository.dart';
import 'base_usecase.dart';

class PauseSessionParams {
  final String sessionLocalId;

  const PauseSessionParams({required this.sessionLocalId});
}

/// Use case to pause an active stock take session
class PauseSession implements UseCase<StockTakeSession, PauseSessionParams> {
  final StockTakeRepository _repository;

  const PauseSession(this._repository);

  @override
  Future<Either<Failure, StockTakeSession>> call(
    PauseSessionParams params,
  ) async {
    return _repository.pauseSession(params.sessionLocalId);
  }
}
