import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_sale_otp_result.freezed.dart';

/// Result of requesting or verifying a customer OTP for sale confirmation.
/// Both `request-otp` and `verify-otp` return this same shape.
@freezed
class DailySaleOtpResult with _$DailySaleOtpResult {
  const factory DailySaleOtpResult({
    required String message,
    required int expiresInMinutes,
  }) = _DailySaleOtpResult;
}
