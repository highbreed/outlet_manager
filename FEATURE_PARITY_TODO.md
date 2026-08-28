# Feature Parity TODO

Gap analysis between the legacy app (`/Users/stephen/Mobile/outlet_m`) and this new build (`outlet_manager`).
Goal: reach feature parity with the legacy app, then retire it.

_Last updated: 2026-07-06_

## Priority 1 — Major missing features

- [ ] **Daily Summary** — full reporting screen (legacy: `lib/screens/daily_summary/`)
  - [ ] Per-outlet summary view + outlets list view
  - [ ] Sales Today section
  - [ ] Sales MTD section
  - [ ] Stock Values MTD section
  - [ ] Stock Take section
  - [ ] Warranties section
  - [ ] Aftersales section
  - [ ] Reporting Times section
- [ ] **Sales & Warranty management** (legacy: `lib/screens/sales_warranty/`)
  - [ ] Sales details screen (customer details, sales items, sales summary)
  - [ ] Warranty management (warranty cards, add-warranty dialog, warranty details, filtering)
- [ ] **Warranty Registration** (legacy: `lib/screens/waranty_reg/`)
  - [ ] Warranty registration form + dialog
  - [ ] Warranty list screen

## Priority 2 — Shelf share parity & merchandising

- [ ] **Facings** — horizontal facings feature (legacy: `lib/screens/facings/` + `horizontalFacings_controller.dart`)
  - [ ] Facings list body
  - [ ] Facings form
  - [ ] Facings detail screen
- [ ] **Drop Count** — missing piece of the shelf share flow (legacy: `lib/screens/shelf_share/components/drop_count_screen.dart` + `drop_count_controller.dart`)
  - [ ] Add drop count entry to the new `shelf_share` feature

## Priority 3 — Inventory & product screens

- [x] **Stock List** — browsable stock-on-hand list with filters (legacy: `lib/screens/stock_list/`; sits in legacy bottom nav)
  - Implemented as the **Products** feature (`lib/features/products/`): catalogue browser at `/products` with search, category chips, brand filter, and stock-on-hand badges (via `/sales/products` + `/sales/products/filters`)
- [ ] **Product screen / product mapping** (legacy: `lib/screens/product/`)
  - [x] Product detail screen — `/products/detail` (identity, pricing, stock on hand, details)
  - [ ] Product map + product map form
  - [ ] Per-warehouse stock breakdown (legacy `product_warehouse_stock_modal`) — needs a backend endpoint; `/sales/products` only returns total quantity
- [ ] **Proposed Orders home/list** — legacy has a standalone dashboard entry (`lib/screens/proposed_orders/`); new build only has per-visit `proposed_order_detail_screen` under `stock_take`

## Priority 4 — Finance & requests

- [ ] **Expenses** — expense/transaction tracking with expense types (legacy: `lib/screens/expenses/`). The "Cash Flow" home tile currently routes to `/coming-soon`
- [ ] **Application Requests** (legacy: `lib/screens/application_requests/`) — request form, pending applications, request product cards
  - Note: not wired into navigation in the legacy app either — confirm this feature is still wanted before building

## Priority 5 — Replace stubs & mock data in the new build

- [ ] **Sales Orders**: replace `SalesOrderMockData` product source (`lib/features/sales_order/presentation/providers/sales_order_providers.dart`) with real repository/local datasource
- [ ] **Complaints**: replace `_mockComplaints()` seed (`lib/features/complaints/presentation/providers/complaint_providers.dart`) with real repository/local datasource
- [ ] **Profile screen**: `/profile` currently routes to `HomeScreen` (`lib/core/providers/router_provider.dart` — `TODO: Create ProfileScreen`)
- [ ] **Map screen**: `/map` currently routes to `HomeScreen` (`TODO: Create MapScreen`)
- [ ] **Route Plan tile**: home grid points to `/coming-soon` even though `/schedules` (visit_schedules) already exists — wire it up
- [ ] **PDF viewer/export** — legacy `pdf_screen` (used for quotations/orders); add PDF generation + viewing to sales orders/quotations

## Supporting data domains (come along with the features above)

- [ ] Catalogue status
- [ ] Competitor SKU
- [ ] Stock ageing
- [ ] Product sellout
- [ ] Product average sales
- [ ] Expense types

## Already ahead of legacy (no action needed)

- Geofencing + location ping tracking
- Offline-first Isar sync queue
- FCM push notifications
- Permission system
- Serial-number/barcode scanning in stock take
- Clock-in session history
- Visit schedules
- Legacy "Technician" home is a stub (`Text("Technician Widget")`) — nothing to port
