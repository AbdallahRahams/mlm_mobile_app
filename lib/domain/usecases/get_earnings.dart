import '../entities/earnings.dart';
import '../repositories/earnings_repository.dart';

class GetEarnings {
  final EarningsRepository repository;

  GetEarnings(this.repository);

  Future<Earnings> call(String userId) {
    return repository.getEarnings(userId);
  }
}
