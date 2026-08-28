import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_repository.dart';
import 'forgot_password_state.dart';

part 'forgot_password_controller.g.dart';

/// Controller for forgot password flow
@riverpod
class ForgotPasswordController extends _$ForgotPasswordController {
  @override
  ForgotPasswordState build() {
    return const ForgotPasswordState.initial();
  }

  /// Request OTP for password reset
  Future<void> requestOtp(String email) async {
    state = const ForgotPasswordState.loading();

    final repository = ref.read(authRepositoryProvider);
    final result = await repository.requestPasswordReset(email: email);

    result.fold(
      (failure) => state = ForgotPasswordState.error(failure.message),
      (_) => state = ForgotPasswordState.otpSent(email: email),
    );
  }

  /// Verify OTP code
  Future<void> verifyOtp(String email, String otp) async {
    state = const ForgotPasswordState.loading();

    final repository = ref.read(authRepositoryProvider);
    final result = await repository.verifyPasswordResetOtp(
      email: email,
      otp: otp,
    );

    result.fold(
      (failure) => state = ForgotPasswordState.error(failure.message),
      (token) => state = ForgotPasswordState.otpVerified(
        email: email,
        resetToken: token,
      ),
    );
  }

  /// Reset password with verified token
  Future<void> resetPassword({
    required String email,
    required String resetToken,
    required String newPassword,
  }) async {
    state = const ForgotPasswordState.loading();

    final repository = ref.read(authRepositoryProvider);
    final result = await repository.resetPassword(
      email: email,
      resetToken: resetToken,
      newPassword: newPassword,
    );

    result.fold(
      (failure) => state = ForgotPasswordState.error(failure.message),
      (_) => state = const ForgotPasswordState.passwordReset(),
    );
  }

  /// Clear error state
  void clearError() {
    state.maybeMap(
      error: (_) => state = const ForgotPasswordState.initial(),
      orElse: () {},
    );
  }

  /// Reset to initial state
  void reset() {
    state = const ForgotPasswordState.initial();
  }
}
