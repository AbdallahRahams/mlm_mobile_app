import 'package:flutter_test/flutter_test.dart';
import 'package:your_project/data/models/product_model.dart'; // Update with actual import path
import 'package:your_project/domain/entities/product.dart'; // Update with actual import path

void main() {
  group('ProductModel', () {
    test('should convert from entity to model and vice versa', () {
      final productEntity = Product(
        id: '1',
        name: 'Product A',
        price: 100.0,
      );

      final productModel = ProductModel.fromEntity(productEntity);
      final newProductEntity = productModel.toEntity();

      expect(newProductEntity.id, productEntity.id);
      expect(newProductEntity.name, productEntity.name);
      expect(newProductEntity.price, productEntity.price);
    });
  });
}