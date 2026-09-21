package com.mikappliance.outletManager.location

import android.content.Context

/**
 * Persists [GeofenceHysteresisTracker.GeofenceState] across process death —
 * `LocationTrackingService` is `START_STICKY`, so Android can recreate it
 * mid-confirmation-window (e.g. one reading into a two-reading exit
 * confirmation) and without this the count would silently reset to zero,
 * letting a real exit slip past undetected for another cycle.
 *
 * Device Protected storage (see [deviceProtectedContext]), same as
 * [TrackingStateStore] — a [BootReceiver] restart can happen before unlock,
 * and this must be readable then too.
 */
class GeofenceStateStore(context: Context) {
    private val prefs =
        deviceProtectedContext(context).getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

    fun save(state: GeofenceHysteresisTracker.GeofenceState) {
        prefs.edit()
            .putBoolean(KEY_CONFIRMED_OUTSIDE, state.confirmedOutside)
            .putInt(KEY_CONSECUTIVE_OUTSIDE, state.consecutiveOutside)
            .putInt(KEY_CONSECUTIVE_INSIDE, state.consecutiveInside)
            .apply {
                if (state.firstOutsideAtEpochMillis != null) {
                    putLong(KEY_FIRST_OUTSIDE_AT, state.firstOutsideAtEpochMillis)
                } else {
                    remove(KEY_FIRST_OUTSIDE_AT)
                }
                if (state.lastDistanceMeters != null) {
                    putFloat(KEY_LAST_DISTANCE, state.lastDistanceMeters.toFloat())
                } else {
                    remove(KEY_LAST_DISTANCE)
                }
            }
            .apply()
    }

    fun load(): GeofenceHysteresisTracker.GeofenceState = GeofenceHysteresisTracker.GeofenceState(
        confirmedOutside = prefs.getBoolean(KEY_CONFIRMED_OUTSIDE, false),
        consecutiveOutside = prefs.getInt(KEY_CONSECUTIVE_OUTSIDE, 0),
        consecutiveInside = prefs.getInt(KEY_CONSECUTIVE_INSIDE, 0),
        firstOutsideAtEpochMillis = if (prefs.contains(KEY_FIRST_OUTSIDE_AT)) {
            prefs.getLong(KEY_FIRST_OUTSIDE_AT, 0L)
        } else {
            null
        },
        lastDistanceMeters = if (prefs.contains(KEY_LAST_DISTANCE)) {
            prefs.getFloat(KEY_LAST_DISTANCE, 0f).toDouble()
        } else {
            null
        },
    )

    fun clear() {
        prefs.edit().clear().apply()
    }

    companion object {
        private const val PREFS_NAME = "outlet_manager_geofence_state"
        private const val KEY_CONFIRMED_OUTSIDE = "confirmed_outside"
        private const val KEY_CONSECUTIVE_OUTSIDE = "consecutive_outside"
        private const val KEY_CONSECUTIVE_INSIDE = "consecutive_inside"
        private const val KEY_FIRST_OUTSIDE_AT = "first_outside_at"
        private const val KEY_LAST_DISTANCE = "last_distance_meters"
    }
}
