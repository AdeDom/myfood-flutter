import 'package:get/get.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/domain/repositories/category/category_repository.dart';
import 'package:myfood/domain/repositories/home/home_repository.dart';
import 'package:myfood/domain/usecases/home/Get_food_list_by_category_id_use_case.dart';
import 'package:myfood/domain/usecases/home/home_page_use_case.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    DataStore dataStore = Get.find();
    CategoryRepository categoryRepository = Get.find();
    HomeRepository homeRepository = Get.find();
    HomePageUseCase homePageUseCase = HomePageUseCase(
      categoryRepository: categoryRepository,
    );
    GetFoodListByCategoryIdUseCase getFoodListByCategoryIdUseCase = GetFoodListByCategoryIdUseCase(
      homeRepository: homeRepository,
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
