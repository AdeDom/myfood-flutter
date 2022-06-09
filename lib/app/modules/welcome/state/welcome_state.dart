import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_state.freezed.dart';

@freezed
class WelcomeState with _$WelcomeState {
  const factory WelcomeState.initial() = Initial;

  const factory WelcomeState.changeLanguage({
    required bool isLanguageEn,
  }) = ChangeLanguage;
}
