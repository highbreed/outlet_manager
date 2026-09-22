// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_cart_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saleCartControllerHash() =>
    r'6d12f8464cdc0449133af77c2adb20753a6c30dd';

/// Controller for building and submitting the register-sale cart.
///
/// Product resolution (barcode scan + search) reuses the stock_take
/// feature's outlet product catalogue (`GET /product-catalogue`, via
/// `stockTakeRepositoryProvider.getCustomerProducts`) rather than a second
/// product data path - outlet-scoped by numeric customer id, not cached,
/// and independent of any stock take session.
///
/// Copied from [SaleCartController].
@ProviderFor(SaleCartController)
final saleCartControllerProvider =
    AutoDisposeNotifierProvider<SaleCartController, SaleCartState>.internal(
      SaleCartController.new,
      name: r'saleCartControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$saleCartControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SaleCartController = AutoDisposeNotifier<SaleCartState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
