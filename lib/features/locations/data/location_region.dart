class LocationRegion {
  final int id;
  final String name;
  final bool isActive;

  const LocationRegion({
    required this.id,
    required this.name,
    required this.isActive,
  });

  factory LocationRegion.fromJson(Map<String, dynamic> json) => LocationRegion(
    id: json['id'] as int? ?? 0,
    name: json['name'] as String? ?? '',
    isActive: json['is_active'] as bool? ?? true,
  );
}
