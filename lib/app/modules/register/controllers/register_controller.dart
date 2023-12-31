import '../../../../imports.dart';

class RegisterController extends GetxController{

  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());

  final GlobalKey<FormState> registerFormKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey2 = GlobalKey<FormState>();

  var firstName = "";
  var lastName = "";
  var userRole = "";
  var phoneNumber = "";
  var username = "";
  var email = "";
  var password = "";
  var confirmPassword = "";
  var hidePassword = true.obs;
  var hideCPassword = true.obs;


  RxInt activeCurrentStep = 0.obs;

  RxString dropdownValue = 'Select Role'.obs;
  var userRoles = [
    'Select Role',
    'Manager',
    'Developer',
  ];
  
  List<Step> stepList() => [
    Step(
        state: activeCurrentStep.value <= 0 ? StepState.indexed : StepState.complete,
        isActive: activeCurrentStep.value >= 0,
        title: const Text('Account'),
        content: SingleChildScrollView(
          child: Form(
            key: registerFormKey1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Register",
                  style: TextStyle(fontSize: 22.0, color: AppColors
                      .black),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                CustomTextFieldWidget(
                  addHint: true,
                  hintText: Strings.firstName,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  validator: Validators.validateEmpty,
                  border: const OutlineInputBorder(),
                  onSaved: (value){
                    firstName = value!;
                  },
                  onChanged: (value) {
                    firstName = value!;
                  },
                ),
                const SizedBox(height: 15.0),
                CustomTextFieldWidget(
                  addHint: true,
                  keyboardType: TextInputType.text,
                  hintText: Strings.lastName,
                  border: const OutlineInputBorder(),
                  validator: Validators.validateEmpty,
                  maxLines: 1,
                  onSaved: (value) {
                    lastName = value!;
                  },
                  onChanged: (value) {
                    lastName = value!;
                  },
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx( ()=> Container(
                      width: MediaQuery.of(Get.context as BuildContext).size.width*0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                            color: Colors.black, style: BorderStyle.solid, width: 0.85),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            hint: const Text("Select Role"),
                            // Initial Value
                            value: dropdownValue.value,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),
                            // Array list of items
                            items: userRoles.map<DropdownMenuItem<String>>((String items) {
                              return DropdownMenuItem<String>(
                                value: items,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(items,style: TextStyle(color: items == "Select Role"? AppColors.doveGray : AppColors.black),),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                                dropdownValue.value = newValue!;
                                update();
                            },
                          ),
                      ),
                    ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                      child: dropdownValue == "Select Role" ?
                        Text("Select role to continue",style: TextStyle(color: Colors.red[700],fontSize: 12.5),)
                        :const SizedBox(),
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                CustomTextFieldWidget(
                  addHint: true,
                  keyboardType: TextInputType.text,
                  hintText: Strings.phoneNumber,
                  border: const OutlineInputBorder(),
                  maxLines: 1,
                  onSaved: (value) {
                    phoneNumber = value!;
                  },
                  onChanged: (value) {
                    phoneNumber = value!;
                  },
                ),
              ],
            ),
          ),
        )
    ),
    Step(
        state:
        activeCurrentStep.value <= 1 ? StepState.indexed : StepState.complete,
        isActive: activeCurrentStep.value >= 1,
        title: const Text('Confirm'),
        content: SingleChildScrollView(
          child: Form(
            key: registerFormKey2,
            child: Column(
              children: [
                CustomTextFieldWidget(
                  addHint: true,
                  hintText: Strings.username,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  validator: Validators.validateEmpty,
                  border: const OutlineInputBorder(),
                  onSaved: (value) {
                    username = value!;
                  },
                  onChanged: (value) {
                    username = value!;
                  },
                ),
                SizedBox(height: 15),
                CustomTextFieldWidget(
                  addHint: true,
                  hintText: Strings.emailAddress,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                  border: const OutlineInputBorder(),
                  onSaved: (value) {
                    email = value!;
                  },
                  onChanged: (value) {
                    email = value!;
                  },
                ),
                SizedBox(height: 15),
                Obx(
                    () => CustomTextFieldWidget(
                      addHint: true,
                      hintText: Strings.password,
                      border: OutlineInputBorder(),
                      isPassword: hidePassword.value,
                      maxLines: 1,
                      validator: Validators.validateRegisterPassword,
                      onSaved: (value) {
                        password = value!;
                      },
                      onChanged: (value) {
                        password = value!;
                      },
                      suffixIcon: InkWell(
                        onTap: () {
                          hidePassword.value =
                          !hidePassword.value;
                        },
                        child: Icon(
                          hidePassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Obx(
                  () => CustomTextFieldWidget(
                    addHint: true,
                    hintText: Strings.confirmPassword,
                    border: const OutlineInputBorder(),
                    isPassword: hideCPassword.value,
                    maxLines: 1,
                    validator: (confirmPassword) {
                      return Validators.validateRegisterConfirmPassword(
                          password, confirmPassword);
                    },
                    onSaved: (value) {
                      confirmPassword = value!;
                    },
                    suffixIcon: InkWell(
                      onTap: () {
                        hideCPassword.value =
                        !hideCPassword.value;
                      },
                      child: Icon(
                        hideCPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                // const Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Password must be",
                //       style: TextStyle(
                //           fontStyle: FontStyle.italic,
                //           fontWeight: FontWeight.w600),
                //     ),
                //     Text("* At least 6 characters."),
                //     Text("* At least one non alphanumeric character."),
                //     Text("* At least one lowercase ('a'-'z')."),
                //     Text("* At least one uppercase ('A'-'Z')."),
                //     Text("* At least one digit ('0'-'9').")
                //   ],
                // ),
              ],
            ),
          ),
        )
    ),
  ];

  void onStepContinue(){
    final isValid = registerFormKey1.currentState!.validate();
    if(isValid && dropdownValue.value != "Select Role"){
      userRole = dropdownValue.value;
      if (activeCurrentStep.value < (stepList().length - 1)) {
        activeCurrentStep.value += 1;
      }
    }
  }

  void onStepPrevious() {
    if (activeCurrentStep.value == 0) {
      return;
    }
    activeCurrentStep.value -= 1;
  }

  void moveToLogin(){
    Get.offAllNamed(Routes.LOGIN);
  }

  void registerUser(){
    final isForm1Valid = registerFormKey1.currentState!.validate();
    final isForm2Valid = registerFormKey2.currentState!.validate();

    if(isForm1Valid && isForm2Valid) {
      print("FirstName - $firstName, LastName - $lastName, Role - $userRole, Phone - $phoneNumber, Username - $username, Email - $email, Password - $password");

      if (userRole == "Manager") {
        _apiHelper
            .registerManager(RegisterRequest(firstName: firstName,
            lastName: lastName,
            email: email,
            username: username,
            phoneNumber: phoneNumber,
            password: password.trim()))
            .futureValue((value) {
              print("Register Response $value");
              Get.showSnackbar(
                const GetSnackBar(
                  title: "Registration Successful!",
                  message: 'User Registered Successfully',
                  icon: Icon(Icons.done,color: AppColors.white,),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 3),
                ),
              );
              moveToLogin();
        });
      }
    }
  }

}