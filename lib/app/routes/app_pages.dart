import 'package:task_management_app/app/modules/home/bindings/home_binding.dart';
import 'package:task_management_app/app/modules/home/views/home_view.dart';
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
    GetPage(
      name: _Paths.HOME,
      page: ()=> const HomeView(),
      binding: HomeBinding(),
    ),
  ];

}