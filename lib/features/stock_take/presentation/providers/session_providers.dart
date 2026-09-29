import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/network/failures.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/stock_take_repository.dart';
import '../../domain/usecases/usecases.dart';
import 'stock_take_providers.dart';
import 'usecase_providers.dart';

part 'session_providers.g.dart';

// ============================================================================
// Paginated Catalogue State
// ============================================================================

/// State for paginated catalogue
class PaginatedCatalogueState {
  final List<CustomerProduct> products;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final int currentPage;
  final String? error;
  final String? searchQuery;

  const PaginatedCatalogueState({
    this.products = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.currentPage = 0,
    this.error,
    this.searchQuery,
  });

  PaginatedCatalogueState copyWith({
    List<CustomerProduct>? products,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    int? currentPage,
    String? error,
    String? searchQuery,
    bool clearError = false,
  }) {
    return PaginatedCatalogueState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
      error: clearError ? null : (error ?? this.error),
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

// ============================================================================
// Paginated Catalogue Controller
// ============================================================================

/// Controller for paginated product catalogue with lazy loading
@riverpod
class PaginatedCatalogueController extends _$PaginatedCatalogueController {
  static const int _pageSize = 200;

  @override
  PaginatedCatalogueState build() {
    // Auto-load initial products when controller is created
    Future.microtask(() => loadInitial());
    return const PaginatedCatalogueState(isLoading: true);
  }

  /// Load initial products (first page)
  Future<void> loadInitial({String? search}) async {
    state = PaginatedCatalogueState(isLoading: true, searchQuery: search);

    try {
      final repository = await ref.read(stockTakeRepositoryProvider.future);
      final result = await repository.getActiveSessionCatalogue(
        search: search,
        page: 1,
        size: _pageSize,
      );

      result.fold(
        (failure) {
          state = state.copyWith(isLoading: false, error: failure.message);
        },
        (products) {
          state = state.copyWith(
            isLoading: false,
            products: products,
            currentPage: 1,
            hasMore: products.length >= _pageSize,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Load more products (next page)
  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasMore || state.isLoading) return;

    state = state.copyWith(isLoadingMore: true);

    try {
      final nextPage = state.currentPage + 1;
      final repository = await ref.read(stockTakeRepositoryProvider.future);
      final result = await repository.getActiveSessionCatalogue(
        search: state.searchQuery,
        page: nextPage,
        size: _pageSize,
      );

      result.fold(
        (failure) {
          state = state.copyWith(isLoadingMore: false, error: failure.message);
        },
        (newProducts) {
          state = state.copyWith(
            isLoadingMore: false,
            products: [...state.products, ...newProducts],
            currentPage: nextPage,
            hasMore: newProducts.length >= _pageSize,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(isLoadingMore: false, error: e.toString());
    }
  }

  /// Search products (resets pagination)
  Future<void> search(String query) async {
    await loadInitial(search: query.isEmpty ? null : query);
  }

  /// Refresh the catalogue
  Future<void> refresh() async {
    await loadInitial(search: state.searchQuery);
  }
}

// ============================================================================
// State Classes
// ============================================================================

/// State for stock take session operations
class StockTakeSessionState {
  final bool isLoading;
  final String? loadingMessage;
  final String? errorMessage;
  final StockTakeSession? activeSession;
  final List<StockTakeSession> completedSessions;
  final List<StockTakeItem> sessionItems;

  /// Active sessions from other customers (for resuming after logout/login)
  final List<StockTakeSession> otherActiveSessions;

  /// Proposed order generation job tracking
  final ProposedOrderJobState? proposedOrderJob;

  const StockTakeSessionState({
    this.isLoading = false,
    this.loadingMessage,
    this.errorMessage,
    this.activeSession,
    this.completedSessions = const [],
    this.sessionItems = const [],
    this.otherActiveSessions = const [],
    this.proposedOrderJob,
  });

  StockTakeSessionState copyWith({
    bool? isLoading,
    String? loadingMessage,
    String? errorMessage,
    StockTakeSession? activeSession,
    List<StockTakeSession>? completedSessions,
    List<StockTakeItem>? sessionItems,
    List<StockTakeSession>? otherActiveSessions,
    ProposedOrderJobState? proposedOrderJob,
    bool clearActiveSession = false,
    bool clearError = false,
    bool clearProposedOrderJob = false,
  }) {
    return StockTakeSessionState(
      isLoading: isLoading ?? this.isLoading,
      loadingMessage: loadingMessage,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      activeSession: clearActiveSession
          ? null
          : (activeSession ?? this.activeSession),
      completedSessions: completedSessions ?? this.completedSessions,
      sessionItems: sessionItems ?? this.sessionItems,
      otherActiveSessions: otherActiveSessions ?? this.otherActiveSessions,
      proposedOrderJob: clearProposedOrderJob
          ? null
          : (proposedOrderJob ?? this.proposedOrderJob),
    );
  }
}

/// Tracks the state of a proposed order generation job
class ProposedOrderJobState {
  final String jobId;
  final int visitId;
  final DateTime startedAt;
  final ProposedOrderProgressResponse? latestProgress;
  final String? error;
  final bool isTimedOut;

  const ProposedOrderJobState({
    required this.jobId,
    required this.visitId,
    required this.startedAt,
    this.latestProgress,
    this.error,
    this.isTimedOut = false,
  });

  ProposedOrderJobState copyWith({
    ProposedOrderProgressResponse? latestProgress,
    String? error,
    bool? isTimedOut,
    bool clearError = false,
  }) {
    return ProposedOrderJobState(
      jobId: jobId,
      visitId: visitId,
      startedAt: startedAt,
      latestProgress: latestProgress ?? this.latestProgress,
      error: clearError ? null : (error ?? this.error),
      isTimedOut: isTimedOut ?? this.isTimedOut,
    );
  }

  bool get isComplete => latestProgress?.isComplete ?? false;
  bool get isSuccess => latestProgress?.isSuccess ?? false;
  bool get hasFailed => latestProgress?.hasFailed ?? false;
  bool get isInProgress => !isComplete && !isTimedOut;

  Duration get elapsed => DateTime.now().difference(startedAt);

  /// 5-minute timeout
  static const timeoutDuration = Duration(minutes: 5);
  bool get hasExceededTimeout => elapsed >= timeoutDuration;
}

// ============================================================================
// Session Controller
// ============================================================================

/// Main controller for stock take session management
@riverpod
class StockTakeSessionController extends _$StockTakeSessionController {
  @override
  StockTakeSessionState build() => const StockTakeSessionState();

  /// Load sessions for a customer, also fetches any active sessions from
  /// other customers.
  ///
  /// Deliberately not scoped to a particular visit or day: a session
  /// started earlier is shown and resumable here rather than hidden, since
  /// matching sessions to a specific visit by string comparison has
  /// repeatedly proven unreliable (see StartStockTakeSession's doc
  /// comment). The agent decides whether to continue or cancel it.
  Future<void> loadForCustomer(int customerId) async {
    state = state.copyWith(
      isLoading: true,
      loadingMessage: 'Loading sessions...',
      clearError: true,
    );

    print('[StockTake] loadForCustomer called with customerId=$customerId');

    final repository = await ref.read(stockTakeRepositoryProvider.future);

    // Fetch active sessions for current customer
    final activeResult = await repository.getActiveSessions(customerId);

    // Fetch today's sessions from backend and sync to local storage
    final completedResult = await repository.fetchTodaysSessions(customerId);

    // Also fetch all active sessions to find any from other customers
    final allActiveResult = await repository.getAllActiveSessions();

    print(
      '[StockTake] allActiveResult: ${allActiveResult.fold((f) => 'FAIL: ${f.message}', (s) => 'Found ${s.length} sessions')}',
    );

    activeResult.fold(
      (failure) {
        print('[StockTake] loadForCustomer FAILED: ${failure.message}');
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
      },
      (activeSessions) {
        print(
          '[StockTake] loadForCustomer found ${activeSessions.length} active sessions for customer $customerId',
        );

        // Get completed sessions
        final completed = completedResult.fold(
          (_) => <StockTakeSession>[],
          (sessions) => sessions,
        );

        print(
          '[StockTake] loadForCustomer found ${completed.length} completed sessions for customer $customerId (today)',
        );

        // Get active sessions from other customers
        final otherActiveSessions = allActiveResult.fold(
          (_) => <StockTakeSession>[],
          (allActive) =>
              allActive.where((s) => s.customerId != customerId).toList(),
        );

        print(
          '[StockTake] active=${activeSessions.length}, completed=${completed.length}, otherActive=${otherActiveSessions.length}',
        );

        state = state.copyWith(
          isLoading: false,
          activeSession: activeSessions.isNotEmpty
              ? activeSessions.first
              : null,
          completedSessions: completed,
          otherActiveSessions: otherActiveSessions,
        );

        // Load items if there's an active session
        if (activeSessions.isNotEmpty) {
          loadSessionItems(activeSessions.first.localId);
        }
      },
    );
  }

  /// Load all active sessions (regardless of customer)
  /// Used when user navigates to stock take without being clocked into a visit
  Future<void> loadAllActiveSessions() async {
    state = state.copyWith(
      isLoading: true,
      loadingMessage: 'Loading active sessions...',
      clearError: true,
    );

    final repository = await ref.read(stockTakeRepositoryProvider.future);
    final result = await repository.getAllActiveSessions();

    result.fold(
      (failure) {
        print('[StockTake] loadAllActiveSessions FAILED: ${failure.message}');
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
      },
      (sessions) {
        print(
          '[StockTake] loadAllActiveSessions found ${sessions.length} sessions',
        );
        for (final s in sessions) {
          print(
            '[StockTake]   - Session ${s.localId}: customer=${s.customerId}, status=${s.status}, warehouse=${s.warehouseName}',
          );
        }

        // If there's an active session, set it as the active one
        state = state.copyWith(
          isLoading: false,
          activeSession: sessions.isNotEmpty ? sessions.first : null,
          otherActiveSessions: sessions.length > 1
              ? sessions.sublist(1)
              : const [],
        );

        // Load items if there's an active session
        if (sessions.isNotEmpty) {
          loadSessionItems(sessions.first.localId);
        }
      },
    );
  }

  /// Validate a session against the backend before trusting it as
  /// resumable, right before opening its counting screen.
  ///
  /// The sessions-list screens (loadForCustomer/loadAllActiveSessions) do
  /// this same check when they load, but time can pass between that load
  /// and the agent actually tapping into a session card - or the screen
  /// could be entered directly from a cached session ID (app restart onto
  /// that route). Since sessions are auto-cancelled server-side if left
  /// open past midnight, re-checking right before entry catches a session
  /// that went stale in that window instead of only discovering it when a
  /// write against it fails.
  ///
  /// Returns false if the session turned out to no longer be usable, in
  /// which case `activeSession` is cleared and `errorMessage` explains why.
  Future<bool> validateSessionEntry(String sessionLocalId) async {
    final repository = await ref.read(stockTakeRepositoryProvider.future);
    final result = await repository.validateSession(sessionLocalId);

    return result.fold(
      (failure) {
        if (failure is NotFoundFailure) {
          state = state.copyWith(
            clearActiveSession: true,
            sessionItems: [],
            errorMessage: 'This stock take session could not be found.',
          );
          return false;
        }
        // Can't validate right now (offline, etc.) - don't block the agent,
        // proceed with whatever's already cached locally.
        return true;
      },
      (session) {
        if (session.canAddItems) {
          state = state.copyWith(activeSession: session);
          return true;
        }
        state = state.copyWith(
          clearActiveSession: true,
          sessionItems: [],
          errorMessage:
              'This stock take session is no longer active on the server. '
              'It may have been closed automatically because it was left '
              'open overnight. Start a new session to continue.',
        );
        return false;
      },
    );
  }

  /// Start a new stock take session
  Future<StockTakeSession?> startSession({
    required int customerId,
    required String visitLocalId,
    int? visitServerId,
    required int warehouseId,
    String? notes,
  }) async {
    state = state.copyWith(
      isLoading: true,
      loadingMessage: 'Starting session...',
      clearError: true,
    );

    final startStockTakeSession = await ref.read(
      startStockTakeSessionProvider.future,
    );
    final result = await startStockTakeSession(
      StartStockTakeSessionParams(
        customerId: customerId,
        visitLocalId: visitLocalId,
        visitServerId: visitServerId,
        warehouseId: warehouseId,
        notes: notes,
      ),
    );

    return result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
        return null;
      },
      (session) {
        state = state.copyWith(
          isLoading: false,
          activeSession: session,
          sessionItems: [],
        );
        return session;
      },
    );
  }

  /// Load items for the current session
  Future<void> loadSessionItems(String sessionLocalId) async {
    final getSessionItems = await ref.read(getSessionItemsProvider.future);
    final result = await getSessionItems(
      GetSessionItemsParams(sessionLocalId: sessionLocalId),
    );

    result.fold(
      (failure) {
        // Don't clear items on error, just log it
      },
      (items) {
        state = state.copyWith(sessionItems: items);
      },
    );
  }

  /// Add a product to the session
  Future<StockTakeItem?> addProduct({
    required String sessionLocalId,
    required CustomerProduct product,
  }) async {
    state = state.copyWith(
      isLoading: true,
      loadingMessage: 'Adding product...',
      clearError: true,
    );

    final addProductToSession = await ref.read(
      addProductToSessionProvider.future,
    );
    final result = await addProductToSession(
      AddProductParams(sessionLocalId: sessionLocalId, product: product),
    );

    return result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
        return null;
      },
      (item) async {
        // Refresh the active session to get updated counts
        final refreshedSession = await _refreshSession(sessionLocalId);
        state = state.copyWith(
          isLoading: false,
          sessionItems: [...state.sessionItems, item],
          activeSession: refreshedSession ?? state.activeSession,
        );
        return item;
      },
    );
  }

  /// Refresh session from database to get updated counts
  Future<StockTakeSession?> _refreshSession(String sessionLocalId) async {
    final repository = await ref.read(stockTakeRepositoryProvider.future);
    final result = await repository.getSession(sessionLocalId);
    return result.fold((_) => null, (session) => session);
  }

  /// Fetches the session record for [sessionLocalId] directly, rather than
  /// through [StockTakeSessionState.activeSession].
  ///
  /// activeSession is one shared field used across every stock-take screen
  /// - it reflects whichever session was most recently loaded anywhere in
  /// the app, not necessarily the session a given screen instance is
  /// showing. If an agent leaves a session open at one outlet, clocks into
  /// another, and starts a second session there, activeSession can end up
  /// pointing at that second session while an earlier screen instance for
  /// the first is still mounted. Anything that needs session data
  /// (visitServerId, warehouseName, etc.) tied to a *specific* session -
  /// e.g. right before completing/submitting it - must fetch it by that
  /// session's own localId via this method instead of reading
  /// state.activeSession.
  Future<StockTakeSession?> getSessionByLocalId(String sessionLocalId) =>
      _refreshSession(sessionLocalId);

  /// Delete an item from the session
  Future<bool> deleteItem(String itemLocalId) async {
    state = state.copyWith(
      isLoading: true,
      loadingMessage: 'Removing product...',
      clearError: true,
    );

    // Get the session ID before deleting
    final sessionLocalId = state.activeSession?.localId;

    final repository = await ref.read(stockTakeRepositoryProvider.future);
    final result = await repository.deleteItem(itemLocalId);

    return result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
        return false;
      },
      (_) async {
        // Refresh the active session to get updated counts
        StockTakeSession? refreshedSession;
        if (sessionLocalId != null) {
          refreshedSession = await _refreshSession(sessionLocalId);
        }
        state = state.copyWith(
          isLoading: false,
          sessionItems: state.sessionItems
              .where((i) => i.localId != itemLocalId)
              .toList(),
          activeSession: refreshedSession ?? state.activeSession,
        );
        return true;
      },
    );
  }

  /// Pause the active session
  Future<bool> pauseSession(String sessionLocalId) async {
    state = state.copyWith(
      isLoading: true,
      loadingMessage: 'Pausing session...',
      clearError: true,
    );

    final pauseSession = await ref.read(pauseSessionProvider.future);
    final result = await pauseSession(
      PauseSessionParams(sessionLocalId: sessionLocalId),
    );

    return result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
        return false;
      },
      (session) {
        state = state.copyWith(isLoading: false, activeSession: session);
        return true;
      },
    );
  }

  /// Resume a paused session
  Future<bool> resumeSession(String sessionLocalId) async {
    state = state.copyWith(
      isLoading: true,
      loadingMessage: 'Resuming session...',
      clearError: true,
    );

    final resumeSession = await ref.read(resumeSessionProvider.future);
    final result = await resumeSession(
      ResumeSessionParams(sessionLocalId: sessionLocalId),
    );

    return result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
        return false;
      },
      (session) {
        state = state.copyWith(isLoading: false, activeSession: session);
        return true;
      },
    );
  }

  /// Cancel the active session
  Future<bool> cancelSession(String sessionLocalId, String reason) async {
    state = state.copyWith(
      isLoading: true,
      loadingMessage: 'Cancelling session...',
      clearError: true,
    );

    final cancelSession = await ref.read(cancelSessionProvider.future);
    final result = await cancelSession(
      CancelSessionParams(sessionLocalId: sessionLocalId, reason: reason),
    );

    return result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
        return false;
      },
      (session) {
        // `cancelSession` is used both to cancel the caller's own active
        // session (stock_take_session_screen.dart) and to cancel a stray
        // active session belonging to a *different* customer, surfaced via
        // `otherActiveSessions` (the "Active Session for Different
        // Customer" banner). Only clear `activeSession` if that's actually
        // what got cancelled — otherwise cancelling someone else's session
        // would incorrectly wipe out the caller's own in-progress one.
        final wasPrimaryActive = state.activeSession?.localId == sessionLocalId;
        state = state.copyWith(
          isLoading: false,
          clearActiveSession: wasPrimaryActive,
          completedSessions: [session, ...state.completedSessions],
          sessionItems: wasPrimaryActive ? [] : state.sessionItems,
          otherActiveSessions: state.otherActiveSessions
              .where((s) => s.localId != sessionLocalId)
              .toList(),
        );
        return true;
      },
    );
  }

  /// Sync all pending items and serials to server without completing the session
  Future<int?> syncSession(String sessionLocalId) async {
    print('[SessionController] syncSession called for: $sessionLocalId');

    state = state.copyWith(
      isLoading: true,
      loadingMessage: 'Syncing to server...',
      clearError: true,
    );

    try {
      final repository = await ref.read(stockTakeRepositoryProvider.future);
      final result = await repository.syncSessionItems(sessionLocalId);

      return result.fold(
        (failure) {
          print('[SessionController] Sync failed: ${failure.message}');
          state = state.copyWith(
            isLoading: false,
            errorMessage: failure.message,
          );
          return null;
        },
        (syncedCount) {
          print(
            '[SessionController] Sync succeeded: $syncedCount items synced',
          );
          state = state.copyWith(isLoading: false);
          return syncedCount;
        },
      );
    } catch (e) {
      print('[SessionController] Exception during sync: $e');
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      return null;
    }
  }

  /// Complete the active session
  Future<bool> completeSession(String sessionLocalId) async {
    print('[SessionController] completeSession called for: $sessionLocalId');

    state = state.copyWith(
      isLoading: true,
      loadingMessage: 'Completing session...',
      clearError: true,
    );

    try {
      print('[SessionController] Getting completeSession use case...');
      final completeSession = await ref.read(completeSessionProvider.future);
      print('[SessionController] Calling use case...');
      final result = await completeSession(
        CompleteSessionParams(sessionLocalId: sessionLocalId),
      );

      return result.fold(
        (failure) {
          print('[SessionController] Completion failed: ${failure.message}');
          state = state.copyWith(
            isLoading: false,
            errorMessage: failure.message,
          );
          return false;
        },
        (session) {
          print('[SessionController] Completion succeeded');
          state = state.copyWith(
            isLoading: false,
            clearActiveSession: true,
            completedSessions: [session, ...state.completedSessions],
            sessionItems: [],
          );
          return true;
        },
      );
    } catch (e) {
      print('[SessionController] Exception during completion: $e');
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      return false;
    }
  }

  /// Generate a proposed order for a visit and start background polling
  Future<bool> generateProposedOrder({
    required int visitId,
    RefillStrategy strategy = RefillStrategy.toMax,
    String? customerEmail,
  }) async {
    print('[SessionProvider] generateProposedOrder called for visit $visitId');
    state = state.copyWith(clearError: true, clearProposedOrderJob: true);

    final repository = await ref.read(stockTakeRepositoryProvider.future);
    final result = await repository.generateProposedOrder(
      visitId: visitId,
      strategy: strategy,
      customerEmail: customerEmail,
    );

    return result.fold(
      (failure) {
        print('[SessionProvider] Failure: ${failure.message}');
        state = state.copyWith(errorMessage: failure.message);
        return false;
      },
      (jobResponse) {
        print('[SessionProvider] Success: jobId=${jobResponse.jobId}');
        // Set the job state and start background polling
        state = state.copyWith(
          proposedOrderJob: ProposedOrderJobState(
            jobId: jobResponse.jobId,
            visitId: visitId,
            startedAt: DateTime.now(),
          ),
        );
        _startBackgroundPolling(visitId, jobResponse.jobId);
        return true;
      },
    );
  }

  /// Background polling loop — runs until job completes or times out
  Future<void> _startBackgroundPolling(int visitId, String jobId) async {
    print('[SessionProvider] Starting background polling for job $jobId');

    while (true) {
      final job = state.proposedOrderJob;
      // Stop if job was cleared, completed, or timed out
      if (job == null || job.jobId != jobId || job.isComplete) break;

      // Check 5-minute timeout
      if (job.hasExceededTimeout) {
        print('[SessionProvider] Job $jobId timed out after 5 minutes');
        state = state.copyWith(
          proposedOrderJob: job.copyWith(isTimedOut: true),
        );
        break;
      }

      try {
        final repository = await ref.read(stockTakeRepositoryProvider.future);
        final result = await repository.getProposedOrderProgress(
          visitId: visitId,
          jobId: jobId,
        );

        // Re-check state in case it was cleared while awaiting
        final currentJob = state.proposedOrderJob;
        if (currentJob == null || currentJob.jobId != jobId) break;

        result.fold(
          (failure) {
            state = state.copyWith(
              proposedOrderJob: currentJob.copyWith(error: failure.message),
            );
          },
          (progress) {
            print(
              '[SessionProvider] Poll result: ${progress.status}, complete=${progress.isComplete}',
            );
            state = state.copyWith(
              proposedOrderJob: currentJob.copyWith(
                latestProgress: progress,
                clearError: true,
              ),
            );
          },
        );
      } catch (e) {
        print('[SessionProvider] Polling error: $e');
        final currentJob = state.proposedOrderJob;
        if (currentJob != null && currentJob.jobId == jobId) {
          state = state.copyWith(
            proposedOrderJob: currentJob.copyWith(error: e.toString()),
          );
        }
      }

      // Wait 3 seconds before next poll
      await Future.delayed(const Duration(seconds: 3));
    }
    print('[SessionProvider] Background polling ended for job $jobId');
  }

  /// Manually retry checking progress (e.g. after timeout)
  Future<void> retryProposedOrderCheck() async {
    final job = state.proposedOrderJob;
    if (job == null) return;

    // Reset timeout and restart polling
    state = state.copyWith(
      proposedOrderJob: ProposedOrderJobState(
        jobId: job.jobId,
        visitId: job.visitId,
        startedAt: DateTime.now(), // Reset the timer
        latestProgress: job.latestProgress,
      ),
    );
    _startBackgroundPolling(job.visitId, job.jobId);
  }

  /// Clear the proposed order job state (dismiss)
  void clearProposedOrderJob() {
    state = state.copyWith(clearProposedOrderJob: true);
  }

  /// Get the progress of a proposed order generation job
  Future<ProposedOrderProgressResponse?> getProposedOrderProgress({
    required int visitId,
    required String jobId,
  }) async {
    final repository = await ref.read(stockTakeRepositoryProvider.future);
    final result = await repository.getProposedOrderProgress(
      visitId: visitId,
      jobId: jobId,
    );

    return result.fold((failure) => null, (progress) => progress);
  }

  /// Get proposed order detail for a visit
  Future<ProposedOrderDetail?> getProposedOrderDetail({
    required int visitId,
  }) async {
    final repository = await ref.read(stockTakeRepositoryProvider.future);
    final result = await repository.getProposedOrderDetail(visitId: visitId);

    return result.fold((failure) {
      state = state.copyWith(errorMessage: failure.message);
      return null;
    }, (orderDetail) => orderDetail);
  }

  /// Checks whether a proposed order already exists for this visit, purely
  /// to decide which card to show on the home screen — NOT via
  /// [getProposedOrderDetail], which sets [StockTakeSessionState.errorMessage]
  /// on every failure. A "not found" here is the normal, expected state any
  /// time no order has been generated yet (including right after a session
  /// completes, before generation), not something worth surfacing as an
  /// error banner. Only a genuine failure (network/server error) is
  /// reported, distinguished from [NotFoundFailure] specifically.
  Future<bool> hasProposedOrder({required int visitId}) async {
    final repository = await ref.read(stockTakeRepositoryProvider.future);
    final result = await repository.getProposedOrderDetail(visitId: visitId);

    return result.fold((failure) {
      if (failure is! NotFoundFailure) {
        state = state.copyWith(errorMessage: failure.message);
      }
      return false;
    }, (orderDetail) => true);
  }

  /// Generate PDF for a proposed order (background task)
  /// Returns the job response on success, null on failure
  Future<ProposedOrderJobResponse?> generateProposedOrderPdf({
    required int visitId,
  }) async {
    final repository = await ref.read(stockTakeRepositoryProvider.future);
    final result = await repository.generateProposedOrderPdf(visitId: visitId);

    return result.fold((failure) {
      state = state.copyWith(errorMessage: failure.message);
      return null;
    }, (jobResponse) => jobResponse);
  }

  /// Download the generated PDF bytes
  Future<List<int>?> downloadProposedOrderPdf({required int visitId}) async {
    final repository = await ref.read(stockTakeRepositoryProvider.future);
    final result = await repository.downloadProposedOrderPdf(visitId: visitId);

    return result.fold((failure) {
      state = state.copyWith(errorMessage: failure.message);
      return null;
    }, (bytes) => bytes);
  }

  /// Get PDF generation progress
  Future<ProposedOrderProgressResponse?> getProposedOrderPdfProgress({
    required int visitId,
    required String jobId,
  }) async {
    final repository = await ref.read(stockTakeRepositoryProvider.future);
    final result = await repository.getProposedOrderPdfProgress(
      visitId: visitId,
      jobId: jobId,
    );

    return result.fold((failure) => null, (progress) => progress);
  }

  /// Convert a proposed order into a real sales order.
  /// Returns null on failure (state.errorMessage explains why).
  Future<ConvertToSalesOrderResult?> convertProposedOrderToSalesOrder({
    required int orderId,
    String? notes,
  }) async {
    final repository = await ref.read(stockTakeRepositoryProvider.future);
    final result = await repository.convertProposedOrderToSalesOrder(
      orderId: orderId,
      notes: notes,
    );

    return result.fold((failure) {
      state = state.copyWith(errorMessage: failure.message);
      return null;
    }, (conversionResult) => conversionResult);
  }

  /// Clear any error state
  void clearError() {
    state = state.copyWith(clearError: true);
  }
}

// ============================================================================
// Serial Number Controller
// ============================================================================

/// State for serial number operations
class SerialScanState {
  final bool isLoading;
  final String? errorMessage;
  final List<SerialNumberEntry> scannedSerials;
  final ValidationResult? lastValidation;

  const SerialScanState({
    this.isLoading = false,
    this.errorMessage,
    this.scannedSerials = const [],
    this.lastValidation,
  });

  SerialScanState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<SerialNumberEntry>? scannedSerials,
    ValidationResult? lastValidation,
    bool clearError = false,
    bool clearValidation = false,
  }) {
    return SerialScanState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      scannedSerials: scannedSerials ?? this.scannedSerials,
      lastValidation: clearValidation
          ? null
          : (lastValidation ?? this.lastValidation),
    );
  }
}

/// Controller for serial number scanning and validation
@riverpod
class SerialScanController extends _$SerialScanController {
  static const _uuid = Uuid();

  @override
  SerialScanState build(String sessionLocalId, String itemLocalId) =>
      const SerialScanState();

  /// Load existing serials for an item
  Future<void> loadSerials() async {
    state = state.copyWith(isLoading: true, clearError: true);

    final getItemSerials = await ref.read(getItemSerialsProvider.future);
    final result = await getItemSerials(
      GetItemSerialsParams(itemLocalId: itemLocalId),
    );

    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
      },
      (serials) {
        state = state.copyWith(isLoading: false, scannedSerials: serials);
      },
    );
  }

  /// Validate a serial number before adding
  Future<ValidationResult?> validateSerial(String serialNumber) async {
    final validateSerialNumber = await ref.read(
      validateSerialNumberProvider.future,
    );
    final result = await validateSerialNumber(
      ValidateSerialParams(
        serialNumber: serialNumber,
        sessionLocalId: sessionLocalId,
      ),
    );

    return result.fold(
      (failure) {
        state = state.copyWith(
          errorMessage: failure.message,
          clearValidation: true,
        );
        return null;
      },
      (validation) {
        state = state.copyWith(lastValidation: validation);
        return validation;
      },
    );
  }

  /// Add a serial number
  Future<SerialNumberEntry?> addSerial(String serialNumber) async {
    state = state.copyWith(isLoading: true, clearError: true);

    // First validate
    final validation = await validateSerial(serialNumber);
    if (validation == null || !validation.isValid) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: validation?.message ?? 'Validation failed',
      );
      return null;
    }

    // Add the serial
    final addSerialNumber = await ref.read(addSerialNumberProvider.future);
    final normalizedSerial = serialNumber.toUpperCase().trim();
    final deviceScanId = _uuid.v4();

    final result = await addSerialNumber(
      AddSerialParams(
        sessionLocalId: sessionLocalId,
        itemLocalId: itemLocalId,
        serialNumberRaw: serialNumber,
        serialNumberNorm: normalizedSerial,
        deviceScanId: deviceScanId,
        deviceScannedAt: DateTime.now(),
        scanSequence: state.scannedSerials.length + 1,
      ),
    );

    return result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
        return null;
      },
      (serial) {
        state = state.copyWith(
          isLoading: false,
          scannedSerials: [...state.scannedSerials, serial],
          clearValidation: true,
        );
        return serial;
      },
    );
  }

  /// Delete a serial number
  Future<bool> deleteSerial(String serialLocalId, String reason) async {
    state = state.copyWith(isLoading: true, clearError: true);

    final deleteSerial = await ref.read(deleteSerialProvider.future);
    final result = await deleteSerial(
      DeleteSerialParams(serialLocalId: serialLocalId, reason: reason),
    );

    return result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
        return false;
      },
      (_) {
        state = state.copyWith(
          isLoading: false,
          scannedSerials: state.scannedSerials
              .where((s) => s.localId != serialLocalId)
              .toList(),
        );
        return true;
      },
    );
  }

  /// Pushes this item's scanned serials to the server now, instead of
  /// waiting for the whole session to complete. Called when the user taps
  /// "Done" on the serial-scan screen. Best-effort: a failure here isn't
  /// surfaced as an error, since the serials are already saved locally and
  /// will be retried at session completion / background sync either way -
  /// it just means they'll reach the backend a little later than intended.
  Future<void> syncNow() async {
    final syncItemSerials = await ref.read(syncItemSerialsProvider.future);
    await syncItemSerials(SyncItemSerialsParams(itemLocalId: itemLocalId));
  }

  /// Clear error state
  void clearError() {
    state = state.copyWith(clearError: true);
  }
}

// ============================================================================
// Warehouse Provider
// ============================================================================

/// Provider for customer warehouses
@riverpod
Future<List<Warehouse>> customerWarehouses(Ref ref, int customerId) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  final result = await repository.getCustomerWarehouses(customerId);

  return result.fold(
    (failure) => throw Exception(failure.message),
    (warehouses) => warehouses,
  );
}

// ============================================================================
// Customer Products Provider
// ============================================================================

/// Provider for customer products (for product selection)
@riverpod
Future<List<CustomerProduct>> customerProducts(
  Ref ref,
  int customerId, {
  int? brandId,
}) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  final result = await repository.getCustomerProducts(
    customerId,
    brandId: brandId,
  );

  return result.fold(
    (failure) => throw Exception(failure.message),
    (products) => products,
  );
}

/// Provider for active session catalogue products (includes barcode)
/// Use this when user has an active stock take session
/// NOTE: This endpoint automatically filters by the agent's assigned customer brands
@riverpod
Future<List<CustomerProduct>> activeSessionCatalogue(
  Ref ref, {
  String? search,
  int? brandId,
}) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  final result = await repository.getActiveSessionCatalogue(
    search: search,
    brandId: brandId,
  );

  return result.fold(
    (failure) => throw Exception(failure.message),
    (products) => products,
  );
}

/// Provider for active session catalogue products filtered by agent's brands
/// This combines the catalogue with the agent's customer-specific brand assignments
/// to ensure only accessible products are shown.
@riverpod
Future<List<CustomerProduct>> activeSessionFilteredCatalogue(
  Ref ref, {
  String? search,
  int? brandId,
}) async {
  // First get the raw catalogue
  final products = await ref.watch(
    activeSessionCatalogueProvider(search: search, brandId: brandId).future,
  );

  // Get agent's customer brands for the active session
  final customerBrands = await ref.watch(
    activeSessionCustomerBrandsProvider.future,
  );

  // If no brand restrictions, return all products
  if (customerBrands == null || customerBrands.hasGlobalAllBrands) {
    return products;
  }

  // Get the active session to know the customer
  final sessionState = ref.watch(stockTakeSessionControllerProvider);
  final session = sessionState.activeSession;
  if (session == null) return products;

  // Check if we should filter
  if (!customerBrands.shouldFilterBrands(session.customerId)) {
    return products;
  }

  // Filter products by accessible brands
  final accessibleBrandIds = customerBrands.getAccessibleBrandIds(
    session.customerId,
  );

  // If no accessible brands, return empty list
  if (accessibleBrandIds.isEmpty) {
    // This shouldn't happen if shouldFilterBrands returned true but handle it
    return products;
  }

  return products.where((p) => accessibleBrandIds.contains(p.brandId)).toList();
}

// ============================================================================
// Agent Brands Provider
// ============================================================================

/// Provider for agent brands (products)
@riverpod
Future<AgentBrand?> agentBrands(Ref ref, int agentId) async {
  final getAgentBrands = await ref.read(getAgentBrandsProvider.future);
  final result = await getAgentBrands(GetAgentBrandsParams(agentId: agentId));

  return result.fold((failure) => null, (agentBrand) => agentBrand);
}

/// Provider for current agent's global brands
@riverpod
Future<AgentBrand?> myBrands(Ref ref) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  final result = await repository.getMyBrands();
  return result.fold((failure) => null, (brands) => brands);
}

/// Provider for agent's brands for the active stock count session
@riverpod
Future<AgentBrand?> activeSessionBrands(Ref ref) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  final result = await repository.getActiveSessionBrands();
  return result.fold((failure) => null, (brands) => brands);
}

/// Provider for agent's customer-specific brands for the active stock count session
@riverpod
Future<AgentCustomerBrands?> activeSessionCustomerBrands(Ref ref) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  final result = await repository.getActiveSessionCustomerBrands();
  return result.fold((failure) => null, (brands) => brands);
}

/// Provider for agent's brands for a specific customer
@riverpod
Future<AgentCustomerBrands?> myBrandsForCustomer(
  Ref ref,
  int customerId,
) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  final result = await repository.getMyBrandsForCustomer(customerId);
  return result.fold((failure) => null, (brands) => brands);
}

/// Provider that returns the brand IDs the agent can access for the active session
/// Returns empty list if agent has access to all brands (no filtering needed)
@riverpod
Future<List<int>> activeSessionAccessibleBrandIds(Ref ref) async {
  final customerBrands = await ref.watch(
    activeSessionCustomerBrandsProvider.future,
  );
  if (customerBrands == null) return [];

  // If agent has global all brands access, return empty (no filtering)
  if (customerBrands.hasGlobalAllBrands) return [];

  // Get the active session to know the customer ID
  final sessionState = ref.watch(stockTakeSessionControllerProvider);
  final session = sessionState.activeSession;
  if (session == null) return [];

  return customerBrands.getAccessibleBrandIds(session.customerId);
}

/// Provider that returns whether brand filtering is needed for active session
@riverpod
Future<bool> shouldFilterBrandsBySession(Ref ref) async {
  final customerBrands = await ref.watch(
    activeSessionCustomerBrandsProvider.future,
  );
  if (customerBrands == null) return false;

  // If agent has global all brands access, no filtering needed
  if (customerBrands.hasGlobalAllBrands) return false;

  // Get the active session to know the customer ID
  final sessionState = ref.watch(stockTakeSessionControllerProvider);
  final session = sessionState.activeSession;
  if (session == null) return false;

  return customerBrands.shouldFilterBrands(session.customerId);
}

// ============================================================================
// Product Search Providers
// ============================================================================

/// Provider for finding a product by barcode against the live,
/// session-scoped catalogue. Not cached locally - always hits the backend,
/// which is the sole source of truth for what's in scope for this session.
@riverpod
Future<CustomerProduct?> findProductByBarcode(Ref ref, String barcode) async {
  final session = ref.watch(stockTakeSessionControllerProvider).activeSession;
  if (session == null) return null;

  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  final result = await repository.findProductByBarcode(barcode);
  return result.fold((failure) => null, (product) => product);
}

/// Provider for searching products by search term against the live,
/// session-scoped catalogue. Not cached locally - always hits the backend.
@riverpod
Future<List<CustomerProduct>> searchCatalogueProducts(
  Ref ref,
  String searchTerm,
) async {
  if (searchTerm.isEmpty) {
    return [];
  }

  final session = ref.watch(stockTakeSessionControllerProvider).activeSession;
  if (session == null) return [];

  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  final result = await repository.searchProducts(searchTerm);

  return result.fold((failure) => [], (products) => products);
}
