// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Auth controller manages authentication state machine
///
/// State transitions:
/// - initial → authenticating → authenticated OR unauthenticated
/// - authenticated → loggingOut → unauthenticated
/// - any state → error (recoverable)

@ProviderFor(AuthController)
const authControllerProvider = AuthControllerProvider._();

/// Auth controller manages authentication state machine
///
/// State transitions:
/// - initial → authenticating → authenticated OR unauthenticated
/// - authenticated → loggingOut → unauthenticated
/// - any state → error (recoverable)
final class AuthControllerProvider
    extends $NotifierProvider<AuthController, AuthState> {
  /// Auth controller manages authentication state machine
  ///
  /// State transitions:
  /// - initial → authenticating → authenticated OR unauthenticated
  /// - authenticated → loggingOut → unauthenticated
  /// - any state → error (recoverable)
  const AuthControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authControllerHash();

  @$internal
  @override
  AuthController create() => AuthController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthState>(value),
    );
  }
}

String _$authControllerHash() => r'7ce27535fb4894da7a91dc0052355d8738277cfa';

/// Auth controller manages authentication state machine
///
/// State transitions:
/// - initial → authenticating → authenticated OR unauthenticated
/// - authenticated → loggingOut → unauthenticated
/// - any state → error (recoverable)

abstract class _$AuthController extends $Notifier<AuthState> {
  AuthState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AuthState, AuthState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthState, AuthState>,
              AuthState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Provider for checking if user is authenticated (convenience)

@ProviderFor(isAuthenticated)
const isAuthenticatedProvider = IsAuthenticatedProvider._();

/// Provider for checking if user is authenticated (convenience)

final class IsAuthenticatedProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Provider for checking if user is authenticated (convenience)
  const IsAuthenticatedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isAuthenticatedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isAuthenticatedHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isAuthenticated(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isAuthenticatedHash() => r'481486ec98fb7a73e4e1f8e26b73407a5a144a9a';

/// Provider for current user (null if not authenticated)

@ProviderFor(currentUser)
const currentUserProvider = CurrentUserProvider._();

/// Provider for current user (null if not authenticated)

final class CurrentUserProvider extends $FunctionalProvider<User?, User?, User?>
    with $Provider<User?> {
  /// Provider for current user (null if not authenticated)
  const CurrentUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserHash();

  @$internal
  @override
  $ProviderElement<User?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  User? create(Ref ref) {
    return currentUser(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(User? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<User?>(value),
    );
  }
}

String _$currentUserHash() => r'8c6e39f9e3cbe55e5e19546feb0702795d5183e0';
