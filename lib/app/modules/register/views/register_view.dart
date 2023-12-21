import '../../../../imports.dart';

class RegisterView extends GetView<RegisterController>{
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: Theme(
        data: ThemeData(
          canvasColor: Colors.white,
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: AppColors.kPrimaryColor,
            secondary: AppColors.doveGray,
          ),
        ),
        child: Obx( () {
          return Stepper(
            currentStep: controller.activeCurrentStep.value,
            type: StepperType.horizontal,
            steps: controller.stepList(),
            controlsBuilder: (context, _) {
              return Column(
                children: [
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Obx( ()=> controller.activeCurrentStep>0 ?
                        TextButton(
                          style: TextButton.styleFrom(backgroundColor: AppColors.kPrimaryColor),
                          onPressed: () {
                            controller.onStepPrevious();
                          },
                          child: const Text(
                            'Previous',
                            style:
                            TextStyle(color: AppColors.white),
                          ),
                        ) : const SizedBox(width: 10,)
                      ),
                      TextButton(
                        style: TextButton.styleFrom(backgroundColor: AppColors.kPrimaryColor),
                        onPressed: () {
                          controller.onStepContinue();
                        },
                        child: const Text(
                          'Continue',
                          style:
                          TextStyle(color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Column(
                    children: [
                      const Text(
                        "Already have an account ?",
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                      InkWell(
                          onTap: () {
                            controller.moveToLogin();
                          },
                          child: const Text("Login",style: TextStyle(color: AppColors.kPrimaryColor,fontSize: 18.0),)
                      ),
                    ],
                  )
                ],
              );
            },
            // onStepContinue: () {
            //   if (controller.activeCurrentStep.value < (controller
            //       .stepList()
            //       .length - 1)) {
            //     controller.activeCurrentStep.value += 1;
            //   }
            // },
            // onStepCancel: () {
            //   if (controller.activeCurrentStep.value == 0) {
            //     return;
            //   }
            //   controller.activeCurrentStep.value -= 1;
            // },

            onStepTapped: (int index) {
              controller.activeCurrentStep.value = index;
            },
          );
        }
        ),
      )
    );
  }
}