import 'package:task_management_app/imports.dart';

class CompletedController extends GetxController{

  String name = "Completed";

  String? currentUserRole, todoUserRole;

  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());
  var completedTaskList = List<Task>.empty(growable: true).obs;

  var loadingScreen = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    loadingScreen.value = true;
    currentUserRole = Storage.getValue(Constants.TOKEN)['role'];
    if(currentUserRole == "Manager"){
      todoUserRole = "Developer Assigned";
    }
    else{
      todoUserRole = "Assigned by Manager";
    }
    await getTasksData();
    loadingScreen.value = false;
  }

  Future<void> getTasksData() async{
    _apiHelper
        .getTasks(TasksRequest(userId: Storage.getValue(Constants.TOKEN)['userId'],statusId: 4))
        .futureValue((value){
      print("Tasks Response $value");
      var taskResponse = TaskResponse.fromJson(value);
      completedTaskList.assignAll(taskResponse.result!.toList(growable: true));
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