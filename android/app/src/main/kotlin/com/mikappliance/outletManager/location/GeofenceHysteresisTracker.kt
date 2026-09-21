package com.mikappliance.outletManager.location

/**
 * Distance-based geofence hysteresis, ported from the thresholds the old
 * (dead-code, never wired up) Dart `GeofenceManager` used: a 10m buffer
 * around the outlet radius — a single raw GPS fix can't be trusted right at
 * the boundary — and a transition only counts as "confirmed" once it
 * survives two consecutive fixes or three minutes of continuous readings.
 * That's deliberately the same bar in both directions (exit and re-entry),
 * so the fast/normal ping-cadence switch in [LocationTrackingService]
 * reacts quickly to a genuine exit without flapping on noise.
 *
 * This does NOT decide auto clock-out — the backend's own geofence
 * violation detector already does that (SMS reminders, grace period,
 * auto-skip) from the pings this class causes to fire faster. Duplicating
 * that decision here would risk the two disagreeing. All this does is get a
 * `ping_source: geofence_event` ping to the server as soon as a transition
 * is confirmed, and poll faster while outside so the backend's own
 * detector has fresher data to work with.
 */
class GeofenceHysteresisTracker(private var state: GeofenceState = GeofenceState()) {

    data class GeofenceState(
        val confirmedOutside: Boolean = false,
        val consecutiveOutside: Int = 0,
        val consecutiveInside: Int = 0,
        val firstOutsideAtEpochMillis: Long? = null,
        // Diagnostic only — not read by any transition logic, only by the
        // geofence debug screen. Set on every evaluate() call regardless of
        // transition, including across a full-state reset on re-entry.
        val lastDistanceMeters: Double? = null,
    )

    sealed class Transition {
        object None : Transition()
        object ExitConfirmed : Transition()
        object ReentryConfirmed : Transition()
    }

    /** Call once per location fix. Returns whichever transition (if any) this fix just confirmed. */
    fun evaluate(
        distanceMeters: Double,
        radiusMeters: Double,
        nowEpochMillis: Long = System.currentTimeMillis(),
    ): Transition {
        val isInside = distanceMeters <= radiusMeters + BUFFER_METERS
        val transition = if (isInside) handleInside() else handleOutside(nowEpochMillis)
        state = state.copy(lastDistanceMeters = distanceMeters)
        return transition
    }

    private fun handleInside(): Transition {
        val consecutiveInside = state.consecutiveInside + 1
        val wasConfirmedOutside = state.confirmedOutside

        return if (wasConfirmedOutside && consecutiveInside >= CONFIRM_READINGS) {
            state = GeofenceState()
            Transition.ReentryConfirmed
        } else {
            state = state.copy(consecutiveInside = consecutiveInside, consecutiveOutside = 0)
            Transition.None
        }
    }

    private fun handleOutside(now: Long): Transition {
        val consecutiveOutside = state.consecutiveOutside + 1
        val firstOutsideAt = state.firstOutsideAtEpochMillis ?: now

        if (state.confirmedOutside) {
            state = state.copy(
                consecutiveOutside = consecutiveOutside,
                consecutiveInside = 0,
                firstOutsideAtEpochMillis = firstOutsideAt,
            )
            return Transition.None
        }

        val minutesOutside = (now - firstOutsideAt) / 60_000.0
        val confirmed = consecutiveOutside >= CONFIRM_READINGS || minutesOutside >= CONFIRM_MINUTES

        state = state.copy(
            confirmedOutside = confirmed,
            consecutiveOutside = consecutiveOutside,
            consecutiveInside = 0,
            firstOutsideAtEpochMillis = firstOutsideAt,
        )

        return if (confirmed) Transition.ExitConfirmed else Transition.None
    }

    fun snapshot(): GeofenceState = state

    companion object {
        private const val BUFFER_METERS = 10.0
        private const val CONFIRM_READINGS = 2
        private const val CONFIRM_MINUTES = 3.0
    }
}
