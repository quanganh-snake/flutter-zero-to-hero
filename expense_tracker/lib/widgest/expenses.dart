import 'package:expense_tracker/widgest/create_expense.dart';
import 'package:expense_tracker/widgest/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 29.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'React Native Course',
      amount: 39.99,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  void handleOpenModalAddExpense() {
    showModalBottomSheet(
      context: context,
      builder: (buildContext) {
        return CreateExpense();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: handleOpenModalAddExpense,
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
        title: Text(
          'Expense Tracker',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          const Text('The list of expenses will go here.'),
          Expanded(child: ExpensesList(expenses: _registerExpenses)),
        ],
      ),
    );
  }
}
