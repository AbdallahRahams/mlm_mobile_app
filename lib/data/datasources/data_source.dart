abstract class DataSource {
  Future<List<T>> getAll<T>();
  Future<T> getById<T>(String id);
  Future<void> create<T>(T entity);
  Future<void> update<T>(String id, T entity);
  Future<void> delete<T>(String id);
}
