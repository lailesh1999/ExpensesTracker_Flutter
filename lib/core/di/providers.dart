
import 'package:expenses_app/core/network/dio_client.dart';
import 'package:expenses_app/data/datasource/remote/api_service.dart';
import 'package:expenses_app/data/repositories_impl/expenses_response_impl.dart';
import 'package:expenses_app/data/repositories_impl/login_response_impl.dart';
import 'package:expenses_app/domain/usecases/expenses_usecases.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/login_usecases.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

final apiServiceProvider = Provider <ApiService>((ref) {
  return ApiService(ref.watch(dioClientProvider));
});

final RepositoryProvider = Provider((ref) => LoginResponseRepositoryImp(ref.watch(apiServiceProvider)));

final loginUseCaseProvider = Provider((ref) => loginUsecase(ref.watch(RepositoryProvider)) );

final ExpensesRepositoryProvider = Provider((ref) => ExpensesRepositoryImpl(ref.watch(apiServiceProvider)));

final ExpensesUsecasesProvider = Provider((ref) => ExpensesUsecases(ref.watch(ExpensesRepositoryProvider)));

