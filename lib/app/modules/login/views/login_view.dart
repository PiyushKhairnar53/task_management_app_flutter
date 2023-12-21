import 'package:task_management_app/imports.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        // addBackButton: false,
        titleSpacing: 0,
        title: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.solidCircleCheck,color: AppColors.white,),
                SizedBox(width: 10,),
                Text("Task Manager",style: TextStyle(color: AppColors.white),),
              ],
            )
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if(controller.loginLoading.value){
            return const Center(child: CircularProgressIndicator(),);
          }
          return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: SizeConstants.horizontalPadding20,
                    vertical: SizeConstants.verticalPadding10),
                child: Form(
                  key: controller.loginFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "Sign in to Continue!",
                        style: TextStyle(fontSize: 22.0, color: AppColors
                            .black),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextFieldWidget(
                        addHint: true,
                        hintText: Strings.username,
                        keyboardType: TextInputType.text,
                        validator: Validators.validateEmpty,
                        border: const OutlineInputBorder(),
                        onSaved: (value) {
                          controller.username = value!;
                        },
                      ),
                      const SizedBox(height: 15.0),
                      CustomTextFieldWidget(
                        addHint: true,
                        hintText: Strings.password,
                        border: const OutlineInputBorder(),
                        isPassword: true,
                        maxLines: 1,
                        onSaved: (value) {
                          controller.password = value!;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      _loginButtonWidget(controller),
                      _localStorageButtonWidget(controller),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Text(
                        "Dont have an account ?",
                        style: TextStyle(fontSize: 18.0, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      InkWell(
                          onTap: () {
                            // controller.moveToRegister();
                          },
                          child: const CustomText('Register')),
                      Container(
                        color: Get.theme.primaryColor,
                        width: 60,
                        height: 2,
                      ),
                    ],
                  ),
                ),
              )
          );
        }
        )
      ),
    );
  }

  _loginButtonWidget(LoginController controller) => FormButtonComponent(
    onPressed: () {
      controller.loginUser();
    },
    color: Get.theme.primaryColor,
    text: Text(
      'LOGIN',
      style: Get.textTheme.headline2!.copyWith(
        color: AppColors.white,
        fontSize: 14,
      ),
    ),
  ).paddingSymmetric(vertical: 10.0);

  _localStorageButtonWidget(LoginController controller) => FormButtonComponent(
    onPressed: () {
      controller.printLocalStorage();
    },
    color: Get.theme.primaryColor,
    text: Text(
      'Print',
      style: Get.textTheme.headline2!.copyWith(
        color: AppColors.white,
        fontSize: 14,
      ),
    ),
  ).paddingSymmetric(vertical: 10.0);

}
