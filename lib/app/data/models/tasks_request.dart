class TasksRequest{
  String userId = "";
  int? statusId;

  TasksRequest({required this.userId,required this.statusId});

  TasksRequest.fromJson(Map<String,dynamic> json){
    userId = json['userId'];
    statusId = json['statusId'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};
    data['userId'] = userId;
    data['statusId'] = statusId;
    return data;
  }
}