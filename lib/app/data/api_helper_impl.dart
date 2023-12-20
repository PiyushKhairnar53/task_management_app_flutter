import 'dart:convert';

import '../../../imports.dart';

class ApiHelperImpl extends GetConnect with ApiHelper{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    httpClient.baseUrl = Constants.BASE_URL;
    httpClient.timeout = Constants.timeout;

    addRequestModifier();

    httpClient.addResponseModifier((request, response) {
      printInfo(
        info: 'Status Code : ${response.statusCode}\n'
              'Data : ${response.bodyString?.toString() ?? ''}',
      );

      return response;
    });
  }

  void addRequestModifier(){
    httpClient.addRequestModifier<dynamic>((request) {
      if(Storage.hasData(Constants.TOKEN)){
        var token = Storage.getValue(Constants.TOKEN);
        print("Token $token");
        var tokenResponse = TokenResponse.fromJson(token);
        request.headers['Authorization'] = "Bearer ${tokenResponse.result}";
      }

      printInfo(
        info: 'REQUEST ║ ${request.method.toUpperCase()}\n'
              'url: ${request.url}\n'
              'Headers: ${request.headers}\n'
              'Body: ${request.files?.toString() ?? ''}\n',
      );

      return request;
    });
  }

  @override
  Future<Response<dynamic>> login(LoginRequest loginRequest) {
    return post('Authentication/login', json.encode(loginRequest.toJson()));
  }

}
