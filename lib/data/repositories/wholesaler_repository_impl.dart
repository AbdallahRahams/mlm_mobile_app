

import 'package:mlm_mobile_app/domain/entities/wholesaler.dart';

import '../../domain/repositories/wholesaler_repository.dart';
import '../datasources/local/local_data_source.dart';
import '../datasources/remote/remote_data_source.dart';

class WholesalerRepositoryImpl implements WholesalerRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  WholesalerRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<List<Wholesaler>> getWholesalers() {
    // TODO: implement getWholesalers
    throw UnimplementedError();
  }

  @override
  Future<void> removeWholesaler(String wholesalerId) {
    // TODO: implement removeWholesaler
    throw UnimplementedError();
  }
  
  @override
  Future<Wholesaler> getWholesalerDetails(String wholesalerId) {
    // TODO: implement getWholesalerDetails
    throw UnimplementedError();
  }
  
  @override
  Future<void> verifyWholesaler(String wholesalerId) {
    // TODO: implement verifyWholesaler
    throw UnimplementedError();
  }
}
