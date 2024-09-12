import 'package:mlm_mobile_app/domain/entities/referral.dart';
import '../../domain/repositories/referral_repository.dart';
import '../datasources/local/local_data_source.dart';
import '../datasources/remote/remote_data_source.dart';

class ReferralRepositoryImpl implements ReferralRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  ReferralRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<void> addReferral(String referrerId, String referralCode) {
    // TODO: implement addReferral
    throw UnimplementedError();
  }

  @override
  Future<Referral> getReferralData(String userId) {
    // TODO: implement getReferralData
    throw UnimplementedError();
  }
  
  @override
  Future<List<Referral>> getTopReferrers() {
    // TODO: implement getTopReferrers
    throw UnimplementedError();
  }
}
