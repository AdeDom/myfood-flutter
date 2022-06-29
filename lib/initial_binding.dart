import 'package:get/get.dart';
import 'package:myfood/app/data/providers/database/category/category_local_data_source.dart';
import 'package:myfood/app/data/providers/database/category/temp_category_local_data_source.dart';
import 'package:myfood/app/data/providers/database/food/food_local_data_source.dart';
import 'package:myfood/app/data/providers/database/food/temp_food_local_data_source.dart';
import 'package:myfood/app/data/providers/database/user/user_local_data_source.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';
import 'package:myfood/app/data/providers/network/auth/auth_remote_data_source.dart';
import 'package:myfood/app/data/providers/network/category/category_remote_data_source.dart';
import 'package:myfood/app/data/providers/network/food/food_remote_data_source.dart';
import 'package:myfood/app/data/providers/network/profile/profile_remote_data_source.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/app/data/repositories/auth/auth_login_repository.dart';
import 'package:myfood/app/data/repositories/auth/auth_user_profile_repository.dart';
import 'package:myfood/app/data/repositories/category/category_repository.dart';
import 'package:myfood/app/data/repositories/food/food_repository.dart';
import 'package:myfood/app/data/repositories/food_detail/food_detail_repository.dart';
import 'package:myfood/app/data/repositories/home/home_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_login_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_user_profile_repository.dart';
import 'package:myfood/domain/repositories/category/category_repository.dart';
import 'package:myfood/domain/repositories/food/food_repository.dart';
import 'package:myfood/domain/repositories/food_detail/food_detail_repository.dart';
import 'package:myfood/domain/repositories/home/home_repository.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DataStore>(DataStoreImpl());
    DataStore dataStore = Get.find();

    MyFoodDio myFoodDio = MyFoodDio(dataStore: dataStore);

    UserLocalDataSource userLocalDataSource = UserLocalDataSourceImpl();
    CategoryLocalDataSource categoryLocalDataSource = CategoryLocalDataSourceImpl();
    FoodLocalDataSource foodLocalDataSource = FoodLocalDataSourceImpl();
    TempCategoryLocalDataSource tempCategoryLocalDataSource = TempCategoryLocalDataSourceImpl();
    TempFoodLocalDataSource tempFoodLocalDataSource = TempFoodLocalDataSourceImpl();

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
    FoodRemoteDataSource foodRemoteDataSource = FoodRemoteDatSourceImpl(
      myFoodDio: myFoodDio,
    );

    CategoryRepository categoryRepository = CategoryRepositoryImpl(
      categoryLocalDataSource: categoryLocalDataSource,
      categoryRemoteDataSource: categoryRemoteDataSource,
    );
    FoodRepository foodRepository = FoodRepositoryImpl(
      dataStore: dataStore,
      categoryLocalDataSource: categoryLocalDataSource,
      foodLocalDataSource: foodLocalDataSource,
      tempCategoryLocalDataSource: tempCategoryLocalDataSource,
      tempFoodLocalDataSource: tempFoodLocalDataSource,
      foodRemoteDataSource: foodRemoteDataSource,
    );

    Get.put<AuthLoginRepository>(
      AuthLoginRepositoryImpl(
        authRemoteDataSource: authRemoteDataSource,
        dataStore: dataStore,
      ),
    );

    Get.put<AuthUserProfileRepository>(
      AuthUserProfileRepositoryImpl(
        userLocalDataSource: userLocalDataSource,
        profileRemoteDataSource: profileRemoteDataSource,
      ),
    );

    Get.put<HomeRepository>(
      HomeRepositoryImpl(
        categoryRepository: categoryRepository,
        foodRepository: foodRepository,
      ),
    );

    Get.put<FoodDetailRepository>(
      FoodDetailRepositoryImpl(
        foodRemoteDataSource: foodRemoteDataSource,
      ),
    );
  }
}
