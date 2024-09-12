import 'package:mlm_mobile_app/domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/local/local_data_source.dart';
import '../datasources/remote/remote_data_source.dart';
import '../models/orderMapper.dart';  // Import the mapper

class OrderRepositoryImpl implements OrderRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  OrderRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Order> getOrderDetails(String orderId) async {
    try {
      final orderDetails = await remoteDataSource.getOrderDetails(orderId);
      final productId = orderDetails.productId;  // Assuming you have these in OrderDetails
      final userId = orderDetails.userId;        // Assuming these are part of OrderDetails
      return OrderMapper.toOrder(orderDetails, productId, userId);  // Pass all required arguments
    } catch (e) {
      print('Error fetching order details from remote: $e');
      try {
        final orderDetails = await localDataSource.getOrderDetails(orderId);
        final productId = orderDetails.productId;
        final userId = orderDetails.userId;
        return OrderMapper.toOrder(orderDetails, productId, userId);
      } catch (e) {
        print('Error fetching order details from local: $e');
        throw Exception('Failed to fetch order details');
      }
    }
  }

  @override
  Future<void> createOrder(Order order) async {
    try {
      final orderDetails = OrderMapper.toOrderDetails(order);  // Map Order to OrderDetails
      await remoteDataSource.createOrder(orderDetails);
    } catch (e) {
      print('Error creating order on remote: $e');
      throw Exception('Failed to create order');
    }
  }

  @override
  Future<void> updateOrder(String orderId, Order order) async {
    try {
      final orderDetails = OrderMapper.toOrderDetails(order);  // Map Order to OrderDetails
      await remoteDataSource.updateOrder(orderId, orderDetails);
    } catch (e) {
      print('Error updating order on remote: $e');
      throw Exception('Failed to update order');
    }
  }

  @override
  Future<void> deleteOrder(String orderId) async {
    try {
      await remoteDataSource.deleteOrder(orderId);
    } catch (e) {
      print('Error deleting order on remote: $e');
      throw Exception('Failed to delete order');
    }
  }

  @override
  Future<void> cancelOrder(String orderId) {
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> getOrders(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<void> placeOrder(Order order) {
    throw UnimplementedError();
  }
}
