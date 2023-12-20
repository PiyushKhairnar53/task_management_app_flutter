import 'package:task_management_app/imports.dart';

part 'app_routes.dart';

abstract class AppPages{
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: ()=> const LoginView(),
      binding: LoginBinding(),
    ),
  ];

}