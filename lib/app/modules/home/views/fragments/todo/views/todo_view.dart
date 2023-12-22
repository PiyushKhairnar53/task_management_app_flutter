import '../../../../../../../imports.dart';

class TodoView extends StatelessWidget{
  TodoView({super.key});

  TodoController controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(controller.value),
            _logoutButtonWidget(controller),
            _localStorageButtonWidget(controller),
          ],
        ),
      )
    );
  }

  _logoutButtonWidget(TodoController controller) => FormButtonComponent(
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

  _localStorageButtonWidget(TodoController controller) => FormButtonComponent(
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