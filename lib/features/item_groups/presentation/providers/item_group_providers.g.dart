// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_group_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(itemGroupLocalDataSource)
const itemGroupLocalDataSourceProvider = ItemGroupLocalDataSourceProvider._();

final class ItemGroupLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<ItemGroupLocalDataSource>,
          ItemGroupLocalDataSource,
          FutureOr<ItemGroupLocalDataSource>
        >
    with
        $FutureModifier<ItemGroupLocalDataSource>,
        $FutureProvider<ItemGroupLocalDataSource> {
  const ItemGroupLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemGroupLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemGroupLocalDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<ItemGroupLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ItemGroupLocalDataSource> create(Ref ref) {
    return itemGroupLocalDataSource(ref);
  }
}

String _$itemGroupLocalDataSourceHash() =>
    r'1016f47951a5c8291a60b6533fea904842a3adec';

@ProviderFor(itemGroupRemoteDataSource)
const itemGroupRemoteDataSourceProvider = ItemGroupRemoteDataSourceProvider._();

final class ItemGroupRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ItemGroupRemoteDataSource,
          ItemGroupRemoteDataSource,
          ItemGroupRemoteDataSource
        >
    with $Provider<ItemGroupRemoteDataSource> {
  const ItemGroupRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemGroupRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemGroupRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ItemGroupRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ItemGroupRemoteDataSource create(Ref ref) {
    return itemGroupRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ItemGroupRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ItemGroupRemoteDataSource>(value),
    );
  }
}

String _$itemGroupRemoteDataSourceHash() =>
    r'1e3b60ccfdad389c6ffabe22369035b36a2b419a';

@ProviderFor(itemGroupRepository)
const itemGroupRepositoryProvider = ItemGroupRepositoryProvider._();

final class ItemGroupRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<ItemGroupRepository>,
          ItemGroupRepository,
          FutureOr<ItemGroupRepository>
        >
    with
        $FutureModifier<ItemGroupRepository>,
        $FutureProvider<ItemGroupRepository> {
  const ItemGroupRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemGroupRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemGroupRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<ItemGroupRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ItemGroupRepository> create(Ref ref) {
    return itemGroupRepository(ref);
  }
}

String _$itemGroupRepositoryHash() =>
    r'80c49555ed277d79d5cc30f4183e74012c680597';
