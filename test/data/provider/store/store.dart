import 'package:myfood/data/providers/store/store.dart';

class FakeStoreImpl implements Store {
  bool isLanguageEn = false;
  String accessToken = "";
  String refreshToken = "";

  @override
  void setIsLanguageEn({required bool isLanguageEn}) {
    this.isLanguageEn = isLanguageEn;
  }

  @override
  bool getIsLanguageEn() {
    return isLanguageEn;
  }

  @override
  void setAccessToken({required String accessToken}) {
    this.accessToken = accessToken;
  }

  @override
  String getAccessToken() {
    return accessToken;
  }

  @override
  void setRefreshToken({required String refreshToken}) {
    this.refreshToken = refreshToken;
  }

  @override
  String getRefreshToken() {
    return refreshToken;
  }
}
