import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand.freezed.dart';

/// Brand information
@freezed
class Brand with _$Brand {
  const factory Brand({
    required int id,
    required String name,
    required String code,
  }) = _Brand;
}

/// Agent brand assignment
@freezed
class AgentBrand with _$AgentBrand {
  const factory AgentBrand({
    required int agentId,
    required bool isAllBrands,
    required List<Brand> brands,
  }) = _AgentBrand;

  const AgentBrand._();

  /// Check if agent can access a specific brand
  bool canAccessBrand(int brandId) {
    return isAllBrands || brands.any((b) => b.id == brandId);
  }

  /// Get brand by ID
  Brand? getBrand(int brandId) {
    try {
      return brands.firstWhere((b) => b.id == brandId);
    } catch (_) {
      return null;
    }
  }

  /// Get brand name by ID
  String? getBrandName(int brandId) {
    return getBrand(brandId)?.name;
  }

  /// Get list of brand IDs (empty if isAllBrands)
  List<int> get brandIds => isAllBrands ? [] : brands.map((b) => b.id).toList();
}

/// Customer brand info for a specific customer
@freezed
class CustomerBrandAssignment with _$CustomerBrandAssignment {
  const factory CustomerBrandAssignment({
    int? customerId,
    String? customerName,
    String? customerCardCode,
    required bool isAllBrands,
    required List<Brand> brands,
  }) = _CustomerBrandAssignment;

  const CustomerBrandAssignment._();

  /// Check if agent can access a specific brand for this customer
  bool canAccessBrand(int brandId) {
    return isAllBrands || brands.any((b) => b.id == brandId);
  }

  /// Get brand IDs (empty if isAllBrands = access all)
  List<int> get brandIds => isAllBrands ? [] : brands.map((b) => b.id).toList();
}

/// Agent's customer-specific brand assignments
@freezed
class AgentCustomerBrands with _$AgentCustomerBrands {
  const factory AgentCustomerBrands({
    required int agentId,
    required String agentName,
    required bool hasGlobalAllBrands,
    required List<CustomerBrandAssignment> customerAssignments,
  }) = _AgentCustomerBrands;

  const AgentCustomerBrands._();

  /// Check if agent can access a brand for a specific customer
  bool canAccessBrand(int customerId, int brandId) {
    // Global all brands = access to everything
    if (hasGlobalAllBrands) return true;

    // Find the customer assignment
    final assignment = customerAssignments
        .where((a) => a.customerId == customerId)
        .firstOrNull;

    if (assignment == null) return false;
    return assignment.canAccessBrand(brandId);
  }

  /// Get accessible brand IDs for a customer (empty list = access all)
  List<int> getAccessibleBrandIds(int customerId) {
    // Global all brands = don't filter
    if (hasGlobalAllBrands) return [];

    final assignment = customerAssignments
        .where((a) => a.customerId == customerId)
        .firstOrNull;

    if (assignment == null) return [];

    // All brands for this customer = don't filter
    if (assignment.isAllBrands) return [];

    return assignment.brandIds;
  }

  /// Check if we should filter products by brands for a customer
  /// Returns false if agent has access to all brands (globally or for customer)
  bool shouldFilterBrands(int customerId) {
    if (hasGlobalAllBrands) return false;

    final assignment = customerAssignments
        .where((a) => a.customerId == customerId)
        .firstOrNull;

    if (assignment == null) return true; // No assignment = filter everything
    return !assignment.isAllBrands;
  }

  /// Get the brand assignment for a specific customer
  CustomerBrandAssignment? getCustomerAssignment(int customerId) {
    return customerAssignments
        .where((a) => a.customerId == customerId)
        .firstOrNull;
  }

  /// Get all assigned brands across all customers
  List<Brand> get allBrands {
    final brands = <Brand>[];
    for (final assignment in customerAssignments) {
      for (final brand in assignment.brands) {
        if (!brands.any((b) => b.id == brand.id)) {
          brands.add(brand);
        }
      }
    }
    return brands;
  }
}
