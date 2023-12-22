import 'package:task_management_app/imports.dart';

class HomeController extends GetxController{

  var tabIndex = 0.obs;

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
  const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  buildBottomNavigationMenu(context) {
    return Obx(() => SizedBox(
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        // showSelectedLabels: true,
        onTap: changeTabIndex,
        currentIndex: tabIndex.value,
        selectedItemColor : AppColors.kPrimaryColor,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey.withOpacity(0.8),
        // unselectedLabelStyle: unselectedLabelStyle,
        selectedLabelStyle: selectedLabelStyle,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: const FaIcon(FontAwesomeIcons.list,size: 16,)
            ),
            label: 'Todo',
            backgroundColor: AppColors.white,
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: const FaIcon(FontAwesomeIcons.rotate,size: 16,)
            ),
            label: 'In Progress',
            backgroundColor: AppColors.white,
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: const FaIcon(FontAwesomeIcons.code,size: 16,)
            ),
            label: 'Review',
            backgroundColor: AppColors.white,
          ),
          BottomNavigationBarItem(
            icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const FaIcon(FontAwesomeIcons.checkDouble,size: 17,)
            ),
            label: 'Done',
            backgroundColor: AppColors.white,
          ),
          // BottomNavigationBarItem(
          //   icon: Container(
          //     margin: const EdgeInsets.only(bottom: 7),
          //     child: const Icon(
          //       Icons.settings,
          //       size: 20.0,
          //     ),
          //   ),
          //   label: 'Settings',
          //   backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
          // ),
        ],
      ),
    ));
  }

  void onLogoutClick(){
    Storage.clearStorage();
    Get.offAllNamed(Routes.LOGIN);
  }

  void printLocalStorage(){
    print(Storage.getValue(Constants.TOKEN));
    // print(Storage.getValue(Constants.TOKEN)['role']);
  }
}