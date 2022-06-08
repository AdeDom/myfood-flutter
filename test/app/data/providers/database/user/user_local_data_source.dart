import 'package:myfood/app/data/models/user/user_entity.dart';
import 'package:myfood/app/data/providers/database/user/user_local_data_source.dart';

class FakeUserLocalDataSource with UserLocalDataSource {
  UserEntity? userEntity;

  @override
  Future<UserEntity?> getUser() async {
    return userEntity;
  }

  @override
  Future<void> saveUser(UserEntity user) async {
    userEntity = user;
  }

  @override
  Future<void> deleteUserAll() async {
    userEntity = null;
  }
}
