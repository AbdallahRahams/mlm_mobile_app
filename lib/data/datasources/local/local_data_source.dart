import 'data_source.dart';

class LocalDataSource implements DataSource {
  @override
  Future<List<T>> getAll<T>() async {
    // Fetch all data locally from SQLite or other local database
    return [];
  }

  @override
  Future<T> getById<T>(String id) async {
    // Fetch a specific data entry by ID from local storage
    throw UnimplementedError();
  }

  @override
  Future<void> create<T>(T entity) async {
    // Save data locally
  }

  @override
  Future<void> update<T>(String id, T entity) async {
    // Update existing data in local storage
  }

  @override
  Future<void> delete<T>(String id) async {
    // Delete specific data from local storage
  }
}
