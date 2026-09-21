package com.mikappliance.outletManager.location

import android.content.Context

/**
 * Persists the active tracking config in plain (non-encrypted) SharedPreferences —
 * it holds no credentials, just outlet/visit coordinates the service needs to
 * survive process death and device reboot (see [BootReceiver]). Auth tokens live
 * separately in [SecureTokenStore].
 *
 * Lives in Device Protected storage (see [deviceProtectedContext]) so
 * [BootReceiver] can read it — and so tracking can actually resume — even
 * before the user's first unlock after a reboot.
 */
class TrackingStateStore(context: Context) {
    private val prefs =
        deviceProtectedContext(context).getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

    fun save(config: TrackingConfig) {
        prefs.edit()
            .putBoolean(KEY_ACTIVE, true)
            .putString(KEY_VISIT_ID, config.visitId)
            .putString(KEY_OUTLET_NAME, config.outletName)
            .putFloat(KEY_OUTLET_LAT, config.outletLatitude.toFloat())
            .putFloat(KEY_OUTLET_LNG, config.outletLongitude.toFloat())
            .putFloat(KEY_RADIUS, config.geofenceRadiusMeters.toFloat())
            .putString(KEY_API_BASE_URL, config.apiBaseUrl)
            .putLong(KEY_STARTED_AT, config.startedAtEpochMillis)
            .apply()
    }

    fun load(): TrackingConfig? {
        if (!prefs.getBoolean(KEY_ACTIVE, false)) return null
        val apiBaseUrl = prefs.getString(KEY_API_BASE_URL, null) ?: return null
        val visitId = prefs.getString(KEY_VISIT_ID, null) ?: return null
        return TrackingConfig(
            visitId = visitId,
            outletName = prefs.getString(KEY_OUTLET_NAME, "Outlet") ?: "Outlet",
            outletLatitude = prefs.getFloat(KEY_OUTLET_LAT, 0f).toDouble(),
            outletLongitude = prefs.getFloat(KEY_OUTLET_LNG, 0f).toDouble(),
            geofenceRadiusMeters = prefs.getFloat(KEY_RADIUS, 50f).toDouble(),
            apiBaseUrl = apiBaseUrl,
            startedAtEpochMillis = prefs.getLong(KEY_STARTED_AT, System.currentTimeMillis()),
        )
    }

    fun isActive(): Boolean = prefs.getBoolean(KEY_ACTIVE, false)

    fun clear() {
        prefs.edit().putBoolean(KEY_ACTIVE, false).apply()
    }

    companion object {
        private const val PREFS_NAME = "outlet_manager_tracking_state"
        private const val KEY_ACTIVE = "active"
        private const val KEY_VISIT_ID = "visit_id"
        private const val KEY_OUTLET_NAME = "outlet_name"
        private const val KEY_OUTLET_LAT = "outlet_lat"
        private const val KEY_OUTLET_LNG = "outlet_lng"
        private const val KEY_RADIUS = "radius"
        private const val KEY_API_BASE_URL = "api_base_url"
        private const val KEY_STARTED_AT = "started_at"
    }
}
