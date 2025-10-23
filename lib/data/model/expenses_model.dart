import 'package:expenses_app/domain/entities/expenses.dart';

class ExpensesModel extends Expenses {
  const ExpensesModel({
    required super.expenseId,
    required super.categoryId,
    required super.categoryName,
    required super.title,
    required super.amount,
    required super.expenseDate,
    required super.notes,
  });

  factory ExpensesModel.fromJson(Map<String, dynamic> json) {
    return ExpensesModel(
      expenseId: int.parse(json['ExpenseId'].toString()),
      categoryId: int.parse(json['CategoryId'].toString()),
      categoryName: json['CategoryName'] ?? '',
      title: json['Title'] ?? '',
      amount: double.parse(json['Amount'].toString()),
      expenseDate: json['ExpenseDate'] ?? '',
      notes: json['Notes'] ?? '',
    );
  }
}
