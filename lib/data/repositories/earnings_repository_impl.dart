import 'package:your_project/data/datasources/local/local_data_source.dart';
import 'package:your_project/data/datasources/remote/remote_data_source.dart';
import 'package:your_project/domain/entities/earnings.dart';
import 'package:your_project/domain/repositories/earnings_repository.dart';

class EarningsRepositoryImpl implements EarningsRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  EarningsRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Earnings> getEarnings(String userId) async {
    try {
      final earnings = await remoteDataSource.getEarnings(userId);
      return earnings;
    } catch (e) {
      return localDataSource.getEarnings(userId);
    }
  }
}
