class Wholesaler {
  final String id;
  final String name;
  final String location;
  final bool isVerified;

  Wholesaler({
    required this.id,
    required this.name,
    required this.location,
    required this.isVerified,
  });

  factory Wholesaler.fromJson(Map<String, dynamic> json) {
    return Wholesaler(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      isVerified: json['isVerified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'isVerified': isVerified,
    };
  }
}
