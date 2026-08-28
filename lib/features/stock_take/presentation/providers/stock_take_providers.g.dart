// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_take_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$stockTakeLocalDataSourceHash() =>
    r'112b8af7a92174df804f16757e6c3c27f38e0489';

/// Provides the local datasource for stock take (async - waits for Isar)
///
/// Copied from [stockTakeLocalDataSource].
@ProviderFor(stockTakeLocalDataSource)
final stockTakeLocalDataSourceProvider =
    AutoDisposeFutureProvider<StockTakeLocalDataSource>.internal(
      stockTakeLocalDataSource,
      name: r'stockTakeLocalDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$stockTakeLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StockTakeLocalDataSourceRef =
    AutoDisposeFutureProviderRef<StockTakeLocalDataSource>;
String _$stockTakeRemoteDataSourceHash() =>
    r'ba802b2e433d44ac0436d650eaff386a61ed2938';

/// Provides the remote datasource for stock take
///
/// Copied from [stockTakeRemoteDataSource].
@ProviderFor(stockTakeRemoteDataSource)
final stockTakeRemoteDataSourceProvider =
    AutoDisposeProvider<StockTakeRemoteDataSource>.internal(
      stockTakeRemoteDataSource,
      name: r'stockTakeRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$stockTakeRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StockTakeRemoteDataSourceRef =
    AutoDisposeProviderRef<StockTakeRemoteDataSource>;
String _$stockTakeRepositoryHash() =>
    r'20da1cd277b1f5008b7563921661582454b58721';

/// Provides the stock take repository implementation (async - waits for local datasource)
///
/// Copied from [stockTakeRepository].
@ProviderFor(stockTakeRepository)
final stockTakeRepositoryProvider =
    AutoDisposeFutureProvider<StockTakeRepository>.internal(
      stockTakeRepository,
      name: r'stockTakeRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$stockTakeRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StockTakeRepositoryRef =
    AutoDisposeFutureProviderRef<StockTakeRepository>;
String _$stockTakeSyncHandlerHash() =>
    r'c17961b00de0b4fca058608170ba354a6793dec8';

/// Provides the stock take sync handler for background operations
///
/// Copied from [stockTakeSyncHandler].
@ProviderFor(stockTakeSyncHandler)
final stockTakeSyncHandlerProvider =
    AutoDisposeFutureProvider<StockTakeSyncHandler>.internal(
      stockTakeSyncHandler,
      name: r'stockTakeSyncHandlerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$stockTakeSyncHandlerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StockTakeSyncHandlerRef =
    AutoDisposeFutureProviderRef<StockTakeSyncHandler>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
