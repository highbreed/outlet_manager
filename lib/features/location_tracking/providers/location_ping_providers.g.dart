// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_ping_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(locationPingRemoteDataSource)
const locationPingRemoteDataSourceProvider =
    LocationPingRemoteDataSourceProvider._();

final class LocationPingRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          LocationPingRemoteDataSource,
          LocationPingRemoteDataSource,
          LocationPingRemoteDataSource
        >
    with $Provider<LocationPingRemoteDataSource> {
  const LocationPingRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationPingRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationPingRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<LocationPingRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocationPingRemoteDataSource create(Ref ref) {
    return locationPingRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationPingRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationPingRemoteDataSource>(value),
    );
  }
}

String _$locationPingRemoteDataSourceHash() =>
    r'96c4c900194b121d38ce7b7fe849c6c742604e91';

@ProviderFor(locationPingLocalDataSource)
const locationPingLocalDataSourceProvider =
    LocationPingLocalDataSourceProvider._();

final class LocationPingLocalDataSourceProvider
    extends
        $FunctionalProvider<
          LocationPingLocalDataSource,
          LocationPingLocalDataSource,
          LocationPingLocalDataSource
        >
    with $Provider<LocationPingLocalDataSource> {
  const LocationPingLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationPingLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationPingLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<LocationPingLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocationPingLocalDataSource create(Ref ref) {
    return locationPingLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationPingLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationPingLocalDataSource>(value),
    );
  }
}

String _$locationPingLocalDataSourceHash() =>
    r'5bfc51844b8619d8204d9ba3a9669fb83fce2904';

@ProviderFor(locationPingRepository)
const locationPingRepositoryProvider = LocationPingRepositoryProvider._();

final class LocationPingRepositoryProvider
    extends
        $FunctionalProvider<
          LocationPingRepository,
          LocationPingRepository,
          LocationPingRepository
        >
    with $Provider<LocationPingRepository> {
  const LocationPingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationPingRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationPingRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocationPingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocationPingRepository create(Ref ref) {
    return locationPingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationPingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationPingRepository>(value),
    );
  }
}

String _$locationPingRepositoryHash() =>
    r'eda46f393013e5a037be83fa6bcbda35f73e7259';
