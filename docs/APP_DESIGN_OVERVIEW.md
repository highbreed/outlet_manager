# Outlet Manager — Current Design & UX Overview

**Purpose of this document:** a complete, page-by-page picture of the app as it exists today — visual design system, navigation flow, and every screen's layout and purpose — written so a designer or AI agent with no prior context can understand what has been built and propose a redesign. This describes **current state**, including known rough edges; it is not a spec for how things should be.

**App:** Outlet Manager (MIKA Appliances field-sales app), package `com.mikaappliances.outlet_manager_rw`. Flutter + Riverpod + go_router, offline-first (Isar local DB with background sync). Used by field sales reps who visit outlets (retail shops) on a daily route and, per outlet visit, perform tasks: stock counts, brand-facing counts, sales registration, orders/quotations, and after-sales complaint intake. There's also a self-service performance/targets view and a product catalogue.

---

## 1. Design System

### 1.1 Color tokens (`lib/core/theme/colors.dart`)

The file's own header states these are meant to be **the only colors allowed in the app** — in practice this rule is not enforced (see §6).

| Token | Value | Intended use |
|---|---|---|
| `kPrimaryColor` | `#000000` black | Primary brand color |
| `kPrimaryLightColor` | `#FFFFFF` white | Primary brand color (surfaces, cards) |
| `kSecondaryColor` | `#4B2E83` purple | **The** accent color — buttons, active tabs, links, focused fields, highlights |
| `kSecondaryLightColor` | `#F1E6FF` light purple | Purple containers/chips |
| `kSecondaryColor2` | `#FFEAC9` warm beige | Badges/info chips only — never a button background |
| `kRedColor` | `#D50000` red | Errors, destructive actions, failed status only |
| `kBackground` | `#F7F7F7` off-white | Light-mode scaffold background |
| `kTextDark` | `#111111` | Primary text |
| `kTextMuted` | `#777777` | Secondary/muted text |
| `kTextLight` | `#FFFFFF` | Text on dark surfaces |

### 1.2 Theming (`lib/core/theme/theme.dart`)

Both a `lightTheme` and `darkTheme` `ThemeData` exist, built from the tokens above via `ColorScheme.light()`/`ColorScheme.dark()`. Light mode: white cards/inputs on `#F7F7F7` background, black-on-white app bar, 12px-rounded corners everywhere (buttons, inputs, cards, chips), purple as the one accent color. Dark mode: black scaffold, `#1C1C1E` cards/app bar, `#2C2C2E` input fill, purple accent kept the same.

**This matters a lot for the redesign**: the app is built almost entirely against the *light* theme. Most feature screens hardcode `Colors.white` backgrounds with `kTextDark` text, or use bare `Card()`/`TextField()` that inherit *ambient* theme styling rather than setting explicit colors. When the ambient theme is dark, this produces the app's single most common bug class: **white-on-white or invisible text** — a dark `Card`/`DropdownSearch` sheet with no explicit `color` renders near-black, or a `TextField` with no explicit `style` renders white text on a white `fillColor: Colors.white` box. This has been patched piecemeal (screen by screen) rather than solved systemically. `lib/features/complaints/presentation/screens/register_complaint_screen.dart:28-39` contains an explicit code comment describing and patching exactly this bug for its `DropdownSearch` fields — it's the one place in the codebase where the root cause is written down.

### 1.3 Core reusable shell (`lib/core/widgets/`)

- **`AppScaffold`** (`app_scaffold.dart`) — used by nearly every authenticated screen. Wraps `Scaffold` with a `CustomAppBar` (title, optional logo, optional location indicator, optional menu, custom leading/actions) and an optional `CustomBottomNavBar`. Auth screens, the splash screen, and the permission-gate screen use a bare `Scaffold` instead — a deliberate but unremarked-on split (pre-auth chrome vs. in-app chrome).
- **`CustomBottomNavBar`** — persistent bottom nav for a handful of top-level destinations (Home, Daily Route/Outlets, Schedules, Map (stub), Profile (stub)); most feature screens reached *through* the home grid don't show it.
- Other shared widgets: `confirmation_dialog.dart`, `loading_overlay.dart`, `permission_widgets.dart`, `toast_notification.dart` (the app's snackbar/toast helper, used pervasively for both success and "coming soon" stub messaging).
- **Not centralized**: card/surface styling. Several features independently reinvent a "white rounded card on off-white background" primitive — `SurfaceCard`/`SectionCard`/`SectionHeading` (defined in `lib/features/daily_sales/presentation/widgets/`, and re-imported cross-feature by Replenishment and referenced conceptually by Sales Performance/Products) is the closest thing to a shared visual primitive beyond Material's own `Card`, but it isn't in `core/widgets`.

### 1.4 Two competing styling conventions

Across the whole app, two different habits coexist for applying color:
1. **Ambient/theme-driven** — call `Theme.of(context).colorScheme.primary` etc. (Stock Take module mostly does this).
2. **Token-literal** — write `kSecondaryColor`, `kTextDark`, `Colors.white` directly on every widget (Shelf Share, Facings Count, Sales Order, Complaints, Products, Sales Performance, Daily Sales mostly do this).

Both look identical today (light theme only), but neither is dark-mode-safe, and a redesign should pick one convention deliberately rather than continue the split.

### 1.5 Ad hoc "shadow" status-color palette

Beyond the 9 official tokens, a de facto secondary palette exists purely through repetition across features, never centralized:
- Green (`#2E7D32`, `#43A047`) — success / active / fulfilled / in-warranty
- Orange (`#E65100`, `#FF6F00`) — pending / warning / deviation / quotation
- Red (`#C62828`, plus raw `Colors.red`) — rejected / out-of-warranty / below-min-stock
- Blue (`#1565C0`) — "activated" route state
- Purple-adjacent grays/browns — assorted feature-tile background colors (see §3.3)

A redesign should turn this into a real semantic-color system (success/warning/danger/info) rather than leaving it as scattered hex literals.

### 1.6 Iconography & imagery

Mix of Material icon glyphs (`Icons.inventory_2_outlined`, `Icons.point_of_sale_outlined`, etc.) and custom PNG assets (`assets/images/*.png` — shelf, routes, dashboard, sales_order, complain, cash-flow, count) used specifically for the home-screen feature tiles, with icon-based fallback if an asset fails to load. No icon font/custom icon set beyond Material's default.

---

## 2. Navigation Architecture

`go_router` (`lib/core/providers/router_provider.dart`) with a single global `redirect` handling three gates in order: **auth state** (splash while checking → login if unauthenticated) → **location permission** (forced `/location-permission` screen if not granted) → **home**. Once past both gates, the app is a flat set of feature routes pushed on top of Home — there's no nested tab/shell navigator; `context.push`/`context.go` calls are used directly against a flat route list (a few places bypass this with raw `Navigator.push(MaterialPageRoute(...))` instead — see §6).

### 2.1 High-level flow

```
Splash
  → (not logged in) Login ⇄ Forgot Password → Verify OTP → Reset Password → Login
  → (logged in, no location permission) Location Permission gate
  → (logged in + permission) Home
        │
        ├── Daily Route: Activate Route → Visit List → [per outlet] Visit Detail
        │     → (clock in) Active Visit → back to Visit List → ... → Close Route → Home
        │     (side branch: Visit Detail → Geofence Override Request, when outside radius)
        │
        └── From Home's feature grid (13 tiles) OR from within an active visit's
            in-visit task menu, jump into any of:
              Stock Take · Daily Sales (+ Reorder) · Shelf Share · Facings Count ·
              Sales Orders & Quotations · Products · My Performance · After Sales ·
              Route Plan (schedules) · Session History · Settings · Cash Flow (stub)
```

Most in-visit task modules (Stock Take, Daily Sales, Shelf Share, Facings Count) require an **active clocked-in visit** — `FeatureTile._handleTap()` (`lib/features/screens/home/widgets/feature_grid.dart:270`) reads the global `activeVisitProvider` and injects `customerId/customerCode/customerName/visitLocalId/visitServerId` into the route's `extra` map; if there's no active visit, it still navigates but passes a "No Active Visit" placeholder and the destination screen shows its own not-clocked-in empty state (a full-screen prompt to go clock in via Daily Route). Products, Sales Performance, Sales Orders, and Settings are *not* visit-gated — reachable any time.

### 2.2 Full route table

| Route | Screen | Notes |
|---|---|---|
| `/splash` | SplashScreen | Logo + spinner, checks auth/location in background |
| `/login` | LoginScreen | |
| `/forgot-password` → `/forgot-password/verify-otp` → `/forgot-password/reset` | ForgotPasswordScreen → VerifyOtpScreen → ResetPasswordScreen | |
| `/location-permission` | LocationPermissionScreen | Mandatory gate |
| `/` , `/home` | HomeScreen | Dashboard + feature grid |
| `/settings` | SettingsScreen | Mostly stubbed |
| `/help` | HelpCenterScreen | Mostly stubbed |
| `/daily-route` | RouteActivationScreen | "Start Your Day" |
| `/daily-route/visits` | VisitListScreen | Today's route |
| `/daily-route/visit/:visitLocalId` | VisitDetailScreen | Pending visit — clock in / skip / override |
| `/daily-route/visit/:visitLocalId/active` | ActiveVisitScreen | Clocked-in timer / clock out |
| `/daily-route/visit/:visitLocalId/override` | GeofenceOverrideRequestScreen | Out-of-radius approval flow |
| `/daily-route/close` | RouteCloseScreen | End-of-day summary + close |
| `/schedules` | ScheduleListScreen | Read-only weekly plan |
| `/clock-in`, `/clock-in/active` | ClockInScreen, ActiveSessionScreen | **Legacy** parallel clock-in system, only reached via deviation push-notification deep links today |
| `/clock-in/history` | SessionHistoryScreen | Reads the *legacy* session store; still a live home-grid tile |
| `/stock-take`, `/stock-take/start`, `/stock-take/session/:id`, `/stock-take/session/:id/add-product`, `/stock-take/session/:id/item/:itemId`, `/stock-take/history`, `/stock-take/proposed-order/:visitId` | Stock Take screens | Full session lifecycle, see §3.6 |
| `/daily-sales`, `/daily-sales/register`, `/daily-sales/reorder`, `/daily-sales/:id`, `/daily-sales/:id/confirm` | Daily Sales + Replenishment screens | See §3.9 |
| `/shelf-share`, `/shelf-share/session/:id`, `/.../select-groups`, `/.../brand-entry` | Shelf Share screens | See §3.7 |
| `/facings`, `/facings/count/:id`, `/facings/count/:id/select-groups` | Facings Count screens | See §3.8 |
| `/sales-orders`, `/sales-orders/customers`, `/sales-orders/create`, `/sales-orders/order/:id`, `/sales-orders/quotation/:id`, `/sales-orders/quotation/:id/convert` | Sales Order screens | See §3.10 |
| `/products`, `/products/detail` | ProductsScreen, ProductDetailScreen | See §3.11 |
| `/sales-performance` | SalesPerformanceScreen | See §3.12 |
| `/after-sales`, `/after-sales/register`, `/after-sales/:complaintNo` | Complaints screens | See §3.13 |
| `/coming-soon` | ComingSoonScreen | Generic placeholder (used by "Cash Flow") |
| `/outlets` | redirects to `/daily-route` | |
| `/map`, `/profile` | Both just render HomeScreen | Unbuilt bottom-nav stubs |

### 2.3 Route-order caveat

`go_router` matches routes in declaration order, and a static path declared *after* a same-depth dynamic `:param` route gets silently shadowed. This has caused at least one real production crash (`/daily-sales/reorder` momentarily matched by `/daily-sales/:id`) — worth flagging to whoever restructures routing, since the current list has grown ad hoc, feature by feature.

---

## 3. Page-by-Page Reference

### 3.1 Home / Dashboard (`lib/features/screens/home/`)

`AppScaffold` (title "Outlet Manager", logo shown, bottom nav visible). Single scrolling column, top to bottom:

1. **User info hero card** — full-width purple gradient (`kSecondaryColor` → a darker purple), rounded, circular avatar with initials, "Welcome back, {name}", a role pill badge, a notification bell (currently a no-op).
2. **Active visit card** (only when clocked in) — light-blue card with a live ticking duration counter, a pulsing "CLOCKED IN" pill, outlet name/code, tap → jumps to the active-visit screen. One of the few widgets on this screen that is theme-aware (light/dark branch coded explicitly).
3. **Daily route status card** — a 5-state widget: loading / error / "Unclosed Route" warning (orange gradient CTA) / "Start Your Day" (green gradient CTA) / in-progress status (white card, colored status pill, progress bar, "N / M visits", tap → visits list). Uses its own ad hoc hex colors rather than the token palette.
4. **Quick stats row** — three tiles (Today's hours / Visits / Target%). **Currently hardcoded to zero** — not wired to real data.
5. **"Quick Actions" header** + a non-functional "See All" button.
6. **Feature grid** — a 3-column grid of 13 gradient tiles (each a solid color fading to 80%-alpha of itself, a faint oversized icon watermark, small icon chip, title text): Stock Take, Orders & Quotations, Daily Sales, Shelf Share, Facings Count, Products, My Performance, After Sales, Cash Flow (badged "SOON", disabled-feeling), Daily Route, Route Plan, Session History, Settings. Each tile's background color is a one-off hex pick, not from the token palette (purple, orange, pink, teal, deep purple, indigo, cyan, red, green, brown, blue, blue-grey — effectively a 13-color rainbow with no systemic logic beyond "look distinct").

Dead code found in this area: `status_card.dart`, `location_info_card.dart`, `location_info_row.dart` under `home/widgets/` are defined but never imported anywhere — leftovers from an earlier dashboard layout.

### 3.2 Settings & Help (`lib/features/screens/settings/`, `.../help/`)

- **SettingsScreen** — profile header card (avatar, name, email, role chip) + four grouped lists of `ListTile`s (General / Location / Data & Privacy / About). Every tile except "App Version" just shows a "Coming soon!" toast — effectively a static shell, not a working settings screen.
- **HelpCenterScreen** — non-functional search field, two "quick action" cards (Live Chat/Email, both toast stubs), 5 FAQ `ExpansionTile`s, 4 stubbed help-topic tiles, a "Contact Support" CTA card. Entirely static content today.

### 3.3 Splash & Coming Soon

- **SplashScreen** — bare `Scaffold`, centered logo + spinner, silently kicks off a location-permission check.
- **ComingSoonScreen** — reusable placeholder: animated purple circular icon badge, "Coming Soon" headline, feature-name pill, description, "Back to Home" button. Currently only used for "Cash Flow".

### 3.4 Auth flow (`lib/features/auth/`, plus the permission gate)

All auth screens use a bare `Scaffold` + default `AppBar` rather than `AppScaffold` — visually a different "mode" from the rest of the app (no logo/menu chrome, plain Material styling).

- **LoginScreen** — centered form: logo, email field, password field (obscure toggle), "Forgot Password?" link, inline red error banner + snackbar on failure, "Sign In" button (spinner state), version footer.
- **ForgotPasswordScreen** — icon + title + instructions + email field + "Send Verification Code" button.
- **VerifyOtpScreen** — illustration + 6 individual single-digit boxes with auto-advance focus and auto-submit on the 6th digit + "Resend" link.
- **ResetPasswordScreen** — illustration + new-password/confirm-password fields (independent obscure toggles) + submit.
- **LocationPermissionScreen** — mandatory gate, re-checks on app resume. Location-pin icon, explanation text (differs if the OS location service itself is off), 3 "why we need this" feature rows (Real-time Tracking / Verify Visits / Route Optimization), then either "enable location service" or "grant/deny" actions (with an "Open Settings" escape hatch if permanently denied). Grants immediately start location tracking and route to Home.

### 3.5 Daily Route — the field-visit lifecycle (`lib/features/daily_route/`)

The most actively maintained flow, and the only one that consistently branches on light/dark theme (though it does so by re-deriving ad hoc hex pairs per screen rather than from shared tokens).

- **RouteActivationScreen** ("Start Your Day") — auto-skips to the visit list if a route is already active. Otherwise: large circular icon badge, today's date, an "Unclosed Route Found" warning card if yesterday's route was never closed, and a full-width "Activate Route" button that creates the day's visit list.
- **VisitListScreen** ("Today's Route") — one scrolling list containing (in order) a status banner, a progress bar, a 4-up stat row (Total/Pending/Done/Skipped), an optional "Currently at: {outlet}" banner, then every visit as a card (tap routes to detail/active/completed depending on status); a **"Close Route" button is pinned outside the scroll area** at the bottom, disabled while a visit is active and showing contextual warnings otherwise. (Recently reworked from a fixed-header layout that made the visit list itself barely scrollable.)
- **VisitDetailScreen** (pending visit) — outlet card (numbered avatar, status chip, scheduled time), live distance-to-outlet readout (polls GPS every 3s), a GPS-accuracy warning if weak signal, an override-request status banner if one exists, "Clock In" (enabled only inside the geofence + good accuracy, or with an approved override), "Request Override" (when outside radius), "Skip Visit" (opens a reason dialog).
- **ActiveVisitScreen** (clocked in) — a large 200×200 circular ticking timer, allocated-vs-elapsed time comparison (turns amber on overtime), "Clock Out" button; clocking out from outside the geofence pops a force-clock-out confirmation dialog.
- **GeofenceOverrideRequestScreen** — a supervisor-approval side flow: request form (distance/accuracy shown, required 10+ char reason, 15-minute expiry note) → status view once submitted (color-coded card, live countdown, rejection note if rejected, refresh/cancel/"clock in now" actions depending on state).
- **RouteCloseScreen** ("Close Route") — a route-summary card (circular progress ring + Completed/Skipped/Pending/Total) and a time-summary card (start/first-clock-in/last-clock-out/total duration); blocks closing until any active visit is ended and every pending visit has a skip reason (bulk-editable via a dedicated dialog); final "Close Route" button, or "Continue Working" to back out.

### 3.6 Clock-In (legacy) (`lib/features/clock_in/`)

A second, largely redundant clock-in/out state machine that predates Daily Route's own. Router comments explicitly label it "Legacy." Its `ClockInScreen`/`ActiveSessionScreen` pair is only reached today via a push-notification deep link for unscheduled "deviation" visits — not from the home grid or normal route flow. Its clock-out form additionally asks for **transport expense, route covered, and whether an order was placed** (business/expense data Daily Route's own clock-out doesn't collect). `SessionHistoryScreen` (a live home-grid tile, "Session History") reads from *this* legacy session store — meaning visits clocked via the normal Daily Route flow may not show up there at all. Also the one place in the app where navigation breaks from `go_router` (`Navigator.pushReplacement` with a raw `MaterialPageRoute`).

### 3.7 Visit Schedules (`lib/features/visit_schedules/`)

**ScheduleListScreen** ("My Schedule") — a day-of-week tab bar (7 tabs, defaults to today) governs a list of that day's scheduled outlets; a purple summary bar above shows outlet count + total allocated time. Purely a read-only planning preview — doesn't connect to actually clocking in (that's Daily Route).

### 3.8 Stock Take (`lib/features/stock_take/`)

The most complex module — a full offline-first session lifecycle.

- **StockTakeHomeScreen** — not-clocked-in empty state if no active visit; otherwise a customer header + 3 tabs: **Active** (current session status card + Continue/Start button, or a blocking red banner if a *different* customer has an unresolved session that must be cancelled/resumed first), **Closed** (list of today's completed/cancelled sessions, tap → read-only view), **Proposed Order** (a multi-state area: not-yet-eligible blockers, a live job-progress card while the server generates a proposed reorder, or the finished order's summary + "View Full Order"/"Regenerate").
- **StartSessionScreen** — pick a warehouse (Display vs. Back-Store, card list) + optional notes → "Start Stock Take".
- **StockTakeSessionScreen** — the counting UI: live summary header (products/scanned counts, duration ticker), search field, then a list of product cards each showing model, a status icon+color (below-min/above-max/ok), a min/max box, and a thin progress bar along the card edge; swipe-to-delete; tap → serial scan. Bottom bar: Add Product / Submit / End Session.
- **AddProductScreen** — searchable, brand-grouped, infinite-scroll product picker.
- **SerialScanScreen** — per-item serial capture: camera-scan button + manual text entry with heavy client-side validation (rejects URLs, all-digits, brand-specific length rules), scanned list, delete-with-reason.
- **BarcodeScannerScreen** — the one fully custom, non-`AppScaffold` screen: full-bleed black camera view with a scan-line overlay and corner brackets.
- **StockTakeHistoryScreen** — appears to render hardcoded mock data with `TODO` comments; likely dead/superseded by the Home screen's real "Closed" tab.
- **ProposedOrderDetailScreen** — read-only order summary (status chip, item/qty/total tiles, line-item table with stock-level dots, totals), plus PDF generate/download (fully working) and Convert-to-Order/Email actions (both stubbed).

### 3.9 Daily Sales + Replenishment (`lib/features/daily_sales/`, `lib/features/replenishment/`)

- **DailySalesHomeScreen** — stats row, a conditional "Suggested reorder" accent card (from the Replenishment feature — appears only when the live reorder computation has items to suggest, tap → reorder list), filter chips, list of pending/confirmed sales.
- **RegisterSaleScreen** — a searchable product picker (dropdown-search + barcode) to build a cart, quantity/line editing, customer name/phone fields, submit. If the backend rejects the sale because today's stock take isn't complete yet, an "Stock Take Required" dialog offers a direct jump into Stock Take with the right outlet context pre-filled.
- **SaleDetailScreen** — a pending sale's detail/summary view.
- **ConfirmSaleScreen** — per-item serial-number entry to finalize a sale; on success, invalidates the reorder suggestion so the home screen's card reflects the new stock levels.
- **ReplenishmentListScreen** — read-only: per-item current/min/max stock, proposed reorder quantity, line total, plus a totals footer. No accept/send actions (informational only, by design).

### 3.10 Sales Order (Orders & Quotations) (`lib/features/sales_order/`)

The one feature not gated by an active visit — reachable any time, and it's the rep who picks *any* customer rather than the day's route context.

- **SalesOrderHomeScreen** — 2 tabs (Orders / Quotations), shared filter bar, a floating "New" button opening a sheet to choose Sales Order (credit customers only) vs. Sales Quotation (cash or credit).
- **SelectCustomerScreen** — searchable customer list with CASH/CREDIT badges; picking a cash customer while creating an "order" auto-redirects to "create quotation" instead (the order-vs-quotation business rule enforced here).
- **CreateOrderScreen** — the shared cart-style builder for both orders and quotations: customer header, line-item list (qty stepper, unit price, line total, discount slider), a running totals card, and — on submit — a bottom sheet collecting warehouse/LPO number/notes before actually posting.
- **ProductPickerScreen** — search + a filter sheet (brand/category dropdowns, model-contains field) used when adding line items.
- **OrderDetailScreen** / **QuotationDetailScreen** — near-identical read-only summaries with status-appropriate action buttons (Cancel/Confirm/Fulfill for orders; "Convert to Sales Order" for eligible quotations).
- **ConvertQuotationScreen** — quotation→order conversion; shows a payment-method/reference form only for cash customers (with a reminder to confirm payment was received), or a simple "booked to account" note for credit customers.

### 3.11 Products (`lib/features/products/`)

- **ProductsScreen** — the catalogue: search + a category/brand filter sheet (search-across-levels, breadcrumb, tabbed Category/Brand picker), grid/list of product cards showing stock status and (recently added) incentive amount.
- **ProductDetailScreen** — a tabbed detail view built up over several iterations this cycle:
  - Overview/stock tab with a stock-ageing donut chart (requires the rep to be clocked in at the outlet to supply the card code — cards that need clock-in are flagged with red text), incentive amount shown alongside price.
  - An **Insights** tab (sell-out figures, the outlet's sales target for this product, and — moved here from a separate tab — a "why isn't this selling" reporting form).
  - An **Alternatives** tab (substitute products; explicitly does *not* require clock-in, unlike stock ageing).
  - A **Competitors** tab, redesigned to handle outlets with 100+ competing SKUs per model: one card per competitor item (not squeezed into a shared list container), with its own "filter by other outlets" and category-style filter button, mirroring the products screen's own filter UX.

### 3.12 My Performance (Sales Performance) (`lib/features/sales_performance/`)

**SalesPerformanceScreen** — a month/year picker button + an outlet filter button (badge + removable chip once picked), then 3 tabs:
- **Summary** — an achievement-percentage ring (circular progress, "Target exceeded" caption above 100%), amount-sold and incentive-earned stat tiles. Works agent-wide (no outlet required) or scoped to one outlet.
- **Sellout** — a product-wise breakdown of what was actually sold this period (search + category/brand filter, grouped by category into expandable sections), independent of any target — also works agent-wide or outlet-scoped.
- **Sales Target** — requires an outlet selected; the outlet's full product target list merged with actual quantities sold, so the rep can see target-vs-achieved per product, grouped by category, with the same search/filter UX as the Sellout tab.

### 3.13 After Sales / Complaints (`lib/features/complaints/`)

- **ComplaintsHomeScreen** — search + filter-sheet, infinite-scroll list of complaint cards, floating "New After Sales" button. **Every card's status badge currently always shows "Open"** — a fully-built 5-state status badge widget exists but isn't wired up yet, because the list endpoint doesn't return a processing status.
- **RegisterComplaintScreen** — a 3-step wizard (numbered progress indicator: Consumer → Product → Type/Source) collecting consumer details (with cascading region/zone/town dropdowns), product + serial number (with barcode scan and validation), warranty status, issue description, complaint type/source, then a review-summary step before submit.
- **ComplaintDetailScreen** — read-only sectioned summary (Consumer / Product / Complaint / Warranty / Record Info cards) — no status timeline, consistent with status tracking not being live yet.

### 3.14 Shelf Share (`lib/features/shelf_share/`)

Records each brand's **facings count** (and derived % share) within an item group. Home screen: Active/Completed/All-Items tabs (the All-Items tab is an aggregated cross-session rollup by category then brand, with progress bars). Selecting an item group jumps into **BrandEntryScreen**: a two-tab picker (browse-and-select brands / edit selected brands), where each selected brand gets a quantity stepper and a live-recalculated percentage-of-group-total bar.

### 3.15 Facings Count (`lib/features/facings_count/`)

Structurally a near-copy of Shelf Share's outer shell (same home-screen tabs, same item-group picker, same dialog styling) but the actual recording screen is much simpler: a flat, cart-like list of item groups each with a plain +/− quantity stepper — no brand breakdown, no percentages, no progress bars. The two features look alike from the outside but diverge completely in their core interaction model.

---

## 4. Cross-Cutting Design/UX Observations

These are patterns worth a deliberate decision during a redesign, not necessarily "bugs" to silently fix:

1. **Two chrome styles**: `AppScaffold` (in-app) vs. bare `Scaffold` (auth + permission + splash). Intentional-feeling but never stated as a rule.
2. **Theme is effectively light-only in practice.** A `darkTheme` exists and Daily Route honors it (via inline, duplicated hex-pair branching), but most other features hardcode light-mode colors — the app would look broken in system dark mode almost everywhere outside Daily Route.
3. **No centralized "card"/"surface" primitive** — `SurfaceCard`/`SectionCard` exist but live inside `daily_sales` and get cross-imported rather than promoted to `core/widgets`.
4. **An unofficial, uncentralized status-color palette** (green/orange/red/blue hex literals repeated across features for success/pending/error/info) sits alongside the official 9 tokens.
5. **Home screen's feature-tile colors are a 13-color rainbow** with no evident system — good raw material for a real category-color scheme (e.g. by workflow stage) in a redesign.
6. **Two independent clock-in/out systems** (Daily Route's own, and a "legacy" `clock_in` module) with different data requirements, still both partially live (Session History tile reads the legacy store).
7. **Shelf Share and Facings Count** share a shell but not an interaction model — a good candidate for deliberate unification or deliberate differentiation (currently it's neither, just historical drift).
8. **A few stub/placeholder-heavy screens**: Settings, Help Center, Home's Quick Stats row, and the Complaints list's status badge are all visually complete but functionally inert — worth deciding whether the redesign finishes or removes them.
9. **Two dead screens found**: `StockTakeHistoryScreen` (mock data) and three unused Home widgets (`status_card.dart`, `location_info_card.dart`, `location_info_row.dart`).
10. **Navigation is mostly `go_router`, with a few `Navigator.push(MaterialPageRoute(...))` holdouts** (legacy clock-in, the sales-order product picker) that don't participate in the router's redirect/back-stack logic the same way.
11. **The recurring "invisible text" bug** (white text on white background, or dark-sheet-on-light-app) shows up anywhere a `TextField`/`DropdownSearch`/`Card` is left without explicit color styling and ends up nested in a container of the opposite polarity from the ambient theme. It's been fixed reactively, screen by screen, rather than by giving these primitives safe defaults.

---

## 5. Suggested reading order for a redesign agent

1. §1 (design system) — understand the token palette and its two competing usage conventions before touching any screen.
2. §2.1 (flow diagram) — understand that almost everything funnels through "clock in at an outlet, then pick a task."
3. §3.5 (Daily Route) — the spine of the whole app; every in-visit feature depends on its `activeVisitProvider` state.
4. §3.8–3.15 — the task modules themselves, roughly in the order a rep actually uses them during a visit (Stock Take → Daily Sales → Shelf Share/Facings Count → After Sales, with Products/My Performance/Sales Orders as anytime destinations).
5. §4 — the known rough edges, so the redesign fixes them deliberately rather than reproducing them.
