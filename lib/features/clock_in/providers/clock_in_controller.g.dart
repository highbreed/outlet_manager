// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clock_in_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Controller for clock-in/out operations

@ProviderFor(ClockInController)
const clockInControllerProvider = ClockInControllerProvider._();

/// Controller for clock-in/out operations
final class ClockInControllerProvider
    extends $NotifierProvider<ClockInController, ClockInState> {
  /// Controller for clock-in/out operations
  const ClockInControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clockInControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clockInControllerHash();

  @$internal
  @override
  ClockInController create() => ClockInController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClockInState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClockInState>(value),
    );
  }
}

String _$clockInControllerHash() => r'7487382aac36843c1355031b5301173f603537f3';

/// Controller for clock-in/out operations

abstract class _$ClockInController extends $Notifier<ClockInState> {
  ClockInState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ClockInState, ClockInState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ClockInState, ClockInState>,
              ClockInState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
