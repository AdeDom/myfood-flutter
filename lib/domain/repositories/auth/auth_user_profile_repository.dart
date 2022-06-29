import 'package:myfood/app/data/models/user/user_entity.dart';
import 'package:myfood/app/data/models/user_profile/user_profile.dart';

mixin AuthUserProfileRepository {
  Future<UserProfile?> callUserProfile();

  Future<void> saveUser(UserEntity userEntity);
}
