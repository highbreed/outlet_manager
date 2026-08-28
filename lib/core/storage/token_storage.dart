import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage for authentication tokens
class TokenStorage {
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _accessExpiryKey = 'access_expiry';

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

  /// Get current tokens (uses cache if available)
  Future<AuthTokens?> getTokens() async {
    if (_cache != null) {
      return AuthTokens(
        accessToken: _cache!.accessToken,
        refreshToken: _cache!.refreshToken,
        accessExpiresAt: _cache!.accessExpiresAt,
      );
    }

    final accessToken = await _storage.read(key: _accessTokenKey);
    final refreshToken = await _storage.read(key: _refreshTokenKey);
    final expiryStr = await _storage.read(key: _accessExpiryKey);

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

    _cache = _CachedTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
      accessExpiresAt: expiresAt,
    );

    await Future.wait([
      _storage.write(key: _accessTokenKey, value: accessToken),
      _storage.write(key: _refreshTokenKey, value: refreshToken),
      _storage.write(key: _accessExpiryKey, value: expiresAt.toIso8601String()),
    ]);
  }

  /// Clear all tokens (logout)
  Future<void> clearAll() async {
    _cache = null;
    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
      _storage.delete(key: _accessExpiryKey),
    ]);
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
