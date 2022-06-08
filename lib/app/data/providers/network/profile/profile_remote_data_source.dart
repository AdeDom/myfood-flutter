import 'package:myfood/app/data/models/base/base_response.dart';
import 'package:myfood/app/data/models/user_profile/user_profile.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';

mixin ProfileRemoteDataSource {
  Future<BaseResponse<UserProfile>> callUserProfile();
}

class ProfileRemoteDataSourceImpl with ProfileRemoteDataSource {
  final MyFoodDio myFoodDio;

  ProfileRemoteDataSourceImpl({
    required this.myFoodDio,
  });

  @override
  Future<BaseResponse<UserProfile>> callUserProfile() async {
    final response = await myFoodDio.addAuth().get(
          "api/profile/user",
        );

    return BaseResponse<UserProfile>.fromJson(
      response.data,
      (json) => UserProfile.fromJson(json),
    );
  }
}
