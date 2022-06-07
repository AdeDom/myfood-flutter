import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myfood/data/models/base/base_error.dart';
import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/repositories/resource.dart';
import 'package:myfood/domain/repositories/auth/auth_repository.dart';
import 'package:myfood/domain/usecases/login/login_use_case.dart';

import '../../../mock.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(LoginRequest());
  });

  late AuthRepository authRepository;
  late LoginUseCase useCase;

  setUp(() {
    authRepository = MockAuthRepository();
    useCase = LoginUseCase(authRepository: authRepository);
  });

  test("callLogin_returnSuccess", () async {
    String email = "dom6";
    String password = "dom6";
    Resource<Object> resourceSuccess = Resource.success();
    when(
      () => authRepository.callLoginAlreadyToUserProfile(
        loginRequest: any(
          named: "loginRequest",
        ),
      ),
    ).thenAnswer((_) async => resourceSuccess);

    final result = await useCase(
      email: email,
      password: password,
    );

    expect(result, resourceSuccess);
    verify(
      () => authRepository.callLoginAlreadyToUserProfile(
        loginRequest: any(
          named: "loginRequest",
        ),
      ),
    ).called(1);
  });

  test("callLogin_returnError", () async {
    String email = "dom6";
    String password = "dom6";
    BaseError error = BaseError();
    Resource<Object> resourceError = Resource.error(error: error);
    when(
      () => authRepository.callLoginAlreadyToUserProfile(
        loginRequest: any(
          named: "loginRequest",
        ),
      ),
    ).thenAnswer((_) async => resourceError);

    final result = await useCase(
      email: email,
      password: password,
    );

    expect(result, resourceError);
    verify(
      () => authRepository.callLoginAlreadyToUserProfile(
        loginRequest: any(
          named: "loginRequest",
        ),
      ),
    ).called(1);
  });

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
