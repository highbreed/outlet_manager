// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_sales_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the local datasource for daily sales (async - waits for Isar)

@ProviderFor(dailySalesLocalDataSource)
const dailySalesLocalDataSourceProvider = DailySalesLocalDataSourceProvider._();

/// Provides the local datasource for daily sales (async - waits for Isar)

final class DailySalesLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<DailySalesLocalDataSource>,
          DailySalesLocalDataSource,
          FutureOr<DailySalesLocalDataSource>
        >
    with
        $FutureModifier<DailySalesLocalDataSource>,
        $FutureProvider<DailySalesLocalDataSource> {
  /// Provides the local datasource for daily sales (async - waits for Isar)
  const DailySalesLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dailySalesLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dailySalesLocalDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<DailySalesLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DailySalesLocalDataSource> create(Ref ref) {
    return dailySalesLocalDataSource(ref);
  }
}

String _$dailySalesLocalDataSourceHash() =>
    r'fc3f90b5916f72ad1a9d2ecd959d7138e8a08295';

/// Provides the remote datasource for daily sales

@ProviderFor(dailySalesRemoteDataSource)
const dailySalesRemoteDataSourceProvider =
    DailySalesRemoteDataSourceProvider._();

/// Provides the remote datasource for daily sales

final class DailySalesRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          DailySalesRemoteDataSource,
          DailySalesRemoteDataSource,
          DailySalesRemoteDataSource
        >
    with $Provider<DailySalesRemoteDataSource> {
  /// Provides the remote datasource for daily sales
  const DailySalesRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dailySalesRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dailySalesRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<DailySalesRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DailySalesRemoteDataSource create(Ref ref) {
    return dailySalesRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DailySalesRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DailySalesRemoteDataSource>(value),
    );
  }
}

String _$dailySalesRemoteDataSourceHash() =>
    r'6f23a41f6600eedcfa140e6a331736b730ec0336';

/// Provides the daily sales repository implementation

@ProviderFor(dailySalesRepository)
const dailySalesRepositoryProvider = DailySalesRepositoryProvider._();

/// Provides the daily sales repository implementation

final class DailySalesRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<DailySalesRepository>,
          DailySalesRepository,
          FutureOr<DailySalesRepository>
        >
    with
        $FutureModifier<DailySalesRepository>,
        $FutureProvider<DailySalesRepository> {
  /// Provides the daily sales repository implementation
  const DailySalesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dailySalesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dailySalesRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<DailySalesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DailySalesRepository> create(Ref ref) {
    return dailySalesRepository(ref);
  }
}

String _$dailySalesRepositoryHash() =>
    r'890307b5c8e31c60ff0e4d4d80354756db70168a';
