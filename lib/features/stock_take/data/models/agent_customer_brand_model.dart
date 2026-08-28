import 'package:isar_community/isar.dart';

part 'agent_customer_brand_model.g.dart';

/// Response model for customer-specific brand assignments
/// Maps to AgentCustomerBrandsResponse from the API
class AgentCustomerBrandsResponse {
  final int agentId;
  final String agentName;
  final bool hasGlobalAllBrands;
  final List<CustomerBrandInfo> customerAssignments;

  const AgentCustomerBrandsResponse({
    required this.agentId,
    required this.agentName,
    required this.hasGlobalAllBrands,
    required this.customerAssignments,
  });

  factory AgentCustomerBrandsResponse.fromJson(Map<String, dynamic> json) {
    final assignments =
        (json['customer_assignments'] as List?)
            ?.map((a) => CustomerBrandInfo.fromJson(a as Map<String, dynamic>))
            .toList() ??
        [];

    return AgentCustomerBrandsResponse(
      agentId: json['agent_id'] as int,
      agentName: json['agent_name'] as String? ?? '',
      hasGlobalAllBrands: json['has_global_all_brands'] as bool? ?? false,
      customerAssignments: assignments,
    );
  }

  Map<String, dynamic> toJson() => {
    'agent_id': agentId,
    'agent_name': agentName,
    'has_global_all_brands': hasGlobalAllBrands,
    'customer_assignments': customerAssignments.map((a) => a.toJson()).toList(),
  };

  /// Check if agent can access a brand for a specific customer
  bool canAccessBrand(int customerId, int brandId) {
    // Global all brands = access to everything
    if (hasGlobalAllBrands) return true;

    // Find the customer assignment
    final assignment = customerAssignments.firstWhere(
      (a) => a.customerId == customerId,
      orElse: () => CustomerBrandInfo.empty(),
    );

    return assignment.canAccessBrand(brandId);
  }

  /// Get all accessible brand IDs for a customer
  List<int> getAccessibleBrandIds(int customerId) {
    // Global all brands = don't filter
    if (hasGlobalAllBrands) return [];

    final assignment = customerAssignments.firstWhere(
      (a) => a.customerId == customerId,
      orElse: () => CustomerBrandInfo.empty(),
    );

    // All brands for this customer = don't filter
    if (assignment.isAllBrands) return [];

    return assignment.brands.map((b) => b.id).toList();
  }

  /// Check if we need to filter by brands (false = show all)
  bool get shouldFilterBrands => !hasGlobalAllBrands;
}

/// Customer-specific brand information
class CustomerBrandInfo {
  final int? customerId;
  final String? customerName;
  final String? customerCardCode;
  final bool isAllBrands;
  final List<BrandInfo> brands;

  const CustomerBrandInfo({
    this.customerId,
    this.customerName,
    this.customerCardCode,
    required this.isAllBrands,
    required this.brands,
  });

  factory CustomerBrandInfo.fromJson(Map<String, dynamic> json) {
    final brandsList =
        (json['brands'] as List?)
            ?.map((b) => BrandInfo.fromJson(b as Map<String, dynamic>))
            .toList() ??
        [];

    return CustomerBrandInfo(
      customerId: json['customer_id'] as int?,
      customerName: json['customer_name'] as String?,
      customerCardCode: json['customer_card_code'] as String?,
      isAllBrands: json['is_all_brands'] as bool? ?? false,
      brands: brandsList,
    );
  }

  factory CustomerBrandInfo.empty() =>
      const CustomerBrandInfo(isAllBrands: false, brands: []);

  Map<String, dynamic> toJson() => {
    'customer_id': customerId,
    'customer_name': customerName,
    'customer_card_code': customerCardCode,
    'is_all_brands': isAllBrands,
    'brands': brands.map((b) => b.toJson()).toList(),
  };

  bool canAccessBrand(int brandId) {
    return isAllBrands || brands.any((b) => b.id == brandId);
  }
}

/// Brand information
class BrandInfo {
  final int id;
  final String code;
  final String name;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const BrandInfo({
    required this.id,
    required this.code,
    required this.name,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  factory BrandInfo.fromJson(Map<String, dynamic> json) {
    return BrandInfo(
      id: json['id'] as int,
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      isActive: json['is_active'] as bool? ?? true,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'name': name,
    'is_active': isActive,
    if (createdAt != null) 'created_at': createdAt!.toIso8601String(),
    if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
  };
}

/// Cached model for offline storage of agent's customer brand assignments
@collection
class AgentCustomerBrandModel {
  Id id = Isar.autoIncrement;

  @Index()
  late int agentId;

  @Index()
  late int customerId;

  late bool hasGlobalAllBrands;

  late bool isAllBrandsForCustomer;

  late List<int> brandIds;

  late List<String> brandNames;

  late List<String> brandCodes;

  DateTime cachedAt = DateTime.now();

  AgentCustomerBrandModel();

  /// Create from customer brand info for a specific customer
  factory AgentCustomerBrandModel.fromResponse(
    AgentCustomerBrandsResponse response,
    int customerId,
  ) {
    final assignment = response.customerAssignments.firstWhere(
      (a) => a.customerId == customerId,
      orElse: () => CustomerBrandInfo.empty(),
    );

    return AgentCustomerBrandModel()
      ..agentId = response.agentId
      ..customerId = customerId
      ..hasGlobalAllBrands = response.hasGlobalAllBrands
      ..isAllBrandsForCustomer = assignment.isAllBrands
      ..brandIds = assignment.brands.map((b) => b.id).toList()
      ..brandNames = assignment.brands.map((b) => b.name).toList()
      ..brandCodes = assignment.brands.map((b) => b.code).toList()
      ..cachedAt = DateTime.now();
  }

  /// Check if agent can access a specific brand
  bool canAccessBrand(int brandId) {
    return hasGlobalAllBrands ||
        isAllBrandsForCustomer ||
        brandIds.contains(brandId);
  }

  /// Convert to response model
  AgentCustomerBrandsResponse toResponse() {
    final brands = List.generate(
      brandIds.length,
      (i) =>
          BrandInfo(id: brandIds[i], name: brandNames[i], code: brandCodes[i]),
    );

    return AgentCustomerBrandsResponse(
      agentId: agentId,
      agentName: '',
      hasGlobalAllBrands: hasGlobalAllBrands,
      customerAssignments: [
        CustomerBrandInfo(
          customerId: customerId,
          isAllBrands: isAllBrandsForCustomer,
          brands: brands,
        ),
      ],
    );
  }
}
