import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/isar_database.dart';
import '../../../core/providers/notification_providers.dart';
import '../../biometric_verification/providers/biometric_status_provider.dart';
import '../../outlet_mapping/domain/entities/mapping_enums.dart';
import '../../outlet_mapping/providers/mapping_session_notifier.dart';
import 'auth_repository.dart';
import 'auth_state.dart';
import '../domain/user.dart';

part 'auth_controller.g.dart';

/// Auth controller manages authentication state machine
/// 
/// State transitions:
/// - initial → authenticating → authenticated OR unauthenticated
/// - authenticated → loggingOut → unauthenticated
/// - any state → error (recoverable)
@riverpod
class AuthController extends _$AuthController {
  late AuthRepository _repository;

  @override
  AuthState build() {
    _repository = ref.watch(authRepositoryProvider);
    
    // Attempt session restoration on first build
    _restoreSession();
    
    return const AuthState.initial();
  }

  // The router holds the user on /splash for exactly as long as `state`
  // stays AuthInitial/Authenticating (see router_provider's redirect) — so
  // this method must be guaranteed to resolve. `hasTokens()` reads through
  // flutter_secure_storage's EncryptedSharedPreferences (Android Keystore
  // backed), which has documented real-world hangs on some devices/Keystore
  // states; `getCurrentUser()` only catches DioException, not e.g. a
  // malformed-response parse error. Neither had a timeout before, and
  // nothing in this function caught anything, so either one hanging or
  // throwing an unexpected type left `state` stuck forever — the same
  // class of bug as the pre-fix Isar database hang.
  static const _restoreSessionTimeout = Duration(seconds: 15);

  /// Attempt to restore session from stored tokens
  Future<void> _restoreSession() async {
    try {
      final hasTokens = await _repository.hasTokens().timeout(
        _restoreSessionTimeout,
      );

      if (!hasTokens) {
        state = const AuthState.unauthenticated();
        return;
      }

      state = const AuthState.authenticating();

      final result = await _repository.getCurrentUser().timeout(
        _restoreSessionTimeout,
      );

      result.fold(
        (failure) {
          // Token invalid or expired, go to unauthenticated
          state = const AuthState.unauthenticated();
        },
        (user) {
          state = AuthState.authenticated(user: user);
        },
      );
    } catch (e) {
      // Fail safe to unauthenticated rather than leave state stuck: worst
      // case a legitimately-logged-in user sees one extra login prompt,
      // instead of the app being dead on the splash screen.
      state = const AuthState.unauthenticated();
    }
  }

  /// Login with email and password
  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AuthState.authenticating();

    final result = await _repository.login(
      email: email,
      password: password,
    );

    result.fold(
      (failure) {
        state = AuthState.error(message: failure.displayMessage);
      },
      (user) {
        // Per-employee, not device-level — a stale cached value from a
        // previous session on this device must never leak into this
        // login. See the "Phase 5" plan's section A.3.
        ref.invalidate(biometricStatusProvider);
        state = AuthState.authenticated(user: user);
      },
    );
  }

  /// Logout (best-effort)
  Future<void> logout({String reason = 'user_initiated'}) async {
    state = AuthState.loggingOut(reason: reason);

    await _handleMappingSessionOnLogout();
    await ref.read(deviceRegistrationRepositoryProvider).deregisterDevice();
    await _repository.logout();
    await IsarDatabase.clearStockTakeCache();

    state = const AuthState.unauthenticated();
  }

  /// Force logout (e.g., from interceptor on 401)
  void forceLogout({required String reason}) {
    state = AuthState.loggingOut(reason: reason);
    // Best-effort, bounded — a forced logout (e.g. a rejected token) must
    // not hang waiting on a network call the very token loss may have
    // already broken (spec §64). Local safety (stop high-frequency GPS,
    // never claim /abandon succeeded) still happens; the network part is
    // opportunistic only.
    _handleMappingSessionOnLogout().timeout(
      const Duration(seconds: 3),
      onTimeout: () {},
    );
    ref.read(deviceRegistrationRepositoryProvider).deregisterDevice().then((_) {
      _repository.logout().then((_) {
        IsarDatabase.clearStockTakeCache().then((_) {
          state = const AuthState.unauthenticated();
        });
      });
    });
  }

  /// Spec §62/§63/§64 — logout must never silently leave high-frequency
  /// mapping GPS configuration enabled, and must never let a DIFFERENT
  /// user's later login accidentally act on this session (ownership stays
  /// tagged to this user's id regardless of what happens here — see
  /// `MappingSession.ownerUserId`'s doc comment).
  ///
  /// Only a session still `capturing` (actively being walked) is abandoned
  /// here — `MappingSessionNotifier.stopMapping()` already does exactly
  /// spec §62's sequence (stop collection, restore normal GPS config,
  /// discard unsent samples, best-effort `POST /abandon`, never block on
  /// the network result). A session that already finished walking
  /// (`captureFinishedLocal`/`uploadPending`/`submitting`/
  /// `finishResultUnknown`) is deliberately left untouched (spec §63) —
  /// the employee's work is done; it stays queued, tagged to this user,
  /// and resumes draining the next time they log back in.
  Future<void> _handleMappingSessionOnLogout() async {
    final mapping = ref.read(mappingSessionNotifierProvider);
    if (mapping.session?.localState == MappingLocalState.capturing) {
      await ref.read(mappingSessionNotifierProvider.notifier).stopMapping();
    }
  }

  /// Clear error and return to unauthenticated
  void clearError() {
    if (state is AuthError) {
      state = const AuthState.unauthenticated();
    }
  }

  /// Flags the current session as gated behind a required password change.
  /// Called by [PasswordChangeGateInterceptor] when any endpoint reports
  /// PASSWORD_CHANGE_REQUIRED mid-session, so the router (which reacts to
  /// auth state) redirects to the change-password screen without every
  /// screen needing to check for this itself.
  void flagMustChangePassword() {
    final current = state;
    if (current is Authenticated && !current.user.mustChangePassword) {
      state = AuthState.authenticated(
        user: current.user.copyWith(mustChangePassword: true),
      );
    }
  }

  /// Called after a successful POST /auth/change-password: the backend
  /// revokes every session for this user, so there's no valid token left
  /// to keep using — go straight back to a normal login.
  void completePasswordChange() {
    state = const AuthState.unauthenticated();
  }

  /// Get current user if authenticated
  User? get currentUser {
    final current = state;
    if (current is Authenticated) {
      return current.user;
    }
    return null;
  }

  /// Check if currently authenticated
  bool get isAuthenticated => state is Authenticated;
}

/// Provider for checking if user is authenticated (convenience)
@riverpod
bool isAuthenticated(Ref ref) {
  final authState = ref.watch(authControllerProvider);
  return authState is Authenticated;
}

/// Provider for current user (null if not authenticated)
@riverpod
User? currentUser(Ref ref) {
  final authState = ref.watch(authControllerProvider);
  if (authState is Authenticated) {
    return authState.user;
  }
  return null;
}
