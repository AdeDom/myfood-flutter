part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const WELCOME = _Paths.WELCOME;
}

abstract class _Paths {
  _Paths._();

  static const HOME = '/home';
  static const SPLASH_SCREEN = '/splash-screen';
  static const WELCOME = '/welcome';
}
