# Redesign Progress Tracker

Tracks the module-by-module rollout of the Claude Design mock
**"Outlet Manager Redesign v2"** (project `e4a9c5f8-d51c-40fa-9eed-1b45fe5f17f8`,
file `Outlet Manager Redesign v2.dc.html`) into the Flutter app. See
`docs/APP_DESIGN_OVERVIEW.md` for the pre-redesign baseline this replaces.

Scope discipline: this is a **visual-only** restyle. No Riverpod providers,
repositories, routing logic, or business rules should change as part of this
effort — only widget trees, colors, shapes, and (where the mock invents a
screen with no backing data) thin navigation-only wrappers around
functionality that already exists elsewhere.

---

## Design system decisions (Module 0)

| Mock token | Value | Applied as |
|---|---|---|
| Canvas | `#F5F5F3` | `kBackground` (was `#F7F7F7`) |
| Surface | `#FFFFFF` | `kPrimaryLightColor` (unchanged) |
| Text / primary action | `#111111` | `kTextDark` (unchanged) — primary buttons now use this as background instead of purple |
| Purple accent | `#4B2E83` | `kSecondaryColor` (unchanged) — reserved for accent/selection/progress/links only |
| Soft purple | `#F1E6FF` | `kSecondaryLightColor` (unchanged) |
| Warm accent | `#FFEAC9` | `kSecondaryColor2` (unchanged) |
| Success | `#2E7D32` / `#E6F4EA` / `#1E6B2C` | new `kSuccessColor` / `kSuccessBg` / `kSuccessText` |
| Warning | `#B45309` / `#FFEAC9` / `#8A5A00` | new `kWarningColor` / `kWarningBg` / `kWarningText` |
| Danger | `#D50000` | `kRedColor` (unchanged) |
| Border | `#E7E7E3` | new `kBorderColor` |
| Caption text | `#9A9A96` | new `kTextFaint` |
| Secondary text | `#6F6F6B` | `kTextMuted` (was `#777777`) |

Shape system: buttons are pill/`StadiumBorder` (black primary, gray-outlined
secondary), cards are 20–22px radius with a `kBorderColor` hairline and no
shadow, inputs are 15px radius, chips are pill-shaped.

New shared widgets in `lib/core/widgets/`: `PrimaryButton`, `SecondaryButton`,
`AppCard`, `StatusChip`, `MetricCard`, `FloatingBottomNav` (replaces the old
`NavigationBar`-based `CustomBottomNavBar`). All exported via
`core/widgets/widgets.dart` → `core/core.dart`.

**Dark theme was intentionally left untouched this pass** — `theme.dart`'s
`darkTheme` still reflects the pre-redesign palette. Most restyled screens
now use light-only token constants (no `isDark` branching), so dark mode
will look inconsistent until a dedicated pass addresses it.

## Navigation shell change (Module 1)

Bottom nav destinations changed from **Home / Outlets / Schedule / Profile**
(the latter two were unbuilt stubs per `APP_DESIGN_OVERVIEW.md` §2.2) to
**Home / Route / Tasks / Menu**:
- **Route** → `/daily-route` (unchanged destination, just relabeled)
- **Tasks** (new, `/tasks`) → flat list of all task modules, reusing the
  same active-visit context injection `feature_grid.dart` used to do
  (extracted to `navigateToFeature()` in
  `lib/features/screens/home/widgets/feature_navigation.dart`)
- **Menu** (new, `/menu`) → profile header + grouped navigation to
  Products/After Sales/Route Plan/Session History/Settings/Help/Sign Out
  (reuses the existing sign-out confirmation flow from `CustomAppBar`)

Home's old 13-tile feature grid is gone — three previously-dead widgets
(`status_card.dart`, `location_info_card.dart`, `location_info_row.dart`,
flagged as dead in `APP_DESIGN_OVERVIEW.md` §3.1) were deleted rather than
carried forward.

### Home pixel audit (2026-08-08, follow-up)

Re-diffed Home against the mock's exact markup (section C) line by line and
fixed drift that had crept in from the initial Module 1 pass:

- **"Today's Route" card** (`route_status_card.dart`): progress-bar track
  color corrected to the mock's literal `#EFEFEC` (was reusing `kBackground`,
  a close but not identical off-white); the completed/remaining stats row
  now matches the mock's *two* layouts exactly — space-between spans when
  there's no active visit, one joined "· "-separated string when there is;
  the "NEXT" caption is regular weight with no letter-spacing (the mock only
  bolds+tracks the equivalent caption on the Today's Route *screen*, not
  Home's card); the next-visit line now includes the scheduled time
  (`Outlet · 11:30 AM`, previously outlet name only); the "Continue Route"
  CTA is a single "Continue Route →" text (was a text+icon `Row`).
- **Active-visit card**: CTA simplified the same way ("Continue Visit →").
- **Quick Actions grid**: gap corrected to the mock's `14px 8px` (was
  `16/6`); grid labels shortened to match the mock's one-word captions
  ("Orders" / "Facings" instead of the full `HomeFeatureItem` titles "Orders
  & Quotations" / "Facings Count" — those stay full-length on the Tasks
  screen, which shares the same data list).
- **Performance tiles**: third tile now switches between "Target" (no
  active visit) and "Orders" (active visit), matching the mock's two Home
  variants — previously always showed "Target" regardless of state.
- **Section spacing**: standardized to the mock's flat `gap:18` between all
  top-level blocks (was an inconsistent 14/26 mix).

### Home — four-state rebuild (2026-08-08, second follow-up)

The mock's Home section (C) actually documents **four** distinct states, not
the two the first audit covered. Re-pulled the full section and rebuilt
`route_status_card.dart` / `home_screen.dart` to match all four:

1. **Route in progress, no active visit** — existing `_RouteProgressCard`
   (already correct from the first audit). Quick Actions shows the full
   6-item set (Stock Take, Daily Sales, Orders, Shelf Share, Facings,
   Products).
2. **Route assigned, not yet activated** (`route.status ==
   DailyRouteStatus.pending`) — this state was previously conflated with
   "no route at all" under a generic `_StartYourDayCard`. Split out into a
   new `_RouteNotStartedCard`, rebuilt to match the mock exactly: centered
   black card, circular icon badge, "Your route hasn't started", a subtitle
   built from real data (`"$total outlets planned for today · first stop
   $firstStop"`, using `routeData.visits.length` and the first sorted
   visit's `scheduledClockIn` — both already available pre-activation, no
   fabricated data needed), and a full-width white "Start Route →" pill
   (was a `Row` with a small icon + trailing arrow, not a pill button).
3. **No route assigned today** — previously fell into the same generic
   `_StartYourDayCard` as state 2 (wrong copy: "Start Your Day / Tap to
   activate your daily route"). Now a distinct `_NoRouteAssignedCard`
   (non-interactive, white bordered card, calendar-off icon, "No route
   assigned today" / "Check back tomorrow or contact your supervisor.").
   Quick Actions in both states 2 and 3 shows the mock's compact 3-item set
   (Products, Orders, Performance) via a new `compactHomeFeatures` getter in
   `feature_navigation.dart`.
4. **Active visit** — Quick Actions section is **omitted entirely** in the
   mock when there's an active visit (only Active Visit card, simplified
   Today's Route card, and Performance show). `home_screen.dart` now wraps
   `QuickActionsSection` in `if (!hasActiveVisit)`; previously it was always
   shown.

`route_status_card.dart` now distinguishes states 2/3 by checking
`todaysRouteProvider`'s result: `null` → no route assigned (state 3);
non-null with `route.status == DailyRouteStatus.pending` → not started
(state 2); anything else → in-progress (state 1), same as before. This is
existing data already returned by `GetTodaysRouteUseCase` — no new queries.

Verified live on-device (dev backend currently has no route assigned):
"No route assigned today" card + 3-item Quick Actions (Products/Orders/
Performance) + Performance tiles render correctly.

**"No route assigned" backend-confirmation guarantee**: `getTodaysRoute()`
(`daily_route_repository_impl.dart`) only ever returns `Right(null)` on an
explicit 404 from the backend — any other failure (offline, 5xx, timeout)
returns `Left(failure)`, which surfaces as `todaysRouteProvider`'s `error`
state and renders `_ErrorCard`, not the "no route" card. So `_NoRouteAssignedCard`
was already unreachable without a confirmed backend response. The one gap
was the nested `pendingRoutesToCloseProvider` check inside that branch: its
`error` case previously fell back to `_NoRouteAssignedCard` too, so a failed
unclosed-route lookup could still show "No route assigned today" without
that specific query having succeeded. Changed that fallback to `_ErrorCard`
so the "no route" card only ever renders once every relevant backend query
has actually completed successfully.

### Home route status — day-status endpoint + polling (2026-08-08, third follow-up)

Replaced `RouteStatusCard`'s ad hoc `todaysRouteProvider` +
`pendingRoutesToCloseProvider` stitching with a single new backend endpoint,
`GET /visits/routes/day-status`, which returns one of seven statuses
(`blocked` / `not_scheduled` / `not_activated` / `active` / `at_outlet` /
`in_transit` / `completed`) for the agent's day in one call. This is now
polled every 30s (`dayStatusPollInterval`) while Home is on screen, so
admin-side changes — closing or force-closing a route, editing today's
schedule — show up without the agent doing anything, which the old
one-shot-fetch approach couldn't do. The existing granular endpoints
(`/routes/today`, `/routes/pending`, `activate`, `close`, `force-close`,
clock-in/out, skip) are **untouched** and still drive the rest of the Daily
Route feature (activation screen, visit list, visit detail, active visit,
close screen) exactly as before — only Home's status card switched.

**New files/additions:**
- `domain/entities/day_status.dart` — `DayStatus` enum, `BlockedRouteSummary`,
  `ScheduledStop`, `DayStatusInfo` (plain classes, no freezed/codegen needed).
- `data/datasources/daily_route_remote_datasource.dart` — `getDayStatus()` →
  `GET /visits/routes/day-status`; `DayStatusResponse` / `ScheduledStopResponse`
  DTOs. Reuses the existing `PendingRouteResponse` DTO for `blocked_route`
  (identical shape) and `DailyRouteWithVisitsResponse` for `route` (same
  root-fields-plus-nested-`visits` shape as `/routes/today`) — no duplicate
  parsing logic.
- `providers/daily_route_providers.dart` — `DayStatusPoll` (`@riverpod`
  `AsyncNotifier`), self-rescheduling via `Timer` + `ref.invalidateSelf()`
  in `build()`, cancelled via `ref.onDispose` (stops automatically once
  nothing watches it, e.g. navigating away from Home — no background drain).
  Also added `ref.invalidate(dayStatusPollProvider)` next to every existing
  `ref.invalidate(todaysRouteProvider)` call (activate/clock-in/clock-out/
  skip/close/override) so an action this device takes reflects immediately
  rather than waiting up to 30s for the next poll tick.
- `route_status_card.dart` — `RouteStatusCard` now switches on
  `DayStatusInfo.status` directly: `blocked` → `_UnclosedRouteCard`,
  `not_scheduled` → `_NoRouteAssignedCard`, `not_activated` →
  `_RouteNotStartedCard`, `active`/`at_outlet`/`in_transit`/`completed` →
  `_RouteProgressCard` (unchanged internally, now fed by `dayStatus.route`).
- `home_screen.dart` — `hasActiveVisit`/`routeInProgress` now derive from
  `dayStatusPollProvider` (`atOutlet` / `active`+`atOutlet`+`inTransit`)
  instead of a one-shot `todaysRouteProvider` read, so Quick Actions'
  6-item-vs-3-item switch and the Active Visit card's visibility both track
  the poll. `ActiveVisitCard`'s own duration ticker still reads
  `activeVisitProvider` internally (unchanged) — Home only changed *when*
  it decides to show that card, not what feeds it.

**Rich scheduled-outlets data (closes the earlier "show what outlets are
scheduled" request):** `_RouteNotStartedCard` now renders a "Scheduled
Outlets" list card below the black CTA, sourced from `scheduled_stops` —
real per-outlet data (name, order, scheduled time) the day-status endpoint
already returns pre-activation, not a fabricated summary. Times come back
as `"HH:MM:SS"`; added `formatScheduledClockTime()` to render `"9:00 AM"`
instead (also applied to `_RouteProgressCard`'s "NEXT" line, which had the
same raw-time bug — `OutletVisit.scheduledClockIn` turns out to be the same
`"HH:MM:SS"` format, confirmed from the day-status endpoint's `active`
example response).

Verified live on-device end-to-end: "Your route hasn't started / 3 outlets
planned for today · first stop 9:00 AM" black card, followed by a
Scheduled Outlets list (Gilani's Supermarket 9:00 AM, Kamindi Self Ridges
10:30 AM, Naivas Limited 8:00 AM — sorted by `visit_order`, not scheduled
time), matching the real dev-backend schedule.

### Home outlet-list overflow → route activation screen (2026-08-08, fourth follow-up)

A rep can have more than 3 scheduled outlets — Home shouldn't push the rest
of the page down listing all of them inline. Extracted the scheduled-outlets
list into a shared widget, `ScheduledOutletsCard`
(`daily_route/presentation/widgets/scheduled_outlets_list.dart`, exported via
the feature's `widgets.dart` barrel so both Home and the Daily Route feature
can use it):

- Takes an optional `maxVisible` + `onViewAll`. When stop count exceeds
  `maxVisible`, only the first `maxVisible` render, followed by a tappable
  "+N more outlets" row (purple, arrow icon) instead of listing everything.
  `maxVisible: null` (default) always shows the full list.
- `route_status_card.dart` — `_RouteNotStartedCard` now uses
  `ScheduledOutletsCard(stops: stops, maxVisible: 3, onViewAll: () =>
  context.push('/daily-route'))`. With ≤3 outlets (today's dev-backend
  state) there's no overflow row, confirmed live on-device — the boundary
  condition (3 items, cap of 3) correctly shows nothing extra.
- `route_activation_screen.dart` (the `/daily-route` destination — "Start
  Your Day" / "Ready to Start?") previously showed **no** outlet list at
  all, just a generic activation prompt. It now watches
  `dayStatusPollProvider` for `scheduledStops` and renders the same
  `ScheduledOutletsCard` with `maxVisible: null`, so "+N more" on Home
  actually lands somewhere that shows the rest — verified live on-device
  (all 3 outlets render there too, above the "Activate Route" button).
  The screen's actual activation logic (`todaysRouteProvider`,
  `routeActivationNotifierProvider`, pending-routes warning) is untouched —
  only the outlet list was added.

### GeofenceOverrideRequestScreen restyle (2026-08-08, fifth follow-up)

Flagged by the user as still on the old theme — it was one of the two
screens explicitly deferred in the original plan. Rebuilt the widget tree
only; every piece of state/logic (location polling, haversine distance,
override request/refresh/clock-in-with-override, the 15-minute countdown
timer) is untouched.

- `AppScaffold(title: ...)` (app bar) → `Scaffold` + `RouteBackHeader`,
  matching every other pushed Daily Route sub-screen (Visit Detail, Active
  Visit, Skipped Outlets).
- "Outside Geofence" banner: ad hoc `Color(0xFFFFF3E0)`/`Color(0xFFFF9800)`/
  `Color(0xFFE65100)` → `kWarningBg`/`kWarningColor`/`kWarningText` inside
  an `AppCard`, matching the pending-routes-warning pattern already used on
  the route activation screen.
- Outlet info rows wrapped in an `AppCard` (previously bare `Row`s in the
  scroll view).
- Reason `TextFormField`'s manual `OutlineInputBorder`/`contentPadding` →
  dropped in favor of the app's themed `inputDecorationTheme` (radius 15,
  purple focus border) — same as every other form field in the app.
- Submit / Retry Location / Refresh Status / Clock In Now / Cancel / Back →
  all converted from raw `FilledButton`/`OutlinedButton` with per-instance
  colors (including a green `0xFF2E7D32` "Clock In Now" and a purple
  `kSecondaryColor` "Refresh Status") to `PrimaryButton`/`SecondaryButton`.
  This is a real behavior-adjacent decision, not just a token swap: the
  design system reserves purple for accent/selection/progress and never
  uses green as a button fill (green is status-only, via `StatusChip`) — so
  every actionable button on this screen is now black or outlined, matching
  the rest of the app's single-CTA-color convention.
- `_StatusCard` (pending/approved/rejected/expired): same ad hoc hex →
  semantic token treatment as the banner, using `kWarningBg/Color/Text`
  (pending), `kSuccessBg/Color/Text` (approved), `kRedColor` at 8%/40%/100%
  alpha for bg/border/text (rejected — no `kRedBg`/`kRedText` pair exists in
  `colors.dart`, so this mirrors `StatusChip`'s own `danger` variant
  formula), and `kBackground`/`kBorderColor`/`kTextFaint` (expired). Card
  radius bumped 14→22 to match `AppCard`'s convention.
- `_DetailCard`: raw `Card` (the only other place in the Daily Route feature
  still using it besides `outlets_screen.dart`, which is out of scope) →
  `AppCard`.

Verified live on-device: activated the dev-backend route, opened Visit
Detail for the first outlet, triggered "Request Override" (the emulator's
location is ~15,867 km from the real outlet, so it's reliably outside the
geofence), and confirmed the request form renders correctly — warning
banner, outlet-info card, themed input with purple focus ring, black pill
submit button.

## Stock Take module rebuild (2026-08-09)

The user redesigned Stock Take in the mock (section E — grew to 11 screens:
sessions dashboard, warehouse selection, session conflict, active session
item list, add product, serial scanner, complete-session confirmation,
order-generation progress, proposed-order-generating, proposed order
detail, session history) and asked for it to be implemented. Unlike Home/
Daily Route, the existing code already had nearly all the real business
logic the mock depicts (session lifecycle, per-item serial scanning with
validation, proposed-order generation + polling + PDF) — the gap was almost
entirely presentational: a 3-tab home screen with plain Material widgets,
where the mock wants a single sessions dashboard, a real history screen,
and dialogs replaced with bottom sheets/on-demand modals.

**Business-rule decision (asked the user first):** the mock's Home frame
shows two sessions active at once for one outlet (Display "Active" + Back
Store "Paused" simultaneously), with a footnote claiming "one active per
warehouse type." The real `StartStockTakeSession` use case blocks *any*
second session for a customer, active or paused, regardless of warehouse —
a stricter rule. **User chose to keep the existing one-session-per-customer
rule** rather than loosen it to match the mock's stated capability. The
rebuilt Home screen supports rendering a list of session cards but will
only ever show 0–1 in practice.

| Mock screen | Implementation | Notes |
|---|---|---|
| Stock Take — Home (sessions) | `StockTakeHomeScreen` (rebuilt) | Replaced the 3-tab layout (Active/Closed/Proposed Order) with a single dashboard: in-progress/paused session card, a "ready to generate" or "already generated" prompt card once a session completes, empty state, and a floating black "Start New" pill FAB. History access moved to a header icon button (was the "Closed" tab). |
| Session Conflict | new `session_conflict_dialog.dart` | Was a permanent red banner (`_OtherActiveSessionsBanner`) shown proactively whenever a *different* customer's session was stray-active. Now an on-demand centered modal shown when "Start New" is tapped while blocked — keeps both real actions (resume, cancel-with-required-reason), matching the mock's dialog shape. |
| Start Session — select warehouse | `StartSessionScreen` (restyled) | `RouteBackHeader` instead of app bar; warehouse cards to mock spec (18px radius, 2px purple selected border, radio circle). Kept the optional Notes field — a real capability the mock's frame doesn't happen to show. |
| Session Active / item list | `StockTakeSessionScreen` (rebuilt) | Black header with PRODUCTS/SERIALS/COMPLETED stats; added an All/Pending filter toggle (new — client-side over already-loaded items, no backend change); item cards restyled with status pill + min/max-tick progress bar. Floating purple "+" FAB (Add Product) + black "Complete Session" bar replaces the old two-row button layout. Kept the existing "Submit to Server" sync action — moved into the header's overflow menu rather than dropped. Complete-session flow: kept the existing "blank items" warning dialog (no mock reference for that edge case), replaced the final confirm step with a bottom sheet matching the mock. On success, now routes into the new Order Generation screen instead of just popping back. |
| Add Product — search / scan | `AddProductScreen` (restyled) | Dark header (translucent search field, purple scan button); added brand filter pills (new — plain client-side filter over already-loaded products; **not** wired to a real per-product access-flag, since no reliable data source for "assigned brand" exists in this screen — the mock's greyed-out "not in your assigned brands" state was not implemented). |
| Serial Scanner | `SerialScanScreen` (restyled) | Dark header with a min/max-tick progress bar and "N valid serials" caption — required threading `category`/`minStockLevel`/`maxStockLevel` through navigation `extra` params (real `StockTakeItem` fields that just weren't previously passed to this screen). **Kept the existing two-screen flow** (manual entry + a button opening the full-screen `BarcodeScannerScreen`) rather than building a persistent inline camera preview like the mock shows — a large black "Scan with camera" tap target visually echoes it without the added risk of rebuilding a working, tested scanner flow. Validation still shown as a one-shot banner for the latest attempt, not a per-row history of past failed attempts (no such log is stored). |
| Barcode scanner (generic) | `BarcodeScannerScreen` | Light touch only — green scan-line/corner accents and "Done" button retoned to the app's purple/black palette. No structural changes; this is a shared, already-functional camera component. |
| Complete Session → generate order | new `OrderGenerationScreen` (`/stock-take/order/:visitId`) | Extracted (not rewritten) the 7-case state machine that used to live in the home screen's "Proposed Order" tab (no visit id / active session running / no completed sessions / job in progress / checking existing / existing found / ready to generate) — same controller methods (`generateProposedOrder`, `_startBackgroundPolling`, `ProposedOrderJobState`), now shown as a dedicated screen reached right after `completeSession()` succeeds, and reachable later from Home's prompt card. |
| Proposed Order — generating | same `OrderGenerationScreen`, job-in-progress state | Backend progress payload has no guaranteed numeric percentage (`progress` is an unstructured map) — uses an indeterminate spinner rather than faking the mock's conic-gradient percentage. |
| Proposed Order detail | `ProposedOrderDetailScreen` (restyled) | Purple `#F1E6FF` "TOTAL ITEMS / TOTAL QTY / ESTIMATED" summary band added per mock; line items simplified to name + qty delta + a "Current · Min · Max" caption (mock's format). Action buttons are the app's real actions (Convert to Sales Order / Email / PDF download) rather than the mock's "Edit"/"Send Quotation" labels, since those specific behaviors don't exist. |
| Session History | `StockTakeHistoryScreen` (rewired + restyled) | This route already existed but rendered hardcoded `_MockHistoryItem` data with a `// TODO: Fetch history from provider` comment, and nothing linked to it. Wired to the real `completedSessions` from `stockTakeSessionControllerProvider` (same data the old "Closed" tab used) and restyled to the mock's simple two-line row format. Home's new history icon button is its first real entry point. |

### Follow-up fixes from live testing (same day)

Two bugs surfaced while verifying the golden path live on-device, both
about "am I clocked in" state, not Stock Take specifically:

1. **`activeVisitProvider` staleness system-wide.** Tasks-tab → Stock Take
   showed "Not Clocked In" despite an active visit on Home. Root cause:
   `navigateToFeature()` (`feature_navigation.dart`) reads
   `activeVisitProvider`, which was still derived from `todaysRouteProvider`
   — a one-shot fetch only refreshed by actions *this device* took. Fixed
   at the root: `activeVisitProvider` now derives from `dayStatusPollProvider`
   first (falling back to `todaysRouteProvider` only before the first poll
   resolves), so every consumer — Products' visit-context cards
   (`sell_out_card.dart`, `stock_ageing_card.dart`, `alternatives_card.dart`,
   `competitor_mapping_card.dart`, `sales_target_card.dart`,
   `product_detail_screen.dart`), Daily Sales' `register_sale_screen.dart`,
   and Stock Take's own navigation — gets the same fresh answer without each
   needing an individual fix.
2. **That alone wasn't enough** — `dayStatusPollProvider` was `autoDispose`,
   and the bottom nav (`CustomBottomNavBar`) navigates with `context.go()`
   per tab, which fully unmounts the previous screen. Home was the only
   thing keeping the poll provider warm, so switching to Tasks disposed it;
   reading it fresh synchronously from Tasks raced an unresolved network
   call and returned nothing. Changed `@riverpod` to
   `@Riverpod(keepAlive: true)` on `DayStatusPoll` — it already self-polls
   on its own 30s timer regardless of who's watching, so keeping it alive
   for the app session (rather than tearing down/cold-starting it on every
   tab switch) is the architecturally correct fix, not a workaround.
3. **Home hid Quick Actions entirely during an active visit** (matching the
   mock's active-visit frame literally, which omits that section). User
   feedback: this made Stock Take/Daily Sales/etc. reachable only via the
   Tasks tab while clocked in — exactly the wrong tradeoff at the most
   time-pressured moment of a rep's day. Quick Actions now always shows on
   Home regardless of active-visit state (using the same 6-item set as
   "route in progress") — a deliberate departure from the mock's literal
   depiction, per direct user correction.

Verified live on-device end-to-end: Home (Quick Actions) → Stock Take Home
(real visit context, "No proposed order found" error banner handled
correctly) → Start New → Warehouse Selection → session created → Session
Active (product added, serial auto-scanned, item card rendering with
purple border/progress bar/tick marks) → Complete Session bottom sheet →
session completed → Order Generation screen → Generate Proposed Order →
job polling loop running against the real backend (confirmed via request
logs, job status `pending`). Also verified the Tasks-tab entry point
independently to confirm the clock-in sync fix.

## Daily Sales + Replenishment module rebuild (2026-08-09)

The user asked for section F's Daily Sales screens to be implemented. Unlike
Stock Take, the existing `daily_sales`/`replenishment` code already matched
the mock's business logic closely (3-step sale wizard, stock-take-required
gating, serial confirmation, replenishment suggestions) — this was
predominantly a **visual migration** from the app's legacy dark/black-scaffold
theme (`SurfaceCard`'s own doc comment: "the app renders on a solid black
scaffold") to the redesign's light `kBackground` canvas, not an IA rebuild.

**Tooling bug discovered mid-module:** the claude_design MCP's `get_file`
silently truncates at 256 KiB. The mock file is 292,810 bytes, so every
`DesignSync.get_file` fetch this session (and, it turned out, in prior
sessions too) silently dropped the last ~268 lines (sections I/J/K — Tasks,
Menu/Activity, System states) with no error. Caught only because the user
provided a design-handoff zip (`design_reference.html`, a full untruncated
export) after flagging the wizard as not matching. Confirmed via full read
of the untruncated file that nothing about Daily Sales/Replenishment changes
as a result — sections I/J/K don't touch this module — but future modules
touching those sections must read from a full export, not `get_file`, or
fetch in offset chunks.

**Scope clarification (asked the user first):** a separate handoff README
bundled in the zip claimed "Daily Sales" should actually be a per-outlet
editable summary/report screen (Select Outlet → OCM-KAC/reporting
times/stock-take start-end/tentative-vs-confirmed sales/etc.), contradicting
what's actually drawn in the mock. Checked both the current (scrapped, red
"Modernist") v1 mock and v2 — neither ever depicted that report screen, and
nothing matching it exists in the codebase either. **User confirmed v2's
actual frames are correct**: Daily Sales — Home, Register Sale (3 steps),
Confirm Sale — Serials, Sale Detail, Replenishment — suggested reorder,
Replenishment — convert to Sales Order. The per-outlet report is a
distinct, not-yet-designed concept, out of scope here.

| Mock screen | Implementation | Notes |
|---|---|---|
| Daily Sales — Home | `DailySalesHomeScreen` (rebuilt) | Dark header (title, outlet · date, TODAY'S TOTAL / SALES TODAY stats — mock's third stat "Incentive Earned" dropped, see departures), status filter chips (mock's black-selected style, was purple), purple `_ReorderCard` banner (was orange), avatar-initials `_SaleCard` rows with opacity-dimmed cancelled state, black FAB. Dropped `showBottomNav` — this is a pushed screen, not a bottom-nav destination (matches Stock Take Home's precedent and the mock, which shows no nav chrome on this frame). |
| Register Sale — Step 1/2/3 | `RegisterSaleScreen` (restyled) | `SaleStepHeader` rebuilt from a stacked circle-over-label layout (Stock Take's convention) to the mock's **inline** circle+label row — this was the specific mismatch the user flagged ("New Sale wizard" doesn't match). Removed added `SectionHeading`s the mock doesn't have (`Add products`, `Customer details`, `Review & submit`) in favor of the mock's plain micro-labels (`CART · N ITEMS`) or no heading at all. Customer step's fields un-wrapped from a `SurfaceCard` into the mock's individually-bordered rows with an `OR ADD NEW` label; dropped the "search existing customer" field (mock shows it, but no such lookup capability exists — kept the real add-new-customer fields only). Review step's customer card now has a working "Edit" link (jumps back to step 2, a real capability, not fabricated). Stock Take Required dialog rebuilt from a plain `AlertDialog` to the mock's centered-card pattern (56px warning icon circle, black primary + purple text link), matching Stock Take's own dialog precedent. |
| Confirm Sale — Serials | `ConfirmSaleScreen` (rebuilt) | Dark header with a green progress bar and "N of M items fully serialized" caption (was a plain `SectionHeading`). Item cards retoned to `kSuccessBg/Text` (complete) / `kWarningBg/Text` (incomplete, amber border) from raw `Colors.green/orange`. Bottom button now shows the mock's disabled-hint caption ("Serialize every unit to enable Confirm") when incomplete. |
| Sale Detail | `SaleDetailScreen` (rebuilt) | Dark header with avatar-initials + status pill (was a light `AppScaffold` app bar). New `SALE INFO` card (Sale ID, Registered time) — mock also shows "Outlet", dropped since this screen only has an outlet id, not a display name. Items now show a real derived red "Serial not yet captured" pill when `!item.isFullySerialized` (computed from real `serialNumbers`/`quantity`, not fabricated) instead of just omitting incomplete items. Cancel/Confirm buttons moved from stacked full-width to the mock's side-by-side row. |
| Replenishment — suggested reorder | `ReplenishmentListScreen` (restyled) | Dark stats header (TO REORDER / UNITS TO ORDER / EST. REORDER — relabeled the mock's "Units Sold" to "Units To Order" since no units-sold-today figure exists, but total suggested quantity does). Item rows gained a severity pill (CRITICAL/LOW) and stock-level bar with a min-tick — both purely derived from real `currentStock`/`minStockLevel`/`maxStockLevel`, not new data. |
| Replenishment — convert to Sales Order | Built 2026-08-10, see follow-up below | Originally not built — see superseded departure note. |

### Departures specific to this module

1. ~~**Replenishment has no accept/edit/convert-to-order workflow.**~~
   Superseded 2026-08-10 — see "Follow-up: OTP/proof-of-purchase +
   Convert to Sales Order" below. The mock's "Suggested / All Products"
   segmented toggle is still dropped — "All Products" needs a full
   catalogue-with-stock data source this screen doesn't have.
2. **Daily Sales Home's "Incentive Earned" stat** (and Sale Detail's
   per-item/total incentive lines) — dropped. No incentive field exists on
   `DailySale`/`DailySaleItem` anywhere in the domain layer.
3. **Register Sale's "search existing customer"** — dropped, see table row
   above. Every sale still records a name (required) + optional phone.

### Verification

`flutter analyze` clean across `daily_sales`/`replenishment` (zero new
issues; pre-existing generated-code info lints only). Live on-device golden
path against the real dev backend ([DEV] KENYA), clocked in at NAIVAS
LIMITED (BUNGOMA): Home → Daily Sales (dark header/stats/empty state) → New
Sale → Products step (barcode-search dropdown, cart card) → Continue →
Customer step (green-check completed step 1, black active step 2, OR ADD
NEW fields) → Continue → Review step (both steps green-checked, Edit link,
purple totals card) → Submit Sale → Sale Detail (dark header, SALE INFO
card, red "Serial not yet captured" pill, purple total, Cancel/Confirm row)
→ Confirm Sale (green progress bar, amber item card, disabled-button hint
caption). Replenishment not exercised live (no low-stock test data in this
pass) but reviewed against the mock markup directly.

### Follow-up: OTP/proof-of-purchase + Convert to Sales Order (2026-08-10)

**Sale confirmation now requires customer OTP + a proof-of-purchase
photo**, a real behavior change requested directly by the user (not
mock-driven — this flow doesn't appear in the `.dc.html` mock at all), matching
new backend endpoints:

- `POST /daily-sales/{id}/request-otp` / `.../verify-otp` — added to
  `DailySalesRemoteDataSource`, `DailySalesRepository`, and two new
  usecases (`RequestDailySaleOtp`/`VerifyDailySaleOtp`), mirroring the
  existing forgot-password OTP pattern in `lib/features/auth/`.
- `POST /daily-sales/{id}/confirm` — breaking change from a JSON body to
  `multipart/form-data` (`items` JSON-encoded into a form field, `otp_code`,
  `proof_of_purchase` file). `DailySaleModel`/`DailySale` gained a nullable
  `proofOfPurchasePath` field from the response.
- `ConfirmSaleScreen` gained a new `_FinalizeSaleSheet`, opened when
  "Confirm Sale" is tapped (once every item is serialized, same gate as
  before): auto-requests an OTP, a code field + Verify/Resend, then (once
  verified) a photo step using the new `image_picker` dependency
  (camera or gallery, `NSPhotoLibraryUsageDescription` added to iOS
  Info.plist — camera permission already existed for barcode scanning).
  Wrapped in `SafeArea(top: false)` from the start, applying the same nav-
  bar-overlap fix already hit once in Sales Orders' Submit Details sheet.

**Register Sale Step 1 (Products) restyled** — `_ProductsStep` in
`register_sale_screen.dart` was still the pre-redesign layout (a
`SurfaceCard` wrapping a full-width "Scan Product Barcode" button, an "OR"
divider, then the catalogue dropdown) despite the rest of the module
having been rebuilt on 2026-08-09. Replaced with the mock's single flat
row: a pill-styled search field (`DropdownSearch`'s decorator restyled,
same catalogue-search capability) plus a black square scan-icon button
beside it (`_ScanBarcodeButton`, same real `_scanBarcode()` action) — no
new capability, just recomposed into the mock's layout.

**Replenishment "Convert to Sales Order" built** (previously a documented
departure — "no such use case exists"). Now buildable for real because the
Sales Orders module (below) landed in the meantime. `ReplenishmentListScreen`
gained a bottom "Convert to Sales Order" button that:
1. Resolves the active visit's outlet to a real `SalesCustomer` via the
   same `salesCustomersProvider.search()` call `SelectCustomerScreen`
   already uses (matched by exact outlet name) — **not** via
   `ReplenishmentOrder.customerId` directly, because `SalesCustomer.id` in
   `SalesCustomersNotifier` is a client-side synthetic id assigned by list
   index (`id: entry.key + 1`, per its own "backend may provide IDs later"
   comment), not stable across independent fetches. No confident single
   match → falls back to `/sales-orders/customers` (manual picking)
   instead of guessing.
2. Resolves each suggested item to a real catalogue `SalesProduct` via
   `fetchProducts(cardCode, search: item.itemCode)`, taking only an exact
   `code` match; unresolved items are skipped and named in a snackbar
   rather than silently dropped or fabricated.
3. Navigates to `CreateOrderScreen` with a new optional `initialItems`
   param (threaded through the `/sales-orders/create` route's `extra`),
   pre-seeding the draft so the agent lands directly on a review state with
   the existing real Submit Details sheet (warehouse, LPO number, total) —
   the same sheet already built for manual orders.

`flutter analyze` clean project-wide (0 errors) after all of the above.
Live on-device re-verification pending — the physical test device's
running process needs a full stop + fresh `flutter run` (not hot reload)
to pick up the new `image_picker` native plugin registration before any
of this can be exercised.

## Sales Orders & Quotations module rebuild (2026-08-10)

The user asked to move on to the "Sales" module, corresponding to the
mock's section F "Orders & Quotations" (Orders Home, Quotations tab,
New-type sheet, Select Customer, Create Order, Submit Details sheet, Order
Detail) — distinct from Daily Sales, backed by the existing
`lib/features/sales_order/` module (`/sales-orders/*` routes). Planned via
`EnterPlanMode` given the scope (9 screens, several structural changes)
before implementing — see the approved plan for full screen-by-screen
mapping. Like Daily Sales, this was predominantly visual: the real business
rules already matched the mock closely (cash-customer→quotation-only
redirect, real credit-line data, real discount/VAT math).

**Tooling note carried over from last session:** confirmed the
`claude_design` MCP's `get_file` 256 KiB truncation doesn't affect this
module either (Orders & Quotations content sits well before the truncation
point in the full file).

**Data-reality note (not a decision, just documented):** `SalesOrder`/
`SalesQuotation` are explicitly commented `"UI-layer stub"` in their own
source. Quotations are real API-backed (read + submit); Sales Orders
themselves are pure in-memory (`SalesOrdersNotifier`, no persistence) —
created orders vanish on app restart. Pre-existing behavior, unchanged by
this pass; the dark stats hero on Sales Home is computed live from
whatever's really in that in-memory list.

| Mock frame | Implementation | Notes |
|---|---|---|
| Orders Home / Quotations tab | `SalesOrderHomeScreen` (rebuilt) | Replaced the Material `TabBar` with the mock's dark stats-hero header (title + OPEN VALUE/AWAITING ACTION/FULFILLED TODAY or OPEN QUOTES/QUOTED VALUE/CONVERTED, computed live from real order/quotation lists) + pill toggle. `OrderCard`/`QuotationCard` rebuilt to the mock's status-icon-circle row format (2px amber border for pending orders, inline "Convert to Order" pill on open quotations). |
| New — choose type (sheet) | same file, `_newDocument()` | Rebuilt to the mock's centered icon-card sheet (purple Sales Order / amber Sales Quotation cards). |
| Select Customer | `SelectCustomerScreen` (rebuilt) | Dark header w/ translucent search; new All/Credit/Cash filter pills (real client-side filter); customer cards rebuilt with avatar-initials, credit-line banner using real `overCreditLimit`/`effectiveAvailableCredit` fields (green available / red 2px-border nearly-exhausted) — not a guessed ratio. Mock's "last order date" omitted, no such field on `SalesCustomer`. Kept the real cash-customer confirm dialog, added the mock's persistent hint caption alongside it. |
| Create Order (+ Quotation) | `CreateOrderScreen` (rebuilt) | Light back-header; "Add products" row opens the real `ProductPickerScreen`; `LineItemTile` rebuilt with a leading icon thumbnail, model number, price-each, and quantity stepper (see follow-up below — discount UI later removed per user request); purple `OrderTotalsCard` band; Submit Details sheet rebuilt to the mock's chrome (warehouse row, LPO/notes fields, black "Submit Order · total" button). |
| Order Detail | `OrderDetailScreen` (rebuilt) | Dark header w/ avatar-initials + status pill; new 3-step Placed→Confirm→Fulfil tracker driven by real `SalesOrderStatus` (cancelled shows a red banner instead, tracker frozen); Confirm action moved from an app-bar icon into the bottom button row as a black primary button (mock has no app-bar action), same real `update()` call — same slot becomes "Mark Fulfilled" once confirmed. "Created by" now shows the real logged-in user via `currentUserProvider` (previously not displayed anywhere on this screen). |
| Quotation Detail | `QuotationDetailScreen` (restyled) | No mock frame — styled with the same dark-header/purple-band language as Order Detail for consistency. Kept both real actions (Convert to Sales Order, View Related Sales Order). |
| Convert Quotation | `ConvertQuotationScreen` (restyled) | No mock frame — light-touch restyle (light header, `SurfaceCard` sections, `PrimaryButton`), same real payment-method/reference logic. |
| Product Picker | `ProductPickerScreen` (restyled) | No mock frame — light-touch restyle (light header, pill search + filter icon, bordered product rows). |

Shared widgets rebuilt: `OrderTotalsCard` (→ purple `#F1E6FF` band, same
language as Daily Sales' `OrderSummaryCard`), `SalesFilterBar` (→ pill
search/filter icon, filter sheet moved onto `showRouteBottomSheet` chrome).

### Follow-up fixes from live testing (same day)

1. **Model number missing from cart line items.** `OrderLineItem` (and the
   `LineItemTile` that renders it) never carried `SalesProduct.modelNumber`
   through — real API data (`SalesProduct.fromApiJson`'s `model_number`,
   and quotation line items' `model_number` from the server) that just
   wasn't threaded into the entity. Added `modelNumber` to `OrderLineItem`,
   populated in `.fromProduct()` and the quotation-line mapping in
   `sales_order_providers.dart`, displayed in `LineItemTile`.
2. **Discount UI removed from the line item card and the card redesigned**
   per direct user request — `LineItemTile` no longer takes
   `onDiscountChanged`/renders the discount slider/row; the underlying
   `SalesDraftNotifier.updateDiscount` capability is left in place
   (unused for now, not deleted — a real capability, just without a UI
   entry point today). Card itself rebuilt with a leading icon thumbnail
   and clearer name/model/price hierarchy, matching Daily Sales'
   `CartItemCard` convention for consistency across the app.
3. **Submit Details sheet's button hidden behind the on-screen nav bar**
   on a physical device with 3-button navigation — the sheet's bottom
   padding only accounted for `viewInsets.bottom` (keyboard), not
   `MediaQuery.padding.bottom` (system nav bar). Fixed by wrapping the
   sheet content in `SafeArea(top: false, ...)`.

### Verification

`flutter analyze` clean across `lib/features/sales_order/` after each
screen group (zero new issues; same two pre-existing info-level lints as
before). Live-tested on a physical Android device (`R5GYB50NBEX`, 3-button
nav) against the real dev backend: Sales Home (dark stats hero, toggle,
empty state, FAB) → New → Sales Order → Select Customer (real credit-line
banners across several real customers) → Create Order (product picker,
added product, redesigned line item card with model number, purple
totals) → Review Order → Submit Details sheet (button now visible above
the nav bar) confirmed by the user. Quotations tab, Order Detail's status
tracker, and Convert Quotation were reviewed against the mock/code but not
separately walked end-to-end live this pass.

## Products module rebuild (2026-08-10)

Mock section G (`lib/features/products/`, routes `/products`,
`/products/detail`). Planned via `EnterPlanMode` given the scope (2
screens, 12 widget files). Like the prior two modules, almost entirely
visual — every real capability already existed (stock lookup, pricing,
5-bucket ageing donut, sell-out history, sales target, alternatives,
competitor SKU price tracking with history, "not selling" reporting).

**Key leverage:** `SectionCard` (`lib/features/products/presentation/widgets/section_card.dart`)
is the single card primitive every detail-screen widget uses (stock,
pricing, ageing, sell-out, sales target, alternatives, competitors,
not-selling, clock-in placeholder) — retoning it once (`Colors.white`/
`Colors.grey` → `kPrimaryLightColor`/`kBorderColor`, and moving its title
from an inside muted-uppercase label to an outside bold-black label,
matching the mock's "Warehouse stock"/"Stock ageing" heading style
confirmed against HD reference screenshots the user shared mid-build)
updated every card at once, the same leverage `SurfaceCard` gave Daily
Sales and `OrderTotalsCard` gave Sales Orders.

**Structural change:** split `AlternativesCard` out of the "Insights" tab
into its own "Alternatives" tab — the mock's tab bar shows 4 tabs
(Overview/Insights/Alternatives/Competitors), the code had 3. Zero new
code, just relocating an existing real widget to match the mock's literal
IA.

| Mock frame | Implementation | Notes |
|---|---|---|
| Products — list | `products_screen.dart` (restyled) | Search field + quick category chips (real `state.availableGroups`, not hardcoded) restyled to mock; kept the real `CategoryFilterSheet` drill-down behind the tune icon. |
| — | `product_card.dart` (rebuilt) | Diagonal-stripe photo placeholder (`ProductPhotoPlaceholder`, reused on the detail screen's hero block too) + name, then **model number and category as separate stacked lines** (not joined on one line — fixed after a user correction), then price/incentive trailing column (added back after a user correction; the mock's own list frame doesn't show price, but real capability + explicit user request won out). Stock status pill intentionally omitted — see departures. |
| Product Detail — Overview & Stock | `product_detail_screen.dart` (rebuilt) | Light `RouteBackHeader`, photo placeholder, 4-tab bar. Merged the old separate `_PricingCard`/`_DetailsCard` into one un-headed `_IdentityCard` (SKU/Category/Price/Incentive rows matching the mock's single combined card exactly, confirmed pixel-for-pixel against the user's reference image) — brand/barcode/UOM/status rows still appended below for real data the mock doesn't happen to show. `_StockCard` renamed "Stock" → "Warehouse stock" to match mock wording exactly, aggregate-available/status-badge kept (real, informative, mock just doesn't show it — "kept beyond the mock"). |
| — | `stock_ageing_card.dart` | Kept the real 5-bucket donut+legend (more informative than the mock's illustrative 2-bucket static example) — bucket colors retoned toward tokens where a token exists. |
| Product Detail — Competitors | `competitor_mapping_card.dart` (restyled) | Search + brand-filter row restyled to pill/token style; `_MappingCard` rebuilt with a photo-placeholder thumbnail + price/status column matching the mock's competitor-row layout, while keeping the real offer-price strikethrough, status pill, and feature-comparison text the mock's static example doesn't show. |
| — (no mock frame) | `report_not_selling_sheet.dart`, `add_competitor_mapping_sheet.dart`, `category_filter_sheet.dart` | Light-touch: grabber/border/radius token retone only, all real form fields/validation/submit logic untouched. |

### Departures specific to this module

1. **List cards' stock status pill** — the catalogue list endpoint doesn't
   return stock (existing code comment confirms this explicitly; stock is
   only fetched per-product on the detail screen). Omitted from the list
   rather than fabricated.
2. **Competitors tab's "All outlets / This outlet only" toggle** — the
   real endpoint isn't outlet-scoped at all (code comment: "not
   outlet-scoped, so it always loads regardless of clock-in state"). Kept
   the real brand-filter dropdown (pill-styled) in place of a toggle with
   nothing to switch.
3. **Overview tab's "Add to Order" button** — no capability today connects
   a product-detail view to an in-progress Sales Order draft (`CreateOrderScreen`
   always starts from picking a customer first). Omitted rather than
   fabricated — same treatment as Replenishment's "Convert to Sales Order"
   gap from the Sales Orders module.

### Verification

`flutter analyze` clean across `lib/features/products/` (zero new issues).
Live-tested on a physical Android device against the real dev backend
through the on-device screenshot loop; the user also live-verified
directly and requested two corrections mid-build (model number stacked
above category rather than joined, and price/incentive restored to the
list card) — both applied and reflected in the table above.

## Known departures from the mock (no backing data)

1. **Active-visit "N of 6 activities completed" progress bar** — dropped.
   No cross-module (stock take + shelf share + daily sales + facings)
   completion aggregate exists per visit. The black active-visit card keeps
   duration/outlet/clock-in-time/CTA only.
2. **Home's "Recent Activity" feed** — omitted entirely. No activity log
   data source exists.
3. **"Tasks" bottom-nav screen** — the mock shows a due-today/in-progress/
   completed task list driven by live per-visit task status. Implemented
   instead as a flat, static list of task-module shortcuts (see above) since
   the status aggregation doesn't exist and building it would be a new
   feature, not a restyle.
4. **"Clock Out — incomplete activities" bottom sheet** (added in the v2
   Daily Route mock) — **not built**. It shows a checklist of pending
   modules (e.g. "Daily Sales", "Facings Count") gating clock-out, but that
   requires the same per-visit cross-module completion data as departure
   #1, which doesn't exist. Clock Out remains a direct action with no
   fabricated checklist.
5. **"Visit Complete — summary" per-module stats card** — the mock's
   itemized list (stock take count, shelf share %, sales total, facings
   count) needs the same unavailable data; `ClockOutVisitUseCase` only
   returns the updated `OutletVisit`, nothing cross-module. The screen
   (`VisitCompleteScreen`) was still built and is wired in after a real
   clock-out, but shows only outlet name + duration — both real.
6. **Skipped Outlets' "Reschedule" action** — no reschedule/reactivate API
   exists on `OutletVisitRepository`. Shows an info toast ("Coming soon")
   instead of a fabricated call. "Visit Now" does navigate for real, to the
   visit's existing detail screen.

## Module checklist

| Module | Section(s) in mock | Status |
|---|---|---|
| 0 — Design system foundation | A | ✅ Done |
| 1 — Home + navigation shell | C, I (adapted), J (adapted) | ✅ Done |
| 2 — Daily Route flow | D | ✅ Done — rebuilt a second time (2026-08-08) against an expanded, pixel-precise D section the user redesigned (grew from 3 to 9 screen states). See "Daily Route v2 rebuild" below for the full breakdown. `GeofenceOverrideRequestScreen` restyled in a follow-up (2026-08-08, see below). `RouteCloseScreen` (the rare recovery-path full-screen close, kept for stale/active-visit cases) is the one Daily Route screen **not** restyled to the new pixel spec. |
| B — Authentication | B | ⬜ Not started (Login/Forgot Password/OTP/Reset/Location Permission still on old styling; buttons will already look closer via the shared theme, but layout/copy untouched) |
| Stock Take | E (partial) | ✅ Done (2026-08-09) — see "Stock Take module rebuild" below |
| Daily Sales + Replenishment | F | ✅ Done (2026-08-09), extended (2026-08-10) — see "Daily Sales + Replenishment module rebuild" and its "Follow-up" below. OTP + proof-of-purchase confirm flow, Register Sale Step 1 restyle, and Replenishment's Convert to Sales Order all added in the follow-up. |
| Shelf Share | E | ⬜ Not started |
| Facings Count | E | ⬜ Not started |
| Sales Orders / Quotations | F | ✅ Done (2026-08-10) — see "Sales Orders & Quotations module rebuild" below |
| Products | G | ✅ Done (2026-08-10) — see "Products module rebuild" below |
| My Performance | H | 🚧 In progress (2026-08-10) — see "My Performance module rebuild" below |
| After Sales / Complaints | — | ⬜ Not started |
| Settings / Help Center | — | ⬜ Not started (still mostly stub screens per baseline doc) |
| Session History (legacy clock-in) | — | ⬜ Not started |
| System states (loading/empty/offline/error/success) | K | ⬜ Not started as a formal pattern — ad hoc per-screen only |
| Dark theme parity | — | ⬜ Not started (deferred, see above) |

## Daily Route v2 rebuild (2026-08-08)

The user redesigned the Daily Route section of the mock and asked for a
pixel-accurate copy (not just a token-level restyle). The new mock defines
9 screen states; here's how each maps to the app:

| Mock screen | Implementation | Notes |
|---|---|---|
| Today's Route | `VisitListScreen` (rebuilt) | Replaced the old full per-visit card list with: progress card, a single black "next outlet" (or "in progress") card, and a flat "upcoming" list — matches the new IA. A "Close Route" control and pending/active warning banners were kept (not in the mock's screenshot) since the app needs a reachable way to close the route; placed at the bottom of the screen rather than invented as a floating element. |
| Today's Route — Skipped outlets | new `SkippedOutletsScreen` (`/daily-route/skipped`) | Reached via a link added to the progress card when `skippedCount > 0` (the mock doesn't show the entry point, only the destination). |
| Close Route — confirm | new `showCloseRouteConfirmSheet` bottom sheet | Only used for the common case (no active visit; any pending visits already routed through the existing `BulkSkipReasonsDialog` first, preserving the per-visit skip-reason requirement). Navigates to the new summary screen on success. |
| Route Closed — summary | new `RouteClosedSummaryScreen` (`/daily-route/close/summary`) | Receives real completed/skipped/missed counts via route `extra`. |
| Outlet / Visit Detail | `VisitDetailScreen` (restyled) | Dropped the app bar + bottom nav in favor of the mock's plain back-chevron header (`RouteBackHeader`); dropped the "Last visit" row (no such data exists). "Skip Visit" changed from an outlined button to the mock's plain text link. |
| Active Visit | `ActiveVisitScreen` (restyled) | Also drops app bar + bottom nav — and, matching the mock exactly, has **no back button at all** (you leave only by clocking out). Clock-out now navigates to the new Visit Complete screen instead of back to the visit list. |
| Skip Visit — reason | `SkipReasonDialog` (rebuilt as a bottom sheet) | Was a centered `AlertDialog`; now a bottom sheet with the mock's bordered/purple-selected reason cards. Real skip reasons still come from `skipReasonsProvider`; the notes field (required for reasons like "Other") isn't in the mock but was kept since the existing validation rule requires it. |
| Clock Out — incomplete activities | **not built** | See departure #4 above. |
| Visit Complete — summary | new `VisitCompleteScreen` (`/daily-route/visit/:id/complete`) | See departure #5 above — real outlet/duration only. |

New shared widgets: `RouteBackHeader` (back-chevron + title header for
pushed sub-screens), `showRouteBottomSheet` (grabber + rounded-top-28 sheet
chrome shared by the confirm/skip sheets).

### Follow-up fixes from live testing (same day)

Testing the rebuilt flow on-device surfaced two more issues, both fixed:

1. **`BulkSkipReasonsDialog`** (the multi-visit skip-reason collector used
   when closing a route with pending visits) was still the old centered
   Material `AlertDialog` with `RadioListTile`s — untouched by the rebuild
   above. Rebuilt on the same bottom-sheet chrome and `_ReasonCard` as the
   single-visit `SkipReasonDialog`, so both now look identical.
2. **Wrong flow order**: tapping "Unclosed Route" on Home (`_UnclosedRouteCard`
   in `route_status_card.dart`) and "Close Previous Route" on
   `RouteActivationScreen` used to pre-fetch the stale route, then pop the
   skip-reason sheet *directly on top of Home/Activation* before ever
   navigating anywhere. Both are now a plain `context.push('/daily-route/close')`
   — `RouteCloseScreen` already lists the not-yet-visited outlets and owns
   an "Add Skip Reasons" button that opens the sheet itself, and a "Close
   Route" button that performs the close. After closing, it still routes to
   `/home`, which has the floating bottom nav.

## Testing log

- **2026-08-08** — `flutter analyze` run after each module; zero errors
  introduced across the whole project (only pre-existing info-level lints
  remain). Built and deployed to an Android emulator
  (`emulator-5554`, Android 16) via `flutter run`; app launches cleanly, no
  crashes. Verified visually via `adb screencap`: the Login screen (not
  itself part of Module 0–2's scope) already picks up the new canvas color,
  black pill primary button, and purple accents purely from the shared
  theme change — confirms the ambient-theme approach is propagating
  correctly to screens that weren't touched directly.
  **Not yet verified**: the authenticated screens (Home, Tasks, Menu, full
  Daily Route golden path) — this session had no valid backend login
  credentials to get past the Sign In screen. Needs a manual pass with real
  credentials before Module 1/2 are considered fully verified.
- **2026-08-08 (later same day)** — a subsequent run kept an already-signed-in
  session (persisted auth), enabling real on-device verification against
  live dev data ([DEV] KENYA backend): Home (greeting header, Unclosed
  Route card, Quick Actions, Performance tiles, floating nav) all render
  correctly. `RouteActivationScreen`'s "Start Your Day" / unclosed-route
  warning renders correctly with the floating nav showing "Route" selected.
  Walked the full recovery-close path against a real stale route (3 pending
  visits): Home → `RouteCloseScreen` (lists the 3 not-visited outlets,
  matches the flow fix above) → "Add Skip Reasons" → bottom sheet renders
  pixel-correct (grabber, progress pill, bordered reason cards, purple
  selected-state with checkmark, disabled→black "Next" pill on selection).
  Did not complete an actual route closure or clock-in/out (would mutate
  real dev data mid-session) — Today's Route (with an activated route),
  Visit Detail, Active Visit, Visit Complete, and Route Closed summary are
  still unverified live, though all compile clean and follow the same
  verified patterns.
