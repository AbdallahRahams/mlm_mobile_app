// domain/repository/service_repository.dart

import '../../data/models/services_model.dart';

abstract class ServiceRepository {
  Future<List<Service>> getServices();
  Future<List<Service>> searchServices(String query);
}
