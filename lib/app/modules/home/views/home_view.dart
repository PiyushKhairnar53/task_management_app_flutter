import '../../../../imports.dart';

class HomeView extends GetView<HomeController>{
  const HomeView({super.key});

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
      bottomNavigationBar: controller.buildBottomNavigationMenu(context),
      body: Obx( ()=>
          IndexedStack(
            index: controller.tabIndex.value,

          )
      )
    );
  }

  _logoutButtonWidget(HomeController controller) => FormButtonComponent(
    onPressed: () {
      controller.onLogoutClick();
    },
    color: Get.theme.primaryColor,
    text: Text(
      'Logout',
      style: Get.textTheme.headline2!.copyWith(
        color: AppColors.white,
        fontSize: 14,
      ),
    ),
  ).paddingSymmetric(vertical: 10.0);

  _localStorageButtonWidget(HomeController controller) => FormButtonComponent(
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