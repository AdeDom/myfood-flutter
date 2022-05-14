import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/domain/repositories/auth/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  call({required String email, required String password}) {
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    return authRepository.callLogin(loginRequest: loginRequest);
  }

  String? validateEmail(String? email) {
    if (email?.isEmpty == true) {
      return "The email is empty";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password?.isEmpty == true) {
      return "The password is empty";
    }
    return null;
  }
}
