import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductDetails(String productId);
  Future<void> addProduct(Product product);
  Future<void> deleteProduct(String productId);
}
