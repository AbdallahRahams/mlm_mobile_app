class Order {
  final String id;
  final String productId;
  final String userId;
  final String status;
  final DateTime orderDate;

  Order({
    required this.id,
    required this.productId,
    required this.userId,
    required this.status,
    required this.orderDate,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      productId: json['productId'],
      userId: json['userId'],
      status: json['status'],
      orderDate: DateTime.parse(json['orderDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'userId': userId,
      'status': status,
      'orderDate': orderDate.toIso8601String(),
    };
  }
}
