package com.mikappliance.outletManager.reminder

import android.app.AlarmManager
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.media.AudioAttributes
import android.media.RingtoneManager
import android.os.Build
import androidx.core.app.NotificationCompat

/**
 * Reminds the user to reopen the app after a device reboot, while a visit
 * is still supposed to be tracked.
 *
 * Why this exists: confirmed on-device that after a reboot, if the app is
 * never reopened, it's stuck at Android's "RCVR" background-execution
 * tier — the OS denies `startForegroundService()` outright unless a
 * narrow (20s) geofence-triggered exemption window is open, and once the
 * screen goes off long enough for Doze to engage, even that stops working
 * and pings cease. There is no way to fix this from Dart/the plugin's own
 * headless dispatch — both run under the same restricted tier. A plain
 * *notification* (not a foreground service) has no such restriction, so
 * this is deliberately pure native Kotlin, triggered straight from
 * [RebootTrackingReminderReceiver]'s `BOOT_COMPLETED` handling.
 *
 * Not a true looping alarm-clock sound — that would need a foreground
 * service to loop a `MediaPlayer`, which runs into the exact same
 * background-service-start restriction this exists to route around.
 * Instead: a full-screen, `CATEGORY_ALARM` notification (sound played
 * once by the system's own notification pipeline, no service needed),
 * repeating via [AlarmManager] every [repeatIntervalMs] until either the
 * app is reopened ([MainActivity] cancels on `onCreate`) or
 * [maxDurationMs] elapses (matches the device-location token's 24h TTL —
 * pings would stop working past that point regardless).
 */
object TrackingReminderScheduler {
    private const val PREFS_NAME = "tracking_reminder_prefs"
    private const val KEY_ACTIVE = "active"
    private const val KEY_STARTED_AT = "started_at_millis"

    private const val CHANNEL_ID = "outlet_manager_reboot_alarm"
    private const val NOTIFICATION_ID = 778821
    const val ACTION_REMIND = "com.mikappliance.outletManager.ACTION_TRACKING_REMINDER"

    private const val repeatIntervalMs = 5 * 60 * 1000L // 5 minutes
    private const val maxDurationMs = 24 * 60 * 60 * 1000L // safety cap

    /** Called from Dart via MethodChannel on startTracking()/stopTracking(). */
    fun setActive(context: Context, active: Boolean) {
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        if (active) {
            prefs.edit()
                .putBoolean(KEY_ACTIVE, true)
                .putLong(KEY_STARTED_AT, System.currentTimeMillis())
                .apply()
        } else {
            prefs.edit().putBoolean(KEY_ACTIVE, false).apply()
            cancel(context)
        }
    }

    /** Called on BOOT_COMPLETED and on each repeat alarm firing. */
    fun showReminderAndScheduleNext(context: Context) {
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        if (!prefs.getBoolean(KEY_ACTIVE, false)) return

        val startedAt = prefs.getLong(KEY_STARTED_AT, System.currentTimeMillis())
        if (System.currentTimeMillis() - startedAt > maxDurationMs) {
            // Given up — matches the device-location token's own TTL, past
            // which pings would stop landing regardless of this reminder.
            setActive(context, false)
            return
        }

        showNotification(context)
        scheduleNext(context)
    }

    /** Called from MainActivity.onCreate() — the app was reopened. */
    fun cancel(context: Context) {
        val intent = Intent(context, TrackingReminderAlarmReceiver::class.java).apply {
            action = ACTION_REMIND
        }
        val pendingIntent = PendingIntent.getBroadcast(
            context,
            0,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )
        (context.getSystemService(Context.ALARM_SERVICE) as AlarmManager).cancel(pendingIntent)
        (context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager)
            .cancel(NOTIFICATION_ID)
    }

    private fun scheduleNext(context: Context) {
        val intent = Intent(context, TrackingReminderAlarmReceiver::class.java).apply {
            action = ACTION_REMIND
        }
        val pendingIntent = PendingIntent.getBroadcast(
            context,
            0,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )
        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val triggerAt = System.currentTimeMillis() + repeatIntervalMs

        // SCHEDULE_EXACT_ALARM requires the user to grant it via Settings
        // (Android 12+) — fall back to inexact scheduling rather than
        // crash or silently do nothing if it's not granted. A reminder a
        // few minutes late is still far better than none.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && !alarmManager.canScheduleExactAlarms()) {
            alarmManager.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, triggerAt, pendingIntent)
        } else {
            alarmManager.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, triggerAt, pendingIntent)
        }
    }

    private fun showNotification(context: Context) {
        val notificationManager =
            context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val audioAttributes = AudioAttributes.Builder()
                .setUsage(AudioAttributes.USAGE_ALARM)
                .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                .build()
            val alarmSound = RingtoneManager.getActualDefaultRingtoneUri(
                context,
                RingtoneManager.TYPE_ALARM,
            ) ?: RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION)

            val channel = NotificationChannel(
                CHANNEL_ID,
                "Resume Location Tracking",
                NotificationManager.IMPORTANCE_HIGH,
            ).apply {
                description = "Reminds you to reopen the app so location tracking can " +
                    "resume after your device restarts"
                setSound(alarmSound, audioAttributes)
                enableVibration(true)
                vibrationPattern = longArrayOf(0, 1000, 500, 1000)
                lockscreenVisibility = Notification.VISIBILITY_PUBLIC
            }
            notificationManager.createNotificationChannel(channel)
        }

        val launchIntent = context.packageManager.getLaunchIntentForPackage(context.packageName)
            ?.apply {
                flags = Intent.FLAG_ACTIVITY_NEW_TASK or
                    Intent.FLAG_ACTIVITY_CLEAR_TOP or
                    Intent.FLAG_ACTIVITY_SINGLE_TOP
            }
        val contentPendingIntent = PendingIntent.getActivity(
            context,
            0,
            launchIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )

        val notification = NotificationCompat.Builder(context, CHANNEL_ID)
            .setSmallIcon(context.applicationInfo.icon)
            .setContentTitle("Reopen Outlet Manager")
            .setContentText(
                "Location tracking stopped after your device restarted — " +
                    "open the app to resume it.",
            )
            .setCategory(NotificationCompat.CATEGORY_ALARM)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setFullScreenIntent(contentPendingIntent, true)
            .setContentIntent(contentPendingIntent)
            .setAutoCancel(true)
            .build()

        notificationManager.notify(NOTIFICATION_ID, notification)
    }
}
