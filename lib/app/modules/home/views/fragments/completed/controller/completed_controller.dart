import 'package:task_management_app/imports.dart';

class CompletedController extends GetxController{

  String name = "Completed";

  void printLocalStorage(){
    print(Storage.getValue(Constants.TOKEN));
    // print(Storage.getValue(Constants.TOKEN)['role']);
    Get.showSnackbar(
      const GetSnackBar(
        title: "Registration Successful!",
        message: 'User Registered Successfully',
        icon: Icon(Icons.done_all,color: AppColors.white,),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
  }

  void onLogoutClick(){
    Storage.clearStorage();
    Get.offAllNamed(Routes.LOGIN);
  }

}