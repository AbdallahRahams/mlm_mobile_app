import 'package:your_project/data/datasources/local/local_data_source.dart';
import 'package:your_project/data/datasources/remote/remote_data_source.dart';
import 'package:your_project/domain/entities/analytics.dart';
import 'package:your_project/domain/repositories/analytics_repository.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  AnalyticsRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Analytics> getAnalyticsData(String analyticsId) async {
    try {
      final analytics = await remoteDataSource.getAnalyticsData(analyticsId);
      return analytics;
    } catch (e) {
      return localDataSource.getAnalyticsData(analyticsId);
    }
  }
}