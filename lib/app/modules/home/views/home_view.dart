import 'package:task_management_app/app/modules/home/views/fragments/completed/views/completed_view.dart';

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
            children: [
              TodoView(),
              InProgressView(),
              CodeReviewView(),
              CompletedView(),
            ],
          )
      )
    );
  }

}