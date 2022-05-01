import 'package:myfood/data/source/shared_preference/shared_preference.dart';

abstract class SharedPreferenceRepository {
  Future<void> setIsLanguageEn({required bool isLanguageEn});

  Future<bool> getIsLanguageEn();
}

class SharedPreferenceRepositoryImpl implements SharedPreferenceRepository {
  final SharedPreference sharedPreference;

  SharedPreferenceRepositoryImpl({required this.sharedPreference});

  @override
  Future<void> setIsLanguageEn({required bool isLanguageEn}) async {
    await sharedPreference.setIsLanguageEn(isLanguageEn: isLanguageEn);
  }

  @override
  Future<bool> getIsLanguageEn() async {
    return await sharedPreference.getIsLanguageEn();
  }
}
