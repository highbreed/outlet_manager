package com.mikappliance.outletManager

import android.app.NotificationManager
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.provider.Settings
import com.mikappliance.outletManager.reminder.TrackingReminderScheduler
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val channelName = "outlet_manager/tracking_reminder"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // The app was just opened — whatever brought it here (a tap on
        // the reboot reminder, or just the user launching it normally),
        // there's no need to keep nagging. See TrackingReminderScheduler's
        // doc comment for the full story.
        TrackingReminderScheduler.cancel(this)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName).setMethodCallHandler {
            call, result ->
            when (call.method) {
                "setActive" -> {
                    val active = call.argument<Boolean>("active") ?: false
                    TrackingReminderScheduler.setActive(this, active)
                    result.success(null)
                }
                "isFullScreenIntentPermissionGranted" -> {
                    result.success(isFullScreenIntentPermissionGranted())
                }
                "requestFullScreenIntentPermission" -> {
                    requestFullScreenIntentPermission()
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun isFullScreenIntentPermissionGranted(): Boolean {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.UPSIDE_DOWN_CAKE) return true
        val notificationManager = getSystemService(NotificationManager::class.java)
        return notificationManager.canUseFullScreenIntent()
    }

    /**
     * Android 14+ only: opens the system screen where the user grants
     * "Full screen intents" access — without it, the reboot reminder's
     * full-screen alarm notification silently downgrades to a normal
     * heads-up notification instead of taking over the screen.
     */
    private fun requestFullScreenIntentPermission() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.UPSIDE_DOWN_CAKE) return
        val intent = Intent(
            Settings.ACTION_MANAGE_APP_USE_FULL_SCREEN_INTENT,
            Uri.parse("package:$packageName"),
        )
        startActivity(intent)
    }
}
