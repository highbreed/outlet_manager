# Geolocation — Live Device Testing TODO

Pending on-device verification for the `flutter_background_geolocation`
(Transistorsoft) tracking engine (`lib/core/location/background_geolocation_service.dart`),
which replaced the custom native Kotlin engine documented in the plan below —
that engine (and this doc's old test items for it) has been deleted. See
`/Users/stephen/.claude/plans/enchanted-juggling-ocean.md` ("Phase 3") for the
full migration history and rationale.

Everything here needs a real device and real GPS/reboot — not something
`flutter analyze`/`flutter build` can confirm.

_Last updated: 2026-09-23_

## Before testing: revert temporary test-only config

Two changes were made purely to make testing faster and must be reverted
before any of this is considered a real pass:

- [ ] `heartbeatInterval` in `BackgroundGeolocationService.configure()` —
  currently `60` (Android's floor, for fast iteration), revert to `300`
  (5 minutes, the actual product requirement).
- [ ] Chunked response-body logging in `LoggingInterceptor` — added to see
  around Android's per-log-entry truncation while debugging the
  `day-status`/`activeVisit` detour; safe to leave but no longer needed.

## Already confirmed on-device (SM-A165F, `RF8YA124W7F`)

- [x] Location permission flow (`location_permission_screen.dart`) — plain
  foreground grant, then the plugin's own `requestPermission()` upgrading to
  background ("Allow all the time") + motion/activity-recognition
  authorization in one flow.
- [x] Battery-optimization exemption flow (`DeviceSettings.showIgnoreBatteryOptimizations`)
  — lands on the OS's battery-management screen.
- [x] Clock-in → `BackgroundGeolocationService.startTracking()` → native
  geofence registered (`TSGeofenceManager monitoring N/N`,
  `GeofencingClient addGeofences SUCCESS`).
- [x] `onLocation` fires and the full save-locally-then-post pipeline works
  — confirmed real `POST /api/v1/visits/location/ping` requests returning
  `200`/`ping_id`.
- [x] Clock-out → `stopTracking()` → geofence removed, tracking service
  stopped cleanly (`GeofencingClient removeGeofences SUCCESS`, `TrackingService
  stopped`).
- [x] Pre-clock-in live-distance UI (`visit_detail_screen.dart`) via
  `BackgroundGeolocationService.watchPosition()`'s `getCurrentPosition()`
  poll loop — resolves correctly. (Note: the plugin's own `watchPosition`
  native API was found to have a broken native→Dart event-bus bridge in
  this version — `getCurrentPosition()` polling is the deliberate
  workaround, not a bug in this codebase; see that method's doc comment.)
- [x] Headless heartbeat delivery (fully terminated + stationary) — a
  headless task scoped to `Event.HEARTBEAT`, registered from
  `startTracking()` (not at app boot), confirmed to deliver a ping after
  termination without breaking live foreground `onLocation` — the
  regression that blocked this earlier. See "New this session" below for
  what still needs a first real pass.

## New this session — needs first-time validation

The dual-path posting architecture and the HEARTBEAT/MOTIONCHANGE listener
fix are both new; only spot-checked so far, not run through the full matrix.

- [ ] **Device-location token mint at login.** Log in (or cold-start
  already-authenticated), confirm `POST /auth/device-token` fires once
  (alongside the existing FCM device registration), and that it does
  *not* re-fire on every clock-in — only when the cached token is missing
  or within 1h of its 24h expiry.
- [x] **Dual-path posting while alive and moving.** Confirmed — backend
  logs showed both `POST /visits/location/ping` (Dart, user token) and
  `POST /visits/location/device-ping` (native autoSync, device token)
  landing with `200 OK`.
- [ ] **Heartbeat while alive and stationary.** Clock in, stay stationary
  past `heartbeatInterval`, confirm `onHeartbeat` fires and a ping posts
  via the normal `/visits/location/ping` path (not headless — the app is
  still alive here).
- [ ] **Heartbeat while terminated and stationary.** Clock in, swipe the
  app from Recents, stay stationary past `heartbeatInterval`, confirm a
  `POST /visits/location/device-ping` lands via the headless task (this is
  the gap this session's work closed — needs a full, deliberate repro, not
  just the one spot-check already done).
- [ ] **LOCATION/geofence fixes while terminated.** Same as above but
  while actually moving / crossing the geofence, confirming native
  autoSync alone (no headless involvement) still delivers
  `device-ping`s — this is the path that's supposed to need no Dart at
  all.
- [ ] **Foreground `onLocation` still fires after headless re-registration.**
  The critical regression check — with the headless task now registered
  (scoped to `HEARTBEAT`), confirm live `onLocation` delivery while moving
  and app-foregrounded still works exactly as before. Not yet explicitly
  reconfirmed (terminated-app behavior was confirmed; live-foreground
  wasn't separately re-checked after that) — do this before the
  `heartbeatInterval` revert.
- [ ] **Device-token revoked on logout.** Log out, log back in (possibly
  as a different user), confirm a *new* `device-token` gets minted and
  used — not a stale/revoked one from the previous session.
- [ ] **App bar tracking indicator.** Confirm the "Tracking" row on
  screens using `CustomAppBar` (Route/Tasks/Menu — not Home, which never
  shows it) correctly reflects `activeVisitProvider`, on clock-in and
  clock-out.
- [ ] **Stage 4 regression pass** — `LocationService`/`LocationTrackingController`
  were trimmed to one-shot-only; confirm nothing broke for their remaining
  consumers: `location_permission_screen.dart` (permission flow),
  `visit_detail_screen.dart`/`active_visit_screen.dart` (live distance,
  clock-in validation), `geofence_override_request_screen.dart`
  (`getCurrentLocation()`), and clock-in/out use cases.

## Still pending (pre-existing, unrelated to this session)

- [ ] **Lock screen.** Clock in, lock the device, confirm pings keep
  arriving on schedule while locked.
- [ ] **Backgrounded app.** Clock in, Home button to background the app
  (not force-closed), confirm pings continue.
- [ ] **Recents-swipe.** Clock in, swipe the app away from Recents, confirm
  the plugin's own foreground service/notification survives and pings
  continue (`stopOnTerminate: false`).
- [x] **Reboot recovery — partially confirmed, gap identified and accepted.**
  After reboot, the plugin's bundled `BootReceiver` fires, detects the
  reboot, resets its (OS-level, can't survive reboot) geofences to empty,
  and auto-resumes via `startOnBoot: true` — captured one initial fix,
  queued it, and native `autoSync` flushed it (`POST
  .../device-ping` → `200`) a couple minutes later. **Gap:** the
  outlet-specific geofence is never rebuilt unless the app is reopened
  (native has no knowledge of which visit is active — only
  `DayStatusPoll._reconcileBackgroundTracking`, which runs in the full
  Dart app, knows that). Product decision: acceptable as-is, since the
  backend's own geofence violation detector can evaluate raw pings
  independent of client-side geofence enter/exit events. Still open:
  confirm heartbeat cadence actually *continues* post-reboot (only one
  ping was observed in the ~2 minute test window — need a longer soak to
  confirm it's not a one-off).
- [ ] **Live geofence exit/re-entry.** Clock into a visit while genuinely
  inside the outlet's radius, physically step outside, confirm the
  `geofence_event`-tagged ping fires promptly and
  `showGeofenceExitDetected` appears; walk back in and confirm
  `clearGeofenceNotifications` fires.
- [ ] **Motion-aware cadence.** Confirm the plugin's own stationary/moving
  detection (`GeoConfig.stopTimeout`) actually widens/narrows ping cadence
  as expected in the field — this is entirely the plugin's own behavior
  now (no custom hysteresis/motion code left in this app), so this is
  really about confirming the *configured* thresholds feel right in
  practice, not verifying custom logic.
- [ ] **Original bug's repro case.** Confirm `visit_detail_screen.dart`'s
  live distance resolves without hanging under the specific conditions
  that caused the original "Getting your location..." bug reports (weak
  indoor signal) — the `getCurrentPosition()` `desiredAccuracy: 200`
  threshold should resolve much faster than a tight GPS-grade fix would,
  but hasn't been stress-tested across many real indoor locations yet.
