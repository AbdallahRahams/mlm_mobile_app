import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUserInfo {
  final UserRepository repository;

  GetUserInfo(this.repository);

  Future<User> call(String userId) {
    return repository.getUserInfo(userId);
  }
}
