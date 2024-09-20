// Domain Layer - Use Case for searching services by query
import '../../data/models/services_model.dart';
import '../repositories/service_repository.dart';

class SearchServicesUseCase {
  final ServiceRepository repository;

  SearchServicesUseCase(this.repository);

  Future<List<Service>> execute(String query) async {
    if (query.isEmpty) {
      return await repository.getServices(); // If no query, return all services
    } else {
      return await repository.searchServices(query);
    }
  }
}
