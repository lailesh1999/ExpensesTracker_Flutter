import 'package:expenses_app/domain/entities/expenses.dart';
import 'package:expenses_app/domain/usecases/expenses_usecases.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../core/di/providers.dart';

class ExpensesSate {
  final bool? isloading;
  final List<Expenses>? expenses;
  final String? error;

  const ExpensesSate({ this.isloading, this.expenses, this.error});

  ExpensesSate copyWith({
    bool? isloading,
    List<Expenses>? expenses,
    String? error,
  }) {
    return ExpensesSate(
        isloading : isloading ?? this.isloading,
        expenses : expenses ?? this.expenses,
        error : error ?? this.error
    );
  }
}

class ExpensesNotifier extends StateNotifier<ExpensesSate>{
  final ExpensesUsecases expensesUsecases;

  ExpensesNotifier( this.expensesUsecases): super(const ExpensesSate());
  Future<void> fecthExpenses(int userID)async {
    try {
      state = state.copyWith(isloading: true);
      final result = await expensesUsecases(userID);
      state = state.copyWith(isloading: false, expenses: result);
    }catch(e){
      state = state.copyWith(isloading: false,error: e.toString());
    }
  }
}

final expensesNotifierProvider = StateNotifierProvider<ExpensesNotifier,ExpensesSate>((ref){
  final usecase = ref.read(ExpensesUsecasesProvider);
  return ExpensesNotifier(usecase);
});
