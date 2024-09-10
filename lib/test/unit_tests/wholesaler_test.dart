import 'package:flutter_test/flutter_test.dart';
import 'package:your_project/data/models/wholesaler_model.dart'; // Update with actual import path
import 'package:your_project/domain/entities/wholesaler.dart'; // Update with actual import path

void main() {
  group('WholesalerModel', () {
    test('should convert from entity to model and vice versa', () {
      final wholesalerEntity = Wholesaler(
        id: '1',
        name: 'Wholesaler A',
        contactInfo: 'contact@example.com',
      );

      final wholesalerModel = WholesalerModel.fromEntity(wholesalerEntity);
      final newWholesalerEntity = wholesalerModel.toEntity();

      expect(newWholesalerEntity.id, wholesalerEntity.id);
      expect(newWholesalerEntity.name, wholesalerEntity.name);
      expect(newWholesalerEntity.contactInfo, wholesalerEntity.contactInfo);
    });
  });
}