// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_cart_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saleCartControllerHash() =>
    r'50e4e284da47ab5db6f951357074aad5d6b6bd22';

/// Controller for building and submitting the register-sale cart.
///
/// Product resolution (barcode scan + search) uses the products feature's
/// catalogue browser (`GET /products`, via `productsRemoteDataSourceProvider`)
/// rather than a second product data path - always live, never cached, and
/// independent of any stock take session.
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
