import 'customer.dart';
import 'order_line_item.dart';

/// Sales order lifecycle status.
enum SalesOrderStatus { draft, pending, confirmed, fulfilled, cancelled }

/// Payment methods supported for cash orders.
enum PaymentMethod { cash, mpesa, bankTransfer, cheque }

extension SalesOrderStatusX on SalesOrderStatus {
  String get label {
    switch (this) {
      case SalesOrderStatus.draft:
        return 'Draft';
      case SalesOrderStatus.pending:
        return 'Pending';
      case SalesOrderStatus.confirmed:
        return 'Confirmed';
      case SalesOrderStatus.fulfilled:
        return 'Fulfilled';
      case SalesOrderStatus.cancelled:
        return 'Cancelled';
    }
  }
}

extension PaymentMethodX on PaymentMethod {
  String get label {
    switch (this) {
      case PaymentMethod.cash:
        return 'Cash';
      case PaymentMethod.mpesa:
        return 'M-Pesa';
      case PaymentMethod.bankTransfer:
        return 'Bank Transfer';
      case PaymentMethod.cheque:
        return 'Cheque';
    }
  }
}

/// Sales order entity. UI-layer stub.
class SalesOrder {
  final String localId;
  final int? serverId;
  final int? sapDocNum;
  final String orderNumber; // e.g. SO-2026-0001
  final int customerId;
  final String customerCode;
  final String customerName;
  final CustomerType customerType;
  final List<OrderLineItem> lineItems;
  final double taxPercent; // e.g. 16 for VAT
  final double additionalDiscountPercent;
  final String? lpoNumber;
  final String? warehouseCode;
  final String? warehouseName;
  final String? notes;
  final SalesOrderStatus status;
  final String? quotationLocalId; // if converted from a quotation
  final PaymentMethod? paymentMethod; // required for cash orders
  final String? paymentReference;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SalesOrder({
    required this.localId,
    this.serverId,
    this.sapDocNum,
    required this.orderNumber,
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
    this.status = SalesOrderStatus.draft,
    this.quotationLocalId,
    this.paymentMethod,
    this.paymentReference,
    required this.createdAt,
    required this.updatedAt,
  });

  double get subtotal => lineItems.fold(0, (sum, item) => sum + item.total);

  double get discountAmount => subtotal * (additionalDiscountPercent / 100);

  /// Prices are VAT-exclusive, so the taxable amount is just the
  /// discounted subtotal.
  double get taxableAmount => subtotal - discountAmount;

  /// VAT added on top of the VAT-exclusive discounted subtotal.
  double get taxAmount => taxableAmount * (taxPercent / 100);

  /// Final payable amount: discounted subtotal plus VAT.
  double get total => taxableAmount + taxAmount;

  int get totalItems => lineItems.fold(0, (s, i) => s + i.quantity);

  bool get isCash => customerType == CustomerType.cash;

  SalesOrder copyWith({
    List<OrderLineItem>? lineItems,
    double? taxPercent,
    double? additionalDiscountPercent,
    String? lpoNumber,
    String? warehouseCode,
    String? warehouseName,
    String? notes,
    SalesOrderStatus? status,
    PaymentMethod? paymentMethod,
    String? paymentReference,
    int? serverId,
    int? sapDocNum,
  }) => SalesOrder(
    localId: localId,
    serverId: serverId ?? this.serverId,
    sapDocNum: sapDocNum ?? this.sapDocNum,
    orderNumber: orderNumber,
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
    quotationLocalId: quotationLocalId,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    paymentReference: paymentReference ?? this.paymentReference,
    createdAt: createdAt,
    updatedAt: DateTime.now(),
  );
}
