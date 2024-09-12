import '../../domain/entities/network.dart';
import '../../domain/repositories/network_repository.dart';
import '../datasources/local/local_data_source.dart';
import '../datasources/remote/remote_data_source.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  NetworkRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });
  
  @override
  Future<void> createNetwork(Network network) {
    // TODO: implement createNetwork
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteNetwork(String networkId) {
    // TODO: implement deleteNetwork
    throw UnimplementedError();
  }
  
  @override
  Future<List<Network>> getAllNetworks() {
    // TODO: implement getAllNetworks
    throw UnimplementedError();
  }
  
  @override
  Future<Network> getNetworkDetails(String networkId) {
    // TODO: implement getNetworkDetails
    throw UnimplementedError();
  }
}
