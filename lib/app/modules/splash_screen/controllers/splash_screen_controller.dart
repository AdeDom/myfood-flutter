import 'package:get/get.dart';
import 'package:myfood/app/config/auth_role.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  DataStore dataStore;

  SplashScreenController({
    required this.dataStore,
  });

  @override
  void onReady() {
    super.onReady();

    openWelcomePage();
  }

  void openWelcomePage() async {
    await Future.delayed(const Duration(seconds: 2));

    int authRole = dataStore.getAuthRole();
    bool isAuthRole = authRole == AuthRole.auth.name;
    bool isGuestRole = authRole == AuthRole.guest.name;
    bool isNavHome = isAuthRole || isGuestRole;
    if (isNavHome) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.WELCOME);
    }
  }
}
