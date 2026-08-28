import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.freezed.dart';

/// State for forgot password flow
@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;
  const factory ForgotPasswordState.loading() = _Loading;
  const factory ForgotPasswordState.otpSent({required String email}) = _OtpSent;
  const factory ForgotPasswordState.otpVerified({
    required String email,
    required String resetToken,
  }) = _OtpVerified;
  const factory ForgotPasswordState.passwordReset() = _PasswordReset;
  const factory ForgotPasswordState.error(String message) = _Error;
}
