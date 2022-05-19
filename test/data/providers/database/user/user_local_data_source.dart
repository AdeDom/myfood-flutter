import 'package:myfood/data/models/user/user_entity.dart';
import 'package:myfood/data/providers/database/user/user_local_data_source.dart';

class FakeUserLocalDataSource with UserLocalDataSource {
  UserEntity? userEntity;

  @override
  Future<UserEntity?> getUser() {
    return Future.value(userEntity);
  }

  @override
  Future<void> saveUser(UserEntity user) {
    userEntity = user;
    return Future.value();
  }

  @override
  Future<void> deleteUserAll() {
    userEntity = null;
    return Future.value();
  }
}
