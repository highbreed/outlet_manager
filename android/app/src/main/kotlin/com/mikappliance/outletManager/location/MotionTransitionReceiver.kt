package com.mikappliance.outletManager.location

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log
import androidx.core.content.ContextCompat
import com.google.android.gms.location.ActivityTransition
import com.google.android.gms.location.ActivityTransitionResult
import com.google.android.gms.location.DetectedActivity

/**
 * Receives STILL enter/exit events from [LocationTrackingService.startMotionUpdates].
 * Purely advisory — [MotionStateStore] is updated unconditionally so a later
 * service restart still knows the last classification, but the ping
 * cadence itself (`LocationTrackingService.desiredIntervalMs`) only widens
 * when *inside* the geofence; a STILL reading right outside it is not
 * treated as "safe to slow down."
 */
class MotionTransitionReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (!ActivityTransitionResult.hasResult(intent)) return
        val result = ActivityTransitionResult.extractResult(intent) ?: return

        // Batches can contain multiple events; only STILL enter/exit affects
        // our cadence, and only the most recent one in the batch matters.
        val stillEvent = result.transitionEvents.lastOrNull { it.activityType == DetectedActivity.STILL }
            ?: return
        val isStill = stillEvent.transitionType == ActivityTransition.ACTIVITY_TRANSITION_ENTER

        Log.d(TAG, "STILL transition: isStill=$isStill")
        MotionStateStore(context).save(isStill)

        // Only forward to the service if a session is actually active —
        // otherwise this would restart a foreground service (and its
        // notification) after the agent has already clocked out, e.g. in
        // the narrow window before stopTrackingAndSelf() gets around to
        // unregistering activity updates.
        if (TrackingStateStore(context).isActive()) {
            val serviceIntent = Intent(context, LocationTrackingService::class.java).apply {
                action = LocationTrackingService.ACTION_MOTION_UPDATE
                putExtra(LocationTrackingService.EXTRA_IS_STILL, isStill)
            }
            ContextCompat.startForegroundService(context, serviceIntent)
        }
    }

    companion object {
        private const val TAG = "MotionTransitionReceiver"
    }
}
