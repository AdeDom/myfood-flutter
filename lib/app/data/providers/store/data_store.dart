import 'package:get_storage/get_storage.dart';

mixin DataStore {
  void setIsLanguageEn({required bool isLanguageEn});

  bool getIsLanguageEn();

  void setAccessToken({required String accessToken});

  String getAccessToken();

  void setRefreshToken({required String refreshToken});

  String getRefreshToken();
}

class DataStoreImpl with DataStore {
  static const String storeFile = "myfood";
  static const String _isLanguageEnKey = "is_language_en";
  static const String _accessTokenKey = "access_token";
  static const String _refreshTokenKey = "refresh_token";

  static final _storeBox = () => GetStorage(storeFile);

  final isLanguageEn = ReadWriteValue(_isLanguageEnKey, false, _storeBox);
  final accessToken = ReadWriteValue(_accessTokenKey, "", _storeBox);
  final refreshToken = ReadWriteValue(_refreshTokenKey, "", _storeBox);

  @override
  void setIsLanguageEn({required bool isLanguageEn}) {
    this.isLanguageEn.val = isLanguageEn;
  }

  @override
  bool getIsLanguageEn() {
    return isLanguageEn.val;
  }

  @override
  void setAccessToken({required String accessToken}) {
    this.accessToken.val = accessToken;
  }

  @override
  String getAccessToken() {
    return accessToken.val;
  }

  @override
  void setRefreshToken({required String refreshToken}) {
    this.refreshToken.val = refreshToken;
  }

  @override
  String getRefreshToken() {
    return refreshToken.val;
  }
}