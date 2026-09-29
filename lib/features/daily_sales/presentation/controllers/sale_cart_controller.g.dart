// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_cart_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Controller for building and submitting the register-sale cart.
///
/// Product resolution (barcode scan + search) reuses the stock_take
/// feature's outlet product catalogue (`GET /product-catalogue`, via
/// `stockTakeRepositoryProvider.getCustomerProducts`) rather than a second
/// product data path - outlet-scoped by numeric customer id, not cached,
/// and independent of any stock take session.

@ProviderFor(SaleCartController)
const saleCartControllerProvider = SaleCartControllerProvider._();

/// Controller for building and submitting the register-sale cart.
///
/// Product resolution (barcode scan + search) reuses the stock_take
/// feature's outlet product catalogue (`GET /product-catalogue`, via
/// `stockTakeRepositoryProvider.getCustomerProducts`) rather than a second
/// product data path - outlet-scoped by numeric customer id, not cached,
/// and independent of any stock take session.
final class SaleCartControllerProvider
    extends $NotifierProvider<SaleCartController, SaleCartState> {
  /// Controller for building and submitting the register-sale cart.
  ///
  /// Product resolution (barcode scan + search) reuses the stock_take
  /// feature's outlet product catalogue (`GET /product-catalogue`, via
  /// `stockTakeRepositoryProvider.getCustomerProducts`) rather than a second
  /// product data path - outlet-scoped by numeric customer id, not cached,
  /// and independent of any stock take session.
  const SaleCartControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saleCartControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saleCartControllerHash();

  @$internal
  @override
  SaleCartController create() => SaleCartController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaleCartState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaleCartState>(value),
    );
  }
}

String _$saleCartControllerHash() =>
    r'6d12f8464cdc0449133af77c2adb20753a6c30dd';

/// Controller for building and submitting the register-sale cart.
///
/// Product resolution (barcode scan + search) reuses the stock_take
/// feature's outlet product catalogue (`GET /product-catalogue`, via
/// `stockTakeRepositoryProvider.getCustomerProducts`) rather than a second
/// product data path - outlet-scoped by numeric customer id, not cached,
/// and independent of any stock take session.

abstract class _$SaleCartController extends $Notifier<SaleCartState> {
  SaleCartState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SaleCartState, SaleCartState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SaleCartState, SaleCartState>,
              SaleCartState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
