import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/usecases.dart';
import 'daily_sales_providers.dart';

/// Provider for RegisterDailySale use case
final registerDailySaleProvider = FutureProvider<RegisterDailySale>((
  ref,
) async {
  final repository = await ref.watch(dailySalesRepositoryProvider.future);
  return RegisterDailySale(repository);
});

/// Provider for ConfirmDailySale use case
final confirmDailySaleProvider = FutureProvider<ConfirmDailySale>((
  ref,
) async {
  final repository = await ref.watch(dailySalesRepositoryProvider.future);
  return ConfirmDailySale(repository);
});

/// Provider for CancelDailySale use case
final cancelDailySaleProvider = FutureProvider<CancelDailySale>((ref) async {
  final repository = await ref.watch(dailySalesRepositoryProvider.future);
  return CancelDailySale(repository);
});

/// Provider for GetDailySale use case
final getDailySaleProvider = FutureProvider<GetDailySale>((ref) async {
  final repository = await ref.watch(dailySalesRepositoryProvider.future);
  return GetDailySale(repository);
});

/// Provider for GetDailySales use case
final getDailySalesProvider = FutureProvider<GetDailySales>((ref) async {
  final repository = await ref.watch(dailySalesRepositoryProvider.future);
  return GetDailySales(repository);
});

/// Provider for RequestDailySaleOtp use case
final requestDailySaleOtpProvider = FutureProvider<RequestDailySaleOtp>((
  ref,
) async {
  final repository = await ref.watch(dailySalesRepositoryProvider.future);
  return RequestDailySaleOtp(repository);
});

/// Provider for VerifyDailySaleOtp use case
final verifyDailySaleOtpProvider = FutureProvider<VerifyDailySaleOtp>((
  ref,
) async {
  final repository = await ref.watch(dailySalesRepositoryProvider.future);
  return VerifyDailySaleOtp(repository);
});
