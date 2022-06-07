import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myfood/data/models/base/base_response.dart';
import 'package:myfood/data/models/user/user_entity.dart';
import 'package:myfood/data/models/user_profile/user_profile.dart';
import 'package:myfood/data/providers/database/user/user_local_data_source.dart';
import 'package:myfood/data/providers/network/profile/profile_remote_data_source.dart';
import 'package:myfood/data/repositories/auth/auth_user_profile_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_user_profile_repository.dart';

import '../../../mock.dart';
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

  test("callUserProfile_hasUserProfile_returnSuccess", () async {
    UserProfile userProfile = UserProfile(
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

    await repository.callUserProfile();

    UserEntity? userEntity = await userLocalDataSource.getUser();
    expect(userEntity?.mapToUserProfile(), userProfile);
    verify(() => profileRemoteDataSource.callUserProfile()).called(1);
  });

  test("callUserProfile_clearUserProfileOld_returnSuccess", () async {
    UserProfile userProfile = UserProfile(
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
    UserEntity user = UserEntity(
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
    await userLocalDataSource.saveUser(user);
    when(
      () => profileRemoteDataSource.callUserProfile(),
    ).thenAnswer((_) async => BaseResponse(result: userProfile));

    await repository.callUserProfile();

    UserEntity? userEntity = await userLocalDataSource.getUser();
    expect(userEntity?.mapToUserProfile(), userProfile);
    verify(() => profileRemoteDataSource.callUserProfile()).called(1);
  });

  test("callUserProfile_noUserProfile_returnError", () async {
    when(
      () => profileRemoteDataSource.callUserProfile(),
    ).thenAnswer((_) async => BaseResponse<UserProfile>());

    await repository.callUserProfile();

    UserEntity? userEntity = await userLocalDataSource.getUser();
    expect(userEntity?.mapToUserProfile(), UserProfile());
    verify(() => profileRemoteDataSource.callUserProfile()).called(1);
  });
}
