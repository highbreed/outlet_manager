class LocationTown {
  final int id;
  final String name;
  final int zoneId;
  final bool isActive;

  const LocationTown({
    required this.id,
    required this.name,
    required this.zoneId,
    required this.isActive,
  });

  factory LocationTown.fromJson(Map<String, dynamic> json) => LocationTown(
    id: json['id'] as int? ?? 0,
    name: json['name'] as String? ?? '',
    zoneId: json['zone_id'] as int? ?? 0,
    isActive: json['is_active'] as bool? ?? true,
  );
}
