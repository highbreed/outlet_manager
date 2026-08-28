/// Customer payment type
enum CustomerType { cash, credit }

/// Minimal customer summary used by the sales order feature.
///
/// Maps to GET /sales/customers API response.
class SalesCustomer {
  final int id;
  final String code;
  final String name;
  final String? phone;
  final String? address;
  final CustomerType type;
  final double creditLimit;
  final double outstandingBalance;
  final double availableCredit;
  final bool overCreditLimit;
  final bool canCreateDirectOrder;
  final int? priceListNum;
  final String? currency;
  final String? paymentGroupName;

  const SalesCustomer({
    required this.id,
    required this.code,
    required this.name,
    this.phone,
    this.address,
    required this.type,
    this.creditLimit = 0,
    this.outstandingBalance = 0,
    this.availableCredit = 0,
    this.overCreditLimit = false,
    this.canCreateDirectOrder = false,
    this.priceListNum,
    this.currency,
    this.paymentGroupName,
  });

  bool get isCash => type == CustomerType.cash;
  bool get isCredit => type == CustomerType.credit;

  /// Computed available credit (fallback if not provided by API)
  double get computedAvailableCredit =>
      (creditLimit - outstandingBalance).clamp(0, double.infinity);

  /// Uses API available_credit if provided, otherwise computes
  double get effectiveAvailableCredit =>
      availableCredit > 0 ? availableCredit : computedAvailableCredit;

  String get typeLabel => isCash ? 'Cash' : 'Credit';

  /// Safely parse a numeric value that might be a num or String
  static double _toDouble(dynamic value) {
    if (value == null) return 0;
    if (value is num) return value.toDouble();
    if (value is String && value.isNotEmpty) {
      return double.tryParse(value) ?? 0;
    }
    return 0;
  }

  /// Safely parse an int value that might be an int or String
  static int _toInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String && value.isNotEmpty) {
      return int.tryParse(value) ?? 0;
    }
    return 0;
  }

  /// Create from API response JSON
  factory SalesCustomer.fromApiJson(Map<String, dynamic> json) {
    final typeStr = (json['customer_type'] as String? ?? 'cash').toLowerCase();
    final type = typeStr == 'credit' ? CustomerType.credit : CustomerType.cash;

    return SalesCustomer(
      id: 0, // Will be assigned by repository
      code: json['card_code'] as String? ?? '',
      name: json['card_name'] as String? ?? '',
      type: type,
      creditLimit: _toDouble(json['credit_line']),
      outstandingBalance: _toDouble(json['balance']),
      availableCredit: _toDouble(json['available_credit']),
      overCreditLimit: json['over_credit_limit'] is bool
          ? json['over_credit_limit'] as bool
          : json['over_credit_limit'] == 'true',
      canCreateDirectOrder: json['can_create_direct_order'] is bool
          ? json['can_create_direct_order'] as bool
          : json['can_create_direct_order'] == 'true',
      priceListNum: _toInt(json['price_list_num']),
      currency: json['currency'] as String?,
      paymentGroupName: json['payment_group_name'] as String?,
    );
  }
}
