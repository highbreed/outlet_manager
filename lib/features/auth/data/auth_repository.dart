import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/failures.dart';
import '../../../core/storage/token_storage.dart';
import '../../../core/utils/result.dart';
import '../domain/user.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final Dio _dio;
  final TokenStorage _tokenStorage;

  AuthRepository({required Dio dio, required TokenStorage tokenStorage})
    : _dio = dio,
      _tokenStorage = tokenStorage;

  /// Login with email and password
  Future<Result<User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
        options: Options(extra: {'skipAuth': true}),
      );

      if (response.statusCode == 200 && response.data != null) {
        final accessToken = response.data['access_token'] as String;
        final refreshToken = response.data['refresh_token'] as String;
        final expiresIn = response.data['expires_in'] as int? ?? 900;

        // Save tokens first
        await _tokenStorage.saveTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
          accessExpiresIn: Duration(seconds: expiresIn),
        );

        // Always confirm via /auth/me rather than trusting the embedded
        // user payload: it's the authoritative source for
        // must_change_password (the password-change gate), so checking it
        // right after login avoids a flash of the wrong screen if that
        // field isn't present on the login response itself.
        return getCurrentUser();
      }

      return const Left(AuthFailure.invalidCredentials());
    } on DioException catch (e) {
      if (e.error is Failure) {
        return Left(e.error as Failure);
      }
      return Left(
        UnknownFailure(message: e.message ?? 'Login failed', originalError: e),
      );
    }
  }

  /// Logout (best-effort server call)
  Future<Result<void>> logout() async {
    try {
      await _dio.post('/auth/logout');
      await _tokenStorage.clearAll();
      return const Right(null);
    } on DioException {
      // Clear tokens even if server call fails
      await _tokenStorage.clearAll();
      return const Right(null);
    }
  }

  /// Get current user profile
  Future<Result<User>> getCurrentUser() async {
    try {
      final response = await _dio.get('/auth/me');

      if (response.statusCode == 200 && response.data != null) {
        return Right(User.fromJson(response.data as Map<String, dynamic>));
      }

      return const Left(AuthFailure.tokenExpired());
    } on DioException catch (e) {
      if (e.error is Failure) {
        return Left(e.error as Failure);
      }
      return Left(
        UnknownFailure(
          message: e.message ?? 'Failed to get user',
          originalError: e,
        ),
      );
    } catch (e) {
      // Not just DioException — a malformed/unexpected response shape
      // (User.fromJson throwing a TypeError/FormatException) must also
      // resolve to a Left, not escape uncaught. AuthController._restoreSession
      // calls this during app startup with no fallback of its own beyond
      // this Either; an uncaught throw here left session restoration
      // permanently stuck (see that method's own doc comment).
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  /// Check if we have valid tokens stored
  Future<bool> hasValidTokens() async {
    final tokens = await _tokenStorage.getTokens();
    return tokens != null && !tokens.isAccessExpired;
  }

  /// Check if we have any tokens (may need refresh)
  Future<bool> hasTokens() async {
    final tokens = await _tokenStorage.getTokens();
    return tokens != null;
  }

  /// Request password reset OTP
  Future<Result<void>> requestPasswordReset({required String email}) async {
    try {
      final response = await _dio.post(
        '/auth/forgot-password',
        data: {'email': email},
        options: Options(extra: {'skipAuth': true}),
      );

      if (response.statusCode == 200 && response.data != null) {
        // Expected response: { "success": true, "message": "string", "expires_in_minutes": 0 }
        final success = response.data['success'] as bool? ?? false;
        if (success) {
          return const Right(null);
        }
        // If success is false, return error with message
        final message =
            response.data['message'] as String? ?? 'Failed to send reset code';
        return Left(UnknownFailure(message: message));
      }

      return Left(UnknownFailure(message: 'Failed to send reset code'));
    } on DioException catch (e) {
      if (e.error is Failure) {
        return Left(e.error as Failure);
      }
      return Left(
        UnknownFailure(
          message: e.message ?? 'Failed to send reset code',
          originalError: e,
        ),
      );
    }
  }

  /// Verify password reset OTP
  Future<Result<String>> verifyPasswordResetOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/verify-otp',
        data: {'email': email, 'otp_code': otp},
        options: Options(extra: {'skipAuth': true}),
      );

      if (response.statusCode == 200 && response.data != null) {
        // Expected response: { "success": true, "reset_token": "string", "expires_in_minutes": 0 }
        final success = response.data['success'] as bool? ?? false;
        if (success) {
          final resetToken = response.data['reset_token'] as String;
          return Right(resetToken);
        }
        // If success is false, return error
        return Left(UnknownFailure(message: 'Invalid or expired OTP'));
      }

      return Left(UnknownFailure(message: 'Invalid or expired OTP'));
    } on DioException catch (e) {
      if (e.error is Failure) {
        return Left(e.error as Failure);
      }
      return Left(
        UnknownFailure(
          message: e.message ?? 'Invalid or expired OTP',
          originalError: e,
        ),
      );
    }
  }

  /// Reset password with verified token
  Future<Result<void>> resetPassword({
    required String email,
    required String resetToken,
    required String newPassword,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/reset-password',
        data: {'reset_token': resetToken, 'new_password': newPassword},
        options: Options(extra: {'skipAuth': true}),
      );

      if (response.statusCode == 200 && response.data != null) {
        // Expected response: { "success": true, "message": "string" }
        final success = response.data['success'] as bool? ?? false;
        if (success) {
          return const Right(null);
        }
        // If success is false, return error with message
        final message =
            response.data['message'] as String? ?? 'Failed to reset password';
        return Left(UnknownFailure(message: message));
      }

      return Left(UnknownFailure(message: 'Failed to reset password'));
    } on DioException catch (e) {
      if (e.error is Failure) {
        return Left(e.error as Failure);
      }
      return Left(
        UnknownFailure(
          message: e.message ?? 'Failed to reset password',
          originalError: e,
        ),
      );
    }
  }

  /// Change password for the current user (also clears the
  /// must_change_password gate). Requires the current password to be
  /// verified server-side.
  Future<Result<void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/change-password',
        data: {
          'current_password': currentPassword,
          'new_password': newPassword,
        },
      );

      if (response.statusCode == 204) {
        // Every other session (including this one's refresh token) is
        // revoked server-side on success — discard local tokens too rather
        // than let a dead access token linger until it naturally expires.
        await _tokenStorage.clearAll();
        return const Right(null);
      }

      return Left(UnknownFailure(message: 'Failed to change password'));
    } on DioException catch (e) {
      // This endpoint returns FastAPI-style {"detail": "..."} on 400
      // (e.g. wrong current password) rather than the {"error": {...}}
      // envelope ErrorMappingInterceptor expects, so read it directly.
      final data = e.response?.data;
      final detail = data is Map ? data['detail'] : null;
      final message = detail is String ? detail : 'Failed to change password';
      return Left(UnknownFailure(message: message));
    }
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(
    dio: ref.watch(dioProvider),
    tokenStorage: ref.watch(tokenStorageProvider),
  );
}
