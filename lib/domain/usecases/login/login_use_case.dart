import 'dart:async';

import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/repositories/resource.dart';
import 'package:myfood/domain/repositories/auth/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Resource<Object>> call({
    required String? email,
    required String? password,
  }) {
    String? validateEmailString = validateEmail(email);
    String? validatePasswordString = validatePassword(password);
    if (validateEmailString != null) {
      BaseError error = BaseError(message: validateEmailString);
      Resource<bool> resourceError = Resource(error: error);
      return Future.value(resourceError);
    } else if (validatePasswordString != null) {
      BaseError error = BaseError(message: validatePasswordString);
      Resource<bool> resourceError = Resource(error: error);
      return Future.value(resourceError);
    } else {
      LoginRequest loginRequest = LoginRequest(
        email: email,
        password: password,
      );
      return authRepository.callLogin(loginRequest: loginRequest);
    }
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "The email is empty";
    } else {
      return null;
    }
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "The password is empty";
    } else {
      return null;
    }
  }
}
