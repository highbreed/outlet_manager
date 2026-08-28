class LocationZone {
  final int id;
  final String name;
  final int regionId;
  final bool isActive;

  const LocationZone({
    required this.id,
    required this.name,
    required this.regionId,
    required this.isActive,
  });

  factory LocationZone.fromJson(Map<String, dynamic> json) => LocationZone(
    id: json['id'] as int? ?? 0,
    name: json['name'] as String? ?? '',
    regionId: json['region_id'] as int? ?? 0,
    isActive: json['is_active'] as bool? ?? true,
  );
}
