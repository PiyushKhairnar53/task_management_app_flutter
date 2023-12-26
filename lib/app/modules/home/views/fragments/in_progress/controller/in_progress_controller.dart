import 'package:task_management_app/imports.dart';

class InProgressController extends GetxController{

  String name = "In Progress";

  String? currentUserRole, todoUserRole;

  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());
  var inProgressTaskList = List<Task>.empty(growable: true).obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    currentUserRole = Storage.getValue(Constants.TOKEN)['role'];
    if(currentUserRole == "Manager"){
      todoUserRole = "Developer Assigned";
    }
    else{
      todoUserRole = "Assigned by Manager";
    }
    await getTasksData();
  }

  Future<void> getTasksData() async{
    _apiHelper
        .getTasks(TasksRequest(userId: Storage.getValue(Constants.TOKEN)['userId'],statusId: 2))
        .futureValue((value){
      print("Tasks Response $value");
      var taskResponse = TaskResponse.fromJson(value);
      inProgressTaskList.assignAll(taskResponse.result!.toList(growable: true));
      update();
    }, onError: (error) {
      print("Get Tasks $error");
    });
  }

  void onLogoutClick(){
    Storage.clearStorage();
    Get.offAllNamed(Routes.LOGIN);
  }

}