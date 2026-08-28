import 'package:isar_community/isar.dart';

part 'customer_product_model.g.dart';

/// Cached customer product catalogue item for offline access
@collection
class CustomerProductModel {
  Id id = Isar.autoIncrement;

  @Index()
  late int serverId; // Backend catalogue item ID

  @Index()
  late int customerId;

  @Index()
  late int brandId;

  late String brandName;

  @Index()
  late String itemCode; // SAP item code

  late String itemName;
  String? itemDescription;

  /// Product barcode (EAN/UPC) for scanning
  @Index()
  String? barcode;

  /// Product categorization
  String? itemGroup;
  String? itemSubGroup2;
  String? itemSubGroup3;
  String? modelNumber;
  String? productStatus;
  String? customerListingCode;

  /// HQ blocked flag
  bool hqBlocked = false;

  /// Approval status (0 = pending, 1 = approved, etc.)
  late int approvalStatus;

  /// ZC (Zone Controller) level min/max
  int? zcMinOnshelfQty;
  int? zcMaxOnshelfQty;
  int? zcMinBackstoreQty;
  int? zcMaxBackstoreQty;

  /// CSH (Cash) level min/max - requires approval
  int? cshMinOnshelfQty;
  int? cshMaxOnshelfQty;
  int? cshMinBackstoreQty;
  int? cshMaxBackstoreQty;

  /// APP (Approved) level min/max - final approved levels
  int? appMinOnshelfQty;
  int? appMaxOnshelfQty;
  int? appMinBackstoreQty;
  int? appMaxBackstoreQty;

  /// Active calculated min/max (from API)
  int? activeMinOnshelf;
  int? activeMaxOnshelf;
  int? activeMinBackstore;
  int? activeMaxBackstore;

  late bool isActive;

  DateTime cachedAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  CustomerProductModel();

  /// Create from API response
  factory CustomerProductModel.fromJson(Map<String, dynamic> json) {
    return CustomerProductModel()
      ..serverId = json['id'] as int
      ..customerId = json['customer_id'] as int
      ..brandId = json['brand_id'] as int
      ..brandName =
          json['brand_name'] as String? ??
          json['brand']?['name'] as String? ??
          ''
      ..itemCode = json['item_code'] as String
      ..itemName = json['item_name'] as String
      ..itemDescription = json['item_description'] as String?
      ..barcode = json['barcode'] as String?
      ..itemGroup = json['item_group'] as String?
      ..itemSubGroup2 = json['item_sub_group_2'] as String?
      ..itemSubGroup3 = json['item_sub_group_3'] as String?
      ..modelNumber = json['model_number'] as String?
      ..productStatus = json['product_status'] as String?
      ..customerListingCode = json['customer_listing_code'] as String?
      ..hqBlocked = json['hq_blocked'] as bool? ?? false
      ..approvalStatus = json['approval_status'] as int? ?? 0
      ..zcMinOnshelfQty = json['zc_min_onshelf_qty'] as int?
      ..zcMaxOnshelfQty = json['zc_max_onshelf_qty'] as int?
      ..zcMinBackstoreQty = json['zc_min_backstore_qty'] as int?
      ..zcMaxBackstoreQty = json['zc_max_backstore_qty'] as int?
      ..cshMinOnshelfQty = json['csh_min_onshelf_qty'] as int?
      ..cshMaxOnshelfQty = json['csh_max_onshelf_qty'] as int?
      ..cshMinBackstoreQty = json['csh_min_backstore_qty'] as int?
      ..cshMaxBackstoreQty = json['csh_max_backstore_qty'] as int?
      ..appMinOnshelfQty = json['app_min_onshelf_qty'] as int?
      ..appMaxOnshelfQty = json['app_max_onshelf_qty'] as int?
      ..appMinBackstoreQty = json['app_min_backstore_qty'] as int?
      ..appMaxBackstoreQty = json['app_max_backstore_qty'] as int?
      ..activeMinOnshelf = json['active_min_onshelf'] as int?
      ..activeMaxOnshelf = json['active_max_onshelf'] as int?
      ..activeMinBackstore = json['active_min_backstore'] as int?
      ..activeMaxBackstore = json['active_max_backstore'] as int?
      ..isActive = json['is_active'] as bool? ?? true
      ..cachedAt = DateTime.now()
      ..updatedAt = DateTime.now();
  }

  /// Convert to JSON for API requests
  Map<String, dynamic> toJson() {
    return {
      'id': serverId,
      'customer_id': customerId,
      'brand_id': brandId,
      'item_code': itemCode,
      'item_name': itemName,
      'item_description': itemDescription,
      'barcode': barcode,
      'item_group': itemGroup,
      'item_sub_group_2': itemSubGroup2,
      'item_sub_group_3': itemSubGroup3,
      'model_number': modelNumber,
      'product_status': productStatus,
      'customer_listing_code': customerListingCode,
      'hq_blocked': hqBlocked,
      'approval_status': approvalStatus,
      'zc_min_onshelf_qty': zcMinOnshelfQty,
      'zc_max_onshelf_qty': zcMaxOnshelfQty,
      'zc_min_backstore_qty': zcMinBackstoreQty,
      'zc_max_backstore_qty': zcMaxBackstoreQty,
      'is_active': isActive,
    };
  }

  /// Get effective min on-shelf quantity (uses active > approved > cash > zc)
  int get effectiveMinOnshelf =>
      activeMinOnshelf ??
      appMinOnshelfQty ??
      cshMinOnshelfQty ??
      zcMinOnshelfQty ??
      0;

  /// Get effective max on-shelf quantity
  int get effectiveMaxOnshelf =>
      activeMaxOnshelf ??
      appMaxOnshelfQty ??
      cshMaxOnshelfQty ??
      zcMaxOnshelfQty ??
      0;

  /// Get effective min backstore quantity
  int get effectiveMinBackstore =>
      activeMinBackstore ??
      appMinBackstoreQty ??
      cshMinBackstoreQty ??
      zcMinBackstoreQty ??
      0;

  /// Get effective max backstore quantity
  int get effectiveMaxBackstore =>
      activeMaxBackstore ??
      appMaxBackstoreQty ??
      cshMaxBackstoreQty ??
      zcMaxBackstoreQty ??
      0;

  /// Check if product has a barcode for scanning
  bool get hasBarcode => barcode != null && barcode!.isNotEmpty;
}
