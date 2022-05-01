class LoginUseCase {
  call({required String email, required String password}) {
    print("loginUseCase => email : $email, password : $password");
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
