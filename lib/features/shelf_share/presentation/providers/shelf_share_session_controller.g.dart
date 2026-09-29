// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelf_share_session_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Controller for shelf share session lifecycle

@ProviderFor(ShelfShareSessionController)
const shelfShareSessionControllerProvider =
    ShelfShareSessionControllerProvider._();

/// Controller for shelf share session lifecycle
final class ShelfShareSessionControllerProvider
    extends
        $NotifierProvider<ShelfShareSessionController, ShelfShareSessionState> {
  /// Controller for shelf share session lifecycle
  const ShelfShareSessionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shelfShareSessionControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shelfShareSessionControllerHash();

  @$internal
  @override
  ShelfShareSessionController create() => ShelfShareSessionController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShelfShareSessionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShelfShareSessionState>(value),
    );
  }
}

String _$shelfShareSessionControllerHash() =>
    r'cece26ee7d2b6384a2f31123bae5f138a4649477';

/// Controller for shelf share session lifecycle

abstract class _$ShelfShareSessionController
    extends $Notifier<ShelfShareSessionState> {
  ShelfShareSessionState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<ShelfShareSessionState, ShelfShareSessionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ShelfShareSessionState, ShelfShareSessionState>,
              ShelfShareSessionState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
