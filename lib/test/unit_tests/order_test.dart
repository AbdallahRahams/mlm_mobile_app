import 'package:flutter_test/flutter_test.dart';
import 'package:your_project/data/models/order_model.dart'; // Update with actual import path
import 'package:your_project/domain/entities/order.dart'; // Update with actual import path

void main() {
  group('OrderModel', () {
    test('should convert from entity to model and vice versa', () {
      final orderEntity = Order(
        id: '1',
        productId: 'p1',
        quantity: 2,
        price: 50.0,
      );

      final orderModel = OrderModel.fromEntity(orderEntity);
      final newOrderEntity = orderModel.toEntity();

      expect(newOrderEntity.id, orderEntity.id);
      expect(newOrderEntity.productId, orderEntity.productId);
      expect(newOrderEntity.quantity, orderEntity.quantity);
      expect(newOrderEntity.price, orderEntity.price);
    });
  });
}
