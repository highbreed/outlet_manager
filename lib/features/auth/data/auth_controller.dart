import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/isar_database.dart';
import '../../../core/providers/notification_providers.dart';
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

  /// Attempt to restore session from stored tokens
  Future<void> _restoreSession() async {
    final hasTokens = await _repository.hasTokens();
    
    if (!hasTokens) {
      state = const AuthState.unauthenticated();
      return;
    }

    state = const AuthState.authenticating();

    final result = await _repository.getCurrentUser();
    
    result.fold(
      (failure) {
        // Token invalid or expired, go to unauthenticated
        state = const AuthState.unauthenticated();
      },
      (user) {
        state = AuthState.authenticated(user: user);
      },
    );
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
        state = AuthState.authenticated(user: user);
      },
    );
  }

  /// Logout (best-effort)
  Future<void> logout({String reason = 'user_initiated'}) async {
    state = AuthState.loggingOut(reason: reason);

    await ref.read(deviceRegistrationRepositoryProvider).deregisterDevice();
    await _repository.logout();
    await IsarDatabase.clearStockTakeCache();

    state = const AuthState.unauthenticated();
  }

  /// Force logout (e.g., from interceptor on 401)
  void forceLogout({required String reason}) {
    state = AuthState.loggingOut(reason: reason);
    ref.read(deviceRegistrationRepositoryProvider).deregisterDevice().then((_) {
      _repository.logout().then((_) {
        IsarDatabase.clearStockTakeCache().then((_) {
          state = const AuthState.unauthenticated();
        });
      });
    });
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
