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
    String userId = "aaa";
    String email = "bbb";
    String name = "ccc";
    String mobileNo = "ddd";
    String address = "eee";
    String image = "fff";
    String status = "ggg";
    String created = "hhh";
    String updated = "iii";
    UserProfile userProfile = UserProfile(
      userId: userId,
      email: email,
      name: name,
      mobileNo: mobileNo,
      address: address,
      image: image,
      status: status,
      created: created,
      updated: updated,
    );
    final userProfileResponse = BaseResponse(result: userProfile);
    when(
      () => profileRemoteDataSource.callUserProfile(),
    ).thenAnswer((_) async => userProfileResponse);

    await repository.callUserProfile();

    UserEntity? userEntity = await userLocalDataSource.getUser();
    expect(userEntity?.userId, userId);
    expect(userEntity?.email, email);
    expect(userEntity?.name, name);
    expect(userEntity?.mobileNo, mobileNo);
    expect(userEntity?.address, address);
    expect(userEntity?.image, image);
    expect(userEntity?.status, status);
    expect(userEntity?.created, created);
    expect(userEntity?.updated, updated);
    verify(() => profileRemoteDataSource.callUserProfile()).called(1);
  });

  test("callUserProfile_clearUserProfileOld_returnSuccess", () async {
    String userId = "aaa";
    String email = "bbb";
    String name = "ccc";
    String mobileNo = "ddd";
    String address = "eee";
    String image = "fff";
    String status = "ggg";
    String created = "hhh";
    String updated = "iii";
    UserProfile userProfile = UserProfile(
      userId: userId,
      email: email,
      name: name,
      mobileNo: mobileNo,
      address: address,
      image: image,
      status: status,
      created: created,
      updated: updated,
    );
    final userProfileResponse = BaseResponse(result: userProfile);
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
    ).thenAnswer((_) async => userProfileResponse);

    await repository.callUserProfile();

    UserEntity? userEntity = await userLocalDataSource.getUser();
    expect(userEntity?.userId, userId);
    expect(userEntity?.email, email);
    expect(userEntity?.name, name);
    expect(userEntity?.mobileNo, mobileNo);
    expect(userEntity?.address, address);
    expect(userEntity?.image, image);
    expect(userEntity?.status, status);
    expect(userEntity?.created, created);
    expect(userEntity?.updated, updated);
    verify(() => profileRemoteDataSource.callUserProfile()).called(1);
  });

  test("callUserProfile_noUserProfile_returnError", () async {
    final userProfileResponse = BaseResponse<UserProfile>();
    when(
      () => profileRemoteDataSource.callUserProfile(),
    ).thenAnswer((_) async => userProfileResponse);

    await repository.callUserProfile();

    UserEntity? userEntity = await userLocalDataSource.getUser();
    expect(userEntity?.userId, null);
    expect(userEntity?.email, null);
    expect(userEntity?.name, null);
    expect(userEntity?.mobileNo, null);
    expect(userEntity?.address, null);
    expect(userEntity?.image, null);
    expect(userEntity?.status, null);
    expect(userEntity?.created, null);
    expect(userEntity?.updated, null);
    verify(() => profileRemoteDataSource.callUserProfile()).called(1);
  });
}
