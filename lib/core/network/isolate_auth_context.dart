import 'dart:developer' as developer;

import 'package:dio/dio.dart';

import '../config/app_config.dart';
import '../storage/token_storage.dart';

// Shared region/base-URL/token resolution for code that runs in an isolate
// that never ran `main()` — the FCM background-message isolate and
// WorkManager's callback dispatcher. `AppConfig`'s static fields are
// uninitialized there (`LateInitializationError` if referenced), and
// `AuthInterceptor` — which normally does proactive token refresh — can't
// be constructed at all outside the main isolate (it requires a Riverpod
// `Ref`). Every such handler used to read whatever access token happened to
// be cached in `TokenStorage` and send it as-is; if it had expired since
// the app was last foregrounded, the ping 401'd and was silently dropped.
// For a *location* ping specifically, enough consecutive silent drops
// trips the backend's stale-location auto-clockout + session-revocation
// path — so a token-refresh gap, not an actual geofence exit, was clocking
// agents out. Route every isolate ping path through
// [resolveIsolateAccessToken] instead of `TokenStorage().getAccessToken()`
// directly to avoid this.

/// Resolves the same region `AppConfig.initialize()` computes in the main
/// isolate, from the compile-time `APP_REGION` `--dart-define` (not runtime
/// state, so it resolves identically in any isolate).
RegionConfig resolveIsolateRegion() => Regions.resolve(
  const String.fromEnvironment('APP_REGION', defaultValue: 'ke'),
);

/// Resolves the same `apiBaseUrl` `AppConfig.initialize()` computes, from
/// the compile-time `APP_ENV` `--dart-define`.
String resolveIsolateApiBaseUrl(RegionConfig region) {
  final envRaw = const String.fromEnvironment('APP_ENV', defaultValue: 'dev');
  final env = switch (envRaw.toLowerCase()) {
    'prod' || 'production' => Environment.prod,
    'staging' || 'stage' => Environment.staging,
    _ => Environment.dev,
  };
  return switch (env) {
    Environment.dev => 'http://192.168.1.18:8002/api/v1',
    Environment.staging => 'https://${region.stagingHost}/api/v1',
    Environment.prod => 'https://${region.host}/api/v1',
  };
}

/// Returns a usable access token for this isolate, refreshing it first via
/// `POST /auth/refresh` if it's within a minute of expiry — the same
/// threshold `AuthTokens.shouldProactiveRefresh` uses, which is what
/// `AuthInterceptor` relies on in the main isolate.
///
/// Returns null if the agent isn't logged in, or if the refresh token
/// itself was rejected (expired/revoked) — in which case there's nothing
/// this isolate can or should do about it; the next request made from the
/// main app isolate will 401 through the real `AuthInterceptor` and route
/// to its normal logout flow. Callers should treat null as "drop this
/// attempt silently", the same best-effort behavior as a location or
/// connectivity failure.
Future<String?> resolveIsolateAccessToken(String apiBaseUrl) async {
  final tokenStorage = TokenStorage();
  final tokens = await tokenStorage.getTokens();
  if (tokens == null) return null;
  if (!tokens.shouldProactiveRefresh) return tokens.accessToken;

  try {
    final refreshDio = Dio(
      BaseOptions(
        baseUrl: apiBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
    final response = await refreshDio.post(
      '/auth/refresh',
      data: {'refresh_token': tokens.refreshToken},
    );

    if (response.statusCode == 200 && response.data != null) {
      final accessToken = response.data['access_token'] as String;
      final newRefreshToken =
          response.data['refresh_token'] as String? ?? tokens.refreshToken;
      final expiresIn = response.data['expires_in'] as int? ?? 900;

      await tokenStorage.saveTokens(
        accessToken: accessToken,
        refreshToken: newRefreshToken,
        accessExpiresIn: Duration(seconds: expiresIn),
      );

      developer.log(
        '[IsolateAuth] Refreshed access token',
        name: 'IsolateAuth',
      );
      return accessToken;
    }
  } on DioException catch (e) {
    final status = e.response?.statusCode;
    if (status == 401 || status == 403) {
      developer.log(
        '[IsolateAuth] Refresh token rejected ($status), dropping',
        name: 'IsolateAuth',
      );
      return null;
    }
    // Network/timeout error during refresh — the cached token may still be
    // good for a bit longer (shouldProactiveRefresh fires a minute early),
    // so fall back to it rather than dropping this attempt over a
    // transient refresh failure.
    developer.log(
      '[IsolateAuth] Refresh attempt failed ($e), falling back to cached token',
      name: 'IsolateAuth',
    );
  }

  return tokens.isAccessExpired ? null : tokens.accessToken;
}
