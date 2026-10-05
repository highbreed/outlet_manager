import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/facings_count.dart';
import 'facings_count_providers.dart';

part 'facings_count_controller.g.dart';

/// State for the facings count controller
class FacingsCountState {
  final bool isLoading;
  final String? loadingMessage;
  final String? errorMessage;
  final FacingsCount? activeDraft;
  final List<FacingsCount> todaySubmitted;

  const FacingsCountState({
    this.isLoading = false,
    this.loadingMessage,
    this.errorMessage,
    this.activeDraft,
    this.todaySubmitted = const [],
  });

  FacingsCountState copyWith({
    bool? isLoading,
    String? loadingMessage,
    String? errorMessage,
    FacingsCount? activeDraft,
    List<FacingsCount>? todaySubmitted,
    bool clearError = false,
    bool clearActiveDraft = false,
    bool clearLoadingMessage = false,
  }) {
    return FacingsCountState(
      isLoading: isLoading ?? this.isLoading,
      loadingMessage: clearLoadingMessage
          ? null
          : (loadingMessage ?? this.loadingMessage),
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      activeDraft: clearActiveDraft ? null : (activeDraft ?? this.activeDraft),
      todaySubmitted: todaySubmitted ?? this.todaySubmitted,
    );
  }
}

/// Controller for the horizontal facings count lifecycle
@riverpod
class FacingsCountController extends _$FacingsCountController {
  @override
  FacingsCountState build() {
    return const FacingsCountState();
  }

  /// Load active draft + today's submitted counts for a customer
  Future<void> loadForCustomer({
    required int customerId,
    required int salesAgentId,
  }) async {
    state = state.copyWith(
      isLoading: true,
      clearError: true,
      loadingMessage: 'Loading facings counts...',
    );

    try {
      final repo = await ref.read(facingsCountRepositoryProvider.future);

      FacingsCount? active;
      final activeResult = await repo.getActiveDraft(customerId);
      activeResult.fold(
        (failure) =>
            print('[FacingsCountCtrl] Error loading draft: ${failure.message}'),
        (draft) => active = draft,
      );

      List<FacingsCount> today = [];
      final todayResult = await repo.getTodaySubmitted(
        customerId: customerId,
        salesAgentId: salesAgentId,
      );
      todayResult.fold(
        (failure) => print(
          '[FacingsCountCtrl] Error loading today\'s counts: ${failure.message}',
        ),
        (counts) => today = counts,
      );

      if (!ref.mounted) return;
      state = FacingsCountState(activeDraft: active, todaySubmitted: today);
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        clearLoadingMessage: true,
        errorMessage: 'Failed to load facings counts: $e',
      );
    }
  }

  /// Start a new facings count draft
  Future<bool> startCount({
    required String visitLocalId,
    int? visitServerId,
    required int customerId,
    required String customerCode,
    required String customerName,
    required int salesAgentId,
  }) async {
    state = state.copyWith(
      isLoading: true,
      clearError: true,
      loadingMessage: 'Starting facings count...',
    );

    try {
      final repo = await ref.read(facingsCountRepositoryProvider.future);
      final result = await repo.createDraft(
        visitLocalId: visitLocalId,
        visitServerId: visitServerId,
        customerId: customerId,
        customerCode: customerCode,
        customerName: customerName,
        salesAgentId: salesAgentId,
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
        (draft) {
          state = state.copyWith(
            isLoading: false,
            clearLoadingMessage: true,
            activeDraft: draft,
          );
          return true;
        },
      );
    } catch (e) {
      if (!ref.mounted) return false;
      state = state.copyWith(
        isLoading: false,
        clearLoadingMessage: true,
        errorMessage: 'Failed to start count: $e',
      );
      return false;
    }
  }

  /// Add item groups to the active draft (default quantity of 1, skips duplicates)
  Future<bool> addItemGroups(List<FacingsCountItem> newItems) async {
    final draft = state.activeDraft;
    if (draft == null || newItems.isEmpty) return false;

    final existingIds = draft.items.map((i) => i.itemGroupId).toSet();
    final itemsToAdd = newItems
        .where((i) => !existingIds.contains(i.itemGroupId))
        .toList();
    if (itemsToAdd.isEmpty) return true;

    return _saveItems([...draft.items, ...itemsToAdd]);
  }

  /// Update the quantity for an item group already in the draft
  Future<bool> updateQuantity(int itemGroupId, int quantity) async {
    final draft = state.activeDraft;
    if (draft == null || quantity < 1) return false;

    final updatedItems = draft.items
        .map(
          (i) => i.itemGroupId == itemGroupId
              ? i.copyWith(quantity: quantity)
              : i,
        )
        .toList();

    return _saveItems(updatedItems);
  }

  /// Remove an item group from the draft
  Future<bool> removeItem(int itemGroupId) async {
    final draft = state.activeDraft;
    if (draft == null) return false;

    final updatedItems = draft.items
        .where((i) => i.itemGroupId != itemGroupId)
        .toList();

    return _saveItems(updatedItems);
  }

  Future<bool> _saveItems(List<FacingsCountItem> items) async {
    final draft = state.activeDraft;
    if (draft == null) return false;

    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final repo = await ref.read(facingsCountRepositoryProvider.future);
      final result = await repo.saveProgress(
        localId: draft.localId,
        items: items,
      );
      if (!ref.mounted) return false;

      return result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            errorMessage: failure.displayMessage,
          );
          return false;
        },
        (updated) {
          state = state.copyWith(isLoading: false, activeDraft: updated);
          return true;
        },
      );
    } catch (e) {
      if (!ref.mounted) return false;
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to update count: $e',
      );
      return false;
    }
  }

  /// Submit the active draft. Clears the cart for the next count on success.
  Future<bool> submitCount() async {
    final draft = state.activeDraft;
    if (draft == null || !draft.hasData) return false;

    state = state.copyWith(
      isLoading: true,
      clearError: true,
      loadingMessage: 'Submitting facings count...',
    );

    try {
      final repo = await ref.read(facingsCountRepositoryProvider.future);
      final result = await repo.submitCount(draft.localId);
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
        (submitted) {
          // Cart clears for the next count
          state = FacingsCountState(
            todaySubmitted: [submitted, ...state.todaySubmitted],
          );
          return true;
        },
      );
    } catch (e) {
      if (!ref.mounted) return false;
      state = state.copyWith(
        isLoading: false,
        clearLoadingMessage: true,
        errorMessage: 'Failed to submit count: $e',
      );
      return false;
    }
  }

  /// Discard the active draft
  Future<bool> discardDraft() async {
    final draft = state.activeDraft;
    if (draft == null) return false;

    try {
      final repo = await ref.read(facingsCountRepositoryProvider.future);
      final result = await repo.discardDraft(draft.localId);
      if (!ref.mounted) return false;

      return result.fold(
        (failure) {
          state = state.copyWith(errorMessage: failure.displayMessage);
          return false;
        },
        (_) {
          state = state.copyWith(clearActiveDraft: true);
          return true;
        },
      );
    } catch (e) {
      if (!ref.mounted) return false;
      state = state.copyWith(errorMessage: 'Failed to discard draft: $e');
      return false;
    }
  }

  /// Reload the active draft from local storage
  Future<void> refreshActiveDraft() async {
    final draft = state.activeDraft;
    if (draft == null) return;

    try {
      final repo = await ref.read(facingsCountRepositoryProvider.future);
      final result = await repo.getByLocalId(draft.localId);
      if (!ref.mounted) return;
      result.fold((failure) => null, (updated) {
        state = state.copyWith(activeDraft: updated);
      });
    } catch (_) {}
  }

  /// Load a specific count by localId (for viewing a past submitted count)
  Future<void> loadCountByLocalId(String localId) async {
    state = state.copyWith(
      isLoading: true,
      clearError: true,
      loadingMessage: 'Loading count...',
    );

    try {
      final repo = await ref.read(facingsCountRepositoryProvider.future);
      final result = await repo.getByLocalId(localId);
      if (!ref.mounted) return;
      result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            clearLoadingMessage: true,
            errorMessage: failure.displayMessage,
          );
        },
        (count) {
          state = state.copyWith(
            isLoading: false,
            clearLoadingMessage: true,
            activeDraft: count,
          );
        },
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        clearLoadingMessage: true,
        errorMessage: 'Failed to load count: $e',
      );
    }
  }

  /// Clear any error message
  void clearError() {
    state = state.copyWith(clearError: true);
  }
}
