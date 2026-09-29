// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapping_session_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The single long-lived orchestrator for outlet mapping (spec §42).
///
/// `keepAlive: true` is deliberate, matching the exact lesson this
/// codebase already learned the hard way from the biometric feature's
/// notifiers (see their own doc comments): a capture session that must
/// survive navigation, backgrounding, and brief zero-listener gaps cannot
/// use Riverpod's `autoDispose` default. Unlike the biometric notifiers,
/// though, **this one is NOT invalidated by any screen's `dispose()`**
/// (spec §18 — screen ≠ session, a deliberate departure from the
/// biometric feature's own cleanup pattern). It is only ever invalidated
/// by [_maybeCleanupAfterTerminal] once local state is genuinely terminal
/// AND every sample for that footprint has synced (or was intentionally
/// discarded).
///
/// Owns: the active [MappingSession], starting/resuming/finishing/
/// aborting it, the upload queue's opportunistic drain, and GPS
/// mapping-mode on/off — via [MappingRecoveryCoordinator]/[MappingUploader]/
/// [BackgroundGeolocationService], never directly reimplementing any of
/// their jobs. The UI only ever reads [state] and calls the public methods
/// below (spec §19/§80 — widgets dispatch intents, they don't orchestrate
/// repositories themselves).

@ProviderFor(MappingSessionNotifier)
const mappingSessionNotifierProvider = MappingSessionNotifierProvider._();

/// The single long-lived orchestrator for outlet mapping (spec §42).
///
/// `keepAlive: true` is deliberate, matching the exact lesson this
/// codebase already learned the hard way from the biometric feature's
/// notifiers (see their own doc comments): a capture session that must
/// survive navigation, backgrounding, and brief zero-listener gaps cannot
/// use Riverpod's `autoDispose` default. Unlike the biometric notifiers,
/// though, **this one is NOT invalidated by any screen's `dispose()`**
/// (spec §18 — screen ≠ session, a deliberate departure from the
/// biometric feature's own cleanup pattern). It is only ever invalidated
/// by [_maybeCleanupAfterTerminal] once local state is genuinely terminal
/// AND every sample for that footprint has synced (or was intentionally
/// discarded).
///
/// Owns: the active [MappingSession], starting/resuming/finishing/
/// aborting it, the upload queue's opportunistic drain, and GPS
/// mapping-mode on/off — via [MappingRecoveryCoordinator]/[MappingUploader]/
/// [BackgroundGeolocationService], never directly reimplementing any of
/// their jobs. The UI only ever reads [state] and calls the public methods
/// below (spec §19/§80 — widgets dispatch intents, they don't orchestrate
/// repositories themselves).
final class MappingSessionNotifierProvider
    extends $NotifierProvider<MappingSessionNotifier, MappingSessionUiState> {
  /// The single long-lived orchestrator for outlet mapping (spec §42).
  ///
  /// `keepAlive: true` is deliberate, matching the exact lesson this
  /// codebase already learned the hard way from the biometric feature's
  /// notifiers (see their own doc comments): a capture session that must
  /// survive navigation, backgrounding, and brief zero-listener gaps cannot
  /// use Riverpod's `autoDispose` default. Unlike the biometric notifiers,
  /// though, **this one is NOT invalidated by any screen's `dispose()`**
  /// (spec §18 — screen ≠ session, a deliberate departure from the
  /// biometric feature's own cleanup pattern). It is only ever invalidated
  /// by [_maybeCleanupAfterTerminal] once local state is genuinely terminal
  /// AND every sample for that footprint has synced (or was intentionally
  /// discarded).
  ///
  /// Owns: the active [MappingSession], starting/resuming/finishing/
  /// aborting it, the upload queue's opportunistic drain, and GPS
  /// mapping-mode on/off — via [MappingRecoveryCoordinator]/[MappingUploader]/
  /// [BackgroundGeolocationService], never directly reimplementing any of
  /// their jobs. The UI only ever reads [state] and calls the public methods
  /// below (spec §19/§80 — widgets dispatch intents, they don't orchestrate
  /// repositories themselves).
  const MappingSessionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mappingSessionNotifierProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mappingSessionNotifierHash();

  @$internal
  @override
  MappingSessionNotifier create() => MappingSessionNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MappingSessionUiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MappingSessionUiState>(value),
    );
  }
}

String _$mappingSessionNotifierHash() =>
    r'd50d201d428aff95297b5c76d6757f2145f55be3';

/// The single long-lived orchestrator for outlet mapping (spec §42).
///
/// `keepAlive: true` is deliberate, matching the exact lesson this
/// codebase already learned the hard way from the biometric feature's
/// notifiers (see their own doc comments): a capture session that must
/// survive navigation, backgrounding, and brief zero-listener gaps cannot
/// use Riverpod's `autoDispose` default. Unlike the biometric notifiers,
/// though, **this one is NOT invalidated by any screen's `dispose()`**
/// (spec §18 — screen ≠ session, a deliberate departure from the
/// biometric feature's own cleanup pattern). It is only ever invalidated
/// by [_maybeCleanupAfterTerminal] once local state is genuinely terminal
/// AND every sample for that footprint has synced (or was intentionally
/// discarded).
///
/// Owns: the active [MappingSession], starting/resuming/finishing/
/// aborting it, the upload queue's opportunistic drain, and GPS
/// mapping-mode on/off — via [MappingRecoveryCoordinator]/[MappingUploader]/
/// [BackgroundGeolocationService], never directly reimplementing any of
/// their jobs. The UI only ever reads [state] and calls the public methods
/// below (spec §19/§80 — widgets dispatch intents, they don't orchestrate
/// repositories themselves).

abstract class _$MappingSessionNotifier
    extends $Notifier<MappingSessionUiState> {
  MappingSessionUiState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MappingSessionUiState, MappingSessionUiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MappingSessionUiState, MappingSessionUiState>,
              MappingSessionUiState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
