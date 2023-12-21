part of 'app_pages.dart';

abstract class Routes{
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const REGISTER = _Paths.REGISTER;
}

abstract class _Paths{
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const REGISTER = '/register';
}