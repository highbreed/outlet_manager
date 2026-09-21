package com.mikappliance.outletManager.location

import android.Manifest
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.os.BatteryManager
import android.os.Build
import android.os.IBinder
import android.os.Looper
import android.util.Log
import androidx.core.app.NotificationCompat
import androidx.core.content.ContextCompat
import com.google.android.gms.location.ActivityRecognition
import com.google.android.gms.location.ActivityTransition
import com.google.android.gms.location.ActivityTransitionRequest
import com.google.android.gms.location.DetectedActivity
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.location.LocationCallback
import com.google.android.gms.location.LocationRequest
import com.google.android.gms.location.LocationResult
import com.google.android.gms.location.LocationServices
import com.google.android.gms.location.Priority
import com.mikappliance.outletManager.MainActivity
import com.mikappliance.outletManager.R
import java.time.Instant
import java.time.format.DateTimeFormatter
import java.util.UUID
import kotlin.math.roundToInt

/**
 * Foreground service that owns the background location-tracking lifecycle for
 * an active clocked-in visit. Once started it keeps running independently of
 * the Flutter Activity — locking the screen, backgrounding the app, or the
 * app being swiped from Recents must not stop it (that's the whole reason
 * this exists: see the plan this implements for the chain of failures that
 * led here). Every captured fix is written to [LocationQueueDb] before any
 * network attempt, and a [LocationSyncWorker] run drains that queue.
 */
class LocationTrackingService : Service() {

    private lateinit var fusedLocationClient: FusedLocationProviderClient
    private lateinit var queue: LocationQueueDb
    private var locationCallback: LocationCallback? = null
    private var currentConfig: TrackingConfig? = null
    private var currentIntervalMs = TrackingCadence.DEFAULT_INTERVAL_MS
    private var hysteresisTracker = GeofenceHysteresisTracker()
    private var isStill = false

    override fun onCreate() {
        super.onCreate()
        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this)
        queue = LocationQueueDb(this)
        createNotificationChannel()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (intent?.action == ACTION_STOP) {
            stopTrackingAndSelf()
            return START_NOT_STICKY
        }

        if (intent?.action == ACTION_MOTION_UPDATE) {
            handleMotionUpdate(intent.getBooleanExtra(EXTRA_IS_STILL, false))
            return START_STICKY
        }

        // An explicit start (real extras from TrackingMethodChannel) means a
        // fresh clock-in — reset hysteresis rather than inheriting whatever
        // state a *previous* visit left behind. A null/extra-less intent
        // means the OS or BootReceiver recreated this service mid-session,
        // so the in-progress confirmation window must survive that restart.
        val isExplicitStart = intent?.hasExtra(EXTRA_VISIT_ID) == true
        val config = configFromIntent(intent) ?: TrackingStateStore(this).load()
        if (config == null) {
            // Restarted by the OS with nothing to restore (e.g. never
            // actually started, or already clocked out) — nothing to do.
            stopSelf()
            return START_NOT_STICKY
        }

        currentConfig = config
        hysteresisTracker = if (isExplicitStart) {
            GeofenceStateStore(this).clear()
            // Assume moving until Activity Recognition says otherwise —
            // carrying over a stale STILL reading from wherever the agent
            // was for their *previous* visit makes no sense for a new one.
            MotionStateStore(this).save(false)
            isStill = false
            GeofenceHysteresisTracker()
        } else {
            isStill = MotionStateStore(this).load()
            GeofenceHysteresisTracker(GeofenceStateStore(this).load())
        }

        TrackingStateStore(this).save(config)
        startForeground(NOTIFICATION_ID, buildNotification(config))
        startLocationUpdates(desiredIntervalMs())
        startMotionUpdates()
        LocationSyncWorker.ensurePeriodicSync(this)

        // START_STICKY: if Android kills this process under memory pressure,
        // it's recreated with a null intent — configFromIntent() then falls
        // back to TrackingStateStore, so tracking resumes with the same
        // config rather than being lost.
        return START_STICKY
    }

    /**
     * Handles a STILL enter/exit event forwarded from [MotionTransitionReceiver].
     * Reacts immediately rather than waiting for the next location fix — the
     * whole point is widening/narrowing the cadence as soon as the motion
     * state actually changes, not up to [DEFAULT_INTERVAL_MS] late.
     */
    private fun handleMotionUpdate(isStillNow: Boolean) {
        isStill = isStillNow
        TrackingEventBridge.emitDebugLog("Motion: STILL ${if (isStillNow) "entered" else "exited"}")

        // The service can be recreated by this broadcast alone if the
        // process died between location fixes — restore full state before
        // acting on it, same as the OS-restart path in onStartCommand.
        if (currentConfig == null) {
            val config = TrackingStateStore(this).load() ?: return
            currentConfig = config
            hysteresisTracker = GeofenceHysteresisTracker(GeofenceStateStore(this).load())
            startForeground(NOTIFICATION_ID, buildNotification(config))
            LocationSyncWorker.ensurePeriodicSync(this)
        }

        if (locationCallback == null) {
            startLocationUpdates(desiredIntervalMs())
        } else {
            restartLocationUpdates(desiredIntervalMs())
        }
    }

    override fun onDestroy() {
        stopLocationUpdates()
        super.onDestroy()
    }

    override fun onBind(intent: Intent?): IBinder? = null

    private fun configFromIntent(intent: Intent?): TrackingConfig? {
        if (intent == null || !intent.hasExtra(EXTRA_VISIT_ID)) return null
        val accessToken = intent.getStringExtra(EXTRA_ACCESS_TOKEN)
        val refreshToken = intent.getStringExtra(EXTRA_REFRESH_TOKEN)
        val expiresAt = intent.getLongExtra(EXTRA_ACCESS_EXPIRES_AT, 0L)
        if (accessToken != null && refreshToken != null) {
            SecureTokenStore(this).saveTokens(accessToken, refreshToken, expiresAt)
        }
        return TrackingConfig(
            visitId = intent.getStringExtra(EXTRA_VISIT_ID) ?: return null,
            outletName = intent.getStringExtra(EXTRA_OUTLET_NAME) ?: "Outlet",
            outletLatitude = intent.getDoubleExtra(EXTRA_OUTLET_LAT, 0.0),
            outletLongitude = intent.getDoubleExtra(EXTRA_OUTLET_LNG, 0.0),
            geofenceRadiusMeters = intent.getDoubleExtra(EXTRA_RADIUS, 50.0),
            apiBaseUrl = intent.getStringExtra(EXTRA_API_BASE_URL) ?: return null,
            startedAtEpochMillis = System.currentTimeMillis(),
        )
    }

    private fun startLocationUpdates(intervalMs: Long) {
        if (locationCallback != null) return // Already running.
        currentIntervalMs = intervalMs

        val request = LocationRequest.Builder(Priority.PRIORITY_BALANCED_POWER_ACCURACY, intervalMs)
            .setMinUpdateIntervalMillis(intervalMs)
            .build()

        val callback = object : LocationCallback() {
            override fun onLocationResult(result: LocationResult) {
                val location = result.lastLocation ?: return
                handleLocationResult(location)
            }
        }
        locationCallback = callback

        try {
            fusedLocationClient.requestLocationUpdates(request, callback, Looper.getMainLooper())
        } catch (e: SecurityException) {
            Log.w(TAG, "Location permission missing, stopping: $e")
            stopTrackingAndSelf()
        }
    }

    private fun stopLocationUpdates() {
        locationCallback?.let { fusedLocationClient.removeLocationUpdates(it) }
        locationCallback = null
    }

    /** Swaps the active [LocationRequest] cadence — used to poll faster once a geofence exit is confirmed. */
    private fun restartLocationUpdates(intervalMs: Long) {
        if (intervalMs == currentIntervalMs) return
        stopLocationUpdates()
        startLocationUpdates(intervalMs)
    }

    private fun desiredIntervalMs(): Long =
        TrackingCadence.desiredIntervalMs(hysteresisTracker.snapshot().consecutiveOutside, isStill)

    /**
     * Best-effort: requires the `ACTIVITY_RECOGNITION` runtime permission
     * (Android 10+), requested from `location_permission_screen.dart`
     * alongside the battery-optimization exemption. Its absence must not
     * block tracking — it only ever *widens* the cadence, so simply not
     * doing that and falling back to [DEFAULT_INTERVAL_MS] is a safe no-op.
     */
    private fun startMotionUpdates() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q &&
            ContextCompat.checkSelfPermission(this, Manifest.permission.ACTIVITY_RECOGNITION) !=
            PackageManager.PERMISSION_GRANTED
        ) {
            return
        }

        val transitions = listOf(
            ActivityTransition.Builder()
                .setActivityType(DetectedActivity.STILL)
                .setActivityTransition(ActivityTransition.ACTIVITY_TRANSITION_ENTER)
                .build(),
            ActivityTransition.Builder()
                .setActivityType(DetectedActivity.STILL)
                .setActivityTransition(ActivityTransition.ACTIVITY_TRANSITION_EXIT)
                .build(),
        )

        try {
            ActivityRecognition.getClient(this)
                .requestActivityTransitionUpdates(ActivityTransitionRequest(transitions), motionPendingIntent())
                .addOnFailureListener { e -> Log.w(TAG, "requestActivityTransitionUpdates failed: $e") }
        } catch (e: SecurityException) {
            Log.w(TAG, "ACTIVITY_RECOGNITION permission missing at request time: $e")
        }
    }

    private fun stopMotionUpdates() {
        try {
            ActivityRecognition.getClient(this).removeActivityTransitionUpdates(motionPendingIntent())
        } catch (e: SecurityException) {
            // Permission was revoked between requesting and removing — nothing to clean up on our end either way.
        }
    }

    private fun motionPendingIntent(): PendingIntent {
        val intent = Intent(this, MotionTransitionReceiver::class.java)
        val flags = PendingIntent.FLAG_UPDATE_CURRENT or
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) PendingIntent.FLAG_MUTABLE else 0
        return PendingIntent.getBroadcast(this, MOTION_REQUEST_CODE, intent, flags)
    }

    private fun handleLocationResult(location: android.location.Location) {
        val config = currentConfig ?: return

        val distanceMeters = FloatArray(1).also {
            android.location.Location.distanceBetween(
                location.latitude,
                location.longitude,
                config.outletLatitude,
                config.outletLongitude,
                it,
            )
        }[0].toDouble()

        val transition = hysteresisTracker.evaluate(distanceMeters, config.geofenceRadiusMeters)
        val snapshot = hysteresisTracker.snapshot()
        GeofenceStateStore(this).save(snapshot)

        val pingSource = when (transition) {
            GeofenceHysteresisTracker.Transition.None -> "background"
            else -> "geofence_event"
        }

        // Poll faster the moment ANY reading lands outside the buffer — not
        // just once fully confirmed — so the 2-reading/3-minute
        // confirmation window itself elapses in under a minute instead of
        // spanning multiple 5-minute cycles. Confirmed re-entry (which
        // resets state entirely) is the only thing that drops back to
        // normal-or-stationary cadence — see [desiredIntervalMs].
        restartLocationUpdates(desiredIntervalMs())

        val ping = PendingPing(
            devicePingId = UUID.randomUUID().toString(),
            latitude = location.latitude,
            longitude = location.longitude,
            accuracyMeters = location.accuracy.toDouble(),
            batteryLevel = batteryLevel(),
            isCharging = isCharging(),
            networkType = networkType(),
            pingSource = pingSource,
            recordedAt = DateTimeFormatter.ISO_INSTANT.format(Instant.now()),
        )
        queue.insertPending(ping)
        LocationSyncWorker.enqueueExpedited(this@LocationTrackingService)

        val distanceRounded = distanceMeters.roundToInt()
        val radiusRounded = config.geofenceRadiusMeters.roundToInt()
        TrackingEventBridge.emitDebugLog(
            "Fix: dist=${distanceRounded}m radius=${radiusRounded}m " +
                "acc=${location.accuracy.roundToInt()}m interval=${currentIntervalMs / 1000}s " +
                "ping=$pingSource still=$isStill",
        )

        when (transition) {
            GeofenceHysteresisTracker.Transition.ExitConfirmed -> {
                Log.i(TAG, "Geofence exit confirmed for visit ${config.visitId} (distance=${distanceMeters}m)")
                TrackingEventBridge.emitDebugLog("EXIT confirmed (dist=${distanceRounded}m)")
                TrackingEventBridge.emitGeofenceTransition("exit", config.visitId, config.outletName, distanceMeters)
            }
            GeofenceHysteresisTracker.Transition.ReentryConfirmed -> {
                Log.i(TAG, "Geofence re-entry confirmed for visit ${config.visitId}")
                TrackingEventBridge.emitDebugLog("RE-ENTRY confirmed (dist=${distanceRounded}m)")
                TrackingEventBridge.emitGeofenceTransition("reentry", config.visitId, config.outletName, distanceMeters)
            }
            GeofenceHysteresisTracker.Transition.None -> {}
        }
    }

    private fun stopTrackingAndSelf() {
        stopLocationUpdates()
        stopMotionUpdates()
        TrackingStateStore(this).clear()
        GeofenceStateStore(this).clear()
        MotionStateStore(this).clear()
        LocationSyncWorker.cancelPeriodicSync(this)
        stopForeground(STOP_FOREGROUND_REMOVE)
        stopSelf()
    }

    private fun createNotificationChannel() {
        val channel = NotificationChannel(
            CHANNEL_ID,
            "Location Tracking",
            NotificationManager.IMPORTANCE_LOW,
        ).apply {
            description = "Shown while tracking your location for an active outlet visit"
            setShowBadge(false)
        }
        getSystemService(NotificationManager::class.java).createNotificationChannel(channel)
    }

    private fun buildNotification(config: TrackingConfig): Notification {
        val openAppIntent = packageManager.getLaunchIntentForPackage(packageName)?.apply {
            setPackage(null)
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED
        }
        val pendingIntentFlags = PendingIntent.FLAG_UPDATE_CURRENT or
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) PendingIntent.FLAG_IMMUTABLE else 0
        val contentIntent = openAppIntent?.let {
            PendingIntent.getActivity(this, 0, it, pendingIntentFlags)
        }

        return NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle("Active Session")
            .setContentText("Tracking your location for ${config.outletName}")
            .setSmallIcon(R.mipmap.launcher_icon)
            .setOngoing(true)
            .setContentIntent(contentIntent)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .build()
    }

    private fun batteryLevel(): Int? {
        val bm = getSystemService(Context.BATTERY_SERVICE) as? BatteryManager ?: return null
        val level = bm.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        return if (level in 0..100) level else null
    }

    private fun isCharging(): Boolean? {
        val bm = getSystemService(Context.BATTERY_SERVICE) as? BatteryManager ?: return null
        return bm.isCharging
    }

    private fun networkType(): String? {
        val cm = getSystemService(Context.CONNECTIVITY_SERVICE) as? ConnectivityManager ?: return null
        val network = cm.activeNetwork ?: return "none"
        val capabilities = cm.getNetworkCapabilities(network) ?: return "none"
        return when {
            capabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) -> "wifi"
            capabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) -> "cellular"
            capabilities.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET) -> "ethernet"
            else -> "other"
        }
    }

    companion object {
        private const val TAG = "LocationTrackingService"
        private const val CHANNEL_ID = "outlet_manager_tracking"
        private const val NOTIFICATION_ID = 384711
        private const val MOTION_REQUEST_CODE = 4821

        const val ACTION_STOP = "com.mikappliance.outletManager.location.STOP"
        const val ACTION_MOTION_UPDATE = "com.mikappliance.outletManager.location.MOTION_UPDATE"
        const val EXTRA_IS_STILL = "is_still"
        const val EXTRA_VISIT_ID = "visit_id"
        const val EXTRA_OUTLET_NAME = "outlet_name"
        const val EXTRA_OUTLET_LAT = "outlet_lat"
        const val EXTRA_OUTLET_LNG = "outlet_lng"
        const val EXTRA_RADIUS = "radius"
        const val EXTRA_API_BASE_URL = "api_base_url"
        const val EXTRA_ACCESS_TOKEN = "access_token"
        const val EXTRA_REFRESH_TOKEN = "refresh_token"
        const val EXTRA_ACCESS_EXPIRES_AT = "access_expires_at"

        fun start(context: Context, config: TrackingConfig, accessToken: String, refreshToken: String, accessExpiresAtEpochMillis: Long) {
            val intent = Intent(context, LocationTrackingService::class.java).apply {
                putExtra(EXTRA_VISIT_ID, config.visitId)
                putExtra(EXTRA_OUTLET_NAME, config.outletName)
                putExtra(EXTRA_OUTLET_LAT, config.outletLatitude)
                putExtra(EXTRA_OUTLET_LNG, config.outletLongitude)
                putExtra(EXTRA_RADIUS, config.geofenceRadiusMeters)
                putExtra(EXTRA_API_BASE_URL, config.apiBaseUrl)
                putExtra(EXTRA_ACCESS_TOKEN, accessToken)
                putExtra(EXTRA_REFRESH_TOKEN, refreshToken)
                putExtra(EXTRA_ACCESS_EXPIRES_AT, accessExpiresAtEpochMillis)
            }
            ContextCompat.startForegroundService(context, intent)
        }

        /** Used by [BootReceiver] — config is read from [TrackingStateStore], not extras. */
        fun startFromPersistedState(context: Context) {
            ContextCompat.startForegroundService(context, Intent(context, LocationTrackingService::class.java))
        }

        fun stop(context: Context) {
            val intent = Intent(context, LocationTrackingService::class.java).apply {
                action = ACTION_STOP
            }
            ContextCompat.startForegroundService(context, intent)
        }
    }
}
