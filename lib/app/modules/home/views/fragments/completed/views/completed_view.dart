import 'package:intl/intl.dart';
import '../../../../../../../imports.dart';

class CompletedView extends StatelessWidget {
  CompletedView({super.key});

  CompletedController controller = Get.put(CompletedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => controller.loadingScreen.value
              ? const Center(child: CircularProgressIndicator(),)
              : RefreshIndicator(
                color: AppColors.kPrimaryColor,
                onRefresh: () {
                  return controller.getTasksData();
                },
                child: controller.completedTaskList.isNotEmpty ?
                ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    itemCount: controller.completedTaskList.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      var task = controller.completedTaskList[index];
                      DateTime dateTime = DateTime.parse(task.createdAt);
                      String formattedDate =
                          DateFormat('EEEE MMMM dd yyyy').format(dateTime);

                      return CustomTaskCard(
                        taskId:task.id,
                        currentTaskType: 4,
                        title: task.title,
                        priority: task.priority,
                        estimatedTime: task.estimatedTime,
                        todoUserRole: controller.todoUserRole,
                        firstName: task.developerFirstName,
                        lastName: task.developerLastName,
                        createdAt: formattedDate,
                      );
                    },
                  ):const CustomScrollView(
                    slivers: <Widget>[
                      SliverFillRemaining(
                        child: Center(
                          child: Text("No results found."),
                        ),
                      ),
                    ],
                ),
              )),
        ));
  }
}
