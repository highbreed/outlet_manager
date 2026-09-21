package com.mikappliance.outletManager.location

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.PowerManager
import android.provider.Settings
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * Flutter <-> native bridge for the background tracking engine. Kept as a
 * thin translation layer only — see `lib/core/location/background_location_service.dart`
 * for the Dart-side wrapper apps actually call into, and [LocationTrackingService]
 * for where the real tracking logic lives.
 */
class TrackingMethodChannel(private val context: Context) {

    fun register(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "startTracking" -> handleStartTracking(call, result)
                    "stopTracking" -> {
                        LocationTrackingService.stop(context)
                        result.success(null)
                    }
                    "getTrackingStatus" -> handleGetTrackingStatus(result)
                    "syncTokens" -> handleSyncTokens(call, result)
                    "isIgnoringBatteryOptimizations" -> handleIsIgnoringBatteryOptimizations(result)
                    "requestBatteryOptimizationExemption" -> handleRequestBatteryOptimizationExemption(result)
                    else -> result.notImplemented()
                }
            }

        // The other half of the token-sync loop — see TrackingEventBridge's
        // doc comment. Only while something is actually listening (engine
        // alive, this handler registered) does a native-side token refresh
        // have anywhere to report itself to.
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT_CHANNEL)
            .setStreamHandler(
                object : EventChannel.StreamHandler {
                    override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
                        TrackingEventBridge.sink = events
                    }

                    override fun onCancel(arguments: Any?) {
                        TrackingEventBridge.sink = null
                    }
                },
            )
    }

    private fun handleStartTracking(call: MethodCall, result: MethodChannel.Result) {
        val args = call.arguments as? Map<*, *>
        if (args == null) {
            result.error("INVALID_ARGS", "startTracking requires an argument map", null)
            return
        }

        try {
            val config = TrackingConfig(
                visitId = args["visitId"] as String,
                outletName = args["outletName"] as? String ?: "Outlet",
                outletLatitude = (args["outletLatitude"] as Number).toDouble(),
                outletLongitude = (args["outletLongitude"] as Number).toDouble(),
                geofenceRadiusMeters = (args["geofenceRadiusMeters"] as Number).toDouble(),
                apiBaseUrl = args["apiBaseUrl"] as String,
                startedAtEpochMillis = System.currentTimeMillis(),
            )
            val accessToken = args["accessToken"] as String
            val refreshToken = args["refreshToken"] as String
            val accessExpiresAtEpochMillis = (args["accessExpiresAtEpochMillis"] as Number).toLong()

            LocationTrackingService.start(context, config, accessToken, refreshToken, accessExpiresAtEpochMillis)
            result.success(null)
        } catch (e: Exception) {
            result.error("INVALID_ARGS", "startTracking argument missing/malformed: $e", null)
        }
    }

    /**
     * Called whenever Dart's AuthInterceptor successfully refreshes the
     * access token, so this engine's own encrypted copy (SecureTokenStore)
     * doesn't drift out of sync with it — see auth_interceptor.dart's call
     * site for why: a rotating-refresh-token backend invalidates the old
     * token on use, and whichever side refreshes independently first
     * strands the other's copy with no way back from a rejected refresh.
     */
    private fun handleSyncTokens(call: MethodCall, result: MethodChannel.Result) {
        val args = call.arguments as? Map<*, *>
        if (args == null) {
            result.error("INVALID_ARGS", "syncTokens requires an argument map", null)
            return
        }

        try {
            val accessToken = args["accessToken"] as String
            val refreshToken = args["refreshToken"] as String
            val accessExpiresAtEpochMillis = (args["accessExpiresAtEpochMillis"] as Number).toLong()

            SecureTokenStore(context).saveTokens(accessToken, refreshToken, accessExpiresAtEpochMillis)
            result.success(null)
        } catch (e: Exception) {
            result.error("INVALID_ARGS", "syncTokens argument missing/malformed: $e", null)
        }
    }

    /**
     * Confirmed by device testing: without this exemption, Doze/App
     * Standby — and this device's own (Samsung) battery management on top
     * of stock Android's — can defer or block broadcast delivery entirely,
     * including BOOT_COMPLETED, regardless of the service/receiver being
     * correctly declared and direct-boot-aware. That's a separate, deeper
     * restriction than anything fixable in this app's own manifest.
     */
    private fun handleIsIgnoringBatteryOptimizations(result: MethodChannel.Result) {
        val powerManager = context.getSystemService(Context.POWER_SERVICE) as PowerManager
        result.success(powerManager.isIgnoringBatteryOptimizations(context.packageName))
    }

    /**
     * Opens the system dialog asking the user to exempt this app from
     * battery optimization. Requires REQUEST_IGNORE_BATTERY_OPTIMIZATIONS
     * (declared in the manifest) — Google Play restricts this to apps with
     * a genuine ongoing-background-work justification, which a field-agent
     * location-tracking app has; it should only be triggered from a
     * screen that's already explained why (see
     * location_permission_screen.dart's call site), not fired unprompted.
     */
    private fun handleRequestBatteryOptimizationExemption(result: MethodChannel.Result) {
        val powerManager = context.getSystemService(Context.POWER_SERVICE) as PowerManager
        if (powerManager.isIgnoringBatteryOptimizations(context.packageName)) {
            result.success(true)
            return
        }

        try {
            val intent = Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS).apply {
                data = Uri.parse("package:${context.packageName}")
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            }
            context.startActivity(intent)
            result.success(false) // Dialog shown — caller re-checks status once the user responds.
        } catch (e: Exception) {
            result.error("UNAVAILABLE", "Could not open battery optimization dialog: $e", null)
        }
    }

    /**
     * Sourced entirely from the persisted stores rather than a live
     * `LocationTrackingService` reference — the service may not even be
     * running (e.g. the app was just reopened, before any restart has
     * happened), and this must reflect the last-known state regardless.
     * The geofence debug screen polls this for its "current state" panel;
     * [TrackingEventBridge.emitDebugLog] covers the live event feed.
     */
    private fun handleGetTrackingStatus(result: MethodChannel.Result) {
        val config = TrackingStateStore(context).load()
        val pendingCount = LocationQueueDb(context).pendingCount()
        val geofenceState = GeofenceStateStore(context).load()
        val isStill = MotionStateStore(context).load()

        result.success(
            mapOf(
                "tracking" to (config != null),
                "visitId" to config?.visitId,
                "outletName" to config?.outletName,
                "pendingPingCount" to pendingCount,
                "distanceMeters" to geofenceState.lastDistanceMeters,
                "geofenceRadiusMeters" to config?.geofenceRadiusMeters,
                "consecutiveOutside" to geofenceState.consecutiveOutside,
                "consecutiveInside" to geofenceState.consecutiveInside,
                "confirmedOutside" to geofenceState.confirmedOutside,
                "isStill" to isStill,
                "currentIntervalMs" to TrackingCadence.desiredIntervalMs(geofenceState.consecutiveOutside, isStill),
            ),
        )
    }

    companion object {
        private const val CHANNEL = "outlet_manager/tracking"
        private const val EVENT_CHANNEL = "outlet_manager/tracking_events"
    }
}
