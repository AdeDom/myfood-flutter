import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfood/app/config/database_constant.dart';
import 'package:myfood/data/models/user/user_entity.dart';

abstract class UserLocalDataSource {
  UserEntity? getUser();

  ValueListenable getUserListenable();

  void saveUser(UserEntity user);

  void deleteUserAll();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final box = Hive.box(DatabaseConstant.tableUser);

  @override
  UserEntity? getUser() {
    return box.get(DatabaseConstant.tableUser);
  }

  @override
  ValueListenable getUserListenable() {
    return box.listenable();
  }

  @override
  void saveUser(UserEntity user) async {
    box.put(DatabaseConstant.tableUser, user);
  }

  @override
  void deleteUserAll() async {
    box.delete(DatabaseConstant.tableUser);
  }
}
