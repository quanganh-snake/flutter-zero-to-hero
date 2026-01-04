import 'package:flutter/material.dart';

enum Categories {
  vegetables,
  convenience,
  fruit,
  sweets,
  spices,
  dairy,
  bakery,
  meat,
  beverages,
  carbs,
  hygiene,
  other,
}

class Category {
  final String name;
  final Color color;

  const Category({required this.name, required this.color});
}
