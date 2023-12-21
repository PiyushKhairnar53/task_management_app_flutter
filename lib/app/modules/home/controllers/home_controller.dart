import 'package:task_management_app/imports.dart';

class HomeController extends GetxController{

  void onLogoutClick(){
    Storage.clearStorage();
    Get.back();
    Get.offAllNamed(Routes.LOGIN);
  }
}