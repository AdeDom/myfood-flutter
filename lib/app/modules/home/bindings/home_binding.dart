import 'package:get/get.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/domain/repositories/home/home_category_repository.dart';
import 'package:myfood/domain/repositories/home/home_food_repository.dart';
import 'package:myfood/domain/usecases/home/Get_food_list_by_category_id_use_case.dart';
import 'package:myfood/domain/usecases/home/home_page_use_case.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    DataStore dataStore = Get.find();
    HomeCategoryRepository categoryRepository = Get.find();
    HomeFoodRepository foodRepository = Get.find();
    HomePageUseCase homePageUseCase = HomePageUseCase(
      categoryRepository: categoryRepository,
      foodRepository: foodRepository,
    );
    GetFoodListByCategoryIdUseCase getFoodListByCategoryIdUseCase = GetFoodListByCategoryIdUseCase(
      foodRepository: foodRepository,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(
        dataStore: dataStore,
        homePageUseCase: homePageUseCase,
        getFoodListByCategoryIdUseCase: getFoodListByCategoryIdUseCase,
      ),
    );
  }
}
