// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clock_in_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the local data source

@ProviderFor(clockInLocalDataSource)
const clockInLocalDataSourceProvider = ClockInLocalDataSourceProvider._();

/// Provider for the local data source

final class ClockInLocalDataSourceProvider
    extends
        $FunctionalProvider<
          ClockInLocalDataSource,
          ClockInLocalDataSource,
          ClockInLocalDataSource
        >
    with $Provider<ClockInLocalDataSource> {
  /// Provider for the local data source
  const ClockInLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clockInLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clockInLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<ClockInLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ClockInLocalDataSource create(Ref ref) {
    return clockInLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClockInLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClockInLocalDataSource>(value),
    );
  }
}

String _$clockInLocalDataSourceHash() =>
    r'34f41c023c00aadedb7be4c659faeef9d8570cb3';

/// Provider for the remote data source

@ProviderFor(clockInRemoteDataSource)
const clockInRemoteDataSourceProvider = ClockInRemoteDataSourceProvider._();

/// Provider for the remote data source

final class ClockInRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ClockInRemoteDataSource,
          ClockInRemoteDataSource,
          ClockInRemoteDataSource
        >
    with $Provider<ClockInRemoteDataSource> {
  /// Provider for the remote data source
  const ClockInRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clockInRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clockInRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ClockInRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ClockInRemoteDataSource create(Ref ref) {
    return clockInRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClockInRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClockInRemoteDataSource>(value),
    );
  }
}

String _$clockInRemoteDataSourceHash() =>
    r'61a6da6acf0b59e3774e101687607c4f801f9add';

/// Provider for the repository (async because it depends on sync service)

@ProviderFor(clockInRepository)
const clockInRepositoryProvider = ClockInRepositoryProvider._();

/// Provider for the repository (async because it depends on sync service)

final class ClockInRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<ClockInRepository>,
          ClockInRepository,
          FutureOr<ClockInRepository>
        >
    with
        $FutureModifier<ClockInRepository>,
        $FutureProvider<ClockInRepository> {
  /// Provider for the repository (async because it depends on sync service)
  const ClockInRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clockInRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clockInRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<ClockInRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ClockInRepository> create(Ref ref) {
    return clockInRepository(ref);
  }
}

String _$clockInRepositoryHash() => r'41bc95ef59465f1b20577e9527fc6b70a7e7fabe';

/// Stream provider for the active session

@ProviderFor(activeSession)
const activeSessionProvider = ActiveSessionProvider._();

/// Stream provider for the active session

final class ActiveSessionProvider
    extends
        $FunctionalProvider<
          AsyncValue<ClockInSession?>,
          ClockInSession?,
          Stream<ClockInSession?>
        >
    with $FutureModifier<ClockInSession?>, $StreamProvider<ClockInSession?> {
  /// Stream provider for the active session
  const ActiveSessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeSessionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeSessionHash();

  @$internal
  @override
  $StreamProviderElement<ClockInSession?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<ClockInSession?> create(Ref ref) {
    return activeSession(ref);
  }
}

String _$activeSessionHash() => r'6f293defb3c6c73caac028859095c14e401a8584';

/// Provider to check if user is currently clocked in

@ProviderFor(isClockIn)
const isClockInProvider = IsClockInProvider._();

/// Provider to check if user is currently clocked in

final class IsClockInProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Provider to check if user is currently clocked in
  const IsClockInProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isClockInProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isClockInHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isClockIn(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isClockInHash() => r'6174969509d1a22d372f7ef3735506aa4f907c8e';

/// Provider for elapsed time since clock-in (updates every second)

@ProviderFor(elapsedTime)
const elapsedTimeProvider = ElapsedTimeProvider._();

/// Provider for elapsed time since clock-in (updates every second)

final class ElapsedTimeProvider
    extends $FunctionalProvider<Duration, Duration, Duration>
    with $Provider<Duration> {
  /// Provider for elapsed time since clock-in (updates every second)
  const ElapsedTimeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'elapsedTimeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$elapsedTimeHash();

  @$internal
  @override
  $ProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Duration create(Ref ref) {
    return elapsedTime(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Duration value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Duration>(value),
    );
  }
}

String _$elapsedTimeHash() => r'daaa59a1552dcd17490520f23db5dd7934daa4e2';

/// Provider for remaining time (allocated - elapsed)

@ProviderFor(remainingTime)
const remainingTimeProvider = RemainingTimeProvider._();

/// Provider for remaining time (allocated - elapsed)

final class RemainingTimeProvider
    extends $FunctionalProvider<Duration, Duration, Duration>
    with $Provider<Duration> {
  /// Provider for remaining time (allocated - elapsed)
  const RemainingTimeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remainingTimeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remainingTimeHash();

  @$internal
  @override
  $ProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Duration create(Ref ref) {
    return remainingTime(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Duration value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Duration>(value),
    );
  }
}

String _$remainingTimeHash() => r'f7404674e537888c654334a4b2c73c6cd5ecb8a9';

/// Provider for time exceeded status

@ProviderFor(isTimeExceeded)
const isTimeExceededProvider = IsTimeExceededProvider._();

/// Provider for time exceeded status

final class IsTimeExceededProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Provider for time exceeded status
  const IsTimeExceededProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isTimeExceededProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isTimeExceededHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isTimeExceeded(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isTimeExceededHash() => r'840f5dc3007fd36313a6d8d4a173fb7da70e3b93';
