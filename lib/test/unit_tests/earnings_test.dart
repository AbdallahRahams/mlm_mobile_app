import 'package:flutter_test/flutter_test.dart';
import 'package:your_project/data/models/earnings_model.dart'; // Update with actual import path
import 'package:your_project/domain/entities/earnings.dart'; // Update with actual import path

void main() {
  group('EarningsModel', () {
    test('should convert from entity to model and vice versa', () {
      final earningsEntity = Earnings(
        id: '1',
        amount: 1000.0,
        date: DateTime.now(),
      );

      final earningsModel = EarningsModel.fromEntity(earningsEntity);
      final newEarningsEntity = earningsModel.toEntity();

      expect(newEarningsEntity.id, earningsEntity.id);
      expect(newEarningsEntity.amount, earningsEntity.amount);
      expect(newEarningsEntity.date, earningsEntity.date);
    });
  });
}