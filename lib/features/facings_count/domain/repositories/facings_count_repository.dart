import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/facings_count.dart';

/// Abstract repository interface for Horizontal Facings Count
abstract class FacingsCountRepository {
  /// Create a new draft facings count
  Future<Either<Failure, FacingsCount>> createDraft({
    required String visitLocalId,
    int? visitServerId,
    required int customerId,
    required String customerCode,
    required String customerName,
    required int salesAgentId,
  });

  /// Get the in-progress draft for a customer (if any)
  Future<Either<Failure, FacingsCount?>> getActiveDraft(int customerId);

  /// Get a count by its local ID
  Future<Either<Failure, FacingsCount>> getByLocalId(String localId);

  /// Save progress (upsert item groups) on a draft
  Future<Either<Failure, FacingsCount>> saveProgress({
    required String localId,
    required List<FacingsCountItem> items,
  });

  /// Submit a draft count — locks it and syncs to server
  Future<Either<Failure, FacingsCount>> submitCount(String localId);

  /// Discard a draft count
  Future<Either<Failure, void>> discardDraft(String localId);

  /// Get counts submitted today by an agent for a customer
  Future<Either<Failure, List<FacingsCount>>> getTodaySubmitted({
    required int customerId,
    required int salesAgentId,
  });
}
