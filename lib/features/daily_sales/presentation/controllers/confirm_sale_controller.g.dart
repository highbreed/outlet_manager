// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_sale_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$confirmSaleControllerHash() =>
    r'3a82eaf5fd9b2079704741caf0cc77babd32f1e6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ConfirmSaleController
    extends BuildlessAutoDisposeAsyncNotifier<ConfirmSaleState> {
  late final int saleId;

  FutureOr<ConfirmSaleState> build(int saleId);
}

/// Loads a pending sale and collects the serial numbers required to
/// confirm it — exactly `quantity` distinct serials per item.
///
/// Copied from [ConfirmSaleController].
@ProviderFor(ConfirmSaleController)
const confirmSaleControllerProvider = ConfirmSaleControllerFamily();

/// Loads a pending sale and collects the serial numbers required to
/// confirm it — exactly `quantity` distinct serials per item.
///
/// Copied from [ConfirmSaleController].
class ConfirmSaleControllerFamily extends Family<AsyncValue<ConfirmSaleState>> {
  /// Loads a pending sale and collects the serial numbers required to
  /// confirm it — exactly `quantity` distinct serials per item.
  ///
  /// Copied from [ConfirmSaleController].
  const ConfirmSaleControllerFamily();

  /// Loads a pending sale and collects the serial numbers required to
  /// confirm it — exactly `quantity` distinct serials per item.
  ///
  /// Copied from [ConfirmSaleController].
  ConfirmSaleControllerProvider call(int saleId) {
    return ConfirmSaleControllerProvider(saleId);
  }

  @override
  ConfirmSaleControllerProvider getProviderOverride(
    covariant ConfirmSaleControllerProvider provider,
  ) {
    return call(provider.saleId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'confirmSaleControllerProvider';
}

/// Loads a pending sale and collects the serial numbers required to
/// confirm it — exactly `quantity` distinct serials per item.
///
/// Copied from [ConfirmSaleController].
class ConfirmSaleControllerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          ConfirmSaleController,
          ConfirmSaleState
        > {
  /// Loads a pending sale and collects the serial numbers required to
  /// confirm it — exactly `quantity` distinct serials per item.
  ///
  /// Copied from [ConfirmSaleController].
  ConfirmSaleControllerProvider(int saleId)
    : this._internal(
        () => ConfirmSaleController()..saleId = saleId,
        from: confirmSaleControllerProvider,
        name: r'confirmSaleControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$confirmSaleControllerHash,
        dependencies: ConfirmSaleControllerFamily._dependencies,
        allTransitiveDependencies:
            ConfirmSaleControllerFamily._allTransitiveDependencies,
        saleId: saleId,
      );

  ConfirmSaleControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.saleId,
  }) : super.internal();

  final int saleId;

  @override
  FutureOr<ConfirmSaleState> runNotifierBuild(
    covariant ConfirmSaleController notifier,
  ) {
    return notifier.build(saleId);
  }

  @override
  Override overrideWith(ConfirmSaleController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ConfirmSaleControllerProvider._internal(
        () => create()..saleId = saleId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        saleId: saleId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    ConfirmSaleController,
    ConfirmSaleState
  >
  createElement() {
    return _ConfirmSaleControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConfirmSaleControllerProvider && other.saleId == saleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, saleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConfirmSaleControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ConfirmSaleState> {
  /// The parameter `saleId` of this provider.
  int get saleId;
}

class _ConfirmSaleControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          ConfirmSaleController,
          ConfirmSaleState
        >
    with ConfirmSaleControllerRef {
  _ConfirmSaleControllerProviderElement(super.provider);

  @override
  int get saleId => (origin as ConfirmSaleControllerProvider).saleId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
