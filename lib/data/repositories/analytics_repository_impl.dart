import 'package:mlm_mobile_app/domain/entities/analytics.dart';
import '../../domain/repositories/analytics_repository.dart';
import '../datasources/local/local_data_source.dart';
import '../datasources/remote/remote_data_source.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  AnalyticsRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<void> updateAnalytics(Analytics analytics) {
    // TODO: implement updateAnalytics
    throw UnimplementedError();
  }
  
  @override
  Future<Analytics> getAnalyticsData() {
    // TODO: implement getAnalyticsData
    throw UnimplementedError();
  }
}