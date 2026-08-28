class ComplaintType {
  final int id;
  final String name;

  const ComplaintType({required this.id, required this.name});

  factory ComplaintType.fromJson(Map<String, dynamic> json) =>
      ComplaintType(id: json['id'] as int, name: json['name'] as String? ?? '');
}
