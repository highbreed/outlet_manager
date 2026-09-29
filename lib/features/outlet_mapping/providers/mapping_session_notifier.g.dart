// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapping_session_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
///
/// Copied from [MappingSessionNotifier].
@ProviderFor(MappingSessionNotifier)
final mappingSessionNotifierProvider =
    NotifierProvider<MappingSessionNotifier, MappingSessionUiState>.internal(
      MappingSessionNotifier.new,
      name: r'mappingSessionNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$mappingSessionNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MappingSessionNotifier = Notifier<MappingSessionUiState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
