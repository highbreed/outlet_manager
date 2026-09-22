import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage for the `device_location` JWT — a separate, narrowly-
/// scoped token minted via `POST /auth/device-token` and handed to the
/// plugin's native `autoSync` HTTP layer (see
/// `BackgroundGeolocationService._ensureDeviceLocationToken`). Deliberately
/// not the same store as [TokenStorage]: this token is DB-backed/revocable
/// server-side, rejected by every other endpoint, and has a hard 24h expiry
/// with no self-renewal — keeping it separate makes clear it's not
/// interchangeable with the normal access/refresh token pair.
class DeviceLocationTokenStorage {
  static const _tokenKey = 'device_location_token';
  static const _expiryKey = 'device_location_token_expiry';

  final FlutterSecureStorage _storage;

  DeviceLocationTokenStorage()
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

  Future<DeviceLocationToken?> read() async {
    final token = await _storage.read(key: _tokenKey);
    final expiryStr = await _storage.read(key: _expiryKey);
    if (token == null || expiryStr == null) return null;
    return DeviceLocationToken(token: token, expiresAt: DateTime.parse(expiryStr));
  }

  Future<void> save({required String token, required DateTime expiresAt}) {
    return Future.wait([
      _storage.write(key: _tokenKey, value: token),
      _storage.write(key: _expiryKey, value: expiresAt.toIso8601String()),
    ]);
  }

  Future<void> clear() {
    return Future.wait([
      _storage.delete(key: _tokenKey),
      _storage.delete(key: _expiryKey),
    ]);
  }
}

class DeviceLocationToken {
  final String token;
  final DateTime expiresAt;

  DeviceLocationToken({required this.token, required this.expiresAt});

  /// Mints have no self-renewal and shifts are confirmed to never approach
  /// the 24h TTL, so a wide 1h safety margin is cheap and avoids ever
  /// handing native a token that expires mid-shift.
  bool get isExpiredOrExpiringSoon =>
      DateTime.now().isAfter(expiresAt.subtract(const Duration(hours: 1)));
}
