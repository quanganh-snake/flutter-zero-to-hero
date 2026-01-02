import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/create_expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
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
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Groceries',
      amount: 150.12,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void handleOpenModalAddExpense() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (buildContext) => CreateExpense(onAddExpense: handleAddExpense),
    );
  }

  void handleAddExpense(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void handleDeleteExpense(Expense expense) {
    final expenseIndex = _registerExpenses.indexOf(expense);

    setState(() {
      _registerExpenses.remove(expense);
    });
    ScaffoldMessenger.of(
      context,
    ).clearSnackBars(); // Xóa thông báo hiện tại nếu có --> Đẩy thông báo mới lên trên cùng
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text('Expense deleted: ${expense.title}'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registerExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registerExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerExpenses,
        onDeleteExpense: handleDeleteExpense,
      );
    }

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
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registerExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registerExpenses)),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
