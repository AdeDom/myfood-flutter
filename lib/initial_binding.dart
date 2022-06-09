import 'package:get/get.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DataStore>(DataStoreImpl());
  }
}
