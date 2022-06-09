import 'package:get/get.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/app/modules/welcome/state/welcome_state.dart';

class WelcomeController extends GetxController {
  final state = const WelcomeState.initial().obs;
  final DataStore dataStore = DataStoreImpl();

  @override
  void onInit() {
    super.onInit();
    bool isLanguageEn = dataStore.getIsLanguageEn();
    state.value = WelcomeState.changeLanguage(isLanguageEn: isLanguageEn);
  }

  void setLanguage() {
    bool isLanguageEn = dataStore.getIsLanguageEn();
    dataStore.setIsLanguageEn(isLanguageEn: !isLanguageEn);
    state.value = WelcomeState.changeLanguage(isLanguageEn: !isLanguageEn);
  }
}
