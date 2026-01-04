import 'package:flutter/widgets.dart';
import 'package:flutter_form/models/category.dart';

const categories = {
  Categories.bakery: Category(name: 'Bakery', color: Color(0xFFFFC107)),
  Categories.beverages: Category(name: 'Beverages', color: Color(0xFF2196F3)),
  Categories.carbs: Category(name: 'Carbs', color: Color(0xFF9C27B0)),
  Categories.convenience: Category(
    name: 'Convenience',
    color: Color(0xFF607D8B),
  ),
  Categories.dairy: Category(name: 'Dairy', color: Color(0xFFFFEB3B)),
  Categories.fruit: Category(name: 'Fruits', color: Color(0xFFFF9800)),
  Categories.hygiene: Category(name: 'Hygiene', color: Color(0xFF3F51B5)),
  Categories.meat: Category(name: 'Meat', color: Color(0xFFF44336)),
  Categories.spices: Category(name: 'Spices', color: Color(0xFFFF5722)),
  Categories.sweets: Category(name: 'Sweets', color: Color(0xFF795548)),
  Categories.other: Category(name: 'Other', color: Color(0xFF9E9E9E)),
  Categories.vegetables: Category(name: 'Vegetables', color: Color(0xFF4CAF50)),
};
