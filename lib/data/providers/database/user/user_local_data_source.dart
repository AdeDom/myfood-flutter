import 'package:myfood/app/config/database_constant.dart';
import 'package:myfood/data/models/user_profile/user_profile.dart';
import 'package:myfood/data/providers/database/myfood_provider.dart';

abstract class UserLocalDataSource {
  Future<UserProfile?> getUser();

  Future saveUser(UserProfile user);

  Future deleteUserAll();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final MyFoodProvider myFoodProvider;

  UserLocalDataSourceImpl({required this.myFoodProvider});

  @override
  Future<UserProfile?> getUser() async {
    List<Map<String, Object?>>? maps = await myFoodProvider.database?.query(
      DatabaseConstant.tableUser,
    );
    List<UserProfile>? userProfileList = maps
        ?.map(
          (e) => UserProfile.fromJson(e),
        )
        .toList();
    if (userProfileList?.isNotEmpty == true) {
      return userProfileList?.first;
    } else {
      return null;
    }
  }

  @override
  Future saveUser(UserProfile user) async {
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
