package com.mikappliance.outletManager.location

import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.EventChannel

/**
 * Closes the other half of the token-sync loop: [SecureTokenStore] pushes
 * to Dart via [TrackingMethodChannel]'s MethodChannel whenever
 * AuthInterceptor/login refreshes *there*, but until now nothing told Dart
 * when *native's own* refresh succeeded — so a native-side refresh could
 * rotate the server's refresh token and strand Dart's copy with no way to
 * know, producing the exact 401-on-/auth/refresh symptom confirmed in the
 * backend logs during today's testing.
 *
 * [sink] is only non-null while a Flutter engine is actually listening
 * (see [TrackingMethodChannel.register]'s EventChannel handler) — a
 * refresh happening with no engine attached (pure background/WorkManager
 * execution) has nothing to emit to and silently no-ops, same best-effort
 * contract as everything else in this engine.
 */
object TrackingEventBridge {
    @Volatile
    var sink: EventChannel.EventSink? = null

    private val mainHandler = Handler(Looper.getMainLooper())

    /** Must be safe to call from any thread — SecureTokenStore refreshes on a background thread. */
    fun emitTokensRefreshed(
        accessToken: String,
        refreshToken: String,
        accessExpiresAtEpochMillis: Long,
    ) {
        val currentSink = sink ?: return
        mainHandler.post {
            // EventChannel.EventSink isn't safe to call once the listener
            // has gone away between the post() and now — re-read the
            // volatile field rather than trusting the captured reference.
            if (sink !== currentSink) return@post
            currentSink.success(
                mapOf(
                    "type" to "tokensRefreshed",
                    "accessToken" to accessToken,
                    "refreshToken" to refreshToken,
                    "accessExpiresAtEpochMillis" to accessExpiresAtEpochMillis,
                ),
            )
        }
    }

    /**
     * Fires when [GeofenceHysteresisTracker] confirms an exit or re-entry.
     * Same best-effort, engine-may-not-be-alive contract as
     * [emitTokensRefreshed] — this is purely for surfacing a notification
     * when the app happens to be running; the ping that actually informs
     * the backend's geofence violation detector already went out
     * independently of whether anything is listening here.
     */
    fun emitGeofenceTransition(
        transitionType: String,
        visitId: String,
        outletName: String,
        distanceMeters: Double,
    ) {
        val currentSink = sink ?: return
        mainHandler.post {
            if (sink !== currentSink) return@post
            currentSink.success(
                mapOf(
                    "type" to "geofenceTransition",
                    "transitionType" to transitionType,
                    "visitId" to visitId,
                    "outletName" to outletName,
                    "distanceMeters" to distanceMeters,
                ),
            )
        }
    }

    /**
     * A free-text line for the temporary geofence debug screen
     * (`geofence_debug_screen.dart`) — field-testing needs *something*
     * visible in-app since testers won't have a laptop/`logcat` on the
     * ground. Same best-effort, engine-may-not-be-alive contract as the
     * other emits here; nothing depends on this arriving.
     */
    fun emitDebugLog(message: String) {
        val currentSink = sink ?: return
        val timestamp = System.currentTimeMillis()
        mainHandler.post {
            if (sink !== currentSink) return@post
            currentSink.success(
                mapOf(
                    "type" to "debugLog",
                    "message" to message,
                    "timestampEpochMillis" to timestamp,
                ),
            )
        }
    }
}
