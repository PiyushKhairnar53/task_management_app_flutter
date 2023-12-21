import 'package:task_management_app/imports.dart';

class LoginController extends GetxController{

  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());

  late TextEditingController passwordController = TextEditingController();
  late TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  var username = "";
  var password = "";

  //PASSWORD VISIBLE OR NOT
  final RxBool _isPasswordVisibleRx = RxBool(false);

  bool get isPasswordVisible => _isPasswordVisibleRx.value;

  var loginLoading = true.obs;

  passwordVisibleChange(bool value) {
    _isPasswordVisibleRx.value = !value;
  }

  void printLocalStorage(){
    print(Storage.getValue(Constants.TOKEN));
    // print(Storage.getValue(Constants.TOKEN)['role']);
  }

  void loginUser(){
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) return;

    loginFormKey.currentState!.save();
    print("Username $username Password $password");

    _apiHelper
        .login(LoginRequest(username: username, password: password.trim()))
        .futureValue((value){
          print("Login Response $value");
          Storage.saveValue(Constants.TOKEN, value);
          moveToHome();
        });
  }

  void moveToHome(){
    Get.offAllNamed(Routes.HOME);
  }

  void moveToRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  @override
  void onReady() async {
    super.onReady();
    loginLoading.value = true;
    await Storage.storage.initStorage;
    if(Storage.hasData(Constants.TOKEN)){
      moveToHome();
    }else{
      loginLoading.value = false;
    }
  }

}