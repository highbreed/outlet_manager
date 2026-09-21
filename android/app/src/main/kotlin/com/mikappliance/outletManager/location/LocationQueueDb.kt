package com.mikappliance.outletManager.location

import android.content.ContentValues
import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper

/** One captured, not-yet-confirmed-synced location ping. */
data class PendingPing(
    val devicePingId: String,
    val latitude: Double,
    val longitude: Double,
    val accuracyMeters: Double,
    val batteryLevel: Int?,
    val isCharging: Boolean?,
    val networkType: String?,
    val pingSource: String,
    val recordedAt: String,
)

/**
 * Local-first offline queue for the native tracking service, mirroring
 * `LocationPingModel`/`LocationPingLocalDataSource` (Isar, Dart side) in
 * shape and intent: a capture always lands here before any network attempt,
 * and a row is only removed once the server has confirmed it. This is a
 * separate store rather than a native Isar binding — Isar has no supported
 * Kotlin API — reconciling the two is a Phase 2 concern, not required for
 * the reliability guarantee this phase exists to prove.
 *
 * Lives in Device Protected storage (see [deviceProtectedContext]) — a
 * capture right after a reboot, before the user has unlocked, still needs
 * somewhere to land. [SecureTokenStore]'s tokens aren't readable that
 * early regardless, so sync naturally just waits for first unlock; nothing
 * captured is lost in the meantime.
 */
class LocationQueueDb(context: Context) :
    SQLiteOpenHelper(deviceProtectedContext(context), DB_NAME, null, DB_VERSION) {

    override fun onCreate(db: SQLiteDatabase) {
        db.execSQL(
            """
            CREATE TABLE $TABLE (
                $COL_DEVICE_PING_ID TEXT PRIMARY KEY,
                $COL_LATITUDE REAL NOT NULL,
                $COL_LONGITUDE REAL NOT NULL,
                $COL_ACCURACY REAL NOT NULL,
                $COL_BATTERY_LEVEL INTEGER,
                $COL_IS_CHARGING INTEGER,
                $COL_NETWORK_TYPE TEXT,
                $COL_PING_SOURCE TEXT NOT NULL,
                $COL_RECORDED_AT TEXT NOT NULL,
                $COL_CREATED_AT INTEGER NOT NULL
            )
            """.trimIndent(),
        )
    }

    override fun onUpgrade(db: SQLiteDatabase, oldVersion: Int, newVersion: Int) {
        db.execSQL("DROP TABLE IF EXISTS $TABLE")
        onCreate(db)
    }

    fun insertPending(ping: PendingPing) {
        val values = ContentValues().apply {
            put(COL_DEVICE_PING_ID, ping.devicePingId)
            put(COL_LATITUDE, ping.latitude)
            put(COL_LONGITUDE, ping.longitude)
            put(COL_ACCURACY, ping.accuracyMeters)
            ping.batteryLevel?.let { put(COL_BATTERY_LEVEL, it) }
            ping.isCharging?.let { put(COL_IS_CHARGING, if (it) 1 else 0) }
            ping.networkType?.let { put(COL_NETWORK_TYPE, it) }
            put(COL_PING_SOURCE, ping.pingSource)
            put(COL_RECORDED_AT, ping.recordedAt)
            put(COL_CREATED_AT, System.currentTimeMillis())
        }
        writableDatabase.insertWithOnConflict(
            TABLE,
            null,
            values,
            SQLiteDatabase.CONFLICT_IGNORE,
        )
    }

    fun getPending(limit: Int = 50): List<PendingPing> {
        val results = mutableListOf<PendingPing>()
        readableDatabase.query(
            TABLE,
            null,
            null,
            null,
            null,
            null,
            "$COL_CREATED_AT ASC",
            limit.toString(),
        ).use { cursor ->
            while (cursor.moveToNext()) {
                results.add(
                    PendingPing(
                        devicePingId = cursor.getString(cursor.getColumnIndexOrThrow(COL_DEVICE_PING_ID)),
                        latitude = cursor.getDouble(cursor.getColumnIndexOrThrow(COL_LATITUDE)),
                        longitude = cursor.getDouble(cursor.getColumnIndexOrThrow(COL_LONGITUDE)),
                        accuracyMeters = cursor.getDouble(cursor.getColumnIndexOrThrow(COL_ACCURACY)),
                        batteryLevel = cursor.getColumnIndexOrThrow(COL_BATTERY_LEVEL)
                            .let { if (cursor.isNull(it)) null else cursor.getInt(it) },
                        isCharging = cursor.getColumnIndexOrThrow(COL_IS_CHARGING)
                            .let { if (cursor.isNull(it)) null else cursor.getInt(it) == 1 },
                        networkType = cursor.getColumnIndexOrThrow(COL_NETWORK_TYPE)
                            .let { if (cursor.isNull(it)) null else cursor.getString(it) },
                        pingSource = cursor.getString(cursor.getColumnIndexOrThrow(COL_PING_SOURCE)),
                        recordedAt = cursor.getString(cursor.getColumnIndexOrThrow(COL_RECORDED_AT)),
                    ),
                )
            }
        }
        return results
    }

    fun markSynced(devicePingId: String) {
        writableDatabase.delete(TABLE, "$COL_DEVICE_PING_ID = ?", arrayOf(devicePingId))
    }

    fun pendingCount(): Int {
        readableDatabase.rawQuery("SELECT COUNT(*) FROM $TABLE", null).use { cursor ->
            cursor.moveToFirst()
            return cursor.getInt(0)
        }
    }

    companion object {
        private const val DB_NAME = "outlet_manager_tracking_queue.db"
        private const val DB_VERSION = 1
        private const val TABLE = "pending_pings"
        private const val COL_DEVICE_PING_ID = "device_ping_id"
        private const val COL_LATITUDE = "latitude"
        private const val COL_LONGITUDE = "longitude"
        private const val COL_ACCURACY = "accuracy"
        private const val COL_BATTERY_LEVEL = "battery_level"
        private const val COL_IS_CHARGING = "is_charging"
        private const val COL_NETWORK_TYPE = "network_type"
        private const val COL_PING_SOURCE = "ping_source"
        private const val COL_RECORDED_AT = "recorded_at"
        private const val COL_CREATED_AT = "created_at"
    }
}
