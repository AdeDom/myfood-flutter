import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myfood/app/data/models/base/base_error.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({
    required bool isLoginButtonStatus,
  }) = Initial;

  const factory LoginState.loading({
    required bool isLoginButtonStatus,
    required String? email,
    required String? password,
  }) = Loading;

  const factory LoginState.loginError({
    required BaseError error,
    required bool isLoginButtonStatus,
    required String? email,
    required String? password,
  }) = LoginError;

  const factory LoginState.currentPage({
    required bool isLoginButtonStatus,
    required String? email,
    required String? password,
  }) = CurrentPage;
}
