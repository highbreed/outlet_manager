// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clock_in_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clockInLocalDataSourceHash() =>
    r'34f41c023c00aadedb7be4c659faeef9d8570cb3';

/// Provider for the local data source
///
/// Copied from [clockInLocalDataSource].
@ProviderFor(clockInLocalDataSource)
final clockInLocalDataSourceProvider =
    AutoDisposeProvider<ClockInLocalDataSource>.internal(
      clockInLocalDataSource,
      name: r'clockInLocalDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$clockInLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ClockInLocalDataSourceRef =
    AutoDisposeProviderRef<ClockInLocalDataSource>;
String _$clockInRemoteDataSourceHash() =>
    r'61a6da6acf0b59e3774e101687607c4f801f9add';

/// Provider for the remote data source
///
/// Copied from [clockInRemoteDataSource].
@ProviderFor(clockInRemoteDataSource)
final clockInRemoteDataSourceProvider =
    AutoDisposeProvider<ClockInRemoteDataSource>.internal(
      clockInRemoteDataSource,
      name: r'clockInRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$clockInRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ClockInRemoteDataSourceRef =
    AutoDisposeProviderRef<ClockInRemoteDataSource>;
String _$clockInRepositoryHash() => r'41bc95ef59465f1b20577e9527fc6b70a7e7fabe';

/// Provider for the repository (async because it depends on sync service)
///
/// Copied from [clockInRepository].
@ProviderFor(clockInRepository)
final clockInRepositoryProvider =
    AutoDisposeFutureProvider<ClockInRepository>.internal(
      clockInRepository,
      name: r'clockInRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$clockInRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ClockInRepositoryRef = AutoDisposeFutureProviderRef<ClockInRepository>;
String _$activeSessionHash() => r'6f293defb3c6c73caac028859095c14e401a8584';

/// Stream provider for the active session
///
/// Copied from [activeSession].
@ProviderFor(activeSession)
final activeSessionProvider =
    AutoDisposeStreamProvider<ClockInSession?>.internal(
      activeSession,
      name: r'activeSessionProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$activeSessionHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActiveSessionRef = AutoDisposeStreamProviderRef<ClockInSession?>;
String _$isClockInHash() => r'6174969509d1a22d372f7ef3735506aa4f907c8e';

/// Provider to check if user is currently clocked in
///
/// Copied from [isClockIn].
@ProviderFor(isClockIn)
final isClockInProvider = AutoDisposeProvider<bool>.internal(
  isClockIn,
  name: r'isClockInProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isClockInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsClockInRef = AutoDisposeProviderRef<bool>;
String _$elapsedTimeHash() => r'daaa59a1552dcd17490520f23db5dd7934daa4e2';

/// Provider for elapsed time since clock-in (updates every second)
///
/// Copied from [elapsedTime].
@ProviderFor(elapsedTime)
final elapsedTimeProvider = AutoDisposeProvider<Duration>.internal(
  elapsedTime,
  name: r'elapsedTimeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$elapsedTimeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ElapsedTimeRef = AutoDisposeProviderRef<Duration>;
String _$remainingTimeHash() => r'f7404674e537888c654334a4b2c73c6cd5ecb8a9';

/// Provider for remaining time (allocated - elapsed)
///
/// Copied from [remainingTime].
@ProviderFor(remainingTime)
final remainingTimeProvider = AutoDisposeProvider<Duration>.internal(
  remainingTime,
  name: r'remainingTimeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$remainingTimeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RemainingTimeRef = AutoDisposeProviderRef<Duration>;
String _$isTimeExceededHash() => r'840f5dc3007fd36313a6d8d4a173fb7da70e3b93';

/// Provider for time exceeded status
///
/// Copied from [isTimeExceeded].
@ProviderFor(isTimeExceeded)
final isTimeExceededProvider = AutoDisposeProvider<bool>.internal(
  isTimeExceeded,
  name: r'isTimeExceededProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isTimeExceededHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsTimeExceededRef = AutoDisposeProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
