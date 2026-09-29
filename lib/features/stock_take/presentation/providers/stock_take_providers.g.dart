// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_take_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the local datasource for stock take (async - waits for Isar)

@ProviderFor(stockTakeLocalDataSource)
const stockTakeLocalDataSourceProvider = StockTakeLocalDataSourceProvider._();

/// Provides the local datasource for stock take (async - waits for Isar)

final class StockTakeLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<StockTakeLocalDataSource>,
          StockTakeLocalDataSource,
          FutureOr<StockTakeLocalDataSource>
        >
    with
        $FutureModifier<StockTakeLocalDataSource>,
        $FutureProvider<StockTakeLocalDataSource> {
  /// Provides the local datasource for stock take (async - waits for Isar)
  const StockTakeLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stockTakeLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stockTakeLocalDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<StockTakeLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<StockTakeLocalDataSource> create(Ref ref) {
    return stockTakeLocalDataSource(ref);
  }
}

String _$stockTakeLocalDataSourceHash() =>
    r'112b8af7a92174df804f16757e6c3c27f38e0489';

/// Provides the remote datasource for stock take

@ProviderFor(stockTakeRemoteDataSource)
const stockTakeRemoteDataSourceProvider = StockTakeRemoteDataSourceProvider._();

/// Provides the remote datasource for stock take

final class StockTakeRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          StockTakeRemoteDataSource,
          StockTakeRemoteDataSource,
          StockTakeRemoteDataSource
        >
    with $Provider<StockTakeRemoteDataSource> {
  /// Provides the remote datasource for stock take
  const StockTakeRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stockTakeRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stockTakeRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<StockTakeRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StockTakeRemoteDataSource create(Ref ref) {
    return stockTakeRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StockTakeRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StockTakeRemoteDataSource>(value),
    );
  }
}

String _$stockTakeRemoteDataSourceHash() =>
    r'ba802b2e433d44ac0436d650eaff386a61ed2938';

/// Provides the stock take repository implementation (async - waits for local datasource)

@ProviderFor(stockTakeRepository)
const stockTakeRepositoryProvider = StockTakeRepositoryProvider._();

/// Provides the stock take repository implementation (async - waits for local datasource)

final class StockTakeRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<StockTakeRepository>,
          StockTakeRepository,
          FutureOr<StockTakeRepository>
        >
    with
        $FutureModifier<StockTakeRepository>,
        $FutureProvider<StockTakeRepository> {
  /// Provides the stock take repository implementation (async - waits for local datasource)
  const StockTakeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stockTakeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stockTakeRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<StockTakeRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<StockTakeRepository> create(Ref ref) {
    return stockTakeRepository(ref);
  }
}

String _$stockTakeRepositoryHash() =>
    r'20da1cd277b1f5008b7563921661582454b58721';

/// Provides the stock take sync handler for background operations

@ProviderFor(stockTakeSyncHandler)
const stockTakeSyncHandlerProvider = StockTakeSyncHandlerProvider._();

/// Provides the stock take sync handler for background operations

final class StockTakeSyncHandlerProvider
    extends
        $FunctionalProvider<
          AsyncValue<StockTakeSyncHandler>,
          StockTakeSyncHandler,
          FutureOr<StockTakeSyncHandler>
        >
    with
        $FutureModifier<StockTakeSyncHandler>,
        $FutureProvider<StockTakeSyncHandler> {
  /// Provides the stock take sync handler for background operations
  const StockTakeSyncHandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stockTakeSyncHandlerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stockTakeSyncHandlerHash();

  @$internal
  @override
  $FutureProviderElement<StockTakeSyncHandler> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<StockTakeSyncHandler> create(Ref ref) {
    return stockTakeSyncHandler(ref);
  }
}

String _$stockTakeSyncHandlerHash() =>
    r'c17961b00de0b4fca058608170ba354a6793dec8';
