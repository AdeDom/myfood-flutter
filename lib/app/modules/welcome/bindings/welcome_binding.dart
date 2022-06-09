import 'package:get/get.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';

import '../controllers/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    DataStore dataStore = Get.find();
    Get.put(WelcomeController(dataStore: dataStore));
  }
}
