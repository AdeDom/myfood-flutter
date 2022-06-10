import 'package:get/get.dart';
import 'package:myfood/app/config/auth_role.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';

class HomeController extends GetxController {
  DataStore dataStore;

  HomeController({
    required this.dataStore,
  });

  void setLogout() {
    int authRole = AuthRole.unAuth.name;
    dataStore.setAuthRole(authRole: authRole);
  }
}
