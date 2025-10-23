import 'package:expenses_app/presentation/screens/expenses_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          "Home DashBoard",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blue[900], // Dark blue
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 23.0),
            child: Text(
              _greetingMessage(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          _buildcard(
            title: "Total Expenses",
            value: "1000",
            color: Colors.blue,
          ),
          _buildcard(
            title: "Pending Task",
            value: "1000",
            color: Colors.purple,
          ),
          _buildcard(
            title: "Upcoming reminder",
            value: "2",
            color: Colors.green,
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            childAspectRatio: 3.5,
            children: [
              _addButton(
                text: 'Expenses',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ExpensesScreen()));
                },
              ),
              _addButton(
                text: 'Notes',
                onTap: () {
                  print('Notes');
                },
              ),
              _addButton(
                text: 'Task',
                onTap: () {
                  print('Task');
                },
              ),
              _addButton(
                text: 'Category',
                onTap: () {
                  print('Category');
                },
              ),
            ],
          ),
        ],
      ),
    );;
  }

  String _greetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning 🌅';
    } else if (hour < 17) {
      return 'Good Afternoon ☀️';
    } else if (hour < 20) {
      return 'Good Evening 🌇';
    } else {
      return 'Good Night 🌙';
    }
  }

  Widget _buildcard({
    required String title,
    required String value,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.blue.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min, // Take minimum space needed
            children: [
              Icon(Icons.add,color: Colors.blue.shade800,),
              Text(
                'Add $text',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue.shade800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
