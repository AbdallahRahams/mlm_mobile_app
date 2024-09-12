import 'package:mlm_mobile_app/data/models/earnings_model.dart';

import '../../domain/entities/earnings.dart';
import '../../domain/repositories/earnings_repository.dart';
import '../datasources/local/local_data_source.dart';
import '../datasources/remote/remote_data_source.dart';

class EarningsRepositoryImpl implements EarningsRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  EarningsRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<void> updateEarnings(Earnings earnings) {
    // TODO: implement updateEarnings
    throw UnimplementedError();
  }
  
  @override
  Future<void> withdrawEarnings(String userId, double amount) {
    // TODO: implement withdrawEarnings
    throw UnimplementedError();
  }
  
  @override
  Future<Earnings> getEarnings(String userId) {
    // TODO: implement getEarnings
    throw UnimplementedError();
  }
}
