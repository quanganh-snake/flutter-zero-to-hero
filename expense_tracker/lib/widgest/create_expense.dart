// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:toastification/toastification.dart';

class CreateExpense extends StatefulWidget {
  const CreateExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<CreateExpense> createState() => _CreateExpenseState();
}

class _CreateExpenseState extends State<CreateExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void handlePresentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now.add(Duration(days: 30)),
      initialDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void handleSubmitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      // showDialog(
      //   context: context,
      //   builder: (ctx) => AlertDialog(
      //     title: Text('Invalid Input'),
      //     content: Text(
      //       'Please make sure a valid title, amount, date and category was entered.',
      //     ),
      //     actions: [
      //       TextButton(
      //         onPressed: () {
      //           Navigator.pop(ctx);
      //         },
      //         child: Text('Okay'),
      //       ),
      //     ],
      //   ),
      // );
      toastification.show(
        context: context, // optional if you use ToastificationWrapper
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 5),
        title: Text('Invalid Input'),
        description: RichText(
          text: const TextSpan(
            text:
                'Please make sure a valid title, amount, date and category was entered.',
          ),
        ),
      );
      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 48, 20, 20),
      child: Column(
        spacing: 20,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: Text('Title')),
            maxLength: 50,
            keyboardType: TextInputType.text,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    prefixText: '\$ ',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 20), // Spacing between the fields
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No date selected'
                          : dateFormatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: handlePresentDatePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton(
                items: Category.values.map((cat) {
                  return DropdownMenuItem(
                    value: cat,
                    child: Text(cat.name.toUpperCase()),
                  );
                }).toList(),
                value: _selectedCategory,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: handleSubmitExpenseData,
                child: Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
