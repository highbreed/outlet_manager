import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/outlet_visit.dart';
import '../repositories/outlet_visit_repository.dart';

/// Use case for skipping an outlet visit.
///
/// Agent can skip a visit with a reason (e.g., outlet closed, road blocked).
/// Some skip reasons require additional notes.
///
/// **Preconditions:**
/// - Visit must be in pending status
/// - Skip reason must be valid
/// - Notes required if skip reason requires them
///
/// **Errors:**
/// - [InvalidVisitStateFailure] if visit not pending
/// - [ValidationFailure] if notes required but not provided
class SkipVisitUseCase {
  final OutletVisitRepository _repository;

  SkipVisitUseCase(this._repository);

  /// Skip a visit.
  ///
  /// [visitLocalId] - Local ID of the visit to skip
  /// [skipReasonId] - ID of the skip reason (from SkipReasonCache)
  /// [skipNotes] - Additional notes (required for some reasons)
  /// [requiresNotes] - Whether this skip reason requires notes
  Future<Either<Failure, OutletVisit>> call({
    required String visitLocalId,
    required int skipReasonId,
    String? skipNotes,
    bool requiresNotes = false,
  }) async {
    // Validate notes are provided if required
    if (requiresNotes && (skipNotes == null || skipNotes.trim().isEmpty)) {
      return Left(
        ValidationFailure(
          message: 'Notes are required for this skip reason',
          fieldErrors: {
            'skipNotes': ['Please provide additional details'],
          },
        ),
      );
    }

    // Get the visit to validate state
    final visitResult = await _repository.getVisitByLocalId(visitLocalId);

    return visitResult.fold((failure) => Left(failure), (visit) async {
      if (visit == null) {
        return Left(
          const NotFoundFailure(
            resourceType: 'OutletVisit',
            resourceId: '',
            message: 'Visit not found',
          ),
        );
      }

      // Validate visit can be skipped
      if (!visit.canSkip) {
        return Left(
          InvalidVisitStateFailure(
            currentStatus: visit.status.name,
            operation: 'skip',
          ),
        );
      }

      // Skip the visit
      return _repository.skipVisit(
        visitLocalId: visitLocalId,
        skipReasonId: skipReasonId,
        skipNotes: skipNotes?.trim(),
      );
    });
  }
}
