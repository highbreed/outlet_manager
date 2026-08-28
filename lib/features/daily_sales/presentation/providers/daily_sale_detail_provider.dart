import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/entities.dart';
import 'usecase_providers.dart';

part 'daily_sale_detail_provider.g.dart';

/// Fetches a single sale by id, for the sale detail screen.
@riverpod
Future<DailySale> dailySaleDetail(Ref ref, int saleId) async {
  final usecase = await ref.watch(getDailySaleProvider.future);
  final result = await usecase(saleId);
  return result.fold((failure) => throw failure, (sale) => sale);
}
