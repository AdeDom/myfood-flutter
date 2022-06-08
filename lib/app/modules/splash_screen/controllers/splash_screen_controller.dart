import 'package:get/get.dart';
import 'package:myfood/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {

  @override
  void onReady() {
    super.onReady();

    openWelcomePage();
  }

  void openWelcomePage() async {
    await Future.delayed(const Duration(seconds: 2));

    Get.offAllNamed(Routes.WELCOME);
  }
}
