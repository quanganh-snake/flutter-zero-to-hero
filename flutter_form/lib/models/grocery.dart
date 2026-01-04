import 'package:flutter/material.dart';
import 'package:flutter_form/models/category.dart';

class Grocery {
  final String id;
  final String name;
  final int quantity;
  final Color color;
  final Category category;

  Grocery({
    required this.name,
    required this.quantity,
    required this.color,
    required this.category,
    String? id,
  }) : id = id ?? DateTime.now().toString();
}
