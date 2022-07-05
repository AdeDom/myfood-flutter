import 'dart:convert';

import 'package:get/get.dart';
import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';
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

  void callFoodDetail() async {
    try {
      int? foodId = Get.arguments;
      final foodModel = await getFoodDetailUseCase(foodId: foodId);
      state.value = FoodDetailState.loadSuccess(foodModel: foodModel);
    } on ApiServiceManagerException catch (error) {
      Map<String, dynamic> jsonError = json.decode(error.message);
      BaseError baseError = BaseError.fromJson(jsonError);
      state.value = FoodDetailState.loadError(error: baseError);
    } catch (error) {
      BaseError baseError = BaseError(
        message: error.toString(),
      );
      state.value = FoodDetailState.loadError(error: baseError);
    }
  }
}
