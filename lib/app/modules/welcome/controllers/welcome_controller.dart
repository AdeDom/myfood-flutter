import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myfood/app/data/providers/store/data_store.dart';
import 'package:myfood/app/modules/welcome/state/welcome_state.dart';

class WelcomeController extends GetxController {
  final state = const WelcomeState.initial().obs;

  DataStore dataStore;

  WelcomeController({
    required this.dataStore,
  });

  @override
  void onInit() {
    super.onInit();
    bool isLanguageEn = dataStore.getIsLanguageEn();
    if (isLanguageEn) {
      Get.updateLocale(const Locale("en", "US"));
    } else {
      Get.updateLocale(const Locale("th", "TH"));
    }
    state.value = WelcomeState.changeLanguage(isLanguageEn: isLanguageEn);
  }

  void setLanguage() {
    bool isLanguageEn = dataStore.getIsLanguageEn();
    dataStore.setIsLanguageEn(isLanguageEn: !isLanguageEn);
    if (!isLanguageEn) {
      Get.updateLocale(const Locale("en", "US"));
    } else {
      Get.updateLocale(const Locale("th", "TH"));
    }
    state.value = WelcomeState.changeLanguage(isLanguageEn: !isLanguageEn);
  }
}
