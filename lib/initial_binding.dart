import 'package:get/get.dart';
import 'package:myfood/app/data/providers/database/user/user_local_data_source.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';
import 'package:myfood/app/data/providers/network/auth/auth_remote_data_source.dart';
import 'package:myfood/app/data/providers/network/profile/profile_remote_data_source.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/app/data/repositories/auth/auth_login_repository.dart';
import 'package:myfood/app/data/repositories/auth/auth_repository.dart';
import 'package:myfood/app/data/repositories/auth/auth_user_profile_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_login_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_user_profile_repository.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DataStore>(DataStoreImpl());
    DataStore dataStore = Get.find();

    Get.put<MyFoodDio>(MyFoodDio(dataStore: dataStore));
    MyFoodDio myFoodDio = Get.find();

    Get.put<AuthRemoteDataSource>(
      AuthRemoteDataSourceImpl(
        myFoodDio: myFoodDio,
      ),
    );
    AuthRemoteDataSource authRemoteDataSource = Get.find();

    Get.put<AuthLoginRepository>(
      AuthLoginRepositoryImpl(
        authRemoteDataSource: authRemoteDataSource,
        dataStore: dataStore,
      ),
    );
    AuthLoginRepository authLoginRepository = Get.find();

    Get.put<UserLocalDataSource>(UserLocalDataSourceImpl());
    UserLocalDataSource userLocalDataSource = Get.find();

    Get.put<ProfileRemoteDataSource>(
      ProfileRemoteDataSourceImpl(
        myFoodDio: myFoodDio,
      ),
    );
    ProfileRemoteDataSource profileRemoteDataSource = Get.find();

    Get.put<AuthUserProfileRepository>(
      AuthUserProfileRepositoryImpl(
        userLocalDataSource: userLocalDataSource,
        profileRemoteDataSource: profileRemoteDataSource,
      ),
    );
    AuthUserProfileRepository authUserProfileRepository = Get.find();

    Get.put<AuthRepository>(
      AuthRepositoryImpl(
        authLoginRepository: authLoginRepository,
        authUserProfileRepository: authUserProfileRepository,
      ),
    );
  }
}
