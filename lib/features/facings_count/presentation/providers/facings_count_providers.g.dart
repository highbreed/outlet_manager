// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facings_count_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(facingsCountLocalDataSource)
const facingsCountLocalDataSourceProvider =
    FacingsCountLocalDataSourceProvider._();

final class FacingsCountLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<FacingsCountLocalDataSource>,
          FacingsCountLocalDataSource,
          FutureOr<FacingsCountLocalDataSource>
        >
    with
        $FutureModifier<FacingsCountLocalDataSource>,
        $FutureProvider<FacingsCountLocalDataSource> {
  const FacingsCountLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'facingsCountLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$facingsCountLocalDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<FacingsCountLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FacingsCountLocalDataSource> create(Ref ref) {
    return facingsCountLocalDataSource(ref);
  }
}

String _$facingsCountLocalDataSourceHash() =>
    r'f6a26e81c8485ce770e825f91c3874ec7c61827f';

@ProviderFor(facingsCountRemoteDataSource)
const facingsCountRemoteDataSourceProvider =
    FacingsCountRemoteDataSourceProvider._();

final class FacingsCountRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          FacingsCountRemoteDataSource,
          FacingsCountRemoteDataSource,
          FacingsCountRemoteDataSource
        >
    with $Provider<FacingsCountRemoteDataSource> {
  const FacingsCountRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'facingsCountRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$facingsCountRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<FacingsCountRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FacingsCountRemoteDataSource create(Ref ref) {
    return facingsCountRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FacingsCountRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FacingsCountRemoteDataSource>(value),
    );
  }
}

String _$facingsCountRemoteDataSourceHash() =>
    r'47978a4f2898667b4649de66ac317e22b3c0d34e';

@ProviderFor(facingsCountRepository)
const facingsCountRepositoryProvider = FacingsCountRepositoryProvider._();

final class FacingsCountRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<FacingsCountRepository>,
          FacingsCountRepository,
          FutureOr<FacingsCountRepository>
        >
    with
        $FutureModifier<FacingsCountRepository>,
        $FutureProvider<FacingsCountRepository> {
  const FacingsCountRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'facingsCountRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$facingsCountRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<FacingsCountRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FacingsCountRepository> create(Ref ref) {
    return facingsCountRepository(ref);
  }
}

String _$facingsCountRepositoryHash() =>
    r'07ebc90b62b68e1514cae58a1e9ef79144de87e1';
