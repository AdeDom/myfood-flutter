import 'package:get/get.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/domain/repositories/category/category_repository.dart';
import 'package:myfood/domain/repositories/food/food_repository.dart';
import 'package:myfood/domain/usecases/home/Get_food_list_by_category_id_use_case.dart';
import 'package:myfood/domain/usecases/home/home_page_use_case.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    DataStore dataStore = Get.find();
    CategoryRepository categoryRepository = Get.find();
    FoodRepository foodRepository = Get.find();
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
