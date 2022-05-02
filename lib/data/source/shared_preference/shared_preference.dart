import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreference {
  Future<void> setIsLanguageEn({required bool isLanguageEn});

  Future<bool> getIsLanguageEn();

  Future<void> setAccessToken({required String accessToken});

  Future<String?> getAccessToken();

  Future<void> setRefreshToken({required String refreshToken});

  Future<String?> getRefreshToken();
}

class SharedPreferenceImpl implements SharedPreference {
  static const String isLanguageEnKey = "is_language_en";
  static const String accessTokenKey = "access_token";
  static const String refreshTokenKey = "refresh_token";

  @override
  Future<void> setIsLanguageEn({required bool isLanguageEn}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool(isLanguageEnKey, isLanguageEn);
  }

  @override
  Future<bool> getIsLanguageEn() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool(isLanguageEnKey) ?? false;
  }

  @override
  Future<void> setAccessToken({required String accessToken}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(accessTokenKey, accessToken);
  }

  @override
  Future<String?> getAccessToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(accessTokenKey);
  }

  @override
  Future<void> setRefreshToken({required String refreshToken}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(refreshTokenKey, refreshToken);
  }

  @override
  Future<String?> getRefreshToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(refreshTokenKey);
  }
}
