import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myfood/data/models/login/login_request.dart';
import 'package:myfood/data/repositories/resource.dart';
import 'package:myfood/domain/repositories/auth/auth_repository.dart';
import 'package:myfood/domain/usecases/login/login_use_case.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

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
    final resourceSuccess = Resource(
      isSuccess: true,
      data: true,
    );
    when(
      () => authRepository.callLogin(
        loginRequest: any(named: "loginRequest"),
      ),
    ).thenAnswer((_) => Future.value(resourceSuccess));

    final result = useCase(
      email: email,
      password: password,
    );

    expect(await result, resourceSuccess);
  });
}
