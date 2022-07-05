import 'dart:convert';

import 'package:get/get.dart';
import 'package:myfood/app/config/auth_role.dart';
import 'package:myfood/app/data/models/base/base_error.dart';
import 'package:myfood/app/data/providers/network/api_service_manager.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/app/modules/home/state/home_state.dart';
import 'package:myfood/domain/usecases/home/Get_food_list_by_category_id_use_case.dart';
import 'package:myfood/domain/usecases/home/home_page_use_case.dart';

class HomeController extends GetxController {
  final state = const HomeState.initial().obs;

  DataStore dataStore;
  final HomePageUseCase homePageUseCase;
  final GetFoodListByCategoryIdUseCase getFoodListByCategoryIdUseCase;

  HomeController({
    required this.dataStore,
    required this.homePageUseCase,
    required this.getFoodListByCategoryIdUseCase,
  });

  @override
  void onInit() async {
    super.onInit();

    try {
      await homePageUseCase();
    } on ApiServiceManagerException catch (error) {
      Map<String, dynamic> jsonError = json.decode(error.message);
      BaseError baseError = BaseError.fromJson(jsonError);
      state.value = HomeState.homePageError(error: baseError);
    } catch (error) {
      BaseError baseError = BaseError(
        message: error.toString(),
      );
      state.value = HomeState.homePageError(error: baseError);
    }
  }

  void getFoodListByCategoryId(int? categoryId) async {
    final result = await getFoodListByCategoryIdUseCase(categoryId);
    result.when(
      success: (_) {},
      error: (error) {
        state.value = HomeState.homePageError(error: error);
      },
    );
  }

  void setLogout() {
    int authRole = AuthRole.unAuth.name;
    dataStore.setAuthRole(authRole: authRole);
  }
}
