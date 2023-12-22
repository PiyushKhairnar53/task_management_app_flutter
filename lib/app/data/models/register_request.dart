
class RegisterRequest {

  String firstName = "";
  String lastName = "";
  String username = "";
  String phoneNumber = "";
  String email = "";
  String password = "";

  RegisterRequest({required this.firstName,required this.lastName,required this.phoneNumber,required this.username, required this.email,required this.password});

  RegisterRequest.fromJson(Map<String,dynamic> json){
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['username'] = username;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}