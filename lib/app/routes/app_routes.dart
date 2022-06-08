part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const WELCOME = _Paths.WELCOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const FOOD_DETAIL = _Paths.FOOD_DETAIL;
}

abstract class _Paths {
  _Paths._();

  static const HOME = '/home';
  static const SPLASH_SCREEN = '/splash-screen';
  static const WELCOME = '/welcome';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const FOOD_DETAIL = '/food-detail';
}
