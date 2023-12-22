part of 'app_pages.dart';

abstract class Routes{
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const REGISTER = _Paths.REGISTER;
  static const TODO = _Paths.TODO;
  static const INPROGRESS = _Paths.INPROGRESS;
}

abstract class _Paths{
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const REGISTER = '/register';
  static const TODO = '/todo';
  static const INPROGRESS = '/inprogress';
}