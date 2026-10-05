import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/shelf_share_session.dart';
import 'shelf_share_providers.dart';

part 'shelf_share_session_controller.g.dart';

/// State for the shelf share session controller
class ShelfShareSessionState {
  final bool isLoading;
  final String? loadingMessage;
  final String? errorMessage;
  final ShelfShareSession? activeSession;
  final List<ShelfShareSession> completedSessions;

  const ShelfShareSessionState({
    this.isLoading = false,
    this.loadingMessage,
    this.errorMessage,
    this.activeSession,
    this.completedSessions = const [],
  });

  ShelfShareSessionState copyWith({
    bool? isLoading,
    String? loadingMessage,
    String? errorMessage,
    ShelfShareSession? activeSession,
    List<ShelfShareSession>? completedSessions,
    bool clearError = false,
    bool clearActiveSession = false,
    bool clearLoadingMessage = false,
  }) {
    return ShelfShareSessionState(
      isLoading: isLoading ?? this.isLoading,
      loadingMessage: clearLoadingMessage
          ? null
          : (loadingMessage ?? this.loadingMessage),
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      activeSession: clearActiveSession
          ? null
          : (activeSession ?? this.activeSession),
      completedSessions: completedSessions ?? this.completedSessions,
    );
  }
}

/// Controller for shelf share session lifecycle
@riverpod
class ShelfShareSessionController extends _$ShelfShareSessionController {
  @override
  ShelfShareSessionState build() {
    return const ShelfShareSessionState();
  }

  /// Load sessions for a customer
  Future<void> loadForCustomer(int customerId, {int? visitServerId}) async {
    state = state.copyWith(
      isLoading: true,
      clearError: true,
      loadingMessage: 'Loading shelf share data...',
    );

    try {
      final repo = await ref.read(shelfShareRepositoryProvider.future);

      ShelfShareSession? active;

      // First try to get active session from server by visit ID
      if (visitServerId != null) {
        final serverResult = await repo.getActiveSessionByVisit(visitServerId);
        serverResult.fold(
          (failure) => print(
            '[ShelfShareCtrl] Error checking server active session: ${failure.message}',
          ),
          (session) => active = session,
        );
      }

      // Fallback to local active session if server didn't return one
      if (active == null) {
        final activeResult = await repo.getActiveSession(customerId);
        activeResult.fold(
          (failure) => print(
            '[ShelfShareCtrl] Error loading active: ${failure.message}',
          ),
          (session) => active = session,
        );
      }

      // Load completed sessions
      final completedResult = await repo.getCompletedSessions(customerId);
      List<ShelfShareSession> completed = [];
      completedResult.fold(
        (failure) => print(
          '[ShelfShareCtrl] Error loading completed: ${failure.message}',
        ),
        (sessions) => completed = sessions,
      );

      if (!ref.mounted) return;
      state = ShelfShareSessionState(
        activeSession: active,
        completedSessions: completed,
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        clearLoadingMessage: true,
        errorMessage: 'Failed to load shelf share data: $e',
      );
    }
  }

  /// Create a new shelf share session
  Future<bool> createSession({
    required int visitServerId,
    required int customerId,
    required String customerCode,
    required String customerName,
    required int salesAgentId,
    required String visitLocalId,
  }) async {
    state = state.copyWith(
      isLoading: true,
      clearError: true,
      loadingMessage: 'Creating shelf share session...',
    );

    try {
      final repo = await ref.read(shelfShareRepositoryProvider.future);
      final result = await repo.createSession(
        visitServerId: visitServerId,
        customerId: customerId,
        customerCode: customerCode,
        customerName: customerName,
        salesAgentId: salesAgentId,
        visitLocalId: visitLocalId,
      );
      if (!ref.mounted) return false;

      return result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            clearLoadingMessage: true,
            errorMessage: failure.displayMessage,
          );
          return false;
        },
        (session) {
          state = state.copyWith(
            isLoading: false,
            clearLoadingMessage: true,
            activeSession: session,
          );
          return true;
        },
      );
    } catch (e) {
      if (!ref.mounted) return false;
      state = state.copyWith(
        isLoading: false,
        clearLoadingMessage: true,
        errorMessage: 'Failed to create session: $e',
      );
      return false;
    }
  }

  /// Save progress on current session
  Future<bool> saveProgress({
    required List<ShelfShareItemGroup> itemGroups,
    String? notes,
  }) async {
    final session = state.activeSession;
    if (session == null) return false;

    state = state.copyWith(
      isLoading: true,
      clearError: true,
      loadingMessage: 'Saving progress...',
    );

    try {
      final repo = await ref.read(shelfShareRepositoryProvider.future);
      final result = await repo.saveProgress(
        localId: session.localId,
        itemGroups: itemGroups,
        notes: notes,
      );
      if (!ref.mounted) return false;

      return result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            clearLoadingMessage: true,
            errorMessage: failure.displayMessage,
          );
          return false;
        },
        (updatedSession) {
          state = state.copyWith(
            isLoading: false,
            clearLoadingMessage: true,
            activeSession: updatedSession,
          );
          return true;
        },
      );
    } catch (e) {
      if (!ref.mounted) return false;
      state = state.copyWith(
        isLoading: false,
        clearLoadingMessage: true,
        errorMessage: 'Failed to save progress: $e',
      );
      return false;
    }
  }

  /// Submit session for approval
  Future<bool> submitSession() async {
    final session = state.activeSession;
    if (session == null) return false;

    state = state.copyWith(
      isLoading: true,
      clearError: true,
      loadingMessage: 'Submitting shelf share...',
    );

    try {
      final repo = await ref.read(shelfShareRepositoryProvider.future);
      final result = await repo.submitSession(session.localId);
      if (!ref.mounted) return false;

      return result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            clearLoadingMessage: true,
            errorMessage: failure.displayMessage,
          );
          return false;
        },
        (updatedSession) {
          // Move from active to completed list
          state = ShelfShareSessionState(
            completedSessions: [updatedSession, ...state.completedSessions],
          );
          return true;
        },
      );
    } catch (e) {
      if (!ref.mounted) return false;
      state = state.copyWith(
        isLoading: false,
        clearLoadingMessage: true,
        errorMessage: 'Failed to submit session: $e',
      );
      return false;
    }
  }

  /// Delete a local-only session
  Future<bool> deleteSession() async {
    final session = state.activeSession;
    if (session == null) return false;

    try {
      final repo = await ref.read(shelfShareRepositoryProvider.future);
      final result = await repo.deleteSession(session.localId);
      if (!ref.mounted) return false;

      return result.fold(
        (failure) {
          state = state.copyWith(errorMessage: failure.displayMessage);
          return false;
        },
        (_) {
          state = state.copyWith(clearActiveSession: true);
          return true;
        },
      );
    } catch (e) {
      if (!ref.mounted) return false;
      state = state.copyWith(errorMessage: 'Failed to delete session: $e');
      return false;
    }
  }

  /// Add item groups to the active session
  Future<bool> addItemGroups(List<ShelfShareItemGroup> newGroups) async {
    final session = state.activeSession;
    if (session == null || newGroups.isEmpty) return false;

    // Merge new groups with existing, avoiding duplicates
    final existingIds = session.itemGroups.map((g) => g.itemGroupId).toSet();
    final groupsToAdd = newGroups
        .where((g) => !existingIds.contains(g.itemGroupId))
        .toList();
    if (groupsToAdd.isEmpty) return true;

    final updatedGroups = [...session.itemGroups, ...groupsToAdd];

    state = state.copyWith(
      isLoading: true,
      clearError: true,
      loadingMessage: 'Adding item groups...',
    );

    try {
      final repo = await ref.read(shelfShareRepositoryProvider.future);
      final result = await repo.saveProgress(
        localId: session.localId,
        itemGroups: updatedGroups,
        notes: session.notes,
      );
      if (!ref.mounted) return false;

      return result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            clearLoadingMessage: true,
            errorMessage: failure.displayMessage,
          );
          return false;
        },
        (updatedSession) {
          state = state.copyWith(
            isLoading: false,
            clearLoadingMessage: true,
            activeSession: updatedSession,
          );
          return true;
        },
      );
    } catch (e) {
      if (!ref.mounted) return false;
      state = state.copyWith(
        isLoading: false,
        clearLoadingMessage: true,
        errorMessage: 'Failed to add item groups: $e',
      );
      return false;
    }
  }

  /// Reload the active session from local storage
  Future<void> refreshActiveSession() async {
    final session = state.activeSession;
    if (session == null) return;

    try {
      final repo = await ref.read(shelfShareRepositoryProvider.future);
      final result = await repo.getSessionByLocalId(session.localId);
      if (!ref.mounted) return;
      result.fold((failure) => null, (updated) {
        state = state.copyWith(activeSession: updated);
      });
    } catch (_) {}
  }

  /// Load a specific session by localId (for viewing completed/any session)
  Future<void> loadSessionByLocalId(String localId) async {
    state = state.copyWith(
      isLoading: true,
      clearError: true,
      loadingMessage: 'Loading session...',
    );

    try {
      final repo = await ref.read(shelfShareRepositoryProvider.future);
      final result = await repo.getSessionByLocalId(localId);
      if (!ref.mounted) return;
      result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            clearLoadingMessage: true,
            errorMessage: failure.displayMessage,
          );
        },
        (session) {
          state = state.copyWith(
            isLoading: false,
            clearLoadingMessage: true,
            activeSession: session,
          );
        },
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        clearLoadingMessage: true,
        errorMessage: 'Failed to load session: $e',
      );
    }
  }

  /// Clear any error message
  void clearError() {
    state = state.copyWith(clearError: true);
  }
}
