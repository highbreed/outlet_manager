package com.mikappliance.outletManager.reminder

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

/**
 * Fires on `BOOT_COMPLETED`. If a visit was active when the device shut
 * down (see [TrackingReminderScheduler.setActive]), immediately reminds
 * the user to reopen the app and starts the repeating reminder chain —
 * see [TrackingReminderScheduler]'s doc comment for why this can't just
 * be handled in Dart.
 */
class RebootTrackingReminderReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action != Intent.ACTION_BOOT_COMPLETED) return
        TrackingReminderScheduler.showReminderAndScheduleNext(context)
    }
}
