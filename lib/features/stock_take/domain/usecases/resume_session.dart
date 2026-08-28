import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/stock_take_repository.dart';
import 'base_usecase.dart';

class ResumeSessionParams {
  final String sessionLocalId;

  const ResumeSessionParams({required this.sessionLocalId});
}

/// Use case to resume a paused stock take session
class ResumeSession implements UseCase<StockTakeSession, ResumeSessionParams> {
  final StockTakeRepository _repository;

  const ResumeSession(this._repository);

  @override
  Future<Either<Failure, StockTakeSession>> call(
    ResumeSessionParams params,
  ) async {
    return _repository.resumeSession(params.sessionLocalId);
  }
}
