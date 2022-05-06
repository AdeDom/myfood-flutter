import 'package:myfood/data/models/user_profile/user_profile_response.dart';
import 'package:myfood/data/providers/network/data_source_provider.dart';

abstract class ProfileRemoteDataSource {
  Future<UserProfileResponse> callUserProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl({required this.dataSourceProvider});

  DataSourceProvider dataSourceProvider;

  @override
  Future<UserProfileResponse> callUserProfile() async {
    final jsonResponse = await dataSourceProvider.get(
      "api/auth/login",
      DataSourceType.authorization,
    );
    return UserProfileResponse.fromJson(jsonResponse);
  }
}
