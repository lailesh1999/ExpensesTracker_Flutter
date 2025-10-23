import 'package:expenses_app/presentation/providers/expenses_provider.dart';
import 'package:expenses_app/presentation/widgets/error_dialogue.dart';
import 'package:expenses_app/presentation/widgets/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpensesScreen extends ConsumerStatefulWidget {
  const ExpensesScreen({super.key});

  @override
  ConsumerState<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends ConsumerState<ExpensesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetching API when the screen loads
    Future.microtask(() {
      ref.read(expensesNotifierProvider.notifier).fecthExpenses(101);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(expensesNotifierProvider);
    if (state.error != null && !(state.isloading ?? false)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) =>
              ErrorDialogue(errorMessage: state.error.toString()),
        );
      });
    }
      return Scaffold(
        appBar: AppBar(
          title: const Text('Expenses'),
          centerTitle: true,
        ),
        body: state.isloading ?? false
            ? const ShimmerEffect()
            : (state.error != null && state.expenses?.isEmpty != false)
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 64),
              SizedBox(height: 16),
              Text(
                'Failed to load expenses',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(expensesNotifierProvider.notifier).fecthExpenses(
                      101);
                },
                child: Text('Retry'),
              ),
            ],
          ),
        ) : ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: state.expenses?.length ?? 0,
          itemBuilder: (context, index) {
            final expense = state.expenses![index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                expense.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '\$${expense.amount.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            expense.categoryName,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            expense.expenseDate,
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit,
                              color: Colors.grey),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete,
                              color: Colors.grey),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
}
