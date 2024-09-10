import '../entities/order.dart';

abstract class OrderRepository {
  Future<List<Order>> getOrders(String userId);
  Future<Order> getOrderDetails(String orderId);
  Future<void> placeOrder(Order order);
  Future<void> cancelOrder(String orderId);
}
