import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/stock_take_repository.dart';
import 'base_usecase.dart';

class StartStockTakeSessionParams {
  final int customerId;
  final String visitLocalId;
  final int? visitServerId;
  final int warehouseId;
  final String? notes;

  const StartStockTakeSessionParams({
    required this.customerId,
    required this.visitLocalId,
    this.visitServerId,
    required this.warehouseId,
    this.notes,
  });
}

/// Use case to start a new stock take session
///
/// A visit may have at most one active/paused session per warehouse at a
/// time (in practice: one Display session and one Backstore session
/// concurrently for the same visit). A session from a DIFFERENT visit for
/// the same warehouse does not block starting a new one — it's just left
/// alone (not hidden, not auto-cancelled); the agent sees and resolves it
/// separately via the active-session list.
class StartStockTakeSession
    implements UseCase<StockTakeSession, StartStockTakeSessionParams> {
  final StockTakeRepository _repository;

  const StartStockTakeSession(this._repository);

  @override
  Future<Either<Failure, StockTakeSession>> call(
    StartStockTakeSessionParams params,
  ) async {
    // Check for an existing active session for this customer
    final activeSessionsResult = await _repository.getActiveSessions(
      params.customerId,
    );

    return activeSessionsResult.fold(
      (failure) {
        // If it's a NotFound failure, we can proceed (no active sessions)
        if (failure is NotFoundFailure) {
          return _repository.startSession(
            customerId: params.customerId,
            visitLocalId: params.visitLocalId,
            visitServerId: params.visitServerId,
            warehouseId: params.warehouseId,
            notes: params.notes,
          );
        }
        // Other failures should be returned
        return left(failure);
      },
      (activeSessions) {
        // Only a duplicate for the SAME visit AND the SAME warehouse blocks
        // starting a new session — one Display + one Backstore session may
        // run concurrently for a visit, and a leftover session from a
        // different visit for the same warehouse doesn't block a fresh one
        // here (see class doc comment).
        final hasDuplicate = activeSessions.any(
          (s) =>
              s.visitLocalId == params.visitLocalId &&
              s.warehouseId == params.warehouseId,
        );

        if (hasDuplicate) {
          return left(
            ValidationFailure(
              message: 'An active session already exists for this warehouse',
              fieldErrors: {
                'session': ['Please complete or cancel the existing session'],
              },
            ),
          );
        }

        return _repository.startSession(
          customerId: params.customerId,
          visitLocalId: params.visitLocalId,
          visitServerId: params.visitServerId,
          warehouseId: params.warehouseId,
          notes: params.notes,
        );
      },
    );
  }
}
