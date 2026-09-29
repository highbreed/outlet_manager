import 'dart:developer' as developer;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage for authentication tokens
class TokenStorage {
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _accessExpiryKey = 'access_expiry';

  // flutter_secure_storage's Android backend (EncryptedSharedPreferences,
  // Keystore-backed) has documented real-world hangs on some devices. This
  // bounds every read/write/delete against that risk — a device whose
  // Keystore is genuinely broken (not just transiently slow) could hang
  // on any of them, and getTokens() specifically is on the hot path for
  // every outgoing request (AuthInterceptor) and every background isolate
  // (resolveIsolateAccessToken, a fresh TokenStorage with an empty cache
  // each time — FCM push, headless location pings), not just login/
  // session-restore. Every existing caller already treats a null/failed
  // result the same way ("not logged in" / "no valid token right now") —
  // confirmed by reading each call site — so failing safe to null here is
  // both centralized and consistent with established behavior, rather
  // than requiring every caller to remember its own timeout.
  static const _storageTimeout = Duration(seconds: 10);

  final FlutterSecureStorage _storage;

  // In-memory cache to avoid async reads on hot path
  _CachedTokens? _cache;

  TokenStorage()
      : _storage = const FlutterSecureStorage(
          aOptions: AndroidOptions(
            encryptedSharedPreferences: true,
            sharedPreferencesName: 'secure_auth_prefs',
            preferencesKeyPrefix: 'auth_',
          ),
          iOptions: IOSOptions(
            accessibility: KeychainAccessibility.first_unlock_this_device,
          ),
        );

  /// Get current tokens (uses cache if available). Returns null both for
  /// "no tokens stored" (the original meaning) and, now, "couldn't read
  /// from secure storage within the timeout" — every caller already
  /// treats null as "not currently logged in / no usable token", which is
  /// the safe fallback for both cases: a genuine absence and an
  /// unreadable store are indistinguishable from the caller's
  /// perspective, and neither should hang the caller forever.
  Future<AuthTokens?> getTokens() async {
    if (_cache != null) {
      return AuthTokens(
        accessToken: _cache!.accessToken,
        refreshToken: _cache!.refreshToken,
        accessExpiresAt: _cache!.accessExpiresAt,
      );
    }

    final String? accessToken;
    final String? refreshToken;
    final String? expiryStr;
    try {
      final values = await Future.wait([
        _storage.read(key: _accessTokenKey),
        _storage.read(key: _refreshTokenKey),
        _storage.read(key: _accessExpiryKey),
      ]).timeout(_storageTimeout);
      accessToken = values[0];
      refreshToken = values[1];
      expiryStr = values[2];
    } catch (e) {
      developer.log(
        '⚠️ Failed to read auth tokens from secure storage — treating as '
        'not logged in: $e',
        name: 'TokenStorage',
      );
      return null;
    }

    if (accessToken == null || refreshToken == null) {
      return null;
    }

    final expiresAt = expiryStr != null
        ? DateTime.parse(expiryStr)
        : DateTime.now().add(const Duration(minutes: 15));

    _cache = _CachedTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
      accessExpiresAt: expiresAt,
    );

    return AuthTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
      accessExpiresAt: expiresAt,
    );
  }

  /// Get just the access token (for interceptor)
  Future<String?> getAccessToken() async {
    if (_cache != null) return _cache!.accessToken;
    final tokens = await getTokens();
    return tokens?.accessToken;
  }

  /// Get just the refresh token (for refresh flow)
  Future<String?> getRefreshToken() async {
    if (_cache != null) return _cache!.refreshToken;
    final tokens = await getTokens();
    return tokens?.refreshToken;
  }

  /// Save new tokens
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required Duration accessExpiresIn,
  }) async {
    final expiresAt = DateTime.now().add(accessExpiresIn);

    // Set synchronously, before the persistent write below: the auth
    // interceptor's getAccessToken()/getRefreshToken() check this cache
    // first, so the current session works from here regardless of
    // whether the write below ever completes.
    _cache = _CachedTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
      accessExpiresAt: expiresAt,
    );

    // Best-effort persistence, bounded — must never block login() from
    // completing. Worst case on a genuinely broken device: this session
    // works fine (via the cache above), but doesn't survive an app
    // restart, so the user has to log in again next time — degraded, not
    // hung.
    try {
      await Future.wait([
        _storage.write(key: _accessTokenKey, value: accessToken),
        _storage.write(key: _refreshTokenKey, value: refreshToken),
        _storage.write(
          key: _accessExpiryKey,
          value: expiresAt.toIso8601String(),
        ),
      ]).timeout(_storageTimeout);
    } catch (e) {
      developer.log(
        '⚠️ Failed to persist auth tokens to secure storage (session still '
        'works via in-memory cache, but will not survive an app restart): $e',
        name: 'TokenStorage',
      );
    }
  }

  /// Clear all tokens (logout)
  Future<void> clearAll() async {
    // Cleared synchronously first, same reasoning as saveTokens() above —
    // the in-memory session state must reflect "logged out" immediately,
    // regardless of whether the persistent delete below ever completes.
    _cache = null;
    try {
      await Future.wait([
        _storage.delete(key: _accessTokenKey),
        _storage.delete(key: _refreshTokenKey),
        _storage.delete(key: _accessExpiryKey),
      ]).timeout(_storageTimeout);
    } catch (e) {
      developer.log(
        '⚠️ Failed to clear persisted auth tokens from secure storage '
        '(in-memory session is still cleared): $e',
        name: 'TokenStorage',
      );
    }
  }
}

class _CachedTokens {
  final String accessToken;
  final String refreshToken;
  final DateTime accessExpiresAt;

  _CachedTokens({
    required this.accessToken,
    required this.refreshToken,
    required this.accessExpiresAt,
  });
}

/// Token data with expiry information
class AuthTokens {
  final String accessToken;
  final String refreshToken;
  final DateTime accessExpiresAt;

  AuthTokens({
    required this.accessToken,
    required this.refreshToken,
    required this.accessExpiresAt,
  });

  /// Check if access token is expired
  bool get isAccessExpired => DateTime.now().isAfter(accessExpiresAt);

  /// Check if we should proactively refresh (1 minute before expiry)
  bool get shouldProactiveRefresh =>
      DateTime.now().isAfter(accessExpiresAt.subtract(const Duration(minutes: 1)));
}
