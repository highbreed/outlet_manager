// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_sales_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Currently selected status filter tab on the daily sales home screen.
/// `null` means "all statuses".

@ProviderFor(DailySalesStatusFilter)
const dailySalesStatusFilterProvider = DailySalesStatusFilterProvider._();

/// Currently selected status filter tab on the daily sales home screen.
/// `null` means "all statuses".
final class DailySalesStatusFilterProvider
    extends $NotifierProvider<DailySalesStatusFilter, DailySaleStatus?> {
  /// Currently selected status filter tab on the daily sales home screen.
  /// `null` means "all statuses".
  const DailySalesStatusFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dailySalesStatusFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dailySalesStatusFilterHash();

  @$internal
  @override
  DailySalesStatusFilter create() => DailySalesStatusFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DailySaleStatus? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DailySaleStatus?>(value),
    );
  }
}

String _$dailySalesStatusFilterHash() =>
    r'a95533173445f65d1242c057371532639cc3a12b';

/// Currently selected status filter tab on the daily sales home screen.
/// `null` means "all statuses".

abstract class _$DailySalesStatusFilter extends $Notifier<DailySaleStatus?> {
  DailySaleStatus? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DailySaleStatus?, DailySaleStatus?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DailySaleStatus?, DailySaleStatus?>,
              DailySaleStatus?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Loads today's sales for a given outlet, re-fetching whenever the status
/// filter changes.

@ProviderFor(DailySalesListController)
const dailySalesListControllerProvider = DailySalesListControllerFamily._();

/// Loads today's sales for a given outlet, re-fetching whenever the status
/// filter changes.
final class DailySalesListControllerProvider
    extends $AsyncNotifierProvider<DailySalesListController, DailySalesPage> {
  /// Loads today's sales for a given outlet, re-fetching whenever the status
  /// filter changes.
  const DailySalesListControllerProvider._({
    required DailySalesListControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'dailySalesListControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$dailySalesListControllerHash();

  @override
  String toString() {
    return r'dailySalesListControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DailySalesListController create() => DailySalesListController();

  @override
  bool operator ==(Object other) {
    return other is DailySalesListControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dailySalesListControllerHash() =>
    r'b435ffaa05c3f322ed697ca4e1ae7930aef551ae';

/// Loads today's sales for a given outlet, re-fetching whenever the status
/// filter changes.

final class DailySalesListControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          DailySalesListController,
          AsyncValue<DailySalesPage>,
          DailySalesPage,
          FutureOr<DailySalesPage>,
          int
        > {
  const DailySalesListControllerFamily._()
    : super(
        retry: null,
        name: r'dailySalesListControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Loads today's sales for a given outlet, re-fetching whenever the status
  /// filter changes.

  DailySalesListControllerProvider call(int outletId) =>
      DailySalesListControllerProvider._(argument: outletId, from: this);

  @override
  String toString() => r'dailySalesListControllerProvider';
}

/// Loads today's sales for a given outlet, re-fetching whenever the status
/// filter changes.

abstract class _$DailySalesListController
    extends $AsyncNotifier<DailySalesPage> {
  late final _$args = ref.$arg as int;
  int get outletId => _$args;

  FutureOr<DailySalesPage> build(int outletId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<DailySalesPage>, DailySalesPage>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DailySalesPage>, DailySalesPage>,
              AsyncValue<DailySalesPage>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
