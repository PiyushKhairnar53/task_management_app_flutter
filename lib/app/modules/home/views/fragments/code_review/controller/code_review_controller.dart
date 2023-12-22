import 'package:task_management_app/imports.dart';

class CodeReviewController extends GetxController{

  String value = "Code Review";

  void onLogoutClick(){
    Storage.clearStorage();
    Get.offAllNamed(Routes.LOGIN);
  }

  void printLocalStorage(){
    print(Storage.getValue(Constants.TOKEN));
    // print(Storage.getValue(Constants.TOKEN)['role']);
  }
}