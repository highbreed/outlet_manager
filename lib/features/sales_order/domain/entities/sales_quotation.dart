import 'customer.dart';
import 'order_line_item.dart';

enum QuotationStatus { draft, sent, accepted, converted, expired, cancelled }

extension QuotationStatusX on QuotationStatus {
  String get label {
    switch (this) {
      case QuotationStatus.draft:
        return 'Draft';
      case QuotationStatus.sent:
        return 'Sent';
      case QuotationStatus.accepted:
        return 'Accepted';
      case QuotationStatus.converted:
        return 'Converted';
      case QuotationStatus.expired:
        return 'Expired';
      case QuotationStatus.cancelled:
        return 'Cancelled';
    }
  }
}

/// Sales quotation entity. UI-layer stub.
class SalesQuotation {
  final String localId;
  final int? serverId;
  final int? sapDocNum;
  final String quotationNumber; // e.g. QT-2026-0001
  final int customerId;
  final String customerCode;
  final String customerName;
  final CustomerType customerType;
  final List<OrderLineItem> lineItems;
  final double taxPercent;
  final double additionalDiscountPercent;
  final String? lpoNumber;
  final String? warehouseCode;
  final String? warehouseName;
  final String? notes;
  final QuotationStatus status;
  final DateTime validUntil;
  final String? convertedOrderLocalId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SalesQuotation({
    required this.localId,
    this.serverId,
    this.sapDocNum,
    required this.quotationNumber,
    required this.customerId,
    required this.customerCode,
    required this.customerName,
    required this.customerType,
    required this.lineItems,
    this.taxPercent = 16,
    this.additionalDiscountPercent = 0,
    this.lpoNumber,
    this.warehouseCode,
    this.warehouseName,
    this.notes,
    this.status = QuotationStatus.draft,
    required this.validUntil,
    this.convertedOrderLocalId,
    required this.createdAt,
    required this.updatedAt,
  });

  double get subtotal => lineItems.fold(0, (s, i) => s + i.total);
  double get discountAmount => subtotal * (additionalDiscountPercent / 100);

  /// Prices are VAT-exclusive, so the taxable amount is just the
  /// discounted subtotal.
  double get taxableAmount => subtotal - discountAmount;

  /// VAT added on top of the VAT-exclusive discounted subtotal.
  double get taxAmount => taxableAmount * (taxPercent / 100);

  /// Final payable amount: discounted subtotal plus VAT.
  double get total => taxableAmount + taxAmount;
  int get totalItems => lineItems.fold(0, (s, i) => s + i.quantity);

  bool get isExpired =>
      status != QuotationStatus.converted && DateTime.now().isAfter(validUntil);

  bool get canConvert =>
      status != QuotationStatus.converted &&
      status != QuotationStatus.cancelled &&
      status != QuotationStatus.expired;

  SalesQuotation copyWith({
    List<OrderLineItem>? lineItems,
    double? taxPercent,
    double? additionalDiscountPercent,
    String? lpoNumber,
    String? warehouseCode,
    String? warehouseName,
    String? notes,
    QuotationStatus? status,
    DateTime? validUntil,
    String? convertedOrderLocalId,
    int? serverId,
    int? sapDocNum,
  }) => SalesQuotation(
    localId: localId,
    serverId: serverId ?? this.serverId,
    sapDocNum: sapDocNum ?? this.sapDocNum,
    quotationNumber: quotationNumber,
    customerId: customerId,
    customerCode: customerCode,
    customerName: customerName,
    customerType: customerType,
    lineItems: lineItems ?? this.lineItems,
    taxPercent: taxPercent ?? this.taxPercent,
    additionalDiscountPercent:
        additionalDiscountPercent ?? this.additionalDiscountPercent,
    lpoNumber: lpoNumber ?? this.lpoNumber,
    warehouseCode: warehouseCode ?? this.warehouseCode,
    warehouseName: warehouseName ?? this.warehouseName,
    notes: notes ?? this.notes,
    status: status ?? this.status,
    validUntil: validUntil ?? this.validUntil,
    convertedOrderLocalId: convertedOrderLocalId ?? this.convertedOrderLocalId,
    createdAt: createdAt,
    updatedAt: DateTime.now(),
  );
}
