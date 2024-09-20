// Domain Layer - Use Case for fetching all services
import '../../data/models/services_model.dart';
import '../repositories/service_repository.dart';

class GetServicesUseCase {
  final ServiceRepository repository;

  GetServicesUseCase(this.repository);

  Future<List<Service>> execute() async {
    return await repository.getServices();
  }
}
