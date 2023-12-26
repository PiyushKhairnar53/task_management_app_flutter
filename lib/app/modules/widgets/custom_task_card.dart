import 'package:task_management_app/imports.dart';

class CustomTaskCard extends StatelessWidget {
  final String? title, priority, todoUserRole, firstName, lastName;
  final dynamic taskId,estimatedTime, createdAt;
  final dynamic currentTaskType;
  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());
  var todoController = Get.put<TodoController>(TodoController());
  var inProgressController = Get.put<InProgressController>(InProgressController());
  var codeReviewController = Get.put<CodeReviewController>(CodeReviewController());
  var completedController = Get.put<CompletedController>(CompletedController());

  // CustomTaskCard({
  //   Key? key,
  //   this.title,
  //   this.priority,
  //   this.todoUserRole,
  //   this.firstName,
  //   this.lastName,
  //   this.estimatedTime,
  //   this.createdAt
  // }) : super(key: key);

  CustomTaskCard(
      {super.key,
      this.taskId,
      this.currentTaskType,
      this.title,
      this.priority,
      this.todoUserRole,
      this.firstName,
      this.lastName,
      this.estimatedTime,
      this.createdAt});

  Future<void> updateStatus(dynamic newStatusId) async{
    // _apiHelper
    //     .getTasks(TasksRequest(userId: Storage.getValue(Constants.TOKEN)['userId'],statusId: 4))
    //     .futureValue((value){
    //   print("Tasks Response $value");
    //   var taskResponse = TaskResponse.fromJson(value);
    //   completedTaskList.assignAll(taskResponse.result!.toList(growable: true));
    //   update();
    // }, onError: (error) {
    //   print("Get Tasks $error");
    // });

    _apiHelper
    .updateTaskStatus(UpdateTaskStatusRequest(taskId: taskId, userId: Storage.getValue(Constants.TOKEN)['userId'], statusId: newStatusId.value))
        .futureValue((value) {
        var taskResponse = TaskResponse.fromJson(value);
        Get.back();
        // todoCon.getTasksData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(Get.context as BuildContext).size.width /
                      1.3,
                  child: Text(
                    "$title",
                    softWrap: true,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text(
                      "Priority",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '$priority',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Estimate",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '$estimatedTime hrs',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "$todoUserRole",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '$firstName $lastName',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(Get.context as BuildContext)
                              .size
                              .width /
                          1.5,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          getChangeStatusBottomSheet(context);
                        },
                        icon: const Icon(
                          // <-- Icon
                          Icons.edit,
                          size: 24.0,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kPrimaryColor,
                        ),
                        label: const Text(
                          'Change Status',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ), // <-- Text
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Updated At - $createdAt",
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  getChangeStatusBottomSheet(BuildContext context) {

    String currentTaskName = 'Todo';
    switch(currentTaskType){
      case 1:
        currentTaskName = 'Todo';
        break;
      case 2:
        currentTaskName = 'In Progress';
        break;
      case 3:
        currentTaskName = 'Code Review';
        break;
      case 4:
        currentTaskName = 'Done';
        break;
    }

    dynamic newTaskType = 1.obs;
    newTaskType.value = currentTaskType;

    List<DropdownMenuItem<int>> sortModes = List.empty(growable: true);
    sortModes.add(DropdownMenuItem(
      value: 1,
      enabled: currentTaskType!=1,
      child: Text(
        "Todo",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: currentTaskType==1? Colors.grey[600] : Colors.black),
      ),
    ));
    sortModes.add(DropdownMenuItem(
      enabled: currentTaskType!=2,
      value: 2,
      child: Text(
        "In Progress",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: currentTaskType==2? Colors.grey[600] : Colors.black),
      ),
    ));
    sortModes.add(DropdownMenuItem(
      enabled: currentTaskType!=3,
      value: 3,
      child: Text(
        "Code Review",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: currentTaskType==3? Colors.grey[600] : Colors.black),
      ),
    ));
    sortModes.add(DropdownMenuItem(
      enabled: currentTaskType!=4,
      value: 4,
      child: Text(
        "Done",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: currentTaskType==4? Colors.grey[600] : Colors.black),
      ),
    ));

    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.width,
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Row(
                                children: [
                                  Text(
                                    "Close",
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Text(
                            "Change Status",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey[600]),
                          ),
                        ),
                        Column(
                          children: [
                            Obx( () =>
                                TextButton(
                                  onPressed: currentTaskType != newTaskType.value ? () async {
                                    await updateStatus(newTaskType);
                                    await todoController.getTasksData();
                                    await inProgressController.getTasksData();
                                    await codeReviewController.getTasksData();
                                    await completedController.getTasksData();
                                    Get.back();
                                  }:null,
                                  style: TextButton.styleFrom(backgroundColor: Colors.transparent),
                                  child: Text(
                                    "Save",
                                    style: TextStyle(fontSize: 16,color: currentTaskType == newTaskType.value ? Colors.grey[500] : Colors.blue),
                                  ),
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20,),
                            SizedBox(
                              width: MediaQuery.of(Get.context as BuildContext).size.width /
                                  1,
                              child: Text(
                                "$title",
                                softWrap: true,
                                maxLines: 3,
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 20,),
                            SizedBox(
                              width: MediaQuery.of(Get.context as BuildContext).size.width /
                                  1.3,
                              child: DropdownButtonFormField(
                                dropdownColor: AppColors.white,
                                value: currentTaskType,
                                items: sortModes,
                                onChanged: (selectedValue){
                                  newTaskType.value = selectedValue;
                                }
                              ),
                            ),
                            const SizedBox(height: 30,),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          );
        });
  }

  updateListViews() async{

  }
}
