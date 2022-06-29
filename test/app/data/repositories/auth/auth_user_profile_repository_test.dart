import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myfood/app/data/models/base/base_response.dart';
import 'package:myfood/app/data/models/user/user_entity.dart';
import 'package:myfood/app/data/models/user_profile/user_profile.dart';
import 'package:myfood/app/data/providers/database/user/user_local_data_source.dart';
import 'package:myfood/app/data/providers/network/profile/profile_remote_data_source.dart';
import 'package:myfood/app/data/repositories/auth/auth_user_profile_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_user_profile_repository.dart';

import '../../../../mock.dart';
import '../../providers/database/user/user_local_data_source.dart';

void main() {
  late UserLocalDataSource userLocalDataSource;
  late ProfileRemoteDataSource profileRemoteDataSource;
  late AuthUserProfileRepository repository;

  setUp(() {
    userLocalDataSource = FakeUserLocalDataSource();
    profileRemoteDataSource = MockProfileRemoteDataSource();
    repository = AuthUserProfileRepositoryImpl(
      userLocalDataSource: userLocalDataSource,
      profileRemoteDataSource: profileRemoteDataSource,
    );
  });

  test("callUserProfile_returnUserProfile", () async {
    UserProfile userProfile = const UserProfile(
      userId: "aaa",
      email: "bbb",
      name: "ccc",
      mobileNo: "ddd",
      address: "eee",
      image: "fff",
      status: "ggg",
      created: "hhh",
      updated: "iii",
    );
    when(
      () => profileRemoteDataSource.callUserProfile(),
    ).thenAnswer((_) async => BaseResponse(result: userProfile));

    final result = await repository.callUserProfile();

    expect(result, userProfile);
  });

  test("callUserProfile_returnUserProfileIsNull", () async {
    when(
      () => profileRemoteDataSource.callUserProfile(),
    ).thenAnswer((_) async => BaseResponse<UserProfile>());

    final result = await repository.callUserProfile();

    expect(result, null);
  });

  test("saveUser", () async {
    UserEntity userEntity = UserEntity(
      userId: "userId",
      email: "email",
      name: "name",
      mobileNo: "mobileNo",
      address: "address",
      image: "image",
      status: "status",
      created: "created",
      updated: "updated",
    );

    await repository.saveUser(userEntity);

    expect(await userLocalDataSource.getUser(), userEntity);
  });
}
