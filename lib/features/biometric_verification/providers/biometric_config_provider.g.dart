// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric_config_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(biometricConfig)
const biometricConfigProvider = BiometricConfigProvider._();

final class BiometricConfigProvider
    extends
        $FunctionalProvider<BiometricConfig, BiometricConfig, BiometricConfig>
    with $Provider<BiometricConfig> {
  const BiometricConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'biometricConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$biometricConfigHash();

  @$internal
  @override
  $ProviderElement<BiometricConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BiometricConfig create(Ref ref) {
    return biometricConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BiometricConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BiometricConfig>(value),
    );
  }
}

String _$biometricConfigHash() => r'96c027bee0c0bcc918806d13698e159c8a7a98e2';
