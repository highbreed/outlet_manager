import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/entities.dart';

part 'stock_take_controller.freezed.dart';

/// State for the Stock Take feature
@freezed
abstract class StockTakeState with _$StockTakeState {
  const factory StockTakeState.initial() = _Initial;
  const factory StockTakeState.loading({String? message}) = _Loading;
  const factory StockTakeState.loaded({
    StockTakeSession? activeSession,
    required List<StockTakeSession> recentSessions,
    required List<StockTakeItem> sessionItems,
  }) = _Loaded;
  const factory StockTakeState.error({required String message}) = _Error;
}

/// Controller for Stock Take operations
class StockTakeController extends Notifier<StockTakeState> {
  @override
  StockTakeState build() => const StockTakeState.initial();

  /// Load stock take data for a customer
  Future<void> loadForCustomer(int customerId) async {
    state = const StockTakeState.loading(message: 'Loading stock take data...');

    // TODO: Implement actual data loading via use cases
    // For now, simulate with empty data
    await Future.delayed(const Duration(milliseconds: 500));

    state = const StockTakeState.loaded(
      activeSession: null,
      recentSessions: [],
      sessionItems: [],
    );
  }

  /// Start a new stock take session
  Future<void> startSession({
    required int customerId,
    required String visitLocalId,
    required int warehouseId,
  }) async {
    state = const StockTakeState.loading(message: 'Starting session...');

    // TODO: Implement via StartStockTakeSession use case
    await Future.delayed(const Duration(milliseconds: 500));

    state = const StockTakeState.loaded(
      activeSession: null,
      recentSessions: [],
      sessionItems: [],
    );
  }

  /// Load items for a session
  Future<void> loadSessionItems(String sessionLocalId) async {
    state = const StockTakeState.loading(message: 'Loading items...');

    // TODO: Implement via GetSessionItems use case
    await Future.delayed(const Duration(milliseconds: 500));

    state = const StockTakeState.loaded(
      activeSession: null,
      recentSessions: [],
      sessionItems: [],
    );
  }

  /// Pause the active session
  Future<void> pauseSession(String sessionLocalId) async {
    state = const StockTakeState.loading(message: 'Pausing session...');

    // TODO: Implement via PauseSession use case
    await Future.delayed(const Duration(milliseconds: 500));

    state = const StockTakeState.loaded(
      activeSession: null,
      recentSessions: [],
      sessionItems: [],
    );
  }

  /// Resume a paused session
  Future<void> resumeSession(String sessionLocalId) async {
    state = const StockTakeState.loading(message: 'Resuming session...');

    // TODO: Implement via ResumeSession use case
    await Future.delayed(const Duration(milliseconds: 500));

    state = const StockTakeState.loaded(
      activeSession: null,
      recentSessions: [],
      sessionItems: [],
    );
  }

  /// Complete and submit the session
  Future<void> completeSession(String sessionLocalId) async {
    state = const StockTakeState.loading(message: 'Submitting session...');

    // TODO: Implement via CompleteSession use case
    await Future.delayed(const Duration(milliseconds: 500));

    state = const StockTakeState.loaded(
      activeSession: null,
      recentSessions: [],
      sessionItems: [],
    );
  }

  /// Cancel the session
  Future<void> cancelSession(String sessionLocalId, String reason) async {
    state = const StockTakeState.loading(message: 'Cancelling session...');

    // TODO: Implement via CancelSession use case
    await Future.delayed(const Duration(milliseconds: 500));

    state = const StockTakeState.loaded(
      activeSession: null,
      recentSessions: [],
      sessionItems: [],
    );
  }
}

/// Provider for the Stock Take controller
final stockTakeControllerProvider =
    NotifierProvider<StockTakeController, StockTakeState>(
      StockTakeController.new,
    );
