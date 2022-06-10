import 'package:get/get.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    DataStore dataStore = Get.find();
    Get.put(SplashScreenController(dataStore: dataStore));
  }
}
