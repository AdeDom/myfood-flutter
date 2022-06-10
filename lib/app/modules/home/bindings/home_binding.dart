import 'package:get/get.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    DataStore dataStore = Get.find();
    Get.lazyPut<HomeController>(
      () => HomeController(dataStore: dataStore),
    );
  }
}
