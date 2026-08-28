/// API endpoint constants for the Outlet Manager app
abstract class ApiEndpoints {
  // Base (configured in Dio client)
  static const String api = '/api/v1';

  // Auth
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String me = '/auth/me';
  static const String changePassword = '/auth/change-password';

  // Agents
  static const String agents = '/agents';
  static const String agentBrands = '/brands';

  // Customers
  static const String customers = '/customers';
  static const String customerProducts = '/products';

  // Visits
  static const String visits = '/visits';
  static const String visitStart = '/start';
  static const String visitComplete = '/complete';
  static const String visitPendingRoutes = '/pending-routes';
  static const String visitsTodaySessions = '/visits/routes/today/sessions';
  static const String proposedOrderGenerate = '/proposed-order/generate';
  static const String proposedOrderProgress = '/proposed-order/progress';

  // Stock Counts (Stock Take)
  static const String stockCounts = '/stock-counts';
  static const String stockCountsMyActive = '/stock-counts/me/active';
  static const String stockCountsMyActiveCatalogue =
      '/stock-counts/me/active/catalogue';
  static const String stockCountsMyActiveBrands =
      '/stock-counts/me/active/brands';
  static const String stockCountsMyActiveCustomerBrands =
      '/stock-counts/me/active/customer-brands';
  static const String stockCountItems = '/items';
  static const String stockCountSerials = '/serials';
  static const String serialsBatch = '/serials/batch';
  static const String offlineSync = '/stock-counts/offline-sync';

  // Brand Assignments
  static const String brandsMe = '/brands/me';
  static const String brandsMeCustomers = '/brands/me/customers';

  // Warehouses
  static const String warehouses = '/warehouses';

  // Brands
  static const String brands = '/brands';

  // Product Catalogue
  static const String productCatalogue = '/product-catalogue';

  // Proposed Orders
  static const String proposedOrders = '/proposed-orders';

  // Item Groups
  static const String itemGroups = '/item-groups';

  // Shelf Share
  static const String shelfShare = '/shelf-share';
  static const String shelfShareByVisit = '/shelf-share/by-visit';

  // Horizontal Facings Count
  static const String facings = '/facings';
  static const String facingsByVisit = '/facings/by-visit';

  // After Sales
  static const String afterSalesProducts = '/aftersales/products';
  static const String afterSalesComplaintOrigins = '/aftersales/complaint-origins';
  static const String afterSalesComplaintSources = '/aftersales/complaint-sources';
  static const String afterSalesRegistrations = '/aftersales/registrations';
  static String afterSalesRegistrationDetail(String complaintNo) =>
      '/aftersales/registrations/$complaintNo';

  // Locations
  static const String locationRegions = '/locations/regions';
  static String locationZones(int regionId) => '/locations/regions/$regionId/zones';
  static String locationTowns(int zoneId) => '/locations/zones/$zoneId/towns';

  // Sales
  static const String salesCustomers = '/sales/customers';
  static const String salesProducts = '/sales/products';
  static const String salesProductFilters = '/sales/products/filters';
  static const String salesQuotations = '/sales/quotations';
  static const String salesOrdersDirect = '/sales/orders/direct';
  static const String salesMyPerformance = '/sales/my-performance';

  // Products (catalogue browser)
  static const String products = '/products/';
  static const String productsFilterOptions = '/products/filter-options';
  static String productStock(String itemCode) => '/products/stocks/$itemCode';

  // Product Insights & Competitor Tracking (product detail page)
  static const String productStockAgeing = '/products/stock-ageing';
  static const String productSellOut = '/products/sell-out';
  static const String productSalesTarget = '/products/sales-target';
  static const String productsSalesTargets = '/products/sales-targets';
  static String productAlternatives(String itemCode) =>
      '/products/alternatives/$itemCode';
  static const String productCompetitorMapping = '/products/competitor-mapping';
  static const String productCompetitorBrands = '/products/competitor-brands';
  static const String productReasonForNotSelling =
      '/products/reason-for-not-selling';

  // Daily Sales (in-store barcode/serial sales flow)
  static const String dailySales = '/daily-sales';
  static String dailySaleDetail(int saleId) => '/daily-sales/$saleId';
  static String dailySaleConfirm(int saleId) => '/daily-sales/$saleId/confirm';
  static String dailySaleCancel(int saleId) => '/daily-sales/$saleId/cancel';
  static String dailySaleRequestOtp(int saleId) =>
      '/daily-sales/$saleId/request-otp';
  static String dailySaleVerifyOtp(int saleId) =>
      '/daily-sales/$saleId/verify-otp';

  // Replenishment (live reorder suggestions, computed as a side effect of
  // confirming daily sales — read-only from the frontend)
  static const String replenishmentCurrent = '/replenishment/current';
  static String replenishmentByVisit(int visitId) =>
      '/replenishment/visits/$visitId';
}
