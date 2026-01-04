import 'package:flutter/material.dart';
import 'package:flutter_form/data/categories.dart';
import 'package:flutter_form/models/category.dart';
import 'package:flutter_form/models/grocery.dart';

final dummyGroceries = [
  Grocery(
    id: '1',
    name: 'Milk',
    quantity: 1,
    color: Colors.white,
    category: categories[Categories.dairy]!,
  ),
  Grocery(
    id: '2',
    name: 'Bananas',
    quantity: 5,
    color: Colors.yellow,
    category: categories[Categories.fruit]!,
  ),
  Grocery(
    id: '3',
    name: 'Beef Steak',
    quantity: 1,
    color: Colors.red,
    category: categories[Categories.meat]!,
  ),
  Grocery(
    id: '4',
    name: 'Coffee',
    quantity: 4,
    color: Colors.brown,
    category: categories[Categories.beverages]!,
  ),
  Grocery(
    id: '5',
    name: 'Cheese',
    quantity: 2,
    color: Colors.orange,
    category: categories[Categories.dairy]!,
  ),
];
