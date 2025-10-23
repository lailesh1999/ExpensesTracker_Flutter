import 'package:expenses_app/domain/entities/login_response.dart';

abstract class LoginRepository{
  Future<LoginResponse> login(String username,String password);
}