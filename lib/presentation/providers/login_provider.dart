
//
// import 'package:expenses_app/core/di/providers.dart';
// import 'package:expenses_app/domain/entities/login_response.dart';
// import 'package:expenses_app/domain/usecases/login_usecases.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';
//
// final loginProvider = FutureProvider.family<LoginResponse,Map<String,String>>((ref,credentais) async {
//  final loginUsecase = ref.watch(loginUseCaseProvider);
//  return loginUsecase(credentais['username']!,credentais['password']!);
// });


import 'package:flutter_riverpod/legacy.dart';

import '../../../core/di/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/login_response.dart';
import '../../domain/usecases/login_usecases.dart';

class LoginState {
 final bool isLoading;
 final LoginResponse? response;
 final String? error;
 const LoginState({this.isLoading = false, this.response, this.error});

 LoginState copyWith({
  bool? isLoading,
  LoginResponse? response,
  String? error,
 }) {
  return LoginState(
   isLoading: isLoading ?? this.isLoading,
   response: response ?? this.response,
   error: error ?? this.error,
  );
 }
}

class LoginNotifier extends StateNotifier<LoginState> {
 final loginUsecase useCase;
 LoginNotifier(this.useCase) : super(const LoginState());

 Future<void> login(String username, String password) async {
  try {
   state = state.copyWith(isLoading: true);
   final result = await useCase(username, password);
   state = state.copyWith(isLoading: false, response: result);
  } catch (e) {
   state = state.copyWith(isLoading: false, error: e.toString());
  }
 }
}

final loginNotifierProvider =
StateNotifierProvider<LoginNotifier, LoginState>((ref) {
 final useCase = ref.read(loginUseCaseProvider);
 return LoginNotifier(useCase);
});
