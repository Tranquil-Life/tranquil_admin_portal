class AdminRole {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  AdminRole({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AdminRole.fromJson(Map<String, dynamic> json) {
    return AdminRole(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}