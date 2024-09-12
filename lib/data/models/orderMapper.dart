import '../../domain/entities/order.dart';
import '../models/orderDetails.dart';

class OrderMapper {
  static OrderDetails toOrderDetails(Order order, {String? productName, int? quantity}) {
    return OrderDetails(
      productName: productName ?? 'Unknown Product',  // Handle missing productName
      quantity: quantity ?? 0,                        // Handle missing quantity
      status: order.status, orderId: '', price: 200.0, productId: '', userId: '',
    );
  }

  static Order toOrder(OrderDetails orderDetails, String productId, String userId) {
    return Order(
      productId: productId,          // Pass the productId explicitly
      userId: userId,                // Pass the userId explicitly
      status: orderDetails.status,
      orderDate: DateTime.now(), id: '',     // Provide the current date or customize as needed
    );
  }
}
