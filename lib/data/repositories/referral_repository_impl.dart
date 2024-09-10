import 'package:your_project/data/datasources/local/local_data_source.dart';
import 'package:your_project/data/datasources/remote/remote_data_source.dart';
import 'package:your_project/domain/entities/referral.dart';
import 'package:your_project/domain/repositories/referral_repository.dart';

class ReferralRepositoryImpl implements ReferralRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  ReferralRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Referral> getReferralCount(String userId) async {
    try {
      final referral = await remoteDataSource.getReferralCount(userId);
      return referral;
    } catch (e) {
      return localDataSource.getReferralCount(userId);
    }
  }
}
