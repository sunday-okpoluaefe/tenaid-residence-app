class Street {
  final String? id;
  final String? name;
  final String? description;

  Street({required this.id, required this.name, required this.description});

  factory Street.fromJson(dynamic json) => Street(
      id: json['_id'] ?? json['id'],
      name: json['name'],
      description: json['description']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = Map();
    map['_id'] = id;
    map['name'] = name;
    map['description'] = description;
    return map;
  }
}
