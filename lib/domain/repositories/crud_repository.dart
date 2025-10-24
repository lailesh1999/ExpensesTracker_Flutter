import 'dart:js_interop';

import 'package:expenses_app/domain/entities/crud_api_response.dart';

abstract class CrudRepository{

  Future<CrudApiResponse> addCategory(JSObject data);
}