// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_sales_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dailySalesStatusFilterHash() =>
    r'a95533173445f65d1242c057371532639cc3a12b';

/// Currently selected status filter tab on the daily sales home screen.
/// `null` means "all statuses".
///
/// Copied from [DailySalesStatusFilter].
@ProviderFor(DailySalesStatusFilter)
final dailySalesStatusFilterProvider =
    AutoDisposeNotifierProvider<
      DailySalesStatusFilter,
      DailySaleStatus?
    >.internal(
      DailySalesStatusFilter.new,
      name: r'dailySalesStatusFilterProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$dailySalesStatusFilterHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DailySalesStatusFilter = AutoDisposeNotifier<DailySaleStatus?>;
String _$dailySalesListControllerHash() =>
    r'b435ffaa05c3f322ed697ca4e1ae7930aef551ae';

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

abstract class _$DailySalesListController
    extends BuildlessAutoDisposeAsyncNotifier<DailySalesPage> {
  late final int outletId;

  FutureOr<DailySalesPage> build(int outletId);
}

/// Loads today's sales for a given outlet, re-fetching whenever the status
/// filter changes.
///
/// Copied from [DailySalesListController].
@ProviderFor(DailySalesListController)
const dailySalesListControllerProvider = DailySalesListControllerFamily();

/// Loads today's sales for a given outlet, re-fetching whenever the status
/// filter changes.
///
/// Copied from [DailySalesListController].
class DailySalesListControllerFamily
    extends Family<AsyncValue<DailySalesPage>> {
  /// Loads today's sales for a given outlet, re-fetching whenever the status
  /// filter changes.
  ///
  /// Copied from [DailySalesListController].
  const DailySalesListControllerFamily();

  /// Loads today's sales for a given outlet, re-fetching whenever the status
  /// filter changes.
  ///
  /// Copied from [DailySalesListController].
  DailySalesListControllerProvider call(int outletId) {
    return DailySalesListControllerProvider(outletId);
  }

  @override
  DailySalesListControllerProvider getProviderOverride(
    covariant DailySalesListControllerProvider provider,
  ) {
    return call(provider.outletId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dailySalesListControllerProvider';
}

/// Loads today's sales for a given outlet, re-fetching whenever the status
/// filter changes.
///
/// Copied from [DailySalesListController].
class DailySalesListControllerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          DailySalesListController,
          DailySalesPage
        > {
  /// Loads today's sales for a given outlet, re-fetching whenever the status
  /// filter changes.
  ///
  /// Copied from [DailySalesListController].
  DailySalesListControllerProvider(int outletId)
    : this._internal(
        () => DailySalesListController()..outletId = outletId,
        from: dailySalesListControllerProvider,
        name: r'dailySalesListControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$dailySalesListControllerHash,
        dependencies: DailySalesListControllerFamily._dependencies,
        allTransitiveDependencies:
            DailySalesListControllerFamily._allTransitiveDependencies,
        outletId: outletId,
      );

  DailySalesListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.outletId,
  }) : super.internal();

  final int outletId;

  @override
  FutureOr<DailySalesPage> runNotifierBuild(
    covariant DailySalesListController notifier,
  ) {
    return notifier.build(outletId);
  }

  @override
  Override overrideWith(DailySalesListController Function() create) {
    return ProviderOverride(
      origin: this,
      override: DailySalesListControllerProvider._internal(
        () => create()..outletId = outletId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        outletId: outletId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    DailySalesListController,
    DailySalesPage
  >
  createElement() {
    return _DailySalesListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DailySalesListControllerProvider &&
        other.outletId == outletId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, outletId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DailySalesListControllerRef
    on AutoDisposeAsyncNotifierProviderRef<DailySalesPage> {
  /// The parameter `outletId` of this provider.
  int get outletId;
}

class _DailySalesListControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          DailySalesListController,
          DailySalesPage
        >
    with DailySalesListControllerRef {
  _DailySalesListControllerProviderElement(super.provider);

  @override
  int get outletId => (origin as DailySalesListControllerProvider).outletId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
