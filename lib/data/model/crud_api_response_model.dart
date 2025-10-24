import 'package:expenses_app/domain/entities/crud_api_response.dart';

class CrudApiResponseModel extends CrudApiResponse {
  CrudApiResponseModel({required super.message});
  factory CrudApiResponseModel.fromJson(Map<String, dynamic> json) {
    return CrudApiResponseModel(message: json['message']);
  }
}
