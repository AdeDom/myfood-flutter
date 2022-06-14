import 'package:myfood/app/data/providers/store/data_store.dart';

class FakeDataStoreImpl with DataStore {
  bool isLanguageEn = false;
  String accessToken = "";
  String refreshToken = "";
  int authRole = 0;
  int currentCategoryId = 1;

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

  @override
  void setAuthRole({required int authRole}) {
    this.authRole = authRole;
  }

  @override
  int getAuthRole() {
    return authRole;
  }

  @override
  void setCurrentCategoryId({required int categoryId}) {
    currentCategoryId = categoryId;
  }

  @override
  int getCurrentCategoryId() {
    return currentCategoryId;
  }
}
