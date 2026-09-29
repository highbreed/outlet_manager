// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facings_count_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Controller for the horizontal facings count lifecycle

@ProviderFor(FacingsCountController)
const facingsCountControllerProvider = FacingsCountControllerProvider._();

/// Controller for the horizontal facings count lifecycle
final class FacingsCountControllerProvider
    extends $NotifierProvider<FacingsCountController, FacingsCountState> {
  /// Controller for the horizontal facings count lifecycle
  const FacingsCountControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'facingsCountControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$facingsCountControllerHash();

  @$internal
  @override
  FacingsCountController create() => FacingsCountController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FacingsCountState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FacingsCountState>(value),
    );
  }
}

String _$facingsCountControllerHash() =>
    r'2ebe62b698e79d527d1d8968a2473fac96c871a1';

/// Controller for the horizontal facings count lifecycle

abstract class _$FacingsCountController extends $Notifier<FacingsCountState> {
  FacingsCountState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<FacingsCountState, FacingsCountState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FacingsCountState, FacingsCountState>,
              FacingsCountState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
