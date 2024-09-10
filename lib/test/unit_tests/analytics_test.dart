import 'package:flutter_test/flutter_test.dart';
import 'package:your_project/data/models/analytics_model.dart'; // Update with actual import path
import 'package:your_project/domain/entities/analytics.dart'; // Update with actual import path

void main() {
  group('AnalyticsModel', () {
    test('should convert from entity to model and vice versa', () {
      final analyticsEntity = Analytics(
        id: '1',
        metric: 'Sales',
        value: 5000.0,
      );

      final analyticsModel = AnalyticsModel.fromEntity(analyticsEntity);
      final newAnalyticsEntity = analyticsModel.toEntity();

      expect(newAnalyticsEntity.id, analyticsEntity.id);
      expect(newAnalyticsEntity.metric, analyticsEntity.metric);
      expect(newAnalyticsEntity.value, analyticsEntity.value);
    });
  });
}
