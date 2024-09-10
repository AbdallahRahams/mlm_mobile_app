class OrderModel {
  final String orderId;
  final String productId;
  final int quantity;
  final String status;

  OrderModel({
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'],
      productId: json['productId'],
      quantity: json['quantity'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'productId': productId,
      'quantity': quantity,
      'status': status,
    };
  }
}
