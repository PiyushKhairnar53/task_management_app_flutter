import 'package:intl/intl.dart';
import 'package:task_management_app/imports.dart';

class InProgressView extends StatelessWidget {
  InProgressView({super.key});

  InProgressController controller = Get.put(InProgressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => controller.inProgressTaskList.isEmpty
              ? const Center(child: CircularProgressIndicator(),)
              : RefreshIndicator(
                color: AppColors.kPrimaryColor,
                onRefresh: () {
                  return controller.getTasksData();
                },
                child:controller.inProgressTaskList.isNotEmpty ?
                ListView.separated(
                    itemCount: controller.inProgressTaskList.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      var task = controller.inProgressTaskList[index];
                      DateTime dateTime = DateTime.parse(task.createdAt);
                      String formattedDate =
                          DateFormat('EEEE MMMM dd yyyy').format(dateTime);

                      return CustomTaskCard(
                        taskId:task.id,
                        currentTaskType: 2,
                        title: task.title,
                        priority: task.priority,
                        estimatedTime: task.estimatedTime,
                        todoUserRole: controller.todoUserRole,
                        firstName: task.developerFirstName,
                        lastName: task.developerLastName,
                        createdAt: formattedDate,
                      );
                    },
                  ):const Center(child: Text("No In Progress Tasks"),),
              )),
        ));
  }
}
