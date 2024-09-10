import '../entities/referral.dart';

abstract class ReferralRepository {
  Future<Referral> getReferralData(String userId);
  Future<void> addReferral(String referrerId, String referralCode);
}
