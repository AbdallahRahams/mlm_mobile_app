import 'package:flutter_test/flutter_test.dart';
import 'package:your_project/data/models/user_model.dart'; // Update with actual import path
import 'package:your_project/domain/entities/user.dart'; // Update with actual import path

void main() {
  group('UserModel', () {
    test('should convert from entity to model and vice versa', () {
      final userEntity = User(
        id: '1',
        name: 'John Doe',
        email: 'john.doe@example.com',
      );

      final userModel = UserModel.fromEntity(userEntity);
      final newUserEntity = userModel.toEntity();

      expect(newUserEntity.id, userEntity.id);
      expect(newUserEntity.name, userEntity.name);
      expect(newUserEntity.email, userEntity.email);
    });
  });
}
