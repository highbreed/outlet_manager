import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/auth/data/auth_controller.dart';

/// Watches for the backend's password-change gate: once an admin issues a
/// temporary/reset password for a user, every endpoint except a small
/// allowlist (/auth/me, /auth/change-password, /auth/logout, /auth/refresh)
/// starts returning 403 PASSWORD_CHANGE_REQUIRED for that user's token.
///
/// Flags [AuthController] the moment that's seen, wherever in the app it
/// happens — the router reacts to auth state and redirects to the
/// change-password screen, so no individual screen needs to check for this.
class PasswordChangeGateInterceptor extends Interceptor {
  final Ref _ref;

  PasswordChangeGateInterceptor(this._ref);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 403) {
      final data = err.response?.data;
      final detail = data is Map ? data['detail'] : null;
      if (detail is Map && detail['code'] == 'PASSWORD_CHANGE_REQUIRED') {
        _ref.read(authControllerProvider.notifier).flagMustChangePassword();
      }
    }
    handler.next(err);
  }
}
