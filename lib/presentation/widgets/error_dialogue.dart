import 'package:expenses_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/expenses_provider.dart';
import '../screens/dashboard_screen.dart';

class ErrorDialogue extends ConsumerWidget {
  const ErrorDialogue({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context,ref) {
    return  Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: Colors.red,
              size: 48,
            ),
            const SizedBox(height: 12),
            const Text(
              "ERROR",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 90,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Closes the dialog
                     // Optional: navigate to dashboard
                      //
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => HomeScreen()),
                              (route) => false, // remove all previous routes
                        );
                      });
                    },
                    child: const Text(
                      "Exit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                SizedBox(
                  width: 90,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {
                        ref.read(expensesNotifierProvider.notifier).clearError();
                      Future.microtask(() async {
                        await  ref.read(expensesNotifierProvider.notifier).fecthExpenses(101);
                      });
                    },
                    child: const Text(
                      "Retry",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
