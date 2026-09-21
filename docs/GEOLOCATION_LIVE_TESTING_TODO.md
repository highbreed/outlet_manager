# Geolocation — Live Device Testing TODO

Pending on-device verification for the native background location tracking
engine (`android/app/src/main/kotlin/com/mikappliance/outletManager/location/`).
Everything here needs a real device and real GPS/reboot — not something
`flutter analyze`/`flutter build` can confirm. See
`/Users/stephen/.claude/plans/enchanted-juggling-ocean.md` for the full
implementation history.

_Last updated: 2026-09-18_

## Phase 1 — reboot recovery

- [ ] **Clean reboot-recovery confirmation.** Direct-boot storage and the
  battery-optimization exemption are both implemented and individually
  confirmed (`dumpsys deviceidle whitelist` shows the exemption granted),
  but the last two end-to-end attempts were confounded: the test visit got
  auto-skipped by the backend's own geofence-violation detector while the
  device sat out of range during a long test session, so `activeVisit` was
  already `null` by the time of the reboot and the reconciliation logic
  correctly did nothing — that's a red herring, not a real pass/fail.
  - [ ] Fresh clock-in on a visit the device stays genuinely inside the
        geofence for
  - [ ] Reboot the device
  - [ ] Check tracking status (`dumpsys activity services`, or
        `getTrackingStatus` via the app) **before** unlocking, to confirm
        `BootReceiver` restarted `LocationTrackingService` pre-unlock

## Phase 2 — geofence hysteresis

- [ ] **Live exit/re-entry crossing test.** Implemented in
  `GeofenceHysteresisTracker.kt` + `LocationTrackingService.kt`; builds
  clean and is installed on the SM-A175F test device
  (`R5GYB50NBEX`), but never exercised with real GPS movement (no
  mock-location tool was used).
  - [ ] Clock into a real visit while genuinely inside the outlet's
        geofence radius
  - [ ] Physically step outside the radius; confirm via `logcat`
        (`LocationTrackingService` tag) that polling switches from 5min to
        30s on the first outside reading, and that "Geofence exit
        confirmed" logs within ~1 minute
  - [ ] Confirm the confirming ping reaches the backend tagged
        `ping_source: geofence_event` (backend logs), not `background`
  - [ ] Confirm `showGeofenceExitDetected` appears in the notification
        shade while the app is foregrounded
  - [ ] Walk back inside; confirm "Geofence re-entry confirmed" logs,
        cadence drops back to 5min, and the notification clears

## Phase 2 — Activity Recognition motion-aware tracking

- [ ] **Live stationary/motion cadence test.** Implemented in
  `MotionStateStore.kt` + `MotionTransitionReceiver.kt` +
  `LocationTrackingService.desiredIntervalMs()`; builds clean and is
  installed on the SM-A175F test device (`R5GYB50NBEX`), but never
  exercised with real device motion.
  - [ ] Grant the `ACTIVITY_RECOGNITION` permission when prompted on the
        location-permission screen (confirm the prompt actually appears)
  - [ ] Clock into a real visit and stay genuinely stationary, inside the
        geofence, for several minutes; confirm via `logcat` that Activity
        Recognition reports a STILL transition and polling widens from 5min
        to 15min
  - [ ] Start walking; confirm polling narrows back to 5min immediately
        (via `ACTION_MOTION_UPDATE`) rather than waiting out the current
        15-minute cycle
  - [ ] Confirm the interaction with geofence hysteresis: while genuinely
        outside the geofence buffer, cadence should stay at 30s regardless
        of STILL/moving state (geofence always wins — see
        `desiredIntervalMs`'s doc comment)
  - [ ] Deny the permission on a fresh install and confirm tracking still
        works normally at the 5min default (the feature must be a pure
        no-op when absent, not a crash or a stuck cadence)
