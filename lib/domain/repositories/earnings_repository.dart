import '../entities/earnings.dart';

abstract class EarningsRepository {
  Future<Earnings> getEarnings(String userId);
  Future<void> updateEarnings(Earnings earnings);
  Future<void> withdrawEarnings(String userId, double amount);
}
