import '../entities/referral.dart';
import '../repositories/referral_repository.dart';

class GetTopReferrers {
  final ReferralRepository repository;

  GetTopReferrers(this.repository);

  Future<List<Referral>> call() {
    // Assume that the repository provides a method to fetch top referrers
    return repository.getTopReferrers();
  }
}