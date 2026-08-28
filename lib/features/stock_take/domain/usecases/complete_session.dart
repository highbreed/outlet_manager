import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/stock_take_repository.dart';
import 'base_usecase.dart';

class CompleteSessionParams {
  final String sessionLocalId;

  const CompleteSessionParams({required this.sessionLocalId});
}

/// Use case to complete and submit a stock take session
/// Validates that all items meet requirements before completion
class CompleteSession
    implements UseCase<StockTakeSession, CompleteSessionParams> {
  final StockTakeRepository _repository;

  const CompleteSession(this._repository);

  @override
  Future<Either<Failure, StockTakeSession>> call(
    CompleteSessionParams params,
  ) async {
    print(
      '[CompleteSession] Starting completion for session: ${params.sessionLocalId}',
    );

    // Get session items to validate
    final itemsResult = await _repository.getSessionItems(
      params.sessionLocalId,
    );

    return itemsResult.fold(
      (failure) {
        print('[CompleteSession] Failed to get items: ${failure.message}');
        return left(failure);
      },
      (items) async {
        print('[CompleteSession] Found ${items.length} items');

        // Validate session can be completed
        if (items.isEmpty) {
          print('[CompleteSession] Validation failed: no items');
          return left(
            ValidationFailure(
              message: 'Session cannot be completed',
              fieldErrors: {
                'session': ['Session must have at least one product'],
              },
            ),
          );
        }

        print('[CompleteSession] Calling repository.completeSession...');
        // Complete the session
        final result = await _repository.completeSession(params.sessionLocalId);
        result.fold(
          (failure) =>
              print('[CompleteSession] Repository failed: ${failure.message}'),
          (session) => print(
            '[CompleteSession] Repository success, session status: ${session.status}',
          ),
        );
        return result;
      },
    );
  }
}
