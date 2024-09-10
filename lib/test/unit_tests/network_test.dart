import 'package:flutter_test/flutter_test.dart';
import 'package:your_project/data/models/network_model.dart'; // Update with actual import path
import 'package:your_project/domain/entities/network.dart'; // Update with actual import path

void main() {
  group('NetworkModel', () {
    test('should convert from entity to model and vice versa', () {
      final networkEntity = Network(
        id: '1',
        status: 'Online',
      );

      final networkModel = NetworkModel.fromEntity(networkEntity);
      final newNetworkEntity = networkModel.toEntity();

      expect(newNetworkEntity.id, networkEntity.id);
      expect(newNetworkEntity.status, networkEntity.status);
    });
  });
}