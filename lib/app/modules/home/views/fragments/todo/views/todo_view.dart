import 'package:intl/intl.dart';
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
        child: Obx(()=>
          controller.todoTaskList.isEmpty ?
              const Center(child: CircularProgressIndicator(),):
              RefreshIndicator(
                color: AppColors.kPrimaryColor,
                onRefresh: () {
                  return controller.getTasksData();
                },
                child: controller.todoTaskList.isNotEmpty ?
                  ListView.separated(
                    itemCount: controller.todoTaskList.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      var task = controller.todoTaskList[index];
                      DateTime dateTime = DateTime.parse(task.createdAt);
                      String formattedDate = DateFormat('EEEE MMMM dd yyyy').format(dateTime);
                
                    return CustomTaskCard(
                      taskId:task.id,
                      currentTaskType: 1,
                      title: task.title,
                      priority: task.priority,
                      estimatedTime: task.estimatedTime,
                      todoUserRole: controller.todoUserRole,
                      firstName: task.developerFirstName,
                      lastName: task.developerLastName,
                      createdAt: formattedDate,
                    );
                
                    // return Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(
                    //         vertical: 8.0, horizontal: 16.0),
                    //     child: Column(
                    //       mainAxisSize: MainAxisSize.min,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         const SizedBox(height: 7,),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Text(
                    //               "${task.title}",
                    //               maxLines: 2,
                    //               style: const TextStyle(
                    //                 fontSize: 19,
                    //                 fontWeight: FontWeight.bold,
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //         const SizedBox(height: 10,),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //           children: [
                    //             Column(
                    //               children: [
                    //                 const Text("Priority",style: TextStyle(color: Colors.grey),),
                    //                 Text('${task.priority}',style: const TextStyle(fontSize: 16),),
                    //               ],
                    //             ),
                    //             Column(
                    //               children: [
                    //                 const Text("Estimate",style: TextStyle(color: Colors.grey),),
                    //                 Text('${task.estimatedTime} hrs',style: const TextStyle(fontSize: 16),),
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //         const SizedBox(height: 12,),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Column(
                    //               children: [
                    //                 Text("${controller.todoUserRole}",style: const TextStyle(color: Colors.grey),),
                    //                 Text('${task.developerFirstName} ${task.developerLastName}',style: const TextStyle(fontSize: 16),),
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //         const SizedBox(height: 7,),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Column(
                    //               children: [
                    //                 SizedBox(
                    //                   width: MediaQuery.of(Get.context as BuildContext).size.width/1.5,
                    //                   child: ElevatedButton.icon(
                    //                     onPressed: () {},
                    //                     icon: const Icon( // <-- Icon
                    //                       Icons.edit,
                    //                       size: 24.0,
                    //                       color: Colors.white,
                    //                     ),
                    //                     style: ElevatedButton.styleFrom(
                    //                       backgroundColor: AppColors.kPrimaryColor,
                    //                     ),
                    //                     label: const Text('Change Status',style: TextStyle(color: Colors.white,fontSize: 16),), // <-- Text
                    //                   ),
                    //                 ),
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //         const SizedBox(height: 10,),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Text("Updated At ${task.createdAt}",style: const TextStyle(color: Colors.grey),)
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // );
                  },
                ):const Center(child: Text("No Todo Tasks"),),
              )
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
      controller.getTasksData();
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