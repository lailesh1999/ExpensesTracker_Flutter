import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio dio;
  DioClient({String baseurl = 'http://192.168.1.4/Expense_tracker/api'})
    : dio = Dio(BaseOptions(baseUrl: baseurl)) {
    dio.interceptors.add(
      PrettyDioLogger(requestBody: true, responseBody: true),
    );
  }
}
