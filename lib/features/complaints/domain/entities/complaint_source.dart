class ComplaintSource {
  final int id;
  final String name;

  const ComplaintSource({required this.id, required this.name});

  factory ComplaintSource.fromJson(Map<String, dynamic> json) =>
      ComplaintSource(id: json['id'] as int, name: json['name'] as String? ?? '');
}
