import '../../../imports.dart';

abstract class ApiHelper{
  Future<Response> login(LoginRequest loginRequest);
  Future<Response> registerManager(RegisterRequest registerRequest);
  Future<Response> registerDeveloper(RegisterRequest registerRequest);
}