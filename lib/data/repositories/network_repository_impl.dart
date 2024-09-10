import 'package:your_project/data/datasources/local/local_data_source.dart';
import 'package:your_project/data/datasources/remote/remote_data_source.dart';
import 'package:your_project/domain/entities/network.dart';
import 'package:your_project/domain/repositories/network_repository.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  NetworkRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Network> getNetworkDetails(String networkId) async {
    try {
      final network = await remoteDataSource.getNetworkDetails(networkId);
      return network;
    } catch (e) {
      return localDataSource.getNetworkDetails(networkId);
    }
  }
}
