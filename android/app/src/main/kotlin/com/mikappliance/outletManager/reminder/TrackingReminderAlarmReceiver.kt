package com.mikappliance.outletManager.reminder

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

/**
 * Fires on each repeat of the tracking reminder — scheduled by
 * [TrackingReminderScheduler.scheduleNext], self-rescheduling on every
 * firing until the app is reopened ([MainActivity] cancels it) or the
 * safety cap elapses.
 */
class TrackingReminderAlarmReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        TrackingReminderScheduler.showReminderAndScheduleNext(context)
    }
}
