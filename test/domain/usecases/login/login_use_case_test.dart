import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myfood/app/data/models/login/login_request.dart';
import 'package:myfood/domain/repositories/auth/auth_login_repository.dart';
import 'package:myfood/domain/repositories/auth/auth_user_profile_repository.dart';
import 'package:myfood/domain/usecases/login/login_use_case.dart';

import '../../../mock.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(LoginRequest());
  });

  late AuthLoginRepository authLoginRepository;
  late AuthUserProfileRepository authUserProfileRepository;
  late LoginUseCase useCase;

  setUp(() {
    authLoginRepository = MockAuthLoginRepository();
    authUserProfileRepository = MockAuthUserProfileRepository();
    useCase = LoginUseCase(
      authLoginRepository: authLoginRepository,
      authUserProfileRepository: authUserProfileRepository,
    );
  });

  // test("callLogin_returnSuccess", () async {
  //   String email = "dom6";
  //   String password = "dom6";
  //   Result resultSuccess = const Result.success();
  //   when(
  //     () => authRepository.callLoginAlreadyToUserProfile(
  //       loginRequest: any(
  //         named: "loginRequest",
  //       ),
  //     ),
  //   ).thenAnswer((_) async => resultSuccess);
  //
  //   final result = await useCase(
  //     email: email,
  //     password: password,
  //   );
  //
  //   expect(result, resultSuccess);
  //   verify(
  //     () => authRepository.callLoginAlreadyToUserProfile(
  //       loginRequest: any(
  //         named: "loginRequest",
  //       ),
  //     ),
  //   ).called(1);
  // });
  //
  // test("callLogin_returnError", () async {
  //   String email = "dom6";
  //   String password = "dom6";
  //   BaseError error = BaseError();
  //   Result resultError = Result.error(error);
  //   when(
  //     () => authRepository.callLoginAlreadyToUserProfile(
  //       loginRequest: any(
  //         named: "loginRequest",
  //       ),
  //     ),
  //   ).thenAnswer((_) async => resultError);
  //
  //   final result = await useCase(
  //     email: email,
  //     password: password,
  //   );
  //
  //   expect(result, resultError);
  //   verify(
  //     () => authRepository.callLoginAlreadyToUserProfile(
  //       loginRequest: any(
  //         named: "loginRequest",
  //       ),
  //     ),
  //   ).called(1);
  // });

  test("validateEmail_correct_returnNull", () {
    String email = "dom6";

    final result = useCase.validateEmail(email);

    expect(result, null);
  });

  test("validateEmail_incorrect_returnMessageEmailIsEmpty", () {
    String email = "";

    final result = useCase.validateEmail(email);

    expect(result, "The email is empty");
  });

  test("validatePassword_correct_returnNull", () {
    String password = "dom6";

    final result = useCase.validatePassword(password);

    expect(result, null);
  });

  test("validatePassword_incorrect_returnMessagePasswordIsEmpty", () {
    String password = "";

    final result = useCase.validatePassword(password);

    expect(result, "The password is empty");
  });
}
