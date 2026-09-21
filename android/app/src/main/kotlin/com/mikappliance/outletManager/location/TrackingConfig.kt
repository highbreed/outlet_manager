package com.mikappliance.outletManager.location

/** Everything the native tracking service needs to run without Flutter alive. */
data class TrackingConfig(
    val visitId: String,
    val outletName: String,
    val outletLatitude: Double,
    val outletLongitude: Double,
    val geofenceRadiusMeters: Double,
    val apiBaseUrl: String,
    val startedAtEpochMillis: Long,
)
