import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/usecases.dart';
import 'stock_take_providers.dart';

// ============================================================================
// Use Case Providers
// ============================================================================

/// Provider for GetAgentBrands use case
final getAgentBrandsProvider = FutureProvider<GetAgentBrands>((ref) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  return GetAgentBrands(repository);
});

/// Provider for StartStockTakeSession use case
final startStockTakeSessionProvider = FutureProvider<StartStockTakeSession>((
  ref,
) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  return StartStockTakeSession(repository);
});

/// Provider for PauseSession use case
final pauseSessionProvider = FutureProvider<PauseSession>((ref) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  return PauseSession(repository);
});

/// Provider for ResumeSession use case
final resumeSessionProvider = FutureProvider<ResumeSession>((ref) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  return ResumeSession(repository);
});

/// Provider for CancelSession use case
final cancelSessionProvider = FutureProvider<CancelSession>((ref) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  return CancelSession(repository);
});

/// Provider for CompleteSession use case
final completeSessionProvider = FutureProvider<CompleteSession>((ref) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  return CompleteSession(repository);
});

/// Provider for GetActiveSessions use case
final getActiveSessionsProvider = FutureProvider<GetActiveSessions>((
  ref,
) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  return GetActiveSessions(repository);
});

/// Provider for GetSessionItems use case
final getSessionItemsProvider = FutureProvider<GetSessionItems>((ref) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  return GetSessionItems(repository);
});

/// Provider for GetItemSerials use case
final getItemSerialsProvider = FutureProvider<GetItemSerials>((ref) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  return GetItemSerials(repository);
});

/// Provider for AddProductToSession use case
final addProductToSessionProvider = FutureProvider<AddProductToSession>((
  ref,
) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  return AddProductToSession(repository);
});

/// Provider for ValidateSerialNumber use case
final validateSerialNumberProvider = FutureProvider<ValidateSerialNumber>((
  ref,
) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  return ValidateSerialNumber(repository);
});

/// Provider for AddSerialNumber use case
final addSerialNumberProvider = FutureProvider<AddSerialNumber>((ref) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  return AddSerialNumber(repository);
});

/// Provider for DeleteSerial use case
final deleteSerialProvider = FutureProvider<DeleteSerial>((ref) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  return DeleteSerial(repository);
});

/// Provider for SyncItemSerials use case
final syncItemSerialsProvider = FutureProvider<SyncItemSerials>((ref) async {
  final repository = await ref.watch(stockTakeRepositoryProvider.future);
  return SyncItemSerials(repository);
});
