import 'package:mlm_mobile_app/domain/entities/product.dart';
import 'package:mlm_mobile_app/domain/repositories/product_repository.dart';
import '../datasources/local/local_data_source.dart';
import '../datasources/remote/remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  ProductRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<void> addProduct(Product product) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProduct(String productId) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Product> getProductDetails(String productId) {
    // TODO: implement getProductDetails
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  // Implement the required methods from ProductRepository
}
