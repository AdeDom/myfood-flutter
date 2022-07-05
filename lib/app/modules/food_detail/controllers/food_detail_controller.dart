import 'package:get/get.dart';
import 'package:myfood/app/modules/food_detail/state/food_detail_state.dart';
import 'package:myfood/domain/usecases/food_detail/get_food_detail_use_case.dart';

class FoodDetailController extends GetxController {
  final state = const FoodDetailState.initial().obs;

  final GetFoodDetailUseCase getFoodDetailUseCase;

  FoodDetailController({
    required this.getFoodDetailUseCase,
  });

  @override
  void onInit() {
    super.onInit();

    callFoodDetail();
  }

  Future<void> callFoodDetail() async {
    int? foodId = Get.arguments;
    final result = getFoodDetailUseCase(foodId: foodId);
    result.then((result) {
      result.when(
        success: (data) {
          state.value = FoodDetailState.loadSuccess(foodModel: data);
        },
        error: (error) {
          state.value = FoodDetailState.loadError(error: error);
        },
      );
    });
  }
}
