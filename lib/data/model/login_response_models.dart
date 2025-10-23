import 'package:expenses_app/domain/entities/login_response.dart';

import '../../domain/entities/login_response.dart';

class LoginResponseModel extends LoginResponse {
  const LoginResponseModel({
    required super.message,
    required super.username,
    required super.userid,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'] ?? '',
      username: json['username'] ?? '',
      userid: json['userid'],
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'username': username,
    'userid': userid,
  };
}
