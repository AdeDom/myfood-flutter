import 'package:get/get.dart';
import 'package:myfood/app/config/auth_role.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/app/modules/home/state/home_state.dart';
import 'package:myfood/domain/usecases/home/home_page_use_case.dart';

class HomeController extends GetxController {
  final state = const HomeState.initial().obs;

  DataStore dataStore;
  final HomePageUseCase homePageUseCase;

  HomeController({
    required this.dataStore,
    required this.homePageUseCase,
  });

  @override
  void onInit() {
    super.onInit();

    final result = homePageUseCase();
    result.then((result) {
      result.when(
        success: (data) {
          state.value = HomeState.loaded(
            foodList: data?.categoryList,
          );
        },
        error: (error) {},
      );
    });
  }

  void setLogout() {
    int authRole = AuthRole.unAuth.name;
    dataStore.setAuthRole(authRole: authRole);
  }
}
