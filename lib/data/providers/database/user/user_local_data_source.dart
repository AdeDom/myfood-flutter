import 'package:myfood/app/config/database_constant.dart';
import 'package:myfood/data/models/user/user_entity.dart';
import 'package:myfood/data/providers/database/myfood_provider.dart';

abstract class UserLocalDataSource {
  Future<UserEntity?> getUser();

  Future saveUser(UserEntity user);

  Future deleteUserAll();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final MyFoodProvider myFoodProvider;

  UserLocalDataSourceImpl({required this.myFoodProvider});

  @override
  Future<UserEntity?> getUser() async {
    List<Map<String, Object?>>? maps = await myFoodProvider.database?.query(
      DatabaseConstant.tableUser,
    );
    List<UserEntity>? userProfileList = maps
        ?.map(
          (e) => UserEntity.fromJson(e),
        )
        .toList();
    if (userProfileList?.isNotEmpty == true) {
      return userProfileList?.first;
    } else {
      return null;
    }
  }

  @override
  Future saveUser(UserEntity user) async {
    return await myFoodProvider.database?.insert(
      DatabaseConstant.tableUser,
      user.toJson(),
    );
  }

  @override
  Future deleteUserAll() async {
    return await myFoodProvider.database?.delete(DatabaseConstant.tableUser);
  }
}
