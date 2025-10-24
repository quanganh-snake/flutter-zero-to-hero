import 'package:expense_tracker/widgest/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const Expenses(),
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
    ),
  );
}
