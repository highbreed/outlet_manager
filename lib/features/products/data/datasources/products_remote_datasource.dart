import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../domain/entities/product.dart';

/// Paginated page of products from /products
class ProductsPageResponse {
  final List<Product> items;
  final int page;
  final int size;
  final int totalCount;
  final int totalPages;

  const ProductsPageResponse({
    required this.items,
    required this.page,
    required this.size,
    required this.totalCount,
    required this.totalPages,
  });

  bool get hasMore => page < totalPages;

  factory ProductsPageResponse.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>? ?? [];
    final meta = json['meta'] as Map<String, dynamic>? ?? {};

    final items = itemsJson
        .map((e) => Product.fromApiJson(e as Map<String, dynamic>))
        .toList();

    return ProductsPageResponse(
      items: items,
      page: meta['page'] as int? ?? 1,
      size: meta['size'] as int? ?? 20,
      totalCount: meta['total_count'] as int? ?? items.length,
      totalPages: meta['total_pages'] as int? ?? 1,
    );
  }
}

/// Leaf level of the category taxonomy (e.g. "12000 BTU"), carrying the
/// specific model numbers that fall under it.
class ProductSubGroup3 {
  final String name;
  final List<String> modelNumbers;

  const ProductSubGroup3({required this.name, this.modelNumbers = const []});

  factory ProductSubGroup3.fromJson(Map<String, dynamic> json) {
    return ProductSubGroup3(
      name: json['name'] as String? ?? '',
      modelNumbers: (json['model_numbers'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
    );
  }
}

/// Second level of the category taxonomy (e.g. "Split Type").
class ProductSubGroup2 {
  final String name;
  final List<ProductSubGroup3> subGroups3;

  const ProductSubGroup2({required this.name, this.subGroups3 = const []});

  factory ProductSubGroup2.fromJson(Map<String, dynamic> json) {
    return ProductSubGroup2(
      name: json['name'] as String? ?? '',
      subGroups3: (json['sub_groups_3'] as List<dynamic>? ?? [])
          .map((e) => ProductSubGroup3.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Top level of the category taxonomy (e.g. "Air Conditioners").
class ProductGroup {
  final String name;
  final List<ProductSubGroup2> subGroups2;

  const ProductGroup({required this.name, this.subGroups2 = const []});

  factory ProductGroup.fromJson(Map<String, dynamic> json) {
    return ProductGroup(
      name: json['name'] as String? ?? '',
      subGroups2: (json['sub_groups_2'] as List<dynamic>? ?? [])
          .map((e) => ProductSubGroup2.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Available filter options from `GET /products/filter-options`: the full
/// group → sub-group-2 → sub-group-3 → model-numbers taxonomy, plus the
/// flat lists of every brand and model number across the catalogue.
class ProductFilterOptions {
  final List<ProductGroup> groups;
  final List<String> brands;
  final List<String> modelNumbers;

  const ProductFilterOptions({
    this.groups = const [],
    this.brands = const [],
    this.modelNumbers = const [],
  });

  /// Top-level group names, used as the "category" chips in the product
  /// browser — the closest equivalent to the old flat category list.
  List<String> get categories => groups.map((g) => g.name).toList();

  factory ProductFilterOptions.fromJson(Map<String, dynamic> json) {
    return ProductFilterOptions(
      groups: (json['groups'] as List<dynamic>? ?? [])
          .map((e) => ProductGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      brands: (json['brands'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      modelNumbers: (json['model_numbers'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
    );
  }
}

/// Stock levels for a product at a single warehouse.
class WarehouseStock {
  final String warehouseCode;
  final String warehouseName;
  final int onHand;
  final int committed;
  final int available;
  final int onOrder;

  const WarehouseStock({
    required this.warehouseCode,
    required this.warehouseName,
    required this.onHand,
    required this.committed,
    required this.available,
    required this.onOrder,
  });

  static int _toInt(dynamic value) {
    if (value == null) return 0;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  factory WarehouseStock.fromJson(Map<String, dynamic> json) {
    return WarehouseStock(
      warehouseCode: json['warehouse_code'] as String? ?? '',
      warehouseName: json['warehouse_name'] as String? ?? '',
      onHand: _toInt(json['on_hand']),
      committed: _toInt(json['committed']),
      available: _toInt(json['available']),
      onOrder: _toInt(json['on_order']),
    );
  }
}

/// Per-warehouse stock breakdown for a single product, from
/// `GET /products/stocks/{item_code}`.
class ProductStockDetail {
  final String itemCode;
  final String itemName;
  final String? modelNo;
  final String? barcode;
  final List<WarehouseStock> warehouses;

  const ProductStockDetail({
    required this.itemCode,
    required this.itemName,
    this.modelNo,
    this.barcode,
    this.warehouses = const [],
  });

  int get totalAvailable =>
      warehouses.fold(0, (sum, w) => sum + w.available);

  int get totalOnHand => warehouses.fold(0, (sum, w) => sum + w.onHand);

  factory ProductStockDetail.fromJson(Map<String, dynamic> json) {
    return ProductStockDetail(
      itemCode: json['item_code'] as String? ?? '',
      itemName: json['item_name'] as String? ?? '',
      modelNo: json['model_no'] as String?,
      barcode: json['barcode'] as String?,
      warehouses: (json['warehouses'] as List<dynamic>? ?? [])
          .map((e) => WarehouseStock.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

double _toDouble(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0;
  return 0;
}

int _toInt(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

/// One outlet's stock-ageing breakdown for a single item, from
/// `GET /products/stock-ageing`.
class StockAgeingRow {
  final String cardCode;
  final String itemCode;
  final String? modelNo;
  final int noOfDays;
  final int onShelfQty;
  final int backStoreQty;
  final int totalQty;
  final double totalValue;
  final int bucket0to30Qty;
  final double bucket0to30Value;
  final int bucket31to60Qty;
  final double bucket31to60Value;
  final int bucket61to90Qty;
  final double bucket61to90Value;
  final int bucket91to120Qty;
  final double bucket91to120Value;
  final int bucketAbove121Qty;
  final double bucketAbove121Value;
  final String? stockCountDate;

  const StockAgeingRow({
    required this.cardCode,
    required this.itemCode,
    this.modelNo,
    this.noOfDays = 0,
    this.onShelfQty = 0,
    this.backStoreQty = 0,
    this.totalQty = 0,
    this.totalValue = 0,
    this.bucket0to30Qty = 0,
    this.bucket0to30Value = 0,
    this.bucket31to60Qty = 0,
    this.bucket31to60Value = 0,
    this.bucket61to90Qty = 0,
    this.bucket61to90Value = 0,
    this.bucket91to120Qty = 0,
    this.bucket91to120Value = 0,
    this.bucketAbove121Qty = 0,
    this.bucketAbove121Value = 0,
    this.stockCountDate,
  });

  factory StockAgeingRow.fromJson(Map<String, dynamic> json) {
    return StockAgeingRow(
      cardCode: json['card_code'] as String? ?? '',
      itemCode: json['item_code'] as String? ?? '',
      modelNo: json['model_no'] as String?,
      noOfDays: _toInt(json['no_of_days']),
      onShelfQty: _toInt(json['on_shelf_qty']),
      backStoreQty: _toInt(json['back_store_qty']),
      totalQty: _toInt(json['total_qty']),
      totalValue: _toDouble(json['total_value']),
      bucket0to30Qty: _toInt(json['bucket_0_30_qty']),
      bucket0to30Value: _toDouble(json['bucket_0_30_value']),
      bucket31to60Qty: _toInt(json['bucket_31_60_qty']),
      bucket31to60Value: _toDouble(json['bucket_31_60_value']),
      bucket61to90Qty: _toInt(json['bucket_61_90_qty']),
      bucket61to90Value: _toDouble(json['bucket_61_90_value']),
      bucket91to120Qty: _toInt(json['bucket_91_120_qty']),
      bucket91to120Value: _toDouble(json['bucket_91_120_value']),
      bucketAbove121Qty: _toInt(json['bucket_above_121_qty']),
      bucketAbove121Value: _toDouble(json['bucket_above_121_value']),
      stockCountDate: json['stock_count_date'] as String?,
    );
  }
}

/// A single month's sell-out figure, part of [SellOutHistory].
class SellOutMonth {
  final int month;
  final String monthName;
  final int qty;

  const SellOutMonth({
    required this.month,
    this.monthName = '',
    this.qty = 0,
  });

  factory SellOutMonth.fromJson(Map<String, dynamic> json) {
    return SellOutMonth(
      month: _toInt(json['month']),
      monthName: json['month_name'] as String? ?? '',
      qty: _toInt(json['qty']),
    );
  }
}

/// 12-month sell-out history for a product at an outlet, from
/// `GET /products/sell-out`.
class SellOutHistory {
  final String cardCode;
  final String year;
  final List<SellOutMonth> months;
  final int totalQty;

  const SellOutHistory({
    required this.cardCode,
    required this.year,
    this.months = const [],
    this.totalQty = 0,
  });

  double get averageMonthlyQty => totalQty / 12;

  factory SellOutHistory.fromJson(Map<String, dynamic> json) {
    return SellOutHistory(
      cardCode: json['card_code'] as String? ?? '',
      year: json['year'] as String? ?? '',
      months: (json['months'] as List<dynamic>? ?? [])
          .map((e) => SellOutMonth.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalQty: _toInt(json['total_qty']),
    );
  }
}

/// The current month's sales target for a product at an outlet, from
/// `GET /products/sales-target`.
class SalesTarget {
  final String cardCode;
  final String itemCode;
  final String targetMonth;
  final int targetQty;
  // A manually-entered override, when set, takes precedence over the
  // system-derived target — `targetQty` above is already that resolved
  // value; these two are only kept around to let the UI show which kind
  // of target is in effect.
  final double? enteredTargetQty;
  final double derivedTargetQty;

  const SalesTarget({
    required this.cardCode,
    required this.itemCode,
    required this.targetMonth,
    this.targetQty = 0,
    this.enteredTargetQty,
    this.derivedTargetQty = 0,
  });

  bool get isManuallySet => enteredTargetQty != null;

  factory SalesTarget.fromJson(Map<String, dynamic> json) {
    return SalesTarget(
      cardCode: json['card_code'] as String? ?? '',
      itemCode: json['item_code'] as String? ?? '',
      targetMonth: json['target_month'] as String? ?? '',
      // target_qty can be a fractional string (e.g. "0.837755") when it
      // falls back to the derived target, so this must parse as a double
      // first — int.tryParse would silently fail on that and default to 0.
      targetQty: _toDouble(json['target_qty']).round(),
      enteredTargetQty: json['entered_target_qty'] == null
          ? null
          : _toDouble(json['entered_target_qty']),
      derivedTargetQty: _toDouble(json['derived_target_qty']),
    );
  }
}

/// One product's target within an outlet's full target list, part of
/// [OutletSalesTargets] (`GET /products/sales-targets`, plural — unlike
/// [SalesTarget]'s single-product `/products/sales-target`, this lists
/// every product with a target row for the outlet/period).
class OutletSalesTargetItem {
  final String itemCode;
  final String? itemName;
  final String? modelNo;
  final String? brand;
  final String? itemGroup1;
  final String? itemGroup2;
  final String? itemGroup3;
  final double incentiveAmount;
  final double targetQty;
  final double? enteredTargetQty;
  final double derivedTargetQty;

  /// Currency-denominated target for this product, distinct from
  /// [targetQty]'s unit count. `null` until the backend adds this — reads
  /// from a `target_amount` JSON key as a best-guess mirroring
  /// `target_qty`'s naming; update the key here once the real field lands
  /// if it's named differently.
  final double? targetAmount;

  const OutletSalesTargetItem({
    required this.itemCode,
    this.itemName,
    this.modelNo,
    this.brand,
    this.itemGroup1,
    this.itemGroup2,
    this.itemGroup3,
    this.incentiveAmount = 0,
    this.targetQty = 0,
    this.enteredTargetQty,
    this.derivedTargetQty = 0,
    this.targetAmount,
  });

  bool get isManuallySet => enteredTargetQty != null;

  factory OutletSalesTargetItem.fromJson(Map<String, dynamic> json) {
    return OutletSalesTargetItem(
      itemCode: json['item_code'] as String? ?? '',
      itemName: json['item_name'] as String?,
      modelNo: json['model_no'] as String?,
      brand: json['brand'] as String?,
      itemGroup1: json['item_group1'] as String?,
      itemGroup2: json['item_group2'] as String?,
      itemGroup3: json['item_group3'] as String?,
      incentiveAmount: _toDouble(json['incentive_amount']),
      targetQty: _toDouble(json['target_qty']),
      enteredTargetQty: json['entered_target_qty'] == null
          ? null
          : _toDouble(json['entered_target_qty']),
      derivedTargetQty: _toDouble(json['derived_target_qty']),
      targetAmount: json['target_amount'] == null
          ? null
          : _toDouble(json['target_amount']),
    );
  }
}

/// Every product's sales target for one outlet + period, from
/// `GET /products/sales-targets`.
class OutletSalesTargets {
  final String cardCode;
  final String? cardName;
  final int year;
  final int month;
  final List<OutletSalesTargetItem> items;
  final double totalTargetQty;

  /// Sum of [OutletSalesTargetItem.targetAmount] across [items], from a
  /// `total_target_amount` JSON key — same pending-backend caveat as
  /// [OutletSalesTargetItem.targetAmount].
  final double? totalTargetAmount;

  const OutletSalesTargets({
    required this.cardCode,
    this.cardName,
    required this.year,
    required this.month,
    this.items = const [],
    this.totalTargetQty = 0,
    this.totalTargetAmount,
  });

  factory OutletSalesTargets.fromJson(Map<String, dynamic> json) {
    return OutletSalesTargets(
      cardCode: json['card_code'] as String? ?? '',
      cardName: json['card_name'] as String?,
      year: _toInt(json['year']),
      month: _toInt(json['month']),
      items: (json['items'] as List<dynamic>? ?? [])
          .map(
            (e) => OutletSalesTargetItem.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      totalTargetQty: _toDouble(json['total_target_qty']),
      totalTargetAmount: json['total_target_amount'] == null
          ? null
          : _toDouble(json['total_target_amount']),
    );
  }
}

/// A single alternative/substitute product, part of [ProductAlternatives].
class ProductAlternative {
  final String altItemCode;
  final String? itemName;
  final String? barcode;
  final String? itemGroup1;
  final String? itemGroup2;
  final String? itemGroup3;
  final String? itemDescription;
  final String? modelNo;
  final String? brand;
  final String? productStatus;
  final double regularPrice;
  final double incentiveAmount;
  final bool foundInCatalogue;
  // The next fields are only resolved when the request included card_code —
  // null means "unknown at this outlet", not "no"/zero.
  final bool? isBranchBlocked;
  final bool? isActive;
  final int? approvalStatus;
  final int? minOnshelfQty;
  final int? maxOnshelfQty;
  final int? minBackstoreQty;
  final int? maxBackstoreQty;

  const ProductAlternative({
    required this.altItemCode,
    this.itemName,
    this.barcode,
    this.itemGroup1,
    this.itemGroup2,
    this.itemGroup3,
    this.itemDescription,
    this.modelNo,
    this.brand,
    this.productStatus,
    this.regularPrice = 0,
    this.incentiveAmount = 0,
    this.foundInCatalogue = false,
    this.isBranchBlocked,
    this.isActive,
    this.approvalStatus,
    this.minOnshelfQty,
    this.maxOnshelfQty,
    this.minBackstoreQty,
    this.maxBackstoreQty,
  });

  factory ProductAlternative.fromJson(Map<String, dynamic> json) {
    return ProductAlternative(
      altItemCode: json['alt_item_code'] as String? ?? '',
      itemName: json['item_name'] as String?,
      barcode: json['barcode'] as String?,
      itemGroup1: json['item_group1'] as String?,
      itemGroup2: json['item_group2'] as String?,
      itemGroup3: json['item_group3'] as String?,
      itemDescription: json['item_description'] as String?,
      modelNo: json['model_no'] as String?,
      brand: json['brand'] as String?,
      productStatus: json['product_status'] as String?,
      regularPrice: _toDouble(json['regular_price']),
      incentiveAmount: _toDouble(json['incentive_amount']),
      foundInCatalogue: json['found_in_catalogue'] as bool? ?? false,
      isBranchBlocked: json['is_branch_blocked'] as bool?,
      isActive: json['is_active'] as bool?,
      approvalStatus: json['approval_status'] == null
          ? null
          : _toInt(json['approval_status']),
      minOnshelfQty: json['min_onshelf_qty'] == null
          ? null
          : _toInt(json['min_onshelf_qty']),
      maxOnshelfQty: json['max_onshelf_qty'] == null
          ? null
          : _toInt(json['max_onshelf_qty']),
      minBackstoreQty: json['min_backstore_qty'] == null
          ? null
          : _toInt(json['min_backstore_qty']),
      maxBackstoreQty: json['max_backstore_qty'] == null
          ? null
          : _toInt(json['max_backstore_qty']),
    );
  }
}

/// Alternative products for a given item, from
/// `GET /products/alternatives/{item_code}`. Universal across outlets —
/// `cardCode` (and the outlet-specific status fields on each alternative)
/// is only populated when the request supplied one.
class ProductAlternatives {
  final String origItemCode;
  final String? cardCode;
  final List<ProductAlternative> alternatives;

  const ProductAlternatives({
    required this.origItemCode,
    this.cardCode,
    this.alternatives = const [],
  });

  factory ProductAlternatives.fromJson(Map<String, dynamic> json) {
    return ProductAlternatives(
      origItemCode: json['orig_item_code'] as String? ?? '',
      cardCode: json['card_code'] as String?,
      alternatives: (json['alternatives'] as List<dynamic>? ?? [])
          .map((e) => ProductAlternative.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// A fixed-list competitor brand, from `GET /products/competitor-brands`.
/// The frontend must submit this `id` (not free text) when adding a
/// competitor SKU mapping.
class CompetitorBrand {
  final int id;
  final String name;

  const CompetitorBrand({required this.id, required this.name});

  factory CompetitorBrand.fromJson(Map<String, dynamic> json) {
    return CompetitorBrand(
      id: _toInt(json['id']),
      name: json['name'] as String? ?? '',
    );
  }
}

/// A competitor SKU mapped against one of our products, from
/// `GET`/`POST /products/competitor-mapping`.
class CompetitorMapping {
  final int code;
  final String itemCode;
  final String? modelNo;
  final String compBrand;
  final String compModelNo;
  final String? compBarcode;
  final String status;
  final String? outletName;
  final String? coordinatorName;
  final String? entryDate;
  final double rrp;
  final double offerRrp;
  final String? offerStartDate;
  final String? itemDescription;
  final String? additionalFeatures;
  final String? lessFeatures;

  const CompetitorMapping({
    required this.code,
    required this.itemCode,
    this.modelNo,
    required this.compBrand,
    required this.compModelNo,
    this.compBarcode,
    this.status = 'Not Approved',
    this.outletName,
    this.coordinatorName,
    this.entryDate,
    this.rrp = 0,
    this.offerRrp = 0,
    this.offerStartDate,
    this.itemDescription,
    this.additionalFeatures,
    this.lessFeatures,
  });

  factory CompetitorMapping.fromJson(Map<String, dynamic> json) {
    return CompetitorMapping(
      code: _toInt(json['code']),
      itemCode: json['item_code'] as String? ?? '',
      modelNo: json['model_no'] as String?,
      compBrand: json['comp_brand'] as String? ?? '',
      compModelNo: json['comp_model_no'] as String? ?? '',
      compBarcode: json['comp_barcode'] as String?,
      status: json['status'] as String? ?? 'Not Approved',
      outletName: json['outlet_name'] as String?,
      coordinatorName: json['coordinator_name'] as String?,
      entryDate: json['entry_date'] as String?,
      rrp: _toDouble(json['rrp']),
      offerRrp: _toDouble(json['offer_rrp']),
      offerStartDate: json['offer_start_date'] as String?,
      itemDescription: json['item_description'] as String?,
      additionalFeatures: json['additional_features'] as String?,
      lessFeatures: json['less_features'] as String?,
    );
  }
}

/// A page of competitor SKU mappings from `GET /products/competitor-mapping`.
class CompetitorMappingPage {
  final List<CompetitorMapping> items;
  final int page;
  final int size;
  final int total;
  final int pages;

  const CompetitorMappingPage({
    required this.items,
    required this.page,
    required this.size,
    required this.total,
    required this.pages,
  });

  bool get hasMore => page < pages;

  factory CompetitorMappingPage.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>? ?? [];
    final meta = json['meta'] as Map<String, dynamic>? ?? {};

    return CompetitorMappingPage(
      items: itemsJson
          .map((e) => CompetitorMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: meta['page'] as int? ?? 1,
      size: meta['size'] as int? ?? 20,
      total: meta['total'] as int? ?? itemsJson.length,
      pages: meta['pages'] as int? ?? 1,
    );
  }
}

/// A single competitor product cited in a "reason for not selling" report.
class CompetitorProductEntry {
  final String competitorName;
  final String? modelNo;
  final double rrp;

  const CompetitorProductEntry({
    required this.competitorName,
    this.modelNo,
    required this.rrp,
  });

  factory CompetitorProductEntry.fromJson(Map<String, dynamic> json) {
    return CompetitorProductEntry(
      competitorName: json['competitor_name'] as String? ?? '',
      modelNo: json['model_no'] as String?,
      rrp: _toDouble(json['rrp']),
    );
  }

  Map<String, dynamic> toJson() => {
    'competitor_name': competitorName,
    if (modelNo != null && modelNo!.isNotEmpty) 'model_no': modelNo,
    'rrp': rrp,
  };
}

/// The saved report from `POST /products/reason-for-not-selling`.
class NotSellingReport {
  final int id;
  final String cardCode;
  final String itemCode;
  final String reason;
  final bool similarCompetitorSku;
  final List<CompetitorProductEntry> competitorProducts;
  final String? createdAt;

  const NotSellingReport({
    required this.id,
    required this.cardCode,
    required this.itemCode,
    required this.reason,
    required this.similarCompetitorSku,
    this.competitorProducts = const [],
    this.createdAt,
  });

  factory NotSellingReport.fromJson(Map<String, dynamic> json) {
    return NotSellingReport(
      id: _toInt(json['id']),
      cardCode: json['card_code'] as String? ?? '',
      itemCode: json['item_code'] as String? ?? '',
      reason: json['reason'] as String? ?? '',
      similarCompetitorSku: json['similar_competitor_sku'] as bool? ?? false,
      competitorProducts: (json['competitor_products'] as List<dynamic>? ?? [])
          .map(
            (e) => CompetitorProductEntry.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      createdAt: json['created_at'] as String?,
    );
  }
}

/// Remote data source for the product catalogue browser.
///
/// This browser is a general catalogue search, not tied to a specific
/// outlet — unlike the `/sales/products` endpoint (used by the outlet
/// sales flow), `/products` doesn't require a `card_code`.
class ProductsRemoteDataSource {
  final Dio _dio;

  const ProductsRemoteDataSource(this._dio);

  /// Fetch products with optional search + item-group/brand filtering
  /// GET /products
  ///
  /// [itemGroup1]/[itemGroup2]/[itemGroup3] mirror the three taxonomy
  /// levels returned by [fetchFilterOptions] (group → sub-group-2 →
  /// sub-group-3). [priceList] selects which price list to price
  /// against — the backend defaults to `1` when omitted. [cardCode] is
  /// optional — the catalogue is global, but the backend narrows results
  /// to what's relevant to that outlet when it's supplied.
  Future<ProductsPageResponse> fetchProducts({
    String? search,
    String? itemGroup1,
    String? itemGroup2,
    String? itemGroup3,
    String? brand,
    int? priceList,
    String? cardCode,
    int page = 1,
    int size = 20,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.products,
        queryParameters: {
          if (search != null && search.isNotEmpty) 'search': search,
          if (itemGroup1 != null && itemGroup1.isNotEmpty)
            'item_group1': itemGroup1,
          if (itemGroup2 != null && itemGroup2.isNotEmpty)
            'item_group2': itemGroup2,
          if (itemGroup3 != null && itemGroup3.isNotEmpty)
            'item_group3': itemGroup3,
          if (brand != null && brand.isNotEmpty) 'brand': brand,
          if (priceList != null) 'price_list': priceList,
          if (cardCode != null && cardCode.isNotEmpty) 'card_code': cardCode,
          'page': page,
          'size': size,
        },
      );

      return ProductsPageResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Fetch the full group/sub-group/brand/model-number filter taxonomy
  /// GET /products/filter-options
  Future<ProductFilterOptions> fetchFilterOptions() async {
    try {
      final response = await _dio.get(ApiEndpoints.productsFilterOptions);

      return ProductFilterOptions.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Fetch the per-warehouse stock breakdown for a single product.
  /// GET /products/stocks/{item_code}
  Future<ProductStockDetail> fetchProductStock(String itemCode) async {
    try {
      final response = await _dio.get(ApiEndpoints.productStock(itemCode));

      return ProductStockDetail.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Fetch this item's stock-ageing buckets, optionally scoped to a single
  /// outlet. Passing both [cardCode] and [itemCode] returns at most one row.
  /// GET /products/stock-ageing
  Future<StockAgeingRow?> fetchStockAgeing({
    required String cardCode,
    required String itemCode,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.productStockAgeing,
        queryParameters: {
          'card_code': cardCode,
          'item_code': itemCode,
          'size': 1,
        },
      );

      final data = response.data as Map<String, dynamic>;
      final items = data['items'] as List<dynamic>? ?? [];
      if (items.isEmpty) return null;
      return StockAgeingRow.fromJson(items.first as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Fetch this item's monthly sell-out history for a given outlet + year.
  /// GET /products/sell-out
  Future<SellOutHistory> fetchSellOut({
    required String cardCode,
    required String year,
    String? itemCode,
    String? brand,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.productSellOut,
        queryParameters: {
          'card_code': cardCode,
          'year': year,
          if (itemCode != null && itemCode.isNotEmpty) 'item_code': itemCode,
          if (brand != null && brand.isNotEmpty) 'brand': brand,
        },
      );

      return SellOutHistory.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Fetch this item's current-month sales target at an outlet.
  /// GET /products/sales-target
  ///
  /// Throws a [NetworkException] with `statusCode == 404` when no target row
  /// exists for this outlet/item this month.
  Future<SalesTarget> fetchSalesTarget({
    required String cardCode,
    required String itemCode,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.productSalesTarget,
        queryParameters: {'card_code': cardCode, 'item_code': itemCode},
      );

      return SalesTarget.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Fetch every product's sales target for one outlet + period — unlike
  /// [fetchSalesTarget], not pinned to the current month and not limited to
  /// a single item. Optional category/brand filters are exact-match and
  /// resolved server-side.
  /// GET /products/sales-targets
  Future<OutletSalesTargets> fetchOutletSalesTargets({
    required String cardCode,
    required int year,
    required int month,
    String? itemGroup1,
    String? itemGroup2,
    String? itemGroup3,
    String? brand,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.productsSalesTargets,
        queryParameters: {
          'card_code': cardCode,
          'year': year,
          'month': month,
          if (itemGroup1 != null && itemGroup1.isNotEmpty)
            'item_group1': itemGroup1,
          if (itemGroup2 != null && itemGroup2.isNotEmpty)
            'item_group2': itemGroup2,
          if (itemGroup3 != null && itemGroup3.isNotEmpty)
            'item_group3': itemGroup3,
          if (brand != null && brand.isNotEmpty) 'brand': brand,
        },
      );

      return OutletSalesTargets.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Fetch alternative/substitute products for this item at an outlet.
  /// GET /products/alternatives/{item_code}
  Future<ProductAlternatives> fetchAlternatives({
    required String itemCode,
    String? cardCode,
    int? priceList,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.productAlternatives(itemCode),
        queryParameters: {
          if (cardCode != null && cardCode.isNotEmpty) 'card_code': cardCode,
          if (priceList != null) 'price_list': priceList,
        },
      );

      return ProductAlternatives.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Fetch competitor SKUs already mapped to this item (not outlet-scoped).
  /// GET /products/competitor-mapping
  Future<CompetitorMappingPage> fetchCompetitorMappings({
    String? itemCode,
    String? compBrand,
    String? compModelNo,
    int page = 1,
    int size = 20,
  }) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.productCompetitorMapping,
        queryParameters: {
          if (itemCode != null && itemCode.isNotEmpty) 'item_code': itemCode,
          if (compBrand != null && compBrand.isNotEmpty)
            'comp_brand': compBrand,
          if (compModelNo != null && compModelNo.isNotEmpty)
            'comp_model_no': compModelNo,
          'page': page,
          'size': size,
        },
      );

      return CompetitorMappingPage.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Fetch the fixed competitor-brand pick-list. Not paginated — small,
  /// fixed reference data (~106 brands).
  /// GET /products/competitor-brands
  Future<List<CompetitorBrand>> fetchCompetitorBrands() async {
    try {
      final response = await _dio.get(ApiEndpoints.productCompetitorBrands);
      final data = response.data as Map<String, dynamic>;
      final items = data['items'] as List<dynamic>? ?? [];
      return items
          .map((e) => CompetitorBrand.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Add a new competitor SKU mapping for this item at an outlet. Starts out
  /// unapproved until reviewed elsewhere.
  /// POST /products/competitor-mapping
  Future<CompetitorMapping> addCompetitorMapping({
    required String cardCode,
    required String itemCode,
    String? modelNo,
    required int compBrandId,
    required String compModelNo,
    String? compBarcode,
    required double rrp,
    required double offerRrp,
    required String offerStartDate,
    String? itemDescription,
    String? additionalFeatures,
    String? lessFeatures,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.productCompetitorMapping,
        data: {
          'card_code': cardCode,
          'item_code': itemCode,
          if (modelNo != null && modelNo.isNotEmpty) 'model_no': modelNo,
          'comp_brand_id': compBrandId,
          'comp_model_no': compModelNo,
          if (compBarcode != null && compBarcode.isNotEmpty)
            'comp_barcode': compBarcode,
          'rrp': rrp,
          'offer_rrp': offerRrp,
          'offer_start_date': offerStartDate,
          if (itemDescription != null && itemDescription.isNotEmpty)
            'item_description': itemDescription,
          if (additionalFeatures != null && additionalFeatures.isNotEmpty)
            'additional_features': additionalFeatures,
          if (lessFeatures != null && lessFeatures.isNotEmpty)
            'less_features': lessFeatures,
        },
      );

      return CompetitorMapping.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Report why this item isn't selling at an outlet — an irreversible,
  /// one-time submission.
  /// POST /products/reason-for-not-selling
  Future<NotSellingReport> reportNotSelling({
    required String cardCode,
    required String itemCode,
    required String reason,
    required bool similarCompetitorSku,
    List<CompetitorProductEntry> competitorProducts = const [],
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.productReasonForNotSelling,
        data: {
          'card_code': cardCode,
          'item_code': itemCode,
          'reason': reason,
          'similar_competitor_sku': similarCompetitorSku,
          if (similarCompetitorSku)
            'competitor_products': competitorProducts
                .map((e) => e.toJson())
                .toList(),
        },
      );

      return NotSellingReport.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }
}
