import '../entities/order.dart';
import '../repositories/order_repository.dart';

class ManageOrders {
  final OrderRepository repository;

  ManageOrders(this.repository);

  Future<List<Order>> getOrders(String userId) {
    return repository.getOrders(userId);
  }

  Future<void> placeOrder(Order order) {
    return repository.placeOrder(order);
  }

  Future<void> cancelOrder(String orderId) {
    return repository.cancelOrder(orderId);
  }
}
