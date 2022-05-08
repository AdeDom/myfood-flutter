import 'dart:convert';

import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/models/login/login_response.dart';
import 'package:myfood/data/models/user_profile/user_profile.dart';
import 'package:myfood/data/models/user_profile/user_profile_response.dart';
import 'package:myfood/data/providers/database/user/user_local_data_source.dart';
import 'package:myfood/data/providers/network/auth/auth_remote_data_source.dart';
import 'package:myfood/data/providers/network/data_source_provider.dart';
import 'package:myfood/data/providers/network/profile/profile_remote_data_source.dart';
import 'package:myfood/data/providers/shared_preference/shared_preference.dart';
import 'package:myfood/data/repositories/resource.dart';
import 'package:myfood/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.userLocalDataSource,
    required this.authRemoteDataSource,
    required this.profileRemoteDataSource,
    required this.sharedPreference,
  });

  UserLocalDataSource userLocalDataSource;
  AuthRemoteDataSource authRemoteDataSource;
  ProfileRemoteDataSource profileRemoteDataSource;
  SharedPreference sharedPreference;

  @override
  Future<Resource<bool>> callLogin({required LoginRequest loginRequest}) async {
    try {
      LoginResponse loginResponse = await authRemoteDataSource.callLogin(
        loginRequest: loginRequest,
      );
      String accessToken = loginResponse.result?.accessToken ?? "";
      String refreshToken = loginResponse.result?.refreshToken ?? "";
      sharedPreference.setAccessToken(accessToken: accessToken);
      sharedPreference.setRefreshToken(refreshToken: refreshToken);

      UserProfileResponse userProfileResponse =
          await profileRemoteDataSource.callUserProfile();
      UserProfile? userProfile = userProfileResponse.result;
      if (userProfile != null) {
        await userLocalDataSource.deleteUserAll();
        await userLocalDataSource.saveUser(userProfile);
      }

      return Resource(
        isSuccess: true,
        data: true,
      );
    } on ApiServiceManagerException catch (error) {
      Map<String, dynamic> jsonError = json.decode(error.message);
      BaseError baseError = BaseError.fromJson(jsonError);
      return Resource(error: baseError);
    } catch (error) {
      BaseError baseError = BaseError(message: error.toString());
      return Resource(error: baseError);
    }
  }
}
