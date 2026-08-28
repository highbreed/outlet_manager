import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/shelf_share_session.dart';

/// Abstract repository interface for Shelf Share
abstract class ShelfShareRepository {
  /// Create a new shelf share session
  Future<Either<Failure, ShelfShareSession>> createSession({
    required int visitServerId,
    required int customerId,
    required String customerCode,
    required String customerName,
    required int salesAgentId,
    required String visitLocalId,
  });

  /// Get all sessions for a customer
  Future<Either<Failure, List<ShelfShareSession>>> getSessions({
    int? customerId,
    int page = 1,
    int size = 50,
  });

  /// Get sessions for a specific visit
  Future<Either<Failure, ShelfShareSession?>> getSessionByVisit(int visitId);

  /// Get a single session by ID
  Future<Either<Failure, ShelfShareSession>> getSessionById(int id);

  /// Get a session by local ID
  Future<Either<Failure, ShelfShareSession>> getSessionByLocalId(
    String localId,
  );

  /// Save progress (upsert item groups/brand entries)
  Future<Either<Failure, ShelfShareSession>> saveProgress({
    required String localId,
    required List<ShelfShareItemGroup> itemGroups,
    String? notes,
  });

  /// Submit session for approval
  Future<Either<Failure, ShelfShareSession>> submitSession(String localId);

  /// Get active (in-progress) session for a customer
  Future<Either<Failure, ShelfShareSession?>> getActiveSession(int customerId);

  /// Get active session for a visit from server
  Future<Either<Failure, ShelfShareSession?>> getActiveSessionByVisit(
    int visitId,
  );

  /// Get completed (submitted/approved) sessions for a customer
  Future<Either<Failure, List<ShelfShareSession>>> getCompletedSessions(
    int customerId,
  );

  /// Delete a local-only session
  Future<Either<Failure, void>> deleteSession(String localId);
}
