class Analytics {
  final String id;
  final int totalUsers;
  final int totalOrders;
  final double totalRevenue;

  Analytics({
    required this.id,
    required this.totalUsers,
    required this.totalOrders,
    required this.totalRevenue,
  });

  factory Analytics.fromJson(Map<String, dynamic> json) {
    return Analytics(
      id: json['id'],
      totalUsers: json['totalUsers'],
      totalOrders: json['totalOrders'],
      totalRevenue: json['totalRevenue'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'totalUsers': totalUsers,
      'totalOrders': totalOrders,
      'totalRevenue': totalRevenue,
    };
  }
}
