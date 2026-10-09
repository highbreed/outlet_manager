import 'dart:async';
import 'dart:developer' as developer;

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

  /// Field-reported crash (Sentry): `PlatformException` wrapping a
  /// `BadPaddingException` from `EncryptedSharedPreferences`'s underlying
  /// Android Keystore AES key — a known, somewhat common real-world
  /// failure mode (the OS restored app data to a new device, a lock-screen
  /// credential change invalidated the key, Keystore corruption, etc.)
  /// where previously-encrypted values become permanently undecryptable
  /// with that key. [TokenStorage.getTokens] already guards against this
  /// exact class of failure; this class never had the same treatment.
  /// Treats any read failure as "no cached token" (the normal cache-miss
  /// path already mints a fresh one — see [ensureDeviceLocationToken]) and
  /// proactively clears the unreadable keys so a broken Keystore key
  /// doesn't keep throwing the same exception on every future read.
  Future<DeviceLocationToken?> read() async {
    final String? token;
    final String? expiryStr;
    try {
      token = await _storage.read(key: _tokenKey);
      expiryStr = await _storage.read(key: _expiryKey);
    } catch (e) {
      developer.log(
        '⚠️ Failed to read device-location token from secure storage — '
        'treating as not cached: $e',
        name: 'DeviceLocationTokenStorage',
      );
      unawaited(clear());
      return null;
    }
    if (token == null || expiryStr == null) return null;
    return DeviceLocationToken(token: token, expiresAt: DateTime.parse(expiryStr));
  }

  Future<void> save({required String token, required DateTime expiresAt}) async {
    try {
      await Future.wait([
        _storage.write(key: _tokenKey, value: token),
        _storage.write(key: _expiryKey, value: expiresAt.toIso8601String()),
      ]);
    } catch (e) {
      // Non-fatal: the freshly-minted token is still returned to the
      // caller for this call's immediate use (see ensureDeviceLocationToken),
      // it just won't survive to the next read — same degrade-gracefully
      // reasoning as TokenStorage.saveTokens.
      developer.log(
        '⚠️ Failed to persist device-location token to secure storage: $e',
        name: 'DeviceLocationTokenStorage',
      );
    }
  }

  Future<void> clear() async {
    try {
      await Future.wait([
        _storage.delete(key: _tokenKey),
        _storage.delete(key: _expiryKey),
      ]);
    } catch (e) {
      developer.log(
        '⚠️ Failed to clear device-location token from secure storage: $e',
        name: 'DeviceLocationTokenStorage',
      );
    }
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
