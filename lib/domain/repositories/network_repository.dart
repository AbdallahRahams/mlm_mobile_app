import '../entities/network.dart';

abstract class NetworkRepository {
  Future<List<Network>> getAllNetworks();
  Future<Network> getNetworkDetails(String networkId);
  Future<void> createNetwork(Network network);
  Future<void> deleteNetwork(String networkId);
}
