package com.mikappliance.outletManager.location

import android.content.Context

/**
 * Persists the last motion classification [MotionTransitionReceiver] saw,
 * so [LocationTrackingService] knows whether to poll at the widened
 * stationary cadence right after a process restart, before any new
 * Activity Recognition event has arrived. Device Protected storage, same
 * reasoning as [TrackingStateStore]/[GeofenceStateStore] — a restart can
 * happen pre-unlock.
 */
class MotionStateStore(context: Context) {
    private val prefs =
        deviceProtectedContext(context).getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

    fun save(isStill: Boolean) {
        prefs.edit().putBoolean(KEY_IS_STILL, isStill).apply()
    }

    /** Defaults to `false` (assume moving) — the safer default until the first real classification arrives. */
    fun load(): Boolean = prefs.getBoolean(KEY_IS_STILL, false)

    fun clear() {
        prefs.edit().clear().apply()
    }

    companion object {
        private const val PREFS_NAME = "outlet_manager_motion_state"
        private const val KEY_IS_STILL = "is_still"
    }
}
