package com.mikappliance.outletManager.location

import android.content.Context
import android.content.SharedPreferences
import android.util.Log
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import org.json.JSONObject
import java.io.OutputStreamWriter
import java.net.HttpURLConnection
import java.net.URL

/**
 * The native tracking service's own encrypted copy of the auth tokens, separate
 * from Dart's `TokenStorage` (flutter_secure_storage). A native background
 * service can run with no Flutter engine alive at all (Activity destroyed, app
 * swiped from Recents, post-reboot), so it can't call back into Dart's
 * `isolate_auth_context.dart` to refresh an expiring token — there may be
 * nothing on the other end of that MethodChannel. Instead this class is seeded
 * once from Dart at `startTracking()` time and refreshes itself independently
 * from then on, mirroring the exact same proactive-refresh logic
 * `isolate_auth_context.dart`/`AuthInterceptor` use on the Dart side (refresh
 * within 1 minute of expiry via `POST /auth/refresh`).
 *
 * Two independent encrypted token copies existing (this one, and Dart's) is a
 * deliberate tradeoff: a stale copy in either just costs one extra refresh
 * call next time it's used, not a failure — simpler and more robust than
 * trying to decrypt flutter_secure_storage's own file from native code, which
 * would depend on that plugin's internal encryption scheme never changing.
 */
class SecureTokenStore(context: Context) {
    private val prefs: SharedPreferences = run {
        val masterKey = MasterKey.Builder(context)
            .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
            .build()
        EncryptedSharedPreferences.create(
            context,
            PREFS_NAME,
            masterKey,
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM,
        )
    }

    fun saveTokens(accessToken: String, refreshToken: String, accessExpiresAtEpochMillis: Long) {
        prefs.edit()
            .putString(KEY_ACCESS_TOKEN, accessToken)
            .putString(KEY_REFRESH_TOKEN, refreshToken)
            .putLong(KEY_EXPIRES_AT, accessExpiresAtEpochMillis)
            .apply()
    }

    /**
     * Returns a usable access token, refreshing it first if it's within a
     * minute of expiry. Returns null if there's no token at all, or if the
     * refresh token itself was rejected (expired/revoked) — the same
     * "drop silently, let the main app's real login flow handle it" contract
     * `isolate_auth_context.dart` uses.
     */
    fun getValidAccessToken(apiBaseUrl: String): String? {
        val accessToken = prefs.getString(KEY_ACCESS_TOKEN, null) ?: return null
        val refreshToken = prefs.getString(KEY_REFRESH_TOKEN, null) ?: return null
        val expiresAt = prefs.getLong(KEY_EXPIRES_AT, 0L)
        val now = System.currentTimeMillis()

        val shouldProactiveRefresh = now >= expiresAt - PROACTIVE_REFRESH_WINDOW_MS
        if (!shouldProactiveRefresh) return accessToken

        return try {
            refresh(apiBaseUrl, refreshToken) ?: run {
                val isExpired = now >= expiresAt
                if (isExpired) null else accessToken
            }
        } catch (e: Exception) {
            Log.w(TAG, "Refresh attempt failed ($e), falling back to cached token")
            val isExpired = now >= expiresAt
            if (isExpired) null else accessToken
        }
    }

    /** Returns the new access token on success, null if the refresh token was rejected. */
    private fun refresh(apiBaseUrl: String, refreshToken: String): String? {
        val url = URL("$apiBaseUrl/auth/refresh")
        val connection = (url.openConnection() as HttpURLConnection).apply {
            requestMethod = "POST"
            doOutput = true
            setRequestProperty("Content-Type", "application/json")
            setRequestProperty("Accept", "application/json")
            connectTimeout = 15_000
            readTimeout = 15_000
        }

        try {
            OutputStreamWriter(connection.outputStream).use { writer ->
                writer.write(JSONObject().put("refresh_token", refreshToken).toString())
            }

            val status = connection.responseCode
            if (status == 401 || status == 403) {
                Log.w(TAG, "Refresh token rejected ($status), dropping")
                return null
            }
            if (status != 200) {
                throw IllegalStateException("Unexpected refresh status $status")
            }

            val body = connection.inputStream.bufferedReader().use { it.readText() }
            val json = JSONObject(body)
            val newAccessToken = json.getString("access_token")
            val newRefreshToken =
                if (json.has("refresh_token")) json.getString("refresh_token") else refreshToken
            val expiresInSeconds = if (json.has("expires_in")) json.getInt("expires_in") else 900

            val newExpiresAt = System.currentTimeMillis() + expiresInSeconds * 1000L
            saveTokens(newAccessToken, newRefreshToken, newExpiresAt)
            Log.d(TAG, "Refreshed access token")
            // Tell Dart too, if it's listening — see TrackingEventBridge.
            // Without this, a native-side refresh rotates the server's
            // refresh token while Dart's TokenStorage never finds out,
            // and Dart's own next refresh attempt gets rejected with the
            // exact 401 confirmed in backend logs during testing.
            TrackingEventBridge.emitTokensRefreshed(newAccessToken, newRefreshToken, newExpiresAt)
            return newAccessToken
        } finally {
            connection.disconnect()
        }
    }

    companion object {
        private const val TAG = "SecureTokenStore"
        private const val PREFS_NAME = "outlet_manager_tracking_tokens"
        private const val KEY_ACCESS_TOKEN = "access_token"
        private const val KEY_REFRESH_TOKEN = "refresh_token"
        private const val KEY_EXPIRES_AT = "expires_at"

        // Same threshold as AuthTokens.shouldProactiveRefresh (Dart side).
        private const val PROACTIVE_REFRESH_WINDOW_MS = 60_000L
    }
}
