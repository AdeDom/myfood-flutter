import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfood/app/config/database_constant.dart';
import 'package:myfood/data/models/user/user_entity.dart';

mixin UserLocalDataSource {
  Future<UserEntity?> getUser();

  Future<void> saveUser(UserEntity user);

  Future<void> deleteUserAll();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final box = Hive.box(DatabaseConstant.tableUser);

  @override
  Future<UserEntity?> getUser() async {
    return await box.get(DatabaseConstant.tableUser);
  }

  @override
  Future<void> saveUser(UserEntity user) async {
    await box.put(DatabaseConstant.tableUser, user);
  }

  @override
  Future<void> deleteUserAll() async {
    await box.delete(DatabaseConstant.tableUser);
  }
}
