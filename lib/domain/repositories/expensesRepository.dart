
import 'package:expenses_app/domain/entities/expenses.dart';

abstract class ExpensesReposioty{
 Future<List<Expenses>> getAllExpenses(int userID);
}