import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgest/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onDeleteExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onDeleteExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (buildContext, index) {
        return Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) => onDeleteExpense(expenses[index]),
          child: ExpenseItem(expenses[index]),
        );
      },
    );
  }
}
