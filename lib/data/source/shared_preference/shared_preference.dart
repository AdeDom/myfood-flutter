import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreference {
  Future<void> setIsLanguageEn(bool isLanguageEn);

  Future<bool> getIsLanguageEn();
}

class SharedPreferenceImpl implements SharedPreference {
  static const String isLanguageEnConst = "is_language_en";

  @override
  Future<void> setIsLanguageEn(bool isLanguageEn) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool(isLanguageEnConst, isLanguageEn);
  }

  @override
  Future<bool> getIsLanguageEn() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool(isLanguageEnConst) ?? false;
  }
}
