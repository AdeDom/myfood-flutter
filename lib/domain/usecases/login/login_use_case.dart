import 'package:myfood/app/data/models/login/login_request.dart';
import 'package:myfood/app/data/models/user/user_entity.dart';
import 'package:myfood/domain/repositories/auth/auth_login_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_user_profile_repository.dart';

class LoginUseCase {
  final AuthLoginRepository authLoginRepository;
  final AuthUserProfileRepository authUserProfileRepository;

  LoginUseCase({
    required this.authLoginRepository,
    required this.authUserProfileRepository,
  });

  Future<void> call({
    required String? email,
    required String? password,
  }) async {
    String? validateEmailString = validateEmail(email);
    String? validatePasswordString = validatePassword(password);
    if (validateEmailString != null) {
      throw Exception(validateEmailString);
    } else if (validatePasswordString != null) {
      throw Exception(validatePasswordString);
    } else {
      return await callLogin(email, password);
    }
  }

  Future<void> callLogin(String? email, String? password) async {
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    final token = await authLoginRepository.callLogin(
      loginRequest: loginRequest,
    );
    bool isAccessToken = token?.accessToken?.isNotEmpty ?? false;
    bool isRefreshToken = token?.refreshToken?.isNotEmpty ?? false;
    if (isAccessToken && isRefreshToken) {
      authLoginRepository.saveToken(
          accessToken: token?.accessToken ?? "",
          refreshToken: token?.refreshToken ?? "",
        );
        authLoginRepository.saveAuthRole();

        return await callUserProfile();
      } else {
        throw Exception("Token is null or empty.");
      }
  }

  Future<void> callUserProfile() async {
    final userProfile = await authUserProfileRepository.callUserProfile();
    UserEntity userEntity = UserEntity(
      userId: userProfile?.userId,
      email: userProfile?.email,
      name: userProfile?.name,
      mobileNo: userProfile?.mobileNo,
      address: userProfile?.address,
      image: userProfile?.image,
      status: userProfile?.status,
      created: userProfile?.created,
      updated: userProfile?.updated,
    );
    authUserProfileRepository.saveUser(userEntity);
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
