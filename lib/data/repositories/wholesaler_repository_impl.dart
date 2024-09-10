import 'package:your_project/data/datasources/local/local_data_source.dart';
import 'package:your_project/data/datasources/remote/remote_data_source.dart';
import 'package:your_project/domain/entities/wholesaler.dart';
import 'package:your_project/domain/repositories/wholesaler_repository.dart';

class WholesalerRepositoryImpl implements WholesalerRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  WholesalerRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Wholesaler> getWholesalerDetails(String wholesalerId) async {
    try {
      final wholesaler = await remoteDataSource.getWholesalerDetails(wholesalerId);
      return wholesaler;
    } catch (e) {
      return localDataSource.getWholesalerDetails(wholesalerId);
    }
  }

  @override
  Future<void> verifyWholesaler(String wholesalerId) async {
    await remoteDataSource.verifyWholesaler(wholesalerId);
    localDataSource.updateWholesalerStatus(wholesalerId, 'verified');
  }
}
