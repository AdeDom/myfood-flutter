import 'package:get/get.dart';
import 'package:myfood/domain/repositories/food_detail/food_detail_repository.dart';
import 'package:myfood/domain/usecases/food_detail/get_food_detail_use_case.dart';

import '../controllers/food_detail_controller.dart';

class FoodDetailBinding extends Bindings {
  @override
  void dependencies() {
    FoodDetailRepository foodDetailRepository = Get.find();
    GetFoodDetailUseCase getFoodDetailUseCase = GetFoodDetailUseCase(
      foodDetailRepository: foodDetailRepository,
    );
    Get.lazyPut<FoodDetailController>(
      () => FoodDetailController(
        getFoodDetailUseCase: getFoodDetailUseCase,
      ),
    );
  }
}
