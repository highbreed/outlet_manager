// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelf_share_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shelfShareLocalDataSource)
const shelfShareLocalDataSourceProvider = ShelfShareLocalDataSourceProvider._();

final class ShelfShareLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<ShelfShareLocalDataSource>,
          ShelfShareLocalDataSource,
          FutureOr<ShelfShareLocalDataSource>
        >
    with
        $FutureModifier<ShelfShareLocalDataSource>,
        $FutureProvider<ShelfShareLocalDataSource> {
  const ShelfShareLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shelfShareLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shelfShareLocalDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<ShelfShareLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ShelfShareLocalDataSource> create(Ref ref) {
    return shelfShareLocalDataSource(ref);
  }
}

String _$shelfShareLocalDataSourceHash() =>
    r'941a9d2f8cebc41ba0ea3550ae8c61dda9c26d76';

@ProviderFor(shelfShareRemoteDataSource)
const shelfShareRemoteDataSourceProvider =
    ShelfShareRemoteDataSourceProvider._();

final class ShelfShareRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ShelfShareRemoteDataSource,
          ShelfShareRemoteDataSource,
          ShelfShareRemoteDataSource
        >
    with $Provider<ShelfShareRemoteDataSource> {
  const ShelfShareRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shelfShareRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shelfShareRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ShelfShareRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ShelfShareRemoteDataSource create(Ref ref) {
    return shelfShareRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShelfShareRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShelfShareRemoteDataSource>(value),
    );
  }
}

String _$shelfShareRemoteDataSourceHash() =>
    r'8f067238d7f8e2a3a17638be5499fe0b43f2aafd';

@ProviderFor(brandRemoteDataSource)
const brandRemoteDataSourceProvider = BrandRemoteDataSourceProvider._();

final class BrandRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          BrandRemoteDataSource,
          BrandRemoteDataSource,
          BrandRemoteDataSource
        >
    with $Provider<BrandRemoteDataSource> {
  const BrandRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'brandRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$brandRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<BrandRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BrandRemoteDataSource create(Ref ref) {
    return brandRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BrandRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BrandRemoteDataSource>(value),
    );
  }
}

String _$brandRemoteDataSourceHash() =>
    r'3b3e906393f7af9d244aa6f5eac1d24636b1deab';

@ProviderFor(shelfShareRepository)
const shelfShareRepositoryProvider = ShelfShareRepositoryProvider._();

final class ShelfShareRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<ShelfShareRepository>,
          ShelfShareRepository,
          FutureOr<ShelfShareRepository>
        >
    with
        $FutureModifier<ShelfShareRepository>,
        $FutureProvider<ShelfShareRepository> {
  const ShelfShareRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shelfShareRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shelfShareRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<ShelfShareRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ShelfShareRepository> create(Ref ref) {
    return shelfShareRepository(ref);
  }
}

String _$shelfShareRepositoryHash() =>
    r'ebc669637a71f6ba7c59398886c41d078f842c98';
