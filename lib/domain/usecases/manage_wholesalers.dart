import '../entities/wholesaler.dart';
import '../repositories/wholesaler_repository.dart';

class ManageWholesalers {
  final WholesalerRepository repository;

  ManageWholesalers(this.repository);

  Future<List<Wholesaler>> getWholesalers() {
    return repository.getWholesalers();
  }

  Future<void> verifyWholesaler(String wholesalerId) {
    return repository.verifyWholesaler(wholesalerId);
  }

  Future<void> removeWholesaler(String wholesalerId) {
    return repository.removeWholesaler(wholesalerId);
  }
}
