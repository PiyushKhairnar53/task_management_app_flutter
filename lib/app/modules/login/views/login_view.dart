import 'package:task_management_app/imports.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // addBackButton: false,
        title: const Text("Task Manager"),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
            child: Center(
              child: Text("Login Screen"),
            )
          )
      ),
    );
  }

  // _loginButtonWidget(LoginController controller) => FormButtonComponent(
  //   onPressed: () {
  //     controller.loginUser();
  //   },
  //   color: Get.theme.primaryColor,
  //   text: Text(
  //     'LOGIN',
  //     style: Get.textTheme.headline2!.copyWith(
  //       color: AppColors.white,
  //       fontSize: 14,
  //     ),
  //   ),
  // ).paddingSymmetric(vertical: 10.0);
}
