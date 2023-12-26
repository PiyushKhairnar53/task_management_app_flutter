import '../../../imports.dart';

abstract class ApiHelper{
  Future<Response> login(LoginRequest loginRequest);
  Future<Response> registerManager(RegisterRequest registerRequest);
  Future<Response> registerDeveloper(RegisterRequest registerRequest);
  Future<Response> getTasks(TasksRequest tasksRequest);
  Future<Response> updateTaskStatus(UpdateTaskStatusRequest updateTaskStatusRequest);

}