package com.mikappliance.outletManager.location

import android.content.Context
import android.util.Log
import androidx.work.BackoffPolicy
import androidx.work.Constraints
import androidx.work.CoroutineWorker
import androidx.work.ExistingPeriodicWorkPolicy
import androidx.work.ExistingWorkPolicy
import androidx.work.NetworkType
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.PeriodicWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.WorkRequest
import androidx.work.WorkerParameters
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.json.JSONObject
import java.io.OutputStreamWriter
import java.net.HttpURLConnection
import java.net.URL
import java.util.concurrent.TimeUnit

/**
 * Drains [LocationQueueDb] and POSTs each row to the same
 * `/visits/location/ping` endpoint the rest of the app already uses (see
 * `location_ping_remote_datasource.dart` for the Dart-side contract this
 * mirrors). Runs both as an expedited one-off (fired right after each
 * capture, for prompt delivery) and as a periodic fallback (the actual
 * offline-catch-up net) — both share this same worker via
 * [LocationTrackingService].
 */
class LocationSyncWorker(context: Context, params: WorkerParameters) :
    CoroutineWorker(context, params) {

    override suspend fun doWork(): Result = withContext(Dispatchers.IO) {
        val config = TrackingStateStore(applicationContext).load()
            ?: return@withContext Result.success() // Clocked out — nothing to sync for.

        val queue = LocationQueueDb(applicationContext)
        val pending = queue.getPending()
        if (pending.isEmpty()) return@withContext Result.success()

        val tokenStore = SecureTokenStore(applicationContext)
        val accessToken = tokenStore.getValidAccessToken(config.apiBaseUrl)
        if (accessToken == null) {
            Log.w(TAG, "No usable access token, will retry")
            return@withContext Result.retry()
        }

        var syncedCount = 0
        var anyFailed = false
        for (ping in pending) {
            try {
                if (postPing(config.apiBaseUrl, accessToken, ping)) {
                    queue.markSynced(ping.devicePingId)
                    syncedCount++
                } else {
                    anyFailed = true
                }
            } catch (e: Exception) {
                Log.w(TAG, "Failed to sync ping ${ping.devicePingId}: $e")
                anyFailed = true
            }
        }

        TrackingEventBridge.emitDebugLog(
            "Sync: $syncedCount/${pending.size} pings delivered" +
                if (anyFailed) " (some failed, will retry)" else "",
        )

        if (anyFailed) Result.retry() else Result.success()
    }

    /** Returns true if the server accepted the ping (2xx, including a duplicate). */
    private fun postPing(apiBaseUrl: String, accessToken: String, ping: PendingPing): Boolean {
        val url = URL("$apiBaseUrl/visits/location/ping")
        val connection = (url.openConnection() as HttpURLConnection).apply {
            requestMethod = "POST"
            doOutput = true
            setRequestProperty("Content-Type", "application/json")
            setRequestProperty("Accept", "application/json")
            setRequestProperty("Authorization", "Bearer $accessToken")
            connectTimeout = 15_000
            readTimeout = 15_000
        }

        try {
            val body = JSONObject().apply {
                put("latitude", ping.latitude)
                put("longitude", ping.longitude)
                put("accuracy_meters", ping.accuracyMeters)
                ping.batteryLevel?.let { put("battery_level", it) }
                ping.isCharging?.let { put("is_charging", it) }
                ping.networkType?.let { put("network_type", it) }
                put("ping_source", ping.pingSource)
                put("recorded_at", ping.recordedAt)
                put("device_ping_id", ping.devicePingId)
            }
            OutputStreamWriter(connection.outputStream).use { it.write(body.toString()) }

            val status = connection.responseCode
            // 200 = recorded, 409/other dedup shapes are treated as success by
            // the existing Dart client too (`is_duplicate` in the response is
            // informational, not an error) — anything in the 2xx range here
            // means the backend has it.
            return status in 200..299
        } finally {
            connection.disconnect()
        }
    }

    companion object {
        private const val TAG = "LocationSyncWorker"
        private const val WORK_NAME_PERIODIC = "outlet_manager_location_sync_periodic"
        private const val WORK_NAME_EXPEDITED = "outlet_manager_location_sync_expedited"

        /** The durable offline-catch-up net — Android's own 15-minute floor for periodic work. */
        fun ensurePeriodicSync(context: Context) {
            val constraints = Constraints.Builder().setRequiredNetworkType(NetworkType.CONNECTED).build()
            val request = PeriodicWorkRequestBuilder<LocationSyncWorker>(15, TimeUnit.MINUTES)
                .setConstraints(constraints)
                .setBackoffCriteria(BackoffPolicy.EXPONENTIAL, WorkRequest.MIN_BACKOFF_MILLIS, TimeUnit.MILLISECONDS)
                .build()
            WorkManager.getInstance(context).enqueueUniquePeriodicWork(
                WORK_NAME_PERIODIC,
                ExistingPeriodicWorkPolicy.KEEP,
                request,
            )
        }

        fun cancelPeriodicSync(context: Context) {
            WorkManager.getInstance(context).cancelUniqueWork(WORK_NAME_PERIODIC)
        }

        /** Fired right after each capture for prompt delivery, on top of the periodic net. */
        fun enqueueExpedited(context: Context) {
            val constraints = Constraints.Builder().setRequiredNetworkType(NetworkType.CONNECTED).build()
            val request = OneTimeWorkRequestBuilder<LocationSyncWorker>()
                .setConstraints(constraints)
                .build()
            WorkManager.getInstance(context).enqueueUniqueWork(
                WORK_NAME_EXPEDITED,
                ExistingWorkPolicy.REPLACE,
                request,
            )
        }
    }
}
