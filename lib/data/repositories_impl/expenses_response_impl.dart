
import 'package:expenses_app/data/datasource/remote/api_service.dart';
import 'package:expenses_app/data/model/expenses_model.dart';
import 'package:expenses_app/domain/entities/expenses.dart';
import 'package:expenses_app/domain/repositories/expensesRepository.dart';

class ExpensesRepositoryImpl implements ExpensesReposioty {

  final ApiService apiService;

  const ExpensesRepositoryImpl(this.apiService);

  @override
  Future<List<Expenses>> getAllExpenses(int userID) async {
    final response = await apiService.getAllExpenses(userID);
    return response.map((elements) =>
        Expenses(expenseId: elements.expenseId,
            categoryId: elements.categoryId,
            categoryName: elements.categoryName,
            title: elements.title,
            amount: elements.amount,
            expenseDate: elements.expenseDate,
            notes: elements.notes)).toList();
  }
}