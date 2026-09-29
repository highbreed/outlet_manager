import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../data/datasources/biometric_remote_datasource.dart';
import '../data/datasources/biometric_remote_datasource_impl.dart';
import '../data/datasources/fake_biometric_remote_datasource.dart';
import '../data/repositories/biometric_repository_impl.dart';
import '../domain/repositories/biometric_repository.dart';
import '../domain/usecases/usecases.dart';

part 'biometric_repository_providers.g.dart';

/// Dev-only escape hatch to use [FakeBiometricRemoteDatasource] before
/// backend contracts are live — flip locally, never commit as `true` for
/// long, and it has zero effect outside `kDebugMode` regardless (see
/// [biometricRemoteDatasource] below). See the "Phase 4" plan's
/// "Production safety" section for why this is a hard gate, not just a
/// convention to remember.
const bool useDevBiometricFake = false;

@riverpod
BiometricRemoteDatasource biometricRemoteDatasource(Ref ref) {
  final useFake = kDebugMode && useDevBiometricFake;
  if (useFake) return const FakeBiometricRemoteDatasource();
  assert(
    !useDevBiometricFake || kDebugMode,
    'Fake biometric datasource must never be selected outside a debug build',
  );
  return BiometricRemoteDatasourceImpl(ref.watch(dioProvider));
}

@riverpod
BiometricRepository biometricRepository(Ref ref) {
  return BiometricRepositoryImpl(ref.watch(biometricRemoteDatasourceProvider));
}

@riverpod
RequestLivenessChallengeUseCase requestLivenessChallengeUseCase(Ref ref) {
  return RequestLivenessChallengeUseCase(ref.watch(biometricRepositoryProvider));
}

@riverpod
VerifyFaceUseCase verifyFaceUseCase(Ref ref) {
  return VerifyFaceUseCase(ref.watch(biometricRepositoryProvider));
}

@riverpod
RegisterFaceUseCase registerFaceUseCase(Ref ref) {
  return RegisterFaceUseCase(ref.watch(biometricRepositoryProvider));
}

@riverpod
GetBiometricStatusUseCase getBiometricStatusUseCase(Ref ref) {
  return GetBiometricStatusUseCase(ref.watch(biometricRepositoryProvider));
}
