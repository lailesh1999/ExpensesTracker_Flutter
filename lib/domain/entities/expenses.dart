class Expenses {
  final int expenseId;
  final int categoryId;
  final String categoryName;
  final String title;
  final double amount;
  final String expenseDate;
  final String notes;

  const Expenses({
    required this.expenseId,
    required this.categoryId,
    required this.categoryName,
    required this.title,
    required this.amount,
    required this.expenseDate,
    required this.notes,
  });
}
