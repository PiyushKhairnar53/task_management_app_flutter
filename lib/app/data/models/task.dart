class TaskResponse{
  List<Task>? result;
  String? message;

  TaskResponse({this.result,this.message});

  TaskResponse.fromJson(Map<String,dynamic> json){
    if(json['data'] != null){
      result = <Task>[];

      json['data'].forEach((v){
        result!.add(new Task.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['data'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }

}

class Task{
  dynamic id;
  String? title;
  String? description;
  String? priority;
  dynamic estimatedTime;
  String? managerId;
  dynamic actualTime;
  String? developerId;
  String? userRole;
  String? developerFirstName;
  String? developerLastName;
  dynamic createdAt;

  Task({
    this.id,
    this.title,
    this.description,
    this.priority,
    this.estimatedTime,
    this.managerId,
    this.actualTime,
    this.developerId,
    this.userRole,
    this.developerFirstName,
    this.developerLastName,
    this.createdAt
  });

  Task.fromJson(Map<String,dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    priority = json['priority'];
    estimatedTime = json['estimatedTime'];
    managerId = json['managerId'];
    actualTime = json['actualTime'];
    developerId = json['developerId'];
    userRole = json['userRole'];
    developerFirstName = json['developerFirstName'];
    developerLastName = json['developerLastName'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['priority'] = this.priority;
    data['estimatedTime'] = this.estimatedTime;
    data['managerId'] = this.managerId;
    data['actualTime'] = this.actualTime;
    data['developerId'] = this.developerId;
    data['userRole'] = this.userRole;
    data['managerFirstName'] = this.developerFirstName;
    data['managerLastName'] = this.developerLastName;
    data['createdAt'] = this.createdAt;
    return data;
  }


}