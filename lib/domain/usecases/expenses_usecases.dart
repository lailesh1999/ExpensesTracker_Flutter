
import 'package:expenses_app/domain/entities/expenses.dart';
import 'package:expenses_app/domain/repositories/expensesRepository.dart';

class ExpensesUsecases{
  final ExpensesReposioty expensesReposioty;

  const ExpensesUsecases(this.expensesReposioty);

  Future<List<Expenses>> call(int userID){
    return expensesReposioty.getAllExpenses(userID);
  }
}