import 'package:expenses_app/data/datasource/remote/api_service.dart';
import 'package:expenses_app/data/model/login_response_models.dart';
import 'package:expenses_app/domain/entities/login_response.dart';

import '../../domain/repositories/loginRepository.dart';

class LoginResponseRepositoryImp implements LoginRepository{

  final ApiService apiService;

  LoginResponseRepositoryImp(this.apiService);

  @override
  Future<LoginResponse> login(String username, String password) async {
    final response = await apiService.login(username: username, password: password);
    return LoginResponse(message: response.message,userid: response.userid,username: response.username);
  }



}