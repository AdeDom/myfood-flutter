class LoginUseCase {
  call({required String email, required String password}) {
    print("loginUseCase => email : $email, password : $password");
  }
}
