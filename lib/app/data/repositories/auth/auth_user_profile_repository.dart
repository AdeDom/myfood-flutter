import 'package:myfood/app/data/models/user/user_entity.dart';
import 'package:myfood/app/data/models/user_profile/user_profile.dart';
import 'package:myfood/app/data/providers/database/user/user_local_data_source.dart';
import 'package:myfood/app/data/providers/network/profile/profile_remote_data_source.dart';
import 'package:myfood/domain/repositories/auth/auth_user_profile_repository.dart';

class AuthUserProfileRepositoryImpl with AuthUserProfileRepository {
  final UserLocalDataSource userLocalDataSource;
  final ProfileRemoteDataSource profileRemoteDataSource;

  AuthUserProfileRepositoryImpl({
    required this.userLocalDataSource,
    required this.profileRemoteDataSource,
  });

  @override
  Future<UserProfile?> callUserProfile() async {
    final userProfileResponse = await profileRemoteDataSource.callUserProfile();
    return userProfileResponse.result;
  }

  @override
  Future<void> saveUser(UserEntity userEntity) async {
    await userLocalDataSource.deleteUserAll();
    await userLocalDataSource.saveUser(userEntity);
  }
}
