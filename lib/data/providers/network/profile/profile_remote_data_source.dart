import 'package:myfood/data/models/user_profile/user_profile_response.dart';
import 'package:myfood/data/providers/network/data_source_provider.dart';

abstract class ProfileRemoteDataSource {
  Future<UserProfileResponse> callUserProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final DataSourceProvider dataSourceProvider;

  ProfileRemoteDataSourceImpl({required this.dataSourceProvider});

  @override
  Future<UserProfileResponse> callUserProfile() async {
    final jsonResponse = await dataSourceProvider.httpGet(
      "api/profile/user",
      DataSourceType.authorization,
    );
    return UserProfileResponse.fromJson(jsonResponse);
  }
}
