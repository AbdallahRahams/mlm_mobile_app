import '../entities/analytics.dart';

abstract class AnalyticsRepository {
  Future<Analytics> getAnalyticsData();
  Future<void> updateAnalytics(Analytics analytics);
}
