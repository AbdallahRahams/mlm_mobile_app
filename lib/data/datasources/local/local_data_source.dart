import 'package:mlm_mobile_app/data/models/earnings_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/networkDetails.dart';
import '../../models/orderDetails.dart';
import '../data_source.dart';

class LocalDataSource implements DataSource {
  Database? _db;

  // Initialize the database
  Future<void> _initDb() async {
    if (_db == null) {
      String path = join(await getDatabasesPath(), 'mlm_app.db');
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          // Create tables if they don't exist
          db.execute('''
            CREATE TABLE earnings (
              userId TEXT PRIMARY KEY,
              totalEarnings REAL,
              monthlyEarnings REAL
            )
          ''');
          db.execute('''
            CREATE TABLE orders (
              orderId TEXT PRIMARY KEY,
              details TEXT
            )
          ''');
          db.execute('''
            CREATE TABLE networks (
              networkId TEXT PRIMARY KEY,
              details TEXT
            )
          ''');
        },
      );
    }
  }

  @override
  Future<List<T>> getAll<T>() async {
    await _initDb();
    if (T == EarningsModel) {
      List<Map<String, dynamic>> earnings = await _db!.query('earnings');
      return earnings.map((e) => EarningsModel.fromMap(e) as T).toList();
    } else if (T == OrderDetails) {
      List<Map<String, dynamic>> orders = await _db!.query('orders');
      return orders.map((o) => OrderDetails.fromMap(o) as T).toList();
    } else if (T == NetworkDetails) {
      List<Map<String, dynamic>> networks = await _db!.query('networks');
      return networks.map((n) => NetworkDetails.fromMap(n) as T).toList();
    }
    throw UnimplementedError('Fetching all data for $T is not implemented yet');
  }

  @override
  Future<T?> getById<T>(String id) async {
    await _initDb();
    if (T == EarningsModel) {
      List<Map<String, dynamic>> result = await _db!.query(
        'earnings',
        where: 'userId = ?',
        whereArgs: [id],
      );
      if (result.isNotEmpty) {
        return EarningsModel.fromMap(result.first) as T;
      }
    } else if (T == OrderDetails) {
      List<Map<String, dynamic>> result = await _db!.query(
        'orders',
        where: 'orderId = ?',
        whereArgs: [id],
      );
      if (result.isNotEmpty) {
        return OrderDetails.fromMap(result.first) as T;
      }
    } else if (T == NetworkDetails) {
      List<Map<String, dynamic>> result = await _db!.query(
        'networks',
        where: 'networkId = ?',
        whereArgs: [id],
      );
      if (result.isNotEmpty) {
        return NetworkDetails.fromMap(result.first) as T;
      }
    }
    return null;  // Changed to nullable
  }

  @override
  Future<void> create<T>(T entity) async {
    await _initDb();
    if (entity is EarningsModel) {
      await _db!.insert('earnings', entity.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } else if (entity is OrderDetails) {
      await _db!.insert('orders', entity.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } else if (entity is NetworkDetails) {
      await _db!.insert('networks', entity.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    // Add more logic for other entities
  }

  @override
  Future<void> update<T>(String id, T entity) async {
    await _initDb();
    if (entity is EarningsModel) {
      await _db!.update(
        'earnings',
        entity.toMap(),
        where: 'userId = ?',
        whereArgs: [id],
      );
    } else if (entity is OrderDetails) {
      await _db!.update(
        'orders',
        entity.toMap(),
        where: 'orderId = ?',
        whereArgs: [id],
      );
    } else if (entity is NetworkDetails) {
      await _db!.update(
        'networks',
        entity.toMap(),
        where: 'networkId = ?',
        whereArgs: [id],
      );
    }
    // Add more logic for other entities
  }

  @override
  Future<void> delete<T>(String id) async {
    await _initDb();
    if (T == EarningsModel) {
      await _db!.delete(
        'earnings',
        where: 'userId = ?',
        whereArgs: [id],
      );
    } else if (T == OrderDetails) {
      await _db!.delete(
        'orders',
        where: 'orderId = ?',
        whereArgs: [id],
      );
    } else if (T == NetworkDetails) {
      await _db!.delete(
        'networks',
        where: 'networkId = ?',
        whereArgs: [id],
      );
    }
    // Add more logic for other entities
  }

  @override
  Future<EarningsModel> getEarnings(String userId) async {
    await _initDb();
    try {
      List<Map<String, dynamic>> result = await _db!.query(
        'earnings',
        where: 'userId = ?',
        whereArgs: [userId],
      );
      if (result.isNotEmpty) {
        return EarningsModel.fromMap(result.first);
      }
      return EarningsModel(userId: userId, totalEarnings: 0.0, monthlyEarnings: 0.0);
    } catch (e) {
      print('Error fetching earnings: $e');
      return EarningsModel(userId: userId, totalEarnings: 0.0, monthlyEarnings: 0.0);
    }
  }

  @override
  Future<OrderDetails> getOrderDetails(String orderId) async {
    await _initDb();
    try {
      List<Map<String, dynamic>> result = await _db!.query(
        'orders',
        where: 'orderId = ?',
        whereArgs: [orderId],
      );
      if (result.isNotEmpty) {
        return OrderDetails.fromMap(result.first);
      }
      throw Exception('Order not found');
    } catch (e) {
      throw Exception('Error fetching order details: $e');
    }
  }

  @override
  Future<NetworkDetails> getNetworkDetails(String networkId) async {
    await _initDb();
    try {
      List<Map<String, dynamic>> result = await _db!.query(
        'networks',
        where: 'networkId = ?',
        whereArgs: [networkId],
      );
      if (result.isNotEmpty) {
        return NetworkDetails.fromMap(result.first);
      }
      throw Exception('Network not found');
    } catch (e) {
      throw Exception('Error fetching network details: $e');
    }
  }
}
