import 'package:myfood/data/models/user/user_entity.dart';
import 'package:myfood/data/models/user_profile/user_profile.dart';
import 'package:myfood/data/providers/database/user/user_local_data_source.dart';
import 'package:myfood/data/providers/network/profile/profile_remote_data_source.dart';
import 'package:myfood/domain/repositories/auth/auth_user_profile_repository.dart';

class AuthUserProfileRepositoryImpl with AuthUserProfileRepository {
  final UserLocalDataSource userLocalDataSource;
  final ProfileRemoteDataSource profileRemoteDataSource;

  AuthUserProfileRepositoryImpl({
    required this.userLocalDataSource,
    required this.profileRemoteDataSource,
  });

  @override
  Future<void> callUserProfile() async {
    final userProfileResponse = await profileRemoteDataSource.callUserProfile();
    UserProfile? userProfile = userProfileResponse.result;
    if (userProfile != null) {
      await userLocalDataSource.deleteUserAll();
      UserEntity userEntity = UserEntity(
        userId: userProfile.userId,
        email: userProfile.email,
        name: userProfile.name,
        mobileNo: userProfile.mobileNo,
        address: userProfile.address,
        image: userProfile.image,
        status: userProfile.status,
        created: userProfile.created,
        updated: userProfile.updated,
      );
      await userLocalDataSource.saveUser(userEntity);
    }
  }
}
