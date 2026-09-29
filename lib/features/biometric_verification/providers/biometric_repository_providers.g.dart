// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric_repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(biometricRemoteDatasource)
const biometricRemoteDatasourceProvider = BiometricRemoteDatasourceProvider._();

final class BiometricRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          BiometricRemoteDatasource,
          BiometricRemoteDatasource,
          BiometricRemoteDatasource
        >
    with $Provider<BiometricRemoteDatasource> {
  const BiometricRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'biometricRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$biometricRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<BiometricRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BiometricRemoteDatasource create(Ref ref) {
    return biometricRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BiometricRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BiometricRemoteDatasource>(value),
    );
  }
}

String _$biometricRemoteDatasourceHash() =>
    r'b27b7141f14258213e31cf5856f885756b2cb2b7';

@ProviderFor(biometricRepository)
const biometricRepositoryProvider = BiometricRepositoryProvider._();

final class BiometricRepositoryProvider
    extends
        $FunctionalProvider<
          BiometricRepository,
          BiometricRepository,
          BiometricRepository
        >
    with $Provider<BiometricRepository> {
  const BiometricRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'biometricRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$biometricRepositoryHash();

  @$internal
  @override
  $ProviderElement<BiometricRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BiometricRepository create(Ref ref) {
    return biometricRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BiometricRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BiometricRepository>(value),
    );
  }
}

String _$biometricRepositoryHash() =>
    r'3ab626a6c5b6e6edf21f9323e941e32578f7efaa';

@ProviderFor(requestLivenessChallengeUseCase)
const requestLivenessChallengeUseCaseProvider =
    RequestLivenessChallengeUseCaseProvider._();

final class RequestLivenessChallengeUseCaseProvider
    extends
        $FunctionalProvider<
          RequestLivenessChallengeUseCase,
          RequestLivenessChallengeUseCase,
          RequestLivenessChallengeUseCase
        >
    with $Provider<RequestLivenessChallengeUseCase> {
  const RequestLivenessChallengeUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'requestLivenessChallengeUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$requestLivenessChallengeUseCaseHash();

  @$internal
  @override
  $ProviderElement<RequestLivenessChallengeUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RequestLivenessChallengeUseCase create(Ref ref) {
    return requestLivenessChallengeUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RequestLivenessChallengeUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RequestLivenessChallengeUseCase>(
        value,
      ),
    );
  }
}

String _$requestLivenessChallengeUseCaseHash() =>
    r'90d8becf460face19e875c53cb41b0976e06ec39';

@ProviderFor(verifyFaceUseCase)
const verifyFaceUseCaseProvider = VerifyFaceUseCaseProvider._();

final class VerifyFaceUseCaseProvider
    extends
        $FunctionalProvider<
          VerifyFaceUseCase,
          VerifyFaceUseCase,
          VerifyFaceUseCase
        >
    with $Provider<VerifyFaceUseCase> {
  const VerifyFaceUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'verifyFaceUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$verifyFaceUseCaseHash();

  @$internal
  @override
  $ProviderElement<VerifyFaceUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  VerifyFaceUseCase create(Ref ref) {
    return verifyFaceUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VerifyFaceUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VerifyFaceUseCase>(value),
    );
  }
}

String _$verifyFaceUseCaseHash() => r'a823eb6c61052c50ab7c7ef2bacabedd09faa329';

@ProviderFor(registerFaceUseCase)
const registerFaceUseCaseProvider = RegisterFaceUseCaseProvider._();

final class RegisterFaceUseCaseProvider
    extends
        $FunctionalProvider<
          RegisterFaceUseCase,
          RegisterFaceUseCase,
          RegisterFaceUseCase
        >
    with $Provider<RegisterFaceUseCase> {
  const RegisterFaceUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerFaceUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerFaceUseCaseHash();

  @$internal
  @override
  $ProviderElement<RegisterFaceUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RegisterFaceUseCase create(Ref ref) {
    return registerFaceUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterFaceUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterFaceUseCase>(value),
    );
  }
}

String _$registerFaceUseCaseHash() =>
    r'9e3ce311ead6b7615b353d6e0f1713b732a6b1e7';

@ProviderFor(getBiometricStatusUseCase)
const getBiometricStatusUseCaseProvider = GetBiometricStatusUseCaseProvider._();

final class GetBiometricStatusUseCaseProvider
    extends
        $FunctionalProvider<
          GetBiometricStatusUseCase,
          GetBiometricStatusUseCase,
          GetBiometricStatusUseCase
        >
    with $Provider<GetBiometricStatusUseCase> {
  const GetBiometricStatusUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getBiometricStatusUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getBiometricStatusUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetBiometricStatusUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetBiometricStatusUseCase create(Ref ref) {
    return getBiometricStatusUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetBiometricStatusUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetBiometricStatusUseCase>(value),
    );
  }
}

String _$getBiometricStatusUseCaseHash() =>
    r'0a3a01d1351524eaeedbec9d9532c541ba344f24';
