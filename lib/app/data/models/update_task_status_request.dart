class UpdateTaskStatusRequest{
  dynamic taskId ;
  String userId = "";
  int? statusId;

  UpdateTaskStatusRequest({required this.taskId,required this.userId,required this.statusId});

  UpdateTaskStatusRequest.fromJson(Map<String,dynamic> json){
    taskId = json['taskId'];
    userId = json['userId'];
    statusId = json['statusId'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};
    data['taskId'] = taskId;
    data['userId'] = userId;
    data['statusId'] = statusId;
    return data;
  }
}