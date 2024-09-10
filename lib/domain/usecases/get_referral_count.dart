import '../entities/referral.dart';
import '../repositories/referral_repository.dart';

class GetReferralCount {
  final ReferralRepository repository;

  GetReferralCount(this.repository);

  Future<Referral> call(String userId) {
    return repository.getReferralData(userId);
  }
}
