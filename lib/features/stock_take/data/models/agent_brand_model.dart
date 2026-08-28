import 'package:isar_community/isar.dart';

part 'agent_brand_model.g.dart';

/// Cached agent brand assignments for offline access
@collection
class AgentBrandModel {
  Id id = Isar.autoIncrement;

  @Index()
  late int agentId; // Sales agent ID

  late bool isAllBrands; // Access to all brands

  late List<int> brandIds; // Assigned brand IDs

  late List<String> brandNames; // Brand names (for display)

  late List<String> brandCodes; // Brand codes

  DateTime cachedAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  AgentBrandModel();

  /// Create from API response
  factory AgentBrandModel.fromJson(Map<String, dynamic> json) {
    final brands =
        (json['brands'] as List?)
            ?.map((b) => b as Map<String, dynamic>)
            .toList() ??
        [];

    return AgentBrandModel()
      ..agentId = json['agent_id'] as int
      ..isAllBrands = json['is_all_brands'] as bool? ?? false
      ..brandIds = brands.map((b) => b['id'] as int).toList()
      ..brandNames = brands.map((b) => b['name'] as String).toList()
      ..brandCodes = brands.map((b) => b['code'] as String).toList()
      ..cachedAt = DateTime.now()
      ..updatedAt = DateTime.now();
  }

  /// Convert to JSON for API requests
  Map<String, dynamic> toJson() {
    return {
      'agent_id': agentId,
      'is_all_brands': isAllBrands,
      'brands': List.generate(
        brandIds.length,
        (i) => {
          'id': brandIds[i],
          'name': brandNames[i],
          'code': brandCodes[i],
        },
      ),
    };
  }

  /// Check if agent can access a specific brand
  bool canAccessBrand(int brandId) {
    return isAllBrands || brandIds.contains(brandId);
  }

  /// Get brand name by ID
  String? getBrandName(int brandId) {
    final index = brandIds.indexOf(brandId);
    return index >= 0 ? brandNames[index] : null;
  }
}
