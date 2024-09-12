import '../models/earnings_model.dart';
import '../models/networkDetails.dart';
import '../models/orderDetails.dart';

abstract class DataSource {
  Future<List<T>> getAll<T>();
  Future<T?> getById<T>(String id); // Changed to nullable
  Future<void> create<T>(T entity);
  Future<void> update<T>(String id, T entity);
  Future<void> delete<T>(String id);

  // Specific methods for Earnings, OrderDetails, and NetworkDetails
  Future<EarningsModel> getEarnings(String userId);
  Future<OrderDetails> getOrderDetails(String orderId);
  Future<NetworkDetails> getNetworkDetails(String networkId);
}