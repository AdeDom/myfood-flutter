import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/domain/repositories/auth/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  call({
    required String email,
    required String password,
  }) {
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    return authRepository.callLogin(loginRequest: loginRequest);
  }

  String? validateEmail(String? email) {
    if (email == null) {
      return "The email is null";
    } else if (email.isEmpty) {
      return "The email is empty";
    } else {
      return null;
    }
  }

  String? validatePassword(String? password) {
    if (password == null) {
      return "The password is null";
    } else if (password.isEmpty) {
      return "The password is empty";
    } else {
      return null;
    }
  }
}
