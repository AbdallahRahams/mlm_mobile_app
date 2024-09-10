import 'package:your_project/data/datasources/local/local_data_source.dart';
import 'package:your_project/data/datasources/remote/remote_data_source.dart';
import 'package:your_project/domain/entities/order.dart';
import 'package:your_project/domain/repositories/order_repository.dart';

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
      final order = await remoteDataSource.getOrderDetails(orderId);
      return order;
    } catch (e) {
      return localDataSource.getOrderDetails(order
