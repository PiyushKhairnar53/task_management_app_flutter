import 'package:task_management_app/imports.dart';

class TodoController extends GetxController{

  String value = "Todo";

  void onLogoutClick(){
    Storage.clearStorage();
    Get.offAllNamed(Routes.LOGIN);
  }

  void printLocalStorage(){
    print(Storage.getValue(Constants.TOKEN));
    // print(Storage.getValue(Constants.TOKEN)['role']);
  }
}