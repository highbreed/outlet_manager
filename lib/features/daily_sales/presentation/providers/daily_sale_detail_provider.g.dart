// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_sale_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dailySaleDetailHash() => r'70cacf5f78a80e81c85ddf71e2032f5894060f26';

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

/// Fetches a single sale by id, for the sale detail screen.
///
/// Copied from [dailySaleDetail].
@ProviderFor(dailySaleDetail)
const dailySaleDetailProvider = DailySaleDetailFamily();

/// Fetches a single sale by id, for the sale detail screen.
///
/// Copied from [dailySaleDetail].
class DailySaleDetailFamily extends Family<AsyncValue<DailySale>> {
  /// Fetches a single sale by id, for the sale detail screen.
  ///
  /// Copied from [dailySaleDetail].
  const DailySaleDetailFamily();

  /// Fetches a single sale by id, for the sale detail screen.
  ///
  /// Copied from [dailySaleDetail].
  DailySaleDetailProvider call(int saleId) {
    return DailySaleDetailProvider(saleId);
  }

  @override
  DailySaleDetailProvider getProviderOverride(
    covariant DailySaleDetailProvider provider,
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
  String? get name => r'dailySaleDetailProvider';
}

/// Fetches a single sale by id, for the sale detail screen.
///
/// Copied from [dailySaleDetail].
class DailySaleDetailProvider extends AutoDisposeFutureProvider<DailySale> {
  /// Fetches a single sale by id, for the sale detail screen.
  ///
  /// Copied from [dailySaleDetail].
  DailySaleDetailProvider(int saleId)
    : this._internal(
        (ref) => dailySaleDetail(ref as DailySaleDetailRef, saleId),
        from: dailySaleDetailProvider,
        name: r'dailySaleDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$dailySaleDetailHash,
        dependencies: DailySaleDetailFamily._dependencies,
        allTransitiveDependencies:
            DailySaleDetailFamily._allTransitiveDependencies,
        saleId: saleId,
      );

  DailySaleDetailProvider._internal(
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
  Override overrideWith(
    FutureOr<DailySale> Function(DailySaleDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DailySaleDetailProvider._internal(
        (ref) => create(ref as DailySaleDetailRef),
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
  AutoDisposeFutureProviderElement<DailySale> createElement() {
    return _DailySaleDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DailySaleDetailProvider && other.saleId == saleId;
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
mixin DailySaleDetailRef on AutoDisposeFutureProviderRef<DailySale> {
  /// The parameter `saleId` of this provider.
  int get saleId;
}

class _DailySaleDetailProviderElement
    extends AutoDisposeFutureProviderElement<DailySale>
    with DailySaleDetailRef {
  _DailySaleDetailProviderElement(super.provider);

  @override
  int get saleId => (origin as DailySaleDetailProvider).saleId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
