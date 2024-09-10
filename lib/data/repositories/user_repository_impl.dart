import 'package:your_project/data/datasources/local/local_data_source.dart';
import 'package:your_project/data/datasources/remote/remote_data_source.dart';
import 'package:your_project/domain/entities/user.dart';
import 'package:your_project/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  UserRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<User> getUserInfo(String userId) async {
    try {
      final user = await remoteDataSource.getUserInfo(userId);
      return user;
    } catch (e) {
      return localDataSource.getUserInfo(userId);
    }
  }
}
