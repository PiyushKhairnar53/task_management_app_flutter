import 'package:task_management_app/imports.dart';

class TodoController extends GetxController{

  String? currentUserRole, todoUserRole;

  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());
  var todoTaskList = List<Task>.empty(growable: true).obs;

  String value = "Todo";

  void onLogoutClick(){
    Storage.clearStorage();
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    currentUserRole = Storage.getValue(Constants.TOKEN)['role'];
    if(currentUserRole == "Manager"){
      todoUserRole = "Developer Assigned";
    }
    else{
      todoUserRole = "Assigned by Manager";
    }
    getTasksData();
  }

  void getTasksData(){
    _apiHelper
        .getTasks(TasksRequest(userId: Storage.getValue(Constants.TOKEN)['userId'],statusId: 1))
        .futureValue((value){
          print("Tasks Response $value");
          var taskResponse = TaskResponse.fromJson(value);
          todoTaskList.addAll(taskResponse.result!.toList(growable: true));
          update();
    }, onError: (error) {
      print("Get Tasks $error");
    });
  }

  void printLocalStorage(){
    print(Storage.getValue(Constants.TOKEN));
    // print(Storage.getValue(Constants.TOKEN)['role']);
  }
}