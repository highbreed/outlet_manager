import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/database/models/sync_operation_model.dart';
import '../../../../core/network/failures.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../../../core/sync/sync_service.dart';
import '../../domain/entities/entities.dart' as domain;
import '../../domain/entities/serial_number_entry.dart' as domain_serial;
import '../../domain/repositories/stock_take_repository.dart';
import '../datasources/stock_take_local_datasource.dart';
import '../datasources/stock_take_remote_datasource.dart';
import '../models/mappers.dart';
import '../models/models.dart'
    hide
        RefillStrategy,
        ProposedOrderJobResponse,
        ProposedOrderProgressResponse;
import '../models/serial_number_entry_model.dart' show SerialStatus;

/// Implementation of stock take repository with offline-first pattern
class StockTakeRepositoryImpl implements StockTakeRepository {
  final StockTakeLocalDataSource _localDataSource;
  final StockTakeRemoteDataSource _remoteDataSource;
  final SyncService? _syncService;
  final int? _currentAgentId;

  const StockTakeRepositoryImpl({
    required StockTakeLocalDataSource localDataSource,
    required StockTakeRemoteDataSource remoteDataSource,
    SyncService? syncService,
    int? currentAgentId,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource,
       _syncService = syncService,
       _currentAgentId = currentAgentId;

  // ============================================================================
  // Brand Management
  // ============================================================================

  @override
  Future<Either<Failure, domain.AgentBrand>> getAgentBrands(int agentId) async {
    try {
      // Try cache first
      final cached = await _localDataSource.getAgentBrands(agentId);
      if (cached != null) {
        return right(cached.toEntity());
      }

      // Fetch from server
      final remote = await _remoteDataSource.fetchAgentBrands(agentId);

      // Cache for offline use
      await _localDataSource.cacheAgentBrands(remote);

      return right(remote.toEntity());
    } on NetworkException catch (e) {
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, domain.AgentBrand>> getMyBrands() async {
    try {
      final remote = await _remoteDataSource.fetchMyBrands();
      // Cache for offline use
      await _localDataSource.cacheAgentBrands(remote);
      return right(remote.toEntity());
    } on NetworkException catch (e) {
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, domain.AgentBrand>> getActiveSessionBrands() async {
    try {
      final remote = await _remoteDataSource.fetchActiveSessionBrands();
      // Cache for offline use
      await _localDataSource.cacheAgentBrands(remote);
      return right(remote.toEntity());
    } on NetworkException catch (e) {
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, domain.AgentCustomerBrands>>
  getActiveSessionCustomerBrands() async {
    try {
      final remote = await _remoteDataSource.fetchActiveSessionCustomerBrands();
      return right(remote.toEntity());
    } on NetworkException catch (e) {
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, domain.AgentCustomerBrands>> getMyBrandsForCustomer(
    int customerId,
  ) async {
    try {
      final remote = await _remoteDataSource.fetchMyBrandsForCustomer(
        customerId,
      );
      return right(remote.toEntity());
    } on NetworkException catch (e) {
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  // ============================================================================
  // Warehouse Management
  // ============================================================================

  @override
  Future<Either<Failure, List<domain.Warehouse>>> getCustomerWarehouses(
    int customerId,
  ) async {
    try {
      // Try cache first
      final cached = await _localDataSource.getCustomerWarehouses(customerId);
      if (cached.isNotEmpty) {
        return right(cached.map((m) => m.toEntity()).toList());
      }

      // Fetch from server
      final remote = await _remoteDataSource.fetchCustomerWarehouses(
        customerId,
      );

      // Cache for offline use
      await _localDataSource.cacheWarehouses(remote);

      return right(remote.map((m) => m.toEntity()).toList());
    } on NetworkException catch (e) {
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  // ============================================================================
  // Customer Products (Catalogue)
  // ============================================================================

  /// Get products catalogue for the active stock take session
  /// Uses the /stock-counts/me/active/catalogue endpoint which includes barcode
  @override
  Future<Either<Failure, List<domain.CustomerProduct>>>
  getActiveSessionCatalogue({
    String? search,
    String? itemCode,
    String? itemName,
    String? barcode,
    String? itemGroup,
    String? itemSubGroup2,
    String? itemSubGroup3,
    String? modelNumber,
    String? productStatus,
    int? brandId,
    int page = 1,
    int size = 200,
  }) async {
    try {
      // Fetch from the active session catalogue endpoint
      final products = await _remoteDataSource.fetchActiveSessionCatalogue(
        search: search,
        itemCode: itemCode,
        itemName: itemName,
        barcode: barcode,
        itemGroup: itemGroup,
        itemSubGroup2: itemSubGroup2,
        itemSubGroup3: itemSubGroup3,
        modelNumber: modelNumber,
        productStatus: productStatus,
        brandId: brandId,
        page: page,
        size: size,
      );

      // Cache for offline use
      if (products.isNotEmpty) {
        await _localDataSource.cacheCustomerProducts(products);
      }

      return right(products.map((m) => m.toEntity()).toList());
    } on NetworkException catch (e) {
      // Fall back to cached products if network fails
      // Note: We need the customerId from the active session
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  /// Search for a product by barcode
  /// First checks local cache, then fetches from backend if not found
  @override
  Future<Either<Failure, domain.CustomerProduct?>> findProductByBarcode(
    String barcode,
  ) async {
    try {
      // 1. First search in local cache
      final cachedProduct = await _localDataSource.findProductByBarcode(
        barcode,
      );
      if (cachedProduct != null) {
        return right(cachedProduct.toEntity());
      }

      // 2. Not found locally - search backend by barcode (exact match)
      final products = await _remoteDataSource.fetchActiveSessionCatalogue(
        barcode: barcode,
        size: 1,
      );

      if (products.isNotEmpty) {
        // Cache the found product
        await _localDataSource.cacheCustomerProducts(products);
        return right(products.first.toEntity());
      }

      // 3. Still not found - try searching by item_code as fallback
      final productsByCode = await _remoteDataSource
          .fetchActiveSessionCatalogue(itemCode: barcode, size: 1);

      if (productsByCode.isNotEmpty) {
        await _localDataSource.cacheCustomerProducts(productsByCode);
        return right(productsByCode.first.toEntity());
      }

      // 4. Not found anywhere
      return right(null);
    } on NetworkException catch (e) {
      // Network error - try local cache only and indicate network issue
      final cachedProduct = await _localDataSource.findProductByBarcode(
        barcode,
      );
      if (cachedProduct != null) {
        return right(cachedProduct.toEntity());
      }
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  /// Search for products by search term
  /// First checks local cache, then fetches from backend
  @override
  Future<Either<Failure, List<domain.CustomerProduct>>> searchProducts(
    String searchTerm,
  ) async {
    try {
      // 1. First search in local cache
      final cachedProducts = await _localDataSource.searchProducts(searchTerm);
      if (cachedProducts.isNotEmpty) {
        return right(cachedProducts.map((m) => m.toEntity()).toList());
      }

      // 2. Not found locally - search backend
      final products = await _remoteDataSource.fetchActiveSessionCatalogue(
        search: searchTerm,
      );

      if (products.isNotEmpty) {
        // Cache the found products
        await _localDataSource.cacheCustomerProducts(products);
      }

      return right(products.map((m) => m.toEntity()).toList());
    } on NetworkException catch (e) {
      // Network error - return local cache results only
      final cachedProducts = await _localDataSource.searchProducts(searchTerm);
      if (cachedProducts.isNotEmpty) {
        return right(cachedProducts.map((m) => m.toEntity()).toList());
      }
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<domain.CustomerProduct>>> getCustomerProducts(
    int customerId, {
    int? brandId,
  }) async {
    try {
      // Try cache first
      final cached = brandId != null
          ? await _localDataSource.getCustomerProductsByBrand(
              customerId,
              brandId,
            )
          : await _localDataSource.getCustomerProducts(customerId);

      if (cached.isNotEmpty) {
        return right(cached.map((m) => m.toEntity()).toList());
      }

      // Fetch from server
      final remote = await _remoteDataSource.fetchCustomerProducts(
        customerId: customerId,
        brandId: brandId,
      );

      // Cache for offline use
      await _localDataSource.cacheCustomerProducts(remote);

      return right(remote.map((m) => m.toEntity()).toList());
    } on NetworkException catch (e) {
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  // ============================================================================
  // Session Management
  // ============================================================================

  @override
  Future<Either<Failure, domain.StockTakeSession>> startSession({
    required int customerId,
    required String visitLocalId,
    int? visitServerId,
    required int warehouseId,
    String? notes,
  }) async {
    try {
      print(
        '[StockTake] startSession called: customerId=$customerId, visitLocalId=$visitLocalId, visitServerId=$visitServerId, warehouseId=$warehouseId',
      );

      // Get warehouse details
      final warehouse = await _localDataSource.getWarehouseByServerId(
        warehouseId,
      );
      if (warehouse == null) {
        print('[StockTake] Warehouse not found: $warehouseId');
        return left(
          NotFoundFailure(
            resourceType: 'Unknown',
            resourceId: 'unknown',
            message: 'Warehouse not found',
          ),
        );
      }

      // Check if visit is synced - we need visitServerId to create session on server
      if (visitServerId == null) {
        print('[StockTake] visitServerId is null, cannot create session');
        return left(
          UnknownFailure(
            message:
                'Cannot start stock take - visit not synced to server. Please ensure you are clocked in.',
          ),
        );
      }

      // Generate local ID for device_session_id
      final localId = const Uuid().v4();

      // Try to create session on server FIRST
      print(
        '[StockTake] Attempting to create session on server (visitServerId=$visitServerId)',
      );
      try {
        final response = await _remoteDataSource.createSession(
          visitId: visitServerId,
          warehouseId: warehouseId,
          deviceSessionId: localId,
          notes: notes,
        );

        print('[StockTake] Server response: $response');

        // Parse server response safely
        final serverId = response['id'] as int?;
        // Prefer the currently authenticated app user's id over the
        // backend's sales_agent_id: local queries (getActiveSessions,
        // getAllActiveSessions) filter strictly by _currentAgentId to keep
        // one device user from ever seeing another's session, so if the
        // backend's value ever differs (or is missing, defaulting to 0)
        // the session would be created successfully, display fine
        // immediately (the UI sets it directly from this return value,
        // bypassing the query), and then silently vanish forever on the
        // very next agent-scoped query - exactly what "session disappears
        // after navigating away and back" looks like.
        final salesAgentId =
            _currentAgentId ?? (response['sales_agent_id'] as int? ?? 0);

        if (serverId == null) {
          print('[StockTake] Server response missing id field');
          return left(
            UnknownFailure(
              message:
                  'Failed to create stock take session. Invalid server response.',
            ),
          );
        }

        // Server succeeded - now create local session with server data
        final localSession = StockTakeSessionModel()
          ..localId = localId
          ..serverId = serverId
          ..visitLocalId = visitLocalId
          ..visitServerId = visitServerId
          ..customerId = customerId
          ..outletCode = ''
          ..outletName = ''
          ..warehouseId = warehouseId
          ..warehouseName = warehouse.warehouseName
          ..warehouseType = warehouse.warehouseType
          ..salesAgentId = salesAgentId
          ..startedAt = DateTime.now()
          ..status = StockTakeStatus.active
          ..totalProducts = 0
          ..totalSerials = 0
          ..notes = notes
          ..syncState = SyncState.synced
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now();

        await _localDataSource.createSession(localSession);
        print(
          '[StockTake] Created local session with localId=$localId, serverId=${response['id']}',
        );

        return right(localSession.toEntity());
      } on NetworkException catch (e) {
        // Get error message from backend if available
        print('[StockTake] Network error while creating session: $e');
        final errorMessage = e.message.isNotEmpty
            ? e.message
            : 'Failed to create stock take session. Please check your connection and try again.';
        return left(UnknownFailure(message: errorMessage));
      } catch (e) {
        print('[StockTake] Error creating session on server: $e');
        // Show generic error to user for unexpected errors (parsing errors, type mismatches, etc.)
        return left(
          UnknownFailure(
            message:
                'Failed to create stock take session. Please try again or contact support.',
          ),
        );
      }
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, domain.StockTakeSession>> getSession(
    String localId,
  ) async {
    try {
      final session = await _localDataSource.getSessionByLocalId(localId);
      if (session == null) {
        return left(
          NotFoundFailure(
            resourceType: 'Unknown',
            resourceId: 'unknown',
            message: 'Session not found',
          ),
        );
      }
      return right(session.toEntity());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  /// Validate a specific cached session against the backend before trusting
  /// it as resumable - e.g. right before opening its counting screen from a
  /// cached session ID, rather than from the sessions list screens (which
  /// already reconcile via getActiveSessions/getAllActiveSessions). See
  /// _reconcileWithBackend for why this check exists.
  @override
  Future<Either<Failure, domain.StockTakeSession>> validateSession(
    String localId,
  ) async {
    try {
      final session = await _localDataSource.getSessionByLocalId(localId);
      if (session == null) {
        return left(
          NotFoundFailure(
            resourceType: 'Unknown',
            resourceId: 'unknown',
            message: 'Session not found',
          ),
        );
      }

      // Mutates `session` in place with whatever the backend reports,
      // regardless of whether it ends up in the (filtered) returned list.
      await _reconcileWithBackend([session]);
      return right(session.toEntity());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<domain.StockTakeSession>>> getActiveSessions(
    int customerId,
  ) async {
    try {
      final agentId = _currentAgentId;
      if (agentId == null) {
        // No authenticated agent to scope the query to - never fall back
        // to an unscoped lookup, or one agent's session could leak to
        // another on a shared device.
        return right(const []);
      }

      // First try local database
      var sessions = await _localDataSource.getActiveSessions(
        customerId,
        agentId,
      );

      // If no local sessions, try fetching from backend using /me/active endpoint
      if (sessions.isEmpty) {
        print(
          '[StockTake] No local sessions for customer $customerId, fetching from backend...',
        );
        await _fetchAndSaveMyActiveSession();
        // Re-fetch from local after backend sync
        sessions = await _localDataSource.getActiveSessions(
          customerId,
          agentId,
        );
      } else {
        // A non-empty local result short-circuits the branch above, so a
        // session the backend auto-cancelled after this device last synced
        // (e.g. its day-scoping cutover) would otherwise show as active
        // forever - see _reconcileWithBackend for why this check exists.
        sessions = await _reconcileWithBackend(sessions);
      }

      return right(sessions.map((s) => s.toEntity()).toList());
    } catch (e) {
      print('[StockTake] getActiveSessions error: $e');
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<domain.StockTakeSession>>>
  getAllActiveSessions() async {
    try {
      final agentId = _currentAgentId;
      if (agentId == null) {
        // No authenticated agent to scope the query to - never fall back
        // to an unscoped lookup, or one agent's session could leak to
        // another on a shared device.
        return right(const []);
      }

      // First try local database
      var sessions = await _localDataSource.getAllActiveSessions(agentId);

      // If no local sessions, try fetching from backend using /me/active endpoint
      if (sessions.isEmpty) {
        print('[StockTake] No local active sessions, fetching from backend...');
        await _fetchAndSaveMyActiveSession();
        // Re-fetch from local after backend sync
        sessions = await _localDataSource.getAllActiveSessions(agentId);
      } else {
        sessions = await _reconcileWithBackend(sessions);
      }

      return right(sessions.map((s) => s.toEntity()).toList());
    } catch (e) {
      print('[StockTake] getAllActiveSessions error: $e');
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<domain.StockTakeSession>>> getCompletedSessions(
    int customerId, {
    DateTime? since,
  }) async {
    try {
      final sessions = await _localDataSource.getCompletedSessions(
        customerId,
        since: since,
      );
      print(
        '[StockTake] getCompletedSessions found ${sessions.length} completed sessions for customer $customerId (since: $since)',
      );
      return right(sessions.map((s) => s.toEntity()).toList());
    } catch (e) {
      print('[StockTake] getCompletedSessions error: $e');
      return left(UnknownFailure(message: e.toString()));
    }
  }

  /// Fetch today's sessions from backend and sync to local storage
  /// Returns sessions for the specified customer
  @override
  Future<Either<Failure, List<domain.StockTakeSession>>> fetchTodaysSessions(
    int customerId,
  ) async {
    try {
      print('[StockTake] Fetching today\'s sessions from backend...');
      final remoteSessions = await _remoteDataSource.getTodaysSessions();
      print(
        '[StockTake] Backend returned ${remoteSessions.length} sessions for today',
      );

      // Save/update each session locally
      for (final sessionData in remoteSessions) {
        final serverId = sessionData['id'] as int?;
        if (serverId == null) continue;

        final existing = await _localDataSource.getSessionByServerId(serverId);
        final model = StockTakeSessionModel.fromJson(sessionData);

        if (existing == null) {
          // Prefer our own authenticated user id over whatever the backend
          // put in sales_agent_id - see the matching comment in
          // startSession(). Without this, a freshly-synced session can be
          // created invisible to every future agent-scoped query.
          if (_currentAgentId != null) {
            model.salesAgentId = _currentAgentId;
          }
          // Create new local record
          await _localDataSource.createSession(model);
          print('[StockTake] Created local session for server ID $serverId');
        } else {
          // Update existing record with server data, but keep locally-owned
          // identifiers as-is: the backend has no concept of our device-only
          // visitLocalId, so StockTakeSessionModel.fromJson falls back to a
          // synthesized 'remote_visit_<id>' placeholder whenever the server
          // omits it (which it always does - createSession() never sends it
          // in the first place). Overwriting the real value with that
          // placeholder corrupted the session's visit association on every
          // later reload. Same reasoning for salesAgentId - it's what local
          // agent-scoped queries filter on, so it must stay whatever this
          // device already resolved it to, not the backend's raw field.
          model
            ..id = existing.id
            ..localId = existing.localId
            ..visitLocalId = existing.visitLocalId
            ..salesAgentId = existing.salesAgentId;
          await _localDataSource.updateSession(model);
          print('[StockTake] Updated local session for server ID $serverId');
        }
      }

      // Now fetch from local storage filtered by customer
      final todayStart = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      );
      final sessions = await _localDataSource.getCompletedSessions(
        customerId,
        since: todayStart,
      );

      print(
        '[StockTake] fetchTodaysSessions: ${sessions.length} sessions for customer $customerId',
      );
      return right(sessions.map((s) => s.toEntity()).toList());
    } on NetworkException catch (e) {
      print('[StockTake] fetchTodaysSessions network error: ${e.message}');
      // Fall back to local data if network fails
      final todayStart = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      );
      final sessions = await _localDataSource.getCompletedSessions(
        customerId,
        since: todayStart,
      );
      return right(sessions.map((s) => s.toEntity()).toList());
    } catch (e) {
      print('[StockTake] fetchTodaysSessions error: $e');
      return left(UnknownFailure(message: e.toString()));
    }
  }

  /// Helper to fetch user's active session from backend and save locally
  Future<void> _fetchAndSaveMyActiveSession() async {
    try {
      final activeSessionData = await _remoteDataSource.getMyActiveSession();

      if (activeSessionData != null) {
        print(
          '[StockTake] Backend returned active session: ${activeSessionData['id']}',
        );

        final model = StockTakeSessionModel.fromJson(activeSessionData);

        // Check if already exists locally by serverId
        final existing = await _localDataSource.getSessionByServerId(
          model.serverId!,
        );
        if (existing == null) {
          // See the matching comment in startSession(): local agent-scoped
          // queries filter on our own authenticated user id, not whatever
          // the backend's sales_agent_id happens to be.
          if (_currentAgentId != null) {
            model.salesAgentId = _currentAgentId;
          }
          await _localDataSource.createSession(model);
          print('[StockTake] Saved session ${model.serverId} to local db');
        } else {
          print('[StockTake] Session ${model.serverId} already exists locally');
        }
      } else {
        print('[StockTake] No active session found on backend');
      }
    } on NetworkException catch (e) {
      print('[StockTake] Backend fetch failed: ${e.message}');
      // Continue with empty local sessions if network fails
    }
  }

  /// Re-validate locally-cached active/paused sessions against the backend
  /// before trusting them.
  ///
  /// Sessions are day-scoped server-side: if an agent starts a count and
  /// never completes it before midnight, the backend auto-cancels it the
  /// next time anything asks about it. That happens entirely server-side -
  /// this device only finds out by asking. Without this check, a session
  /// already cached locally as active/paused is never re-queried (see
  /// getActiveSessions/getAllActiveSessions: the backend is only consulted
  /// when the local result is empty), so a session cancelled server-side
  /// yesterday would otherwise keep showing as active on this device
  /// forever, with every real action against it (add item, complete, sync)
  /// failing against a session the server no longer recognizes.
  ///
  /// Returns only the sessions that are still genuinely resumable; any
  /// session the backend reports as no longer active/paused is updated
  /// locally to match and dropped from the result. Sessions that haven't
  /// synced to the server yet (no serverId), or that can't be checked right
  /// now (offline), are passed through unchanged rather than discarded.
  Future<List<StockTakeSessionModel>> _reconcileWithBackend(
    List<StockTakeSessionModel> sessions,
  ) async {
    final reconciled = <StockTakeSessionModel>[];

    for (final session in sessions) {
      if (session.serverId == null) {
        // Never synced to the server - nothing to validate against yet.
        reconciled.add(session);
        continue;
      }

      try {
        final data = await _remoteDataSource.validateSession(
          session.serverId!,
        );

        if (data == null) {
          // Backend no longer knows this session for this agent - treat it
          // the same as an explicit cancellation so it stops being offered
          // as resumable.
          print(
            '[StockTake] Session ${session.serverId} no longer found on server, marking cancelled locally',
          );
          session
            ..status = StockTakeStatus.cancelled
            ..cancelledAt = DateTime.now()
            ..cancelReason ??= 'Session no longer found on server';
          await _localDataSource.updateSession(session);
          continue;
        }

        final backendStatus = (data['status'] as String?)?.toLowerCase();

        if (backendStatus == 'in_progress' || backendStatus == 'paused') {
          session.status = backendStatus == 'paused'
              ? StockTakeStatus.paused
              : StockTakeStatus.active;
          reconciled.add(session);
          continue;
        }

        // Any other status (cancelled, completed, submitted, approved,
        // rejected) means the backend no longer considers this session
        // open. Sync the cancellation reason through when present so the
        // UI can explain why (e.g. "Carried over from 2026-08-25").
        print(
          '[StockTake] Session ${session.serverId} is $backendStatus on the backend, dropping from active list',
        );
        session
          ..status = backendStatus == 'completed'
              ? StockTakeStatus.completed
              : StockTakeStatus.cancelled
          ..cancelledAt = DateTime.now()
          ..cancelReason ??= data['partial_reason'] as String?;
        await _localDataSource.updateSession(session);
      } on NetworkException catch (e) {
        // Can't reach the backend right now - fail open and keep the
        // cached session usable offline rather than blocking the agent.
        print(
          '[StockTake] Could not validate session ${session.serverId}: ${e.message}',
        );
        reconciled.add(session);
      }
    }

    return reconciled;
  }

  /// Common cleanup for when a write against a session gets a definitive
  /// "not found" (404) from the server - i.e. the backend has authoritatively
  /// dropped this session (most commonly its day-scoping auto-cancel), as
  /// opposed to a transient offline/timeout error where queuing a retry
  /// still makes sense. Marks the session cancelled locally so the two
  /// sides stop diverging, and reports failure instead of letting the
  /// caller's optimistic local update stand as if the write had succeeded.
  Future<Either<Failure, domain.StockTakeSession>> _dropStaleSession(
    StockTakeSessionModel session,
    String localId,
  ) async {
    session
      ..status = StockTakeStatus.cancelled
      ..cancelledAt = DateTime.now()
      ..cancelReason ??= 'Session no longer found on server';
    await _localDataSource.updateSession(session);

    return left(
      NotFoundFailure(
        resourceType: 'StockTakeSession',
        resourceId: localId,
        message:
            'This session is no longer active on the server. It may have '
            'been closed automatically because it was left open overnight.',
      ),
    );
  }

  @override
  Future<Either<Failure, domain.StockTakeSession>> pauseSession(
    String localId,
  ) async {
    try {
      final session = await _localDataSource.getSessionByLocalId(localId);
      if (session == null) {
        return left(
          NotFoundFailure(
            resourceType: 'Unknown',
            resourceId: 'unknown',
            message: 'Session not found',
          ),
        );
      }

      // Update local status
      final updated = session
        ..status = StockTakeStatus.paused
        ..pausedAt = DateTime.now()
        ..lastPausedAt = DateTime.now();

      await _localDataSource.updateSession(updated);

      // Sync to server if online and synced
      if (session.serverId != null) {
        try {
          await _remoteDataSource.pauseSession(session.serverId!);
        } on NetworkException catch (e) {
          if (e.statusCode == 404) {
            return _dropStaleSession(updated, localId);
          }
          // Otherwise queue for later sync (offline, timeout, etc.)
        }
      }

      return right(updated.toEntity());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, domain.StockTakeSession>> resumeSession(
    String localId,
  ) async {
    try {
      final session = await _localDataSource.getSessionByLocalId(localId);
      if (session == null) {
        return left(
          NotFoundFailure(
            resourceType: 'Unknown',
            resourceId: 'unknown',
            message: 'Session not found',
          ),
        );
      }

      // Update local status
      final updated = session
        ..status = StockTakeStatus.active
        ..resumedAt = DateTime.now()
        ..lastResumedAt = DateTime.now();

      await _localDataSource.updateSession(updated);

      // Sync to server if online and synced
      if (session.serverId != null) {
        try {
          await _remoteDataSource.resumeSession(session.serverId!);
        } on NetworkException catch (e) {
          if (e.statusCode == 404) {
            return _dropStaleSession(updated, localId);
          }
          // Otherwise queue for later sync (offline, timeout, etc.)
        }
      }

      return right(updated.toEntity());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, domain.StockTakeSession>> completeSession(
    String localId,
  ) async {
    print('[StockTakeRepo] completeSession called for: $localId');
    try {
      final session = await _localDataSource.getSessionByLocalId(localId);
      if (session == null) {
        print('[StockTakeRepo] Session not found locally');
        return left(
          NotFoundFailure(
            resourceType: 'Unknown',
            resourceId: 'unknown',
            message: 'Session not found',
          ),
        );
      }

      print('[StockTakeRepo] Session found, serverId: ${session.serverId}');

      // Sync all items and serials to server before completing
      if (session.serverId != null) {
        print('[StockTakeRepo] Starting server sync...');
        try {
          // Get all items for this session
          final items = await _localDataSource.getSessionItems(localId);
          print('[StockTakeRepo] Found ${items.length} items to sync');

          for (final item in items) {
            // Ensure item is synced
            if (item.serverId == null) {
              print(
                '[StockTakeRepo] Creating item on server for: ${item.localId}',
              );
              // Create item on server first
              final itemResponse = await _remoteDataSource.addItem(
                sessionId: session.serverId!,
                customerProductId: item.customerProductId,
              );
              item.serverId = itemResponse['id'];
              await _localDataSource.updateItem(item);
            }

            // Get all serials for this item
            final serials = await _localDataSource.getItemSerials(item.localId);

            // Filter pending serials that haven't been synced
            final pendingSerials = serials
                .where((s) => s.syncState == SyncState.pending)
                .toList();

            print(
              '[StockTakeRepo] Item ${item.localId}: ${pendingSerials.length} pending serials',
            );

            if (pendingSerials.isNotEmpty && item.serverId != null) {
              print(
                '[StockTakeRepo] Uploading ${pendingSerials.length} serials to item ${item.serverId}...',
              );
              // Upload serials in batch
              final serialsData = pendingSerials
                  .map(
                    (s) => {
                      'serial_number': s.serialNumberRaw,
                      'device_scan_id': s.deviceScanId,
                      'device_scanned_at': s.deviceScannedAt.toIso8601String(),
                      if (s.scanSequence != null)
                        'scan_sequence': s.scanSequence,
                    },
                  )
                  .toList();

              try {
                final response = await _remoteDataSource.uploadSerialsBatch(
                  sessionId: session.serverId!,
                  itemId: item.serverId!,
                  serials: serialsData,
                );
                print('[StockTakeRepo] Serials uploaded successfully');

                // Update local serials with server IDs if provided
                final uploadedSerials =
                    response['serials'] as List<dynamic>? ?? [];
                for (
                  var i = 0;
                  i < pendingSerials.length && i < uploadedSerials.length;
                  i++
                ) {
                  final uploadedData =
                      uploadedSerials[i] as Map<String, dynamic>;
                  pendingSerials[i]
                    ..serverId = uploadedData['id'] as int?
                    ..syncState = SyncState.synced;
                  await _localDataSource.updateSerial(pendingSerials[i]);
                }

                // Mark any remaining serials as synced even if no server ID returned
                for (
                  var i = uploadedSerials.length;
                  i < pendingSerials.length;
                  i++
                ) {
                  pendingSerials[i].syncState = SyncState.synced;
                  await _localDataSource.updateSerial(pendingSerials[i]);
                }

                print(
                  '[StockTakeRepo] All ${pendingSerials.length} serials marked as synced',
                );
              } catch (e) {
                print(
                  '[StockTakeRepo] Error uploading serials for item ${item.localId}: $e',
                );
                // Re-throw to trigger background sync
                rethrow;
              }
            }
          }

          // Now complete the session on server
          print('[StockTakeRepo] Completing session on server...');
          await _remoteDataSource.completeSession(session.serverId!);
          print('[StockTakeRepo] Server completion successful');
        } on NetworkException catch (e) {
          if (e.statusCode == 404) {
            // The session itself is gone server-side - e.g. auto-cancelled
            // by day-scoping before the agent finished counting. Queuing a
            // background retry would fail forever against a session ID
            // that no longer exists, and marking this "completed" below
            // would silently lose the count data without ever telling the
            // agent - surface it instead.
            print(
              '[StockTake] Session ${session.serverId} not found on server (404), aborting completion',
            );
            return _dropStaleSession(session, localId);
          }
          // Network failed for another reason - queue for background sync
          print('[StockTake] Network failed during complete: ${e.message}');
          print('[StockTake] Queuing background sync for session...');
          await _queueBackgroundSync(session, localId);
        } catch (e) {
          // Other error (API error, parsing error, etc.) - also queue for background sync
          print('[StockTake] Error during server sync: $e');
          print('[StockTake] Queuing background sync for session...');
          await _queueBackgroundSync(session, localId);
        }
      } else {
        print('[StockTakeRepo] No server ID, skipping server sync');
      }

      // Update local status
      print('[StockTakeRepo] Updating local session status to completed');
      final updated = session
        ..status = StockTakeStatus.completed
        ..completedAt = DateTime.now();

      await _localDataSource.updateSession(updated);
      print('[StockTakeRepo] Session completed successfully');

      return right(updated.toEntity());
    } catch (e) {
      print('[StockTakeRepo] Error during completion: $e');
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> syncSessionItems(String localId) async {
    print('[StockTakeRepo] syncSessionItems called for: $localId');
    try {
      final session = await _localDataSource.getSessionByLocalId(localId);
      if (session == null) {
        print('[StockTakeRepo] Session not found locally');
        return left(
          NotFoundFailure(
            resourceType: 'Unknown',
            resourceId: 'unknown',
            message: 'Session not found',
          ),
        );
      }

      if (session.serverId == null) {
        print('[StockTakeRepo] Session has no serverId, cannot sync to server');
        return left(
          UnknownFailure(
            message:
                'Session not synced to server yet. Visit must be clocked in.',
          ),
        );
      }

      int syncedCount = 0;
      print('[StockTakeRepo] Starting item/serial sync...');

      // Get all items for this session
      final items = await _localDataSource.getSessionItems(localId);
      print('[StockTakeRepo] Found ${items.length} items to check');

      for (final item in items) {
        // Ensure item is synced
        if (item.serverId == null) {
          print('[StockTakeRepo] Creating item on server for: ${item.localId}');
          final itemResponse = await _remoteDataSource.addItem(
            sessionId: session.serverId!,
            customerProductId: item.customerProductId,
          );
          item.serverId = itemResponse['id'];
          await _localDataSource.updateItem(item);
          syncedCount++;
        }

        // Get all serials for this item
        final serials = await _localDataSource.getItemSerials(item.localId);

        // Filter pending serials that haven't been synced
        final pendingSerials = serials
            .where((s) => s.syncState == SyncState.pending)
            .toList();

        print(
          '[StockTakeRepo] Item ${item.localId}: ${pendingSerials.length} pending serials',
        );

        if (pendingSerials.isNotEmpty && item.serverId != null) {
          print(
            '[StockTakeRepo] Uploading ${pendingSerials.length} serials to item ${item.serverId}...',
          );

          final serialsData = pendingSerials
              .map(
                (s) => {
                  'serial_number': s.serialNumberRaw,
                  'device_scan_id': s.deviceScanId,
                  'device_scanned_at': s.deviceScannedAt.toIso8601String(),
                  if (s.scanSequence != null) 'scan_sequence': s.scanSequence,
                },
              )
              .toList();

          final response = await _remoteDataSource.uploadSerialsBatch(
            sessionId: session.serverId!,
            itemId: item.serverId!,
            serials: serialsData,
          );
          print('[StockTakeRepo] Serials uploaded successfully');

          // Update local serials with server IDs if provided
          final uploadedSerials = response['serials'] as List<dynamic>? ?? [];
          for (
            var i = 0;
            i < pendingSerials.length && i < uploadedSerials.length;
            i++
          ) {
            final uploadedData = uploadedSerials[i] as Map<String, dynamic>;
            pendingSerials[i]
              ..serverId = uploadedData['id'] as int?
              ..syncState = SyncState.synced;
            await _localDataSource.updateSerial(pendingSerials[i]);
          }

          // Mark any remaining serials as synced
          for (var i = uploadedSerials.length; i < pendingSerials.length; i++) {
            pendingSerials[i].syncState = SyncState.synced;
            await _localDataSource.updateSerial(pendingSerials[i]);
          }

          syncedCount += pendingSerials.length;
          print(
            '[StockTakeRepo] Synced ${pendingSerials.length} serials for item',
          );
        }
      }

      print('[StockTakeRepo] Total synced: $syncedCount items/serials');
      return right(syncedCount);
    } on NetworkException catch (e) {
      print('[StockTakeRepo] Network error during sync: ${e.message}');
      return left(NetworkFailure.connectionError(message: e.message));
    } catch (e) {
      print('[StockTakeRepo] Error during sync: $e');
      return left(UnknownFailure(message: e.toString()));
    }
  }

  /// Queue background sync operations for pending serials and session completion
  Future<void> _queueBackgroundSync(
    StockTakeSessionModel session,
    String sessionLocalId,
  ) async {
    if (_syncService == null) {
      print('[StockTake] SyncService is null, cannot queue background sync');
      return;
    }

    print('[StockTake] Starting to queue background sync operations...');

    // Get all items and their pending serials
    final items = await _localDataSource.getSessionItems(sessionLocalId);
    print('[StockTake] Found ${items.length} items to process');

    for (final item in items) {
      final serials = await _localDataSource.getItemSerials(item.localId);
      final pendingSerials = serials
          .where((s) => s.syncState == SyncState.pending)
          .toList();

      print(
        '[StockTake] Item ${item.localId}: ${pendingSerials.length} pending serials',
      );

      if (pendingSerials.isNotEmpty) {
        // Queue serial upload operation
        await _syncService!.createOperation(
          type: SyncOperationType.uploadStockTakeSerials,
          entityType: 'stock_take_item',
          entityId: item.localId,
          data: {
            'session_server_id': session.serverId,
            'session_local_id': sessionLocalId,
            'item_server_id': item.serverId,
            'item_local_id': item.localId,
            'customer_product_id': item.customerProductId,
            'serials': pendingSerials
                .map(
                  (s) => {
                    'local_id': s.localId,
                    'serial_number': s.serialNumberRaw,
                    'device_scan_id': s.deviceScanId,
                    'device_scanned_at': s.deviceScannedAt.toIso8601String(),
                    if (s.scanSequence != null) 'scan_sequence': s.scanSequence,
                  },
                )
                .toList(),
          },
          priority: 10, // Higher priority for stock take data
        );
        print('[StockTake] Queued serial upload for item ${item.localId}');
      }
    }

    // Queue session completion operation (depends on serial uploads)
    await _syncService!.createOperation(
      type: SyncOperationType.completeStockTake,
      entityType: 'stock_take_session',
      entityId: sessionLocalId,
      data: {
        'session_server_id': session.serverId,
        'session_local_id': sessionLocalId,
      },
      priority: 15, // Lower priority than serial uploads (runs after)
    );
    print('[StockTake] Queued session completion for $sessionLocalId');
  }

  @override
  Future<Either<Failure, domain.StockTakeSession>> cancelSession(
    String localId,
    String reason,
  ) async {
    try {
      final session = await _localDataSource.getSessionByLocalId(localId);
      if (session == null) {
        return left(
          NotFoundFailure(
            resourceType: 'Unknown',
            resourceId: 'unknown',
            message: 'Session not found',
          ),
        );
      }

      // Update local status
      final updated = session
        ..status = StockTakeStatus.cancelled
        ..cancelledAt = DateTime.now()
        ..cancelReason = reason;

      await _localDataSource.updateSession(updated);

      // Sync to server if online and synced
      if (session.serverId != null) {
        try {
          await _remoteDataSource.cancelSession(
            session.serverId!,
            reason: reason,
          );
        } on NetworkException {
          // Queue for later sync
        }
      }

      return right(updated.toEntity());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  // ============================================================================
  // Item Management
  // ============================================================================

  @override
  Future<Either<Failure, domain.StockTakeItem>> addProduct({
    required String sessionLocalId,
    required int customerProductId,
  }) async {
    try {
      final session = await _localDataSource.getSessionByLocalId(
        sessionLocalId,
      );
      if (session == null) {
        return left(
          NotFoundFailure(
            resourceType: 'Unknown',
            resourceId: 'unknown',
            message: 'Session not found',
          ),
        );
      }

      // Look up the product from local storage to get all fields
      final product = await _localDataSource.getCustomerProductByServerId(
        customerProductId,
      );

      // Create local item with product details from local storage
      final localItem = StockTakeItemModel()
        ..localId = const Uuid().v4()
        ..sessionLocalId = sessionLocalId
        ..customerProductId = customerProductId
        ..brandId = product?.brandId ?? 0
        ..brandName = product?.brandName ?? ''
        ..itemCode = product?.itemCode ?? ''
        ..itemName = product?.itemName ?? ''
        ..itemDescription = product?.itemDescription
        ..category = product?.itemGroup
        ..modelNumber = product?.modelNumber
        ..serialCount = 0
        ..minStockLevel =
            product?.activeMinOnshelf ?? product?.zcMinOnshelfQty ?? 0
        ..maxStockLevel =
            product?.activeMaxOnshelf ?? product?.zcMaxOnshelfQty ?? 0
        ..status = ItemCountStatus.inProgress
        ..startedAt = DateTime.now()
        ..syncState = SyncState.pending
        ..updatedAt = DateTime.now();

      await _localDataSource.createItem(localItem);
      print('[StockTakeRepo] Item ${localItem.localId} created locally');

      // Sync to server if session is synced
      if (session.serverId != null) {
        print(
          '[StockTakeRepo] Syncing item to server (session ${session.serverId})...',
        );
        try {
          final response = await _remoteDataSource.addItem(
            sessionId: session.serverId!,
            customerProductId: customerProductId,
          );
          print(
            '[StockTakeRepo] Item synced to server, serverId: ${response['id']}',
          );

          // Update with server ID and details (prefer server values but keep local if server is empty)
          final updated = localItem
            ..serverId = response['id']
            ..brandId = response['brand_id'] ?? localItem.brandId
            ..brandName =
                (response['brand_name'] as String?)?.isNotEmpty == true
                ? response['brand_name']
                : localItem.brandName
            ..itemCode = (response['item_code'] as String?)?.isNotEmpty == true
                ? response['item_code']
                : localItem.itemCode
            ..itemName = (response['item_name'] as String?)?.isNotEmpty == true
                ? response['item_name']
                : localItem.itemName
            ..modelNumber =
                (response['model_number'] as String?)?.isNotEmpty == true
                ? response['model_number']
                : localItem.modelNumber
            ..minStockLevel =
                response['min_stock_level'] ?? localItem.minStockLevel
            ..maxStockLevel =
                response['max_stock_level'] ?? localItem.maxStockLevel
            ..syncState = SyncState.synced;

          await _localDataSource.updateItem(updated);

          return right(updated.toEntity());
        } on NetworkException catch (e) {
          print('[StockTakeRepo] Failed to sync item to server: ${e.message}');
          // Queue for later sync - item will be synced when completing session
          return right(localItem.toEntity());
        }
      } else {
        print(
          '[StockTakeRepo] Session not synced to server yet, item will sync later',
        );
      }

      return right(localItem.toEntity());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, domain.StockTakeItem>> getItem(String localId) async {
    try {
      final item = await _localDataSource.getItemByLocalId(localId);
      if (item == null) {
        return left(
          NotFoundFailure(
            resourceType: 'Unknown',
            resourceId: 'unknown',
            message: 'Item not found',
          ),
        );
      }
      return right(item.toEntity());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<domain.StockTakeItem>>> getSessionItems(
    String sessionLocalId,
  ) async {
    try {
      final items = await _localDataSource.getSessionItems(sessionLocalId);
      return right(items.map((i) => i.toEntity()).toList());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, domain.StockTakeItem>> completeItem(
    String localId,
  ) async {
    try {
      final item = await _localDataSource.getItemByLocalId(localId);
      if (item == null) {
        return left(
          NotFoundFailure(
            resourceType: 'Unknown',
            resourceId: 'unknown',
            message: 'Item not found',
          ),
        );
      }

      final updated = item
        ..status = ItemCountStatus.completed
        ..completedAt = DateTime.now();

      await _localDataSource.updateItem(updated);

      return right(updated.toEntity());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteItem(String localId) async {
    try {
      // Get item to check if it has a server ID
      final item = await _localDataSource.getItemByLocalId(localId);
      if (item == null) {
        return right(unit); // Already deleted
      }

      // Delete from server if item is synced
      if (item.serverId != null) {
        // Get the session to get its server ID
        final session = await _localDataSource.getSessionByLocalId(
          item.sessionLocalId,
        );

        if (session?.serverId != null) {
          print(
            '[StockTakeRepo] Deleting item ${item.serverId} from server (session ${session!.serverId})...',
          );
          try {
            await _remoteDataSource.deleteItem(
              session.serverId!,
              item.serverId!,
            );
            print('[StockTakeRepo] Item deleted from server');
          } on NetworkException catch (e) {
            print('[StockTakeRepo] Failed to delete from server: ${e.message}');
            // Continue with local delete even if server fails
            // The server item will be orphaned but won't cause issues
          }
        }
      }

      // Always delete locally
      await _localDataSource.deleteItem(localId);
      print('[StockTakeRepo] Item deleted locally');

      return right(unit);
    } catch (e) {
      print('[StockTakeRepo] Error deleting item: $e');
      return left(UnknownFailure(message: e.toString()));
    }
  }

  // ============================================================================
  // Serial Number Management
  // ============================================================================

  @override
  Future<Either<Failure, domain.SerialNumberEntry>> addSerial({
    required String sessionLocalId,
    required String itemLocalId,
    required String serialNumberRaw,
    required String serialNumberNorm,
    required String deviceScanId,
    required DateTime deviceScannedAt,
    int? scanSequence,
  }) async {
    try {
      final item = await _localDataSource.getItemByLocalId(itemLocalId);
      if (item == null) {
        return left(
          NotFoundFailure(
            resourceType: 'Unknown',
            resourceId: 'unknown',
            message: 'Item not found',
          ),
        );
      }

      // Check for duplicates (case-insensitive)
      final duplicate = await _localDataSource.findSerialInSession(
        sessionLocalId: sessionLocalId,
        serialNumberNorm: serialNumberNorm,
      );

      if (duplicate != null) {
        return left(
          ValidationFailure(
            message: 'Serial number already scanned in this session',
            fieldErrors: {},
          ),
        );
      }

      // Create local serial
      final localSerial = SerialNumberEntryModel()
        ..localId = const Uuid().v4()
        ..sessionLocalId = sessionLocalId
        ..itemLocalId = itemLocalId
        ..serialNumberRaw = serialNumberRaw
        ..serialNumberNorm = serialNumberNorm
        ..deviceScanId = deviceScanId
        ..deviceScannedAt = deviceScannedAt
        ..scanSequence = scanSequence
        ..scannedAt = DateTime.now()
        ..status = SerialStatus.valid
        ..syncState = SyncState.pending;

      await _localDataSource.createSerial(localSerial);
      print(
        '[StockTakeRepo] Serial ${localSerial.localId} saved locally (syncState: pending)',
      );

      return right(localSerial.toEntity());
    } catch (e) {
      print('[StockTakeRepo] Error adding serial: $e');
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BatchUploadResult>> addSerialsBatch({
    required String sessionLocalId,
    required String itemLocalId,
    required List<SerialScanData> serials,
  }) async {
    try {
      final item = await _localDataSource.getItemByLocalId(itemLocalId);
      if (item == null) {
        return left(
          NotFoundFailure(
            resourceType: 'Unknown',
            resourceId: 'unknown',
            message: 'Item not found',
          ),
        );
      }

      int created = 0;
      int duplicatesSkipped = 0;
      final List<SerialException> exceptions = [];

      for (final scan in serials) {
        // Check for duplicates (case-insensitive)
        final normalizedSerial = scan.serialNumber.toUpperCase();
        final duplicate = await _localDataSource.findSerialInSession(
          sessionLocalId: sessionLocalId,
          serialNumberNorm: normalizedSerial,
        );

        if (duplicate != null) {
          duplicatesSkipped++;
          exceptions.add(
            SerialException(
              serialNumber: scan.serialNumber,
              status: domain_serial.SerialStatus.duplicate,
              message: 'Serial already scanned in this session',
            ),
          );
          continue;
        }

        // Create local serial
        final localSerial = SerialNumberEntryModel()
          ..localId = const Uuid().v4()
          ..sessionLocalId = sessionLocalId
          ..itemLocalId = itemLocalId
          ..serialNumberRaw = scan.serialNumber
          ..serialNumberNorm = normalizedSerial
          ..deviceScanId = scan.deviceScanId
          ..deviceScannedAt = scan.deviceScannedAt
          ..scanSequence = scan.scanSequence
          ..scannedAt = DateTime.now()
          ..status = SerialStatus.valid
          ..syncState = SyncState.pending;

        await _localDataSource.createSerial(localSerial);
        created++;
      }

      // Get new total
      final allSerials = await _localDataSource.getItemSerials(itemLocalId);

      return right(
        BatchUploadResult(
          totalSubmitted: serials.length,
          created: created,
          duplicatesSkipped: duplicatesSkipped,
          crossItemDuplicates: 0,
          urlRejected: 0,
          errors: exceptions.length,
          newTotal: allSerials.length,
          exceptions: exceptions,
        ),
      );
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<domain.SerialNumberEntry>>> getItemSerials(
    String itemLocalId,
  ) async {
    try {
      final serials = await _localDataSource.getItemSerials(itemLocalId);
      return right(serials.map((s) => s.toEntity()).toList());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSerial(
    String localId,
    String reason,
  ) async {
    try {
      // Get serial to check if it has been synced
      final serial = await _localDataSource.getSerialByLocalId(localId);
      if (serial == null) {
        return right(unit); // Already deleted
      }

      // Delete from server if serial is synced
      if (serial.serverId != null) {
        // Get the item to get its server ID
        final item = await _localDataSource.getItemByLocalId(
          serial.itemLocalId,
        );

        // Get the session to get its server ID
        final session = await _localDataSource.getSessionByLocalId(
          serial.sessionLocalId,
        );

        if (session?.serverId != null && item?.serverId != null) {
          print(
            '[StockTakeRepo] Deleting serial ${serial.serverId} from server '
            '(session ${session!.serverId}, item ${item!.serverId})...',
          );
          try {
            await _remoteDataSource.deleteSerial(
              sessionId: session.serverId!,
              itemId: item.serverId!,
              serialId: serial.serverId!,
              reason: reason,
            );
            print('[StockTakeRepo] Serial deleted from server');
          } on NetworkException catch (e) {
            print(
              '[StockTakeRepo] Failed to delete serial from server: ${e.message}',
            );
            // Continue with local delete even if server fails
            // The server serial will be orphaned but won't cause issues
          }
        }
      }

      // Always delete locally
      await _localDataSource.deleteSerial(localId);
      print('[StockTakeRepo] Serial deleted locally');

      return right(unit);
    } catch (e) {
      print('[StockTakeRepo] Error deleting serial: $e');
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ValidationResult>> validateSerial(
    String serialNumber,
    String sessionLocalId,
  ) async {
    try {
      // Basic format validation
      if (serialNumber.trim().isEmpty) {
        return right(ValidationResult.invalid('Serial number cannot be empty'));
      }

      // Check for duplicates
      final normalizedSerial = serialNumber.toUpperCase();
      final duplicate = await _localDataSource.findSerialInSession(
        sessionLocalId: sessionLocalId,
        serialNumberNorm: normalizedSerial,
      );

      if (duplicate != null) {
        return right(
          ValidationResult.duplicate(
            'Serial number already scanned in this session',
          ),
        );
      }

      return right(ValidationResult.valid());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SyncResult>> syncOfflineData() async {
    try {
      // TODO: Implement full offline sync logic
      // This will gather all pending sessions, items, and serials
      // and batch upload to server
      return right(
        const SyncResult(synced: 0, pending: 0, failed: 0, errors: []),
      );
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  // ============================================================================
  // Proposed Orders
  // ============================================================================

  @override
  Future<Either<Failure, ProposedOrderJobResponse>> generateProposedOrder({
    required int visitId,
    RefillStrategy strategy = RefillStrategy.toMax,
    bool notifyOnComplete = true,
    String? customerEmail,
    bool autoSendEmail = false,
  }) async {
    try {
      print('[StockTake] Generating proposed order for visit $visitId');
      final response = await _remoteDataSource.generateVisitProposedOrder(
        visitId: visitId,
        refillStrategy: strategy.value,
        notifyOnComplete: notifyOnComplete,
        customerEmail: customerEmail,
        autoSendEmail: autoSendEmail,
      );

      final jobResponse = ProposedOrderJobResponse.fromJson(response);
      print('[StockTake] Proposed order job started: ${jobResponse.jobId}');
      return right(jobResponse);
    } on NetworkException catch (e) {
      print('[StockTake] Generate proposed order failed: ${e.message}');
      return left(UnknownFailure(message: e.message));
    } catch (e) {
      print('[StockTake] Generate proposed order error: $e');
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProposedOrderProgressResponse>>
  getProposedOrderProgress({
    required int visitId,
    required String jobId,
  }) async {
    try {
      final response = await _remoteDataSource.getVisitProposedOrderProgress(
        visitId: visitId,
        jobId: jobId,
      );

      final progressResponse = ProposedOrderProgressResponse.fromJson(response);
      print(
        '[StockTake] Proposed order progress: ${progressResponse.status} (${progressResponse.jobId})',
      );
      return right(progressResponse);
    } on NetworkException catch (e) {
      print('[StockTake] Get proposed order progress failed: ${e.message}');
      return left(UnknownFailure(message: e.message));
    } catch (e) {
      print('[StockTake] Get proposed order progress error: $e');
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProposedOrderDetail>> getProposedOrderDetail({
    required int visitId,
  }) async {
    try {
      print('[StockTake] Getting proposed order for visit: $visitId');
      final response = await _remoteDataSource.getVisitProposedOrder(
        visitId: visitId,
      );

      final orderDetail = ProposedOrderDetail.fromJson(response);
      print(
        '[StockTake] Got proposed order #${orderDetail.id} (${orderDetail.totalItems} items)',
      );
      return right(orderDetail);
    } on NetworkException catch (e) {
      print('[StockTake] Get proposed order detail failed: ${e.message}');
      return left(UnknownFailure(message: e.message));
    } catch (e) {
      print('[StockTake] Get proposed order detail error: $e');
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProposedOrderJobResponse>> generateProposedOrderPdf({
    required int visitId,
  }) async {
    try {
      print('[StockTake] Generating PDF for visit: $visitId');
      final response = await _remoteDataSource.generateProposedOrderPdf(
        visitId: visitId,
      );

      final jobResponse = ProposedOrderJobResponse.fromJson(response);
      print('[StockTake] PDF generation job started: ${jobResponse.jobId}');
      return right(jobResponse);
    } on NetworkException catch (e) {
      print('[StockTake] Generate PDF failed: ${e.message}');
      return left(UnknownFailure(message: e.message));
    } catch (e) {
      print('[StockTake] Generate PDF error: $e');
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<int>>> downloadProposedOrderPdf({
    required int visitId,
  }) async {
    try {
      print('[StockTake] Downloading PDF for visit: $visitId');
      final bytes = await _remoteDataSource.downloadProposedOrderPdf(
        visitId: visitId,
      );

      print('[StockTake] PDF downloaded: ${bytes.length} bytes');
      return right(bytes);
    } on NetworkException catch (e) {
      print('[StockTake] Download PDF failed: ${e.message}');
      return left(UnknownFailure(message: e.message));
    } catch (e) {
      print('[StockTake] Download PDF error: $e');
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProposedOrderProgressResponse>>
  getProposedOrderPdfProgress({
    required int visitId,
    required String jobId,
  }) async {
    try {
      print(
        '[StockTake] Getting PDF progress for visit: $visitId, job: $jobId',
      );
      final data = await _remoteDataSource.getProposedOrderPdfProgress(
        visitId: visitId,
        jobId: jobId,
      );

      final progress = ProposedOrderProgressResponse.fromJson(data);
      print(
        '[StockTake] PDF progress: ${progress.status} - ${progress.progress}%',
      );
      return right(progress);
    } on NetworkException catch (e) {
      print('[StockTake] PDF progress failed: ${e.message}');
      return left(UnknownFailure(message: e.message));
    } catch (e) {
      print('[StockTake] PDF progress error: $e');
      return left(UnknownFailure(message: e.toString()));
    }
  }
}
