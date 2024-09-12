import 'package:http/http.dart' as http;
import 'package:mlm_mobile_app/data/models/earnings_model.dart';
import 'dart:convert';
import '../../models/earnings.dart';
import '../../models/networkDetails.dart';
import '../../models/orderDetails.dart';
import '../data_source.dart';

class RemoteDataSource implements DataSource {
  final String baseUrl;

  RemoteDataSource(this.baseUrl);

  @override
  Future<List<T>> getAll<T>() async {
    final response = await http.get(Uri.parse('$baseUrl/entities'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => e as T).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<T> getById<T>(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/entities/$id'));
    if (response.statusCode == 200) {
      return json.decode(response.body) as T;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<void> create<T>(T entity) async {
    final response = await http.post(
      Uri.parse('$baseUrl/entities'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(entity),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create entity');
    }
  }

  @override
  Future<void> update<T>(String id, T entity) async {
    final response = await http.put(
      Uri.parse('$baseUrl/entities/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(entity),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update entity');
    }
  }

  @override
  Future<void> delete<T>(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/entities/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete entity');
    }
  }

  // Define getEarnings method
  Future<EarningsModel> getEarnings(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/earnings/$userId'));
    if (response.statusCode == 200) {
      return EarningsModel.fromJson(json.decode(response.body));  // Assuming you have an EarningsModel
    } else {
      throw Exception('Failed to fetch earnings');
    }
  }

  // Define getOrderDetails method
  Future<OrderDetails> getOrderDetails(String orderId) async {
    final response = await http.get(Uri.parse('$baseUrl/orders/$orderId'));
    if (response.statusCode == 200) {
      return OrderDetails.fromJson(json.decode(response.body));  // Assuming you have an OrderDetails model
    } else {
      throw Exception('Failed to fetch order details');
    }
  }

  // Define getNetworkDetails method
  Future<NetworkDetails> getNetworkDetails(String networkId) async {
    final response = await http.get(Uri.parse('$baseUrl/networks/$networkId'));
    if (response.statusCode == 200) {
      return NetworkDetails.fromJson(json.decode(response.body));  // Assuming you have a NetworkDetails model
    } else {
      throw Exception('Failed to fetch network details');
    }
  }

  // New method to create an order
  Future<void> createOrder(OrderDetails orderDetails) async {
    final response = await http.post(
      Uri.parse('$baseUrl/orders'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(orderDetails.toJson()),  // Assuming OrderDetails has a toJson() method
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create order');
    }
  }

  // New method to update an order
  Future<void> updateOrder(String orderId, OrderDetails orderDetails) async {
    final response = await http.put(
      Uri.parse('$baseUrl/orders/$orderId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(orderDetails.toJson()),  // Assuming OrderDetails has a toJson() method
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update order');
    }
  }

  // New method to delete an order
  Future<void> deleteOrder(String orderId) async {
    final response = await http.delete(Uri.parse('$baseUrl/orders/$orderId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete order');
    }
  }
}