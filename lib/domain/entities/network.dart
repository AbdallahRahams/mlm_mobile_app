class Network {
  final String id;
  final String name;
  final String description;
  final int memberCount;

  Network({
    required this.id,
    required this.name,
    required this.description,
    required this.memberCount,
  });

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      memberCount: json['memberCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'memberCount': memberCount,
    };
  }
}
