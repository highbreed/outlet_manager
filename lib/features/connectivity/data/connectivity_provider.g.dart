// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Connectivity controller monitors network state changes

@ProviderFor(ConnectivityController)
const connectivityControllerProvider = ConnectivityControllerProvider._();

/// Connectivity controller monitors network state changes
final class ConnectivityControllerProvider
    extends $NotifierProvider<ConnectivityController, ConnectivityState> {
  /// Connectivity controller monitors network state changes
  const ConnectivityControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityControllerHash();

  @$internal
  @override
  ConnectivityController create() => ConnectivityController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConnectivityState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConnectivityState>(value),
    );
  }
}

String _$connectivityControllerHash() =>
    r'7dbe26540f0134357122da1827c7ea23ca350981';

/// Connectivity controller monitors network state changes

abstract class _$ConnectivityController extends $Notifier<ConnectivityState> {
  ConnectivityState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ConnectivityState, ConnectivityState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ConnectivityState, ConnectivityState>,
              ConnectivityState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Simple boolean provider for checking if online
/// Used by interceptors and UI components

@ProviderFor(isOnline)
const isOnlineProvider = IsOnlineProvider._();

/// Simple boolean provider for checking if online
/// Used by interceptors and UI components

final class IsOnlineProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Simple boolean provider for checking if online
  /// Used by interceptors and UI components
  const IsOnlineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isOnlineProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isOnlineHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isOnline(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isOnlineHash() => r'a0d5142403df05d418cd2a8543ea188796b77ccf';

/// Provider that emits only when going offline
/// Useful for showing snackbars/banners

@ProviderFor(offlineEvents)
const offlineEventsProvider = OfflineEventsProvider._();

/// Provider that emits only when going offline
/// Useful for showing snackbars/banners

final class OfflineEventsProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  /// Provider that emits only when going offline
  /// Useful for showing snackbars/banners
  const OfflineEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'offlineEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$offlineEventsHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return offlineEvents(ref);
  }
}

String _$offlineEventsHash() => r'33d4d47fb0ae5705617cab21d19950b0ebda3a74';

/// Provider that emits when connectivity is restored (offline -> online)
/// Used to trigger background sync operations

@ProviderFor(onlineRestoredEvents)
const onlineRestoredEventsProvider = OnlineRestoredEventsProvider._();

/// Provider that emits when connectivity is restored (offline -> online)
/// Used to trigger background sync operations

final class OnlineRestoredEventsProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  /// Provider that emits when connectivity is restored (offline -> online)
  /// Used to trigger background sync operations
  const OnlineRestoredEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onlineRestoredEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onlineRestoredEventsHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return onlineRestoredEvents(ref);
  }
}

String _$onlineRestoredEventsHash() =>
    r'35d7f6c548117efc9b61f299d7bc805c5d99d902';
