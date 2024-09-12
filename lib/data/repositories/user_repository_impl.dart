import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/local/local_data_source.dart';
import '../datasources/remote/remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  UserRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  

  @override
  Future<void> deleteUser(String userId) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserInfo(User user) {
    // TODO: implement updateUserInfo
    throw UnimplementedError();
  }
  
  @override
  Future<User> getUserInfo(String userId) {
    // TODO: implement getUserInfo
    throw UnimplementedError();
  }
}
