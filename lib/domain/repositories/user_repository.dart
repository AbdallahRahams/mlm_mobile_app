import '../entities/user.dart';

abstract class UserRepository {
  Future<User> getUserInfo(String userId);
  Future<void> updateUserInfo(User user);
  Future<void> deleteUser(String userId);
}
