// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_sales_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dailySalesLocalDataSourceHash() =>
    r'fc3f90b5916f72ad1a9d2ecd959d7138e8a08295';

/// Provides the local datasource for daily sales (async - waits for Isar)
///
/// Copied from [dailySalesLocalDataSource].
@ProviderFor(dailySalesLocalDataSource)
final dailySalesLocalDataSourceProvider =
    AutoDisposeFutureProvider<DailySalesLocalDataSource>.internal(
      dailySalesLocalDataSource,
      name: r'dailySalesLocalDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$dailySalesLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DailySalesLocalDataSourceRef =
    AutoDisposeFutureProviderRef<DailySalesLocalDataSource>;
String _$dailySalesRemoteDataSourceHash() =>
    r'6f23a41f6600eedcfa140e6a331736b730ec0336';

/// Provides the remote datasource for daily sales
///
/// Copied from [dailySalesRemoteDataSource].
@ProviderFor(dailySalesRemoteDataSource)
final dailySalesRemoteDataSourceProvider =
    AutoDisposeProvider<DailySalesRemoteDataSource>.internal(
      dailySalesRemoteDataSource,
      name: r'dailySalesRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$dailySalesRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DailySalesRemoteDataSourceRef =
    AutoDisposeProviderRef<DailySalesRemoteDataSource>;
String _$dailySalesRepositoryHash() =>
    r'890307b5c8e31c60ff0e4d4d80354756db70168a';

/// Provides the daily sales repository implementation
///
/// Copied from [dailySalesRepository].
@ProviderFor(dailySalesRepository)
final dailySalesRepositoryProvider =
    AutoDisposeFutureProvider<DailySalesRepository>.internal(
      dailySalesRepository,
      name: r'dailySalesRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$dailySalesRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DailySalesRepositoryRef =
    AutoDisposeFutureProviderRef<DailySalesRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
