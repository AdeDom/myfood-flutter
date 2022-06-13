import 'package:get/get.dart';
import 'package:myfood/app/data/providers/database/category/category_local_data_source.dart';
import 'package:myfood/app/data/providers/database/user/user_local_data_source.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';
import 'package:myfood/app/data/providers/network/auth/auth_remote_data_source.dart';
import 'package:myfood/app/data/providers/network/category/category_remote_data_source.dart';
import 'package:myfood/app/data/providers/network/profile/profile_remote_data_source.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/app/data/repositories/auth/auth_login_repository.dart';
import 'package:myfood/app/data/repositories/auth/auth_repository.dart';
import 'package:myfood/app/data/repositories/auth/auth_user_profile_repository.dart';
import 'package:myfood/app/data/repositories/category/category_repository.dart';
import 'package:myfood/app/data/repositories/home/home_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_login_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_user_profile_repository.dart';
import 'package:myfood/domain/repositories/category/category_repository.dart';
import 'package:myfood/domain/repositories/home/home_repository.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DataStore>(DataStoreImpl());
    DataStore dataStore = Get.find();

    MyFoodDio myFoodDio = MyFoodDio(dataStore: dataStore);

    UserLocalDataSource userLocalDataSource = UserLocalDataSourceImpl();
    CategoryLocalDataSource categoryLocalDataSource = CategoryLocalDataSourceImpl();

    AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSourceImpl(
      myFoodDio: myFoodDio,
    );
    ProfileRemoteDataSource profileRemoteDataSource =
        ProfileRemoteDataSourceImpl(
      myFoodDio: myFoodDio,
    );
    CategoryRemoteDataSource categoryRemoteDataSource =
        CategoryRemoteDataSourceImpl(
      myFoodDio: myFoodDio,
    );

    AuthLoginRepository authLoginRepository = AuthLoginRepositoryImpl(
      authRemoteDataSource: authRemoteDataSource,
      dataStore: dataStore,
    );
    AuthUserProfileRepository authUserProfileRepository =
        AuthUserProfileRepositoryImpl(
      userLocalDataSource: userLocalDataSource,
      profileRemoteDataSource: profileRemoteDataSource,
    );
    CategoryRepository categoryRepository = CategoryRepositoryImpl(
      categoryRemoteDataSource: categoryRemoteDataSource,
      categoryLocalDataSource: categoryLocalDataSource,
    );

    Get.put<AuthRepository>(
      AuthRepositoryImpl(
        authLoginRepository: authLoginRepository,
        authUserProfileRepository: authUserProfileRepository,
      ),
    );

    Get.put<HomeRepository>(
      HomeRepositoryImpl(
        categoryRepository: categoryRepository,
      ),
    );
  }
}
