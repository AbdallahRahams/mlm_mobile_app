import 'data_source.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
}
