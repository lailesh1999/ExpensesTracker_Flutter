import 'package:expenses_app/domain/entities/login_response.dart';
import 'package:expenses_app/domain/repositories/loginRepository.dart';

class loginUsecase{
  final LoginRepository loginRepo;
  loginUsecase(this.loginRepo);

  Future<LoginResponse> call(String username,String password) {
    return loginRepo.login(username, password);
  }

}