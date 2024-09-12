class OrderDetails {
  final String orderId;
  final String productName;
  final int quantity;
  final double price;
  final String status;
  final String productId;
  final String userId;

  OrderDetails({
    required this.orderId,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.status,
    required this.productId,
    required this.userId,
  });

  // Factory constructor to create an OrderDetails instance from a Map (used by SQLite)
  factory OrderDetails.fromMap(Map<String, dynamic> map) {
    return OrderDetails(
      orderId: map['orderId'],
      productName: map['productName'],
      quantity: map['quantity'],
      price: map['price'],
      status: map['status'],
      productId: map['productId'],
      userId: map['userId'],
    );
  }

  // Method to convert OrderDetails to a Map (used by SQLite)
  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'productName': productName,
      'quantity': quantity,
      'price': price,
      'status': status,
      'productId': productId,
      'userId': userId,
    };
  }

  // Factory constructor to create an OrderDetails instance from JSON
  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      orderId: json['orderId'],
      productName: json['productName'],
      quantity: json['quantity'],
      price: json['price'],
      status: json['status'],
      productId: json['productId'],
      userId: json['userId'],
    );
  }

  // Method to convert OrderDetails to JSON
  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'productName': productName,
      'quantity': quantity,
      'price': price,
      'status': status,
      'productId': productId,
      'userId': userId,
    };
  }
}