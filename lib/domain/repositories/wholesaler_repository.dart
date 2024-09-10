import '../entities/wholesaler.dart';

abstract class WholesalerRepository {
  Future<List<Wholesaler>> getWholesalers();
  Future<Wholesaler> getWholesalerDetails(String wholesalerId);
  Future<void> verifyWholesaler(String wholesalerId);
  Future<void> removeWholesaler(String wholesalerId);
}
