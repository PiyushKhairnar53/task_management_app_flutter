import 'package:task_management_app/imports.dart';

class CodeReviewController extends GetxController{

  String value = "Code Review";

  String? currentUserRole, todoUserRole;

  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());
  var codeReviewTaskList = List<Task>.empty(growable: true).obs;

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
        .getTasks(TasksRequest(userId: Storage.getValue(Constants.TOKEN)['userId'],statusId: 3))
        .futureValue((value){
      print("Tasks Response $value");
      var taskResponse = TaskResponse.fromJson(value);
      codeReviewTaskList.assignAll(taskResponse.result!.toList(growable: true));
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