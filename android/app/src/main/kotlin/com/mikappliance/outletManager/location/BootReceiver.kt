package com.mikappliance.outletManager.location

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

/**
 * Restarts tracking after a device reboot if the agent was still clocked in
 * when it happened. Does nothing if they'd already clocked out —
 * [TrackingStateStore] only reports active when a session is genuinely open.
 */
class BootReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        // Unconditional — logged before the action check specifically so
        // "onReceive never ran at all" is distinguishable from "it ran and
        // decided there was nothing to restore," which previously looked
        // identical (total silence) in logcat either way.
        Log.d(TAG, "onReceive: action=${intent.action}")

        if (intent.action != Intent.ACTION_BOOT_COMPLETED) return

        try {
            val isActive = TrackingStateStore(context).isActive()
            Log.d(TAG, "TrackingStateStore.isActive() = $isActive")
            if (isActive) {
                Log.d(TAG, "Restoring tracking after boot")
                LocationTrackingService.startFromPersistedState(context)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Failed to restore tracking after boot: $e", e)
        }
    }

    companion object {
        private const val TAG = "BootReceiver"
    }
}
