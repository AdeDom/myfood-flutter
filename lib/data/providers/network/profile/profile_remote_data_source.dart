import 'package:myfood/data/models/base/base_response.dart';
import 'package:myfood/data/models/user_profile/user_profile.dart';
import 'package:myfood/data/providers/network/api_service_manager.dart';
import 'package:myfood/data/providers/shared_preference/shared_preference.dart';

abstract class ProfileRemoteDataSource {
  Future<BaseResponse<UserProfile>> callUserProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final MyFoodDio myFoodDio;
  final SharedPreference sharedPreference;

  ProfileRemoteDataSourceImpl({
    required this.myFoodDio,
    required this.sharedPreference,
  });

  @override
  Future<BaseResponse<UserProfile>> callUserProfile() async {
    var accessToken = await sharedPreference.getAccessToken();
    final response = await myFoodDio.addAuth(accessToken).get(
          "api/profile/user",
        );

    return BaseResponse<UserProfile>.fromJson(
      response.data,
      (json) => UserProfile.fromJson(json),
    );
  }
}
