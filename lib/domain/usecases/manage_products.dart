import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ManageProducts {
  final ProductRepository repository;

  ManageProducts(this.repository);

  Future<List<Product>> getProducts() {
    return repository.getProducts();
  }

  Future<Product> getProductDetails(String productId) {
    return repository.getProductDetails(productId);
  }

  Future<void> addProduct(Product product) {
    return repository.addProduct(product);
  }

  Future<void> deleteProduct(String productId) {
    return repository.deleteProduct(productId);
  }
}
