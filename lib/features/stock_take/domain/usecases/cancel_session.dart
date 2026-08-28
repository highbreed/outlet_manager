import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/stock_take_repository.dart';
import 'base_usecase.dart';

class CancelSessionParams {
  final String sessionLocalId;
  final String reason;

  const CancelSessionParams({
    required this.sessionLocalId,
    required this.reason,
  });
}

/// Use case to cancel a stock take session with a reason
class CancelSession implements UseCase<StockTakeSession, CancelSessionParams> {
  final StockTakeRepository _repository;

  const CancelSession(this._repository);

  @override
  Future<Either<Failure, StockTakeSession>> call(
    CancelSessionParams params,
  ) async {
    // Validate reason is provided
    if (params.reason.trim().isEmpty) {
      return left(
        ValidationFailure(
          message: 'Cancellation reason is required',
          fieldErrors: {
            'reason': ['Please provide a reason for cancellation'],
          },
        ),
      );
    }

    return _repository.cancelSession(params.sessionLocalId, params.reason);
  }
}
