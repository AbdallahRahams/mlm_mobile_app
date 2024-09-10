import '../entities/network.dart';
import '../repositories/network_repository.dart';

class GetNetworkDetails {
  final NetworkRepository repository;

  GetNetworkDetails(this.repository);

  Future<Network> call(String networkId) {
    return repository.getNetworkDetails(networkId);
  }
}
