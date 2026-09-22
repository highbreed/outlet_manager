# Geolocation — Live Device Testing TODO

Pending on-device verification for the `flutter_background_geolocation`
(Transistorsoft) tracking engine (`lib/core/location/background_geolocation_service.dart`),
which replaced the custom native Kotlin engine documented in the plan below —
that engine (and this doc's old test items for it) has been deleted. See
`/Users/stephen/.claude/plans/enchanted-juggling-ocean.md` ("Phase 3") for the
full migration history and rationale.

Everything here needs a real device and real GPS/reboot — not something
`flutter analyze`/`flutter build` can confirm.

_Last updated: 2026-09-22_

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

## Still pending

- [ ] **Lock screen.** Clock in, lock the device, confirm pings keep
  arriving on schedule while locked.
- [ ] **Backgrounded app.** Clock in, Home button to background the app
  (not force-closed), confirm pings continue.
- [ ] **Recents-swipe.** Clock in, swipe the app away from Recents, confirm
  the plugin's own foreground service/notification survives and pings
  continue (`stopOnTerminate: false`).
- [ ] **Reboot recovery.** Clock in, reboot the device, confirm tracking
  resumes automatically (`startOnBoot: true`) without reopening the app.
- [ ] **Headless delivery (fully terminated app).** Not yet wired —
  `registerHeadlessTask` was deliberately deferred out of the initial
  cutover (see the plan's "Recommended approach": *"Headless mode is
  required, not optional"*). Needs its own implementation pass before this
  can be tested; the app's permission disclosure already promises tracking
  survives full termination, so this is a real gap, not just an
  untested nice-to-have.
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
