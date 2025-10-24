import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:expenses_app/core/network/dio_client.dart';
import 'package:expenses_app/data/model/expenses_model.dart';

import '../../model/login_response_models.dart';

class ApiService {
  final DioClient dioClient;

  ApiService(this.dioClient);

  Future<LoginResponseModel> login({
    required String username,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> loginData = {
        "username": username,
        "password": password,
      };

      final response = await dioClient.dio.post(
        '/user/login.php',
        data: loginData,
        options: Options(
          validateStatus: (status) => status == 200 || status == 400,
        ),
      );

      final Map<String, dynamic> data = response.data is String
          ? jsonDecode(response.data)
          : response.data as Map<String, dynamic>;

      // Handle invalid login
      if (response.statusCode == 400 ||
          (data['message']?.toString().toLowerCase().contains('invalid') ??
              false)) {
        final errorMessage = data['message'] ?? 'Invalid username or password';
        throw Exception(errorMessage);
      }

      return LoginResponseModel.fromJson(data);
    } on DioException catch (e) {
      final errorMessage = e.response?.data is Map
          ? (e.response!.data['message'] ?? 'Login failed')
          : (e.message ?? 'Network error occurred');
      throw Exception(errorMessage);
    } catch (e) {
      // ✅ Only wrap if it's not already an Exception
      if (e is Exception) {
        rethrow; // Pass through original message cleanly
      } else {
        throw Exception(e.toString());
      }
    }
  }

  Future<List<ExpensesModel>> getAllExpenses(int userId) async {
    try {
      final response = await dioClient.dio.get(
        '/expenses/getAllExpenses.php',
        queryParameters: {'UserID': userId},
      );
      if(response.statusCode == 200 && response.data['expensesList'] != null){
        final List<dynamic> list = response.data['expensesList'];
        return list.map((data) => ExpensesModel.fromJson(data)).toList();
      }else{
        throw Exception('Failed to Load data');
      }
    } catch (e) {
      if (e is Exception) {
        rethrow;
      } else {
        throw Exception(e.toString());
      }
    }
  }
}
