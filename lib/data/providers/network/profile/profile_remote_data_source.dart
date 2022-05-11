import 'package:dio/dio.dart';
import 'package:myfood/data/models/base/base_response.dart';
import 'package:myfood/data/models/user_profile/user_profile.dart';
import 'package:myfood/data/providers/network/api_service_manager.dart';
import 'package:myfood/data/providers/shared_preference/shared_preference.dart';

abstract class ProfileRemoteDataSource {
  Future<BaseResponse<UserProfile>> callUserProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final SharedPreference sharedPreference;

  ProfileRemoteDataSourceImpl({
    required this.sharedPreference,
  });

  @override
  Future<BaseResponse<UserProfile>> callUserProfile() async {
    final _dio = Dio();
    _dio.interceptors.add(ApiServiceManagerInterceptors());
    var accessToken = await sharedPreference.getAccessToken();
    final response = await _dio.get(
      "api/profile/user",
      options: Options(
        headers: {
          "Authorization": accessToken ?? "",
        },
      ),
    );

    return BaseResponse<UserProfile>.fromJson(
      response.data,
      (json) => UserProfile.fromJson(json),
    );
  }
}
