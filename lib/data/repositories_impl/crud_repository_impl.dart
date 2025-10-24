import 'dart:js_interop';

import 'package:expenses_app/data/datasource/remote/api_service.dart';
import 'package:expenses_app/domain/entities/crud_api_response.dart';
import 'package:expenses_app/domain/repositories/crud_repository.dart';

class CrudReposiotyImpl implements CrudRepository{
  final ApiService apiService;
  CrudReposiotyImpl(this.apiService);
  @override
  Future<CrudApiResponse> addCategory(JSObject data) async{
   final result = await apiService.addCategory(data);
   return CrudApiResponse(message: result.message);
  }


}