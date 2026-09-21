package com.mikappliance.outletManager.location

/**
 * Single source of truth for the ping-interval decision — used by both
 * [LocationTrackingService] (to actually drive [android.location.LocationRequest])
 * and [TrackingMethodChannel] (to describe the *current* cadence for the
 * geofence debug screen, without needing a live reference to the service).
 */
object TrackingCadence {
    const val DEFAULT_INTERVAL_MS = 5 * 60 * 1000L // 5 minutes, matches normal heartbeat cadence.
    const val FAST_INTERVAL_MS = 30 * 1000L // While any reading lands outside the geofence buffer.
    const val STILL_INTERVAL_MS = 15 * 60 * 1000L // While Activity Recognition confirms STILL and we're inside the geofence.

    /**
     * The geofence signal always wins: any reading outside the buffer means
     * fast polling regardless of motion state (a STILL classification right
     * outside the outlet isn't "safe to slow down"). Otherwise, a confirmed
     * STILL reading widens the interval past [DEFAULT_INTERVAL_MS].
     */
    fun desiredIntervalMs(consecutiveOutside: Int, isStill: Boolean): Long = when {
        consecutiveOutside > 0 -> FAST_INTERVAL_MS
        isStill -> STILL_INTERVAL_MS
        else -> DEFAULT_INTERVAL_MS
    }
}
