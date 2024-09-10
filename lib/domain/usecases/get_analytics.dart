import '../entities/analytics.dart';
import '../repositories/analytics_repository.dart';

class GetAnalytics {
  final AnalyticsRepository repository;

  GetAnalytics(this.repository);

  Future<Analytics> call() {
    return repository.getAnalyticsData();
  }
}
