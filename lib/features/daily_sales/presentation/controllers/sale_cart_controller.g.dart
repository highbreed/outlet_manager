// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_cart_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saleCartControllerHash() =>
    r'6dbe5cbf346979e0360c90fe89bfc2688db14a22';

/// Controller for building and submitting the register-sale cart.
///
/// Product resolution (barcode scan + search) reuses the stock_take
/// feature's outlet product catalogue (`stockTakeRepositoryProvider`) —
/// this app already caches that catalogue offline per outlet, so there's
/// no need for a second product data path here.
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
