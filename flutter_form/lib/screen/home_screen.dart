import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form/data/categories.dart';
import 'package:flutter_form/models/grocery.dart';
import 'package:flutter_form/screen/form_grocery_screen.dart';
import 'package:flutter_form/widgets/grocery_item.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Grocery> _groceryItems = [];
  var _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
      'flutter-learn-554bd-default-rtdb.asia-southeast1.firebasedatabase.app',
      'shopping-list.json',
    );
    final response = await http.get(url);

    if (response.statusCode >= 400) {
      // error handling
      setState(() {
        _error = 'Failed to load data. Please try again later.';
      });
      return;
    }

    if (response.body == 'null') {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final List<Grocery> loadedGroceryItems = <Grocery>[];
    final Map<String, dynamic> listData = json.decode(response.body);

    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere((catItem) => catItem.value.name == item.value['category'])
          .value;

      loadedGroceryItems.add(
        Grocery(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          color: Colors.redAccent,
          category: category,
        ),
      );
    }
    setState(() {
      _groceryItems = loadedGroceryItems;
      _isLoading = false;
    });
  }

  void _switchToFormGroceryScreen() async {
    final newGrocery = await Navigator.of(context).push<Grocery>(
      MaterialPageRoute(builder: (context) => const FormGroceryScreen()),
    );

    if (newGrocery != null) {
      setState(() {
        _groceryItems.add(newGrocery);
      });
    }
  }

  void _removeGroceryItem(Grocery grocery) async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final index = _groceryItems.indexOf(grocery);

    setState(() {
      _groceryItems.removeAt(index);
    });

    final url = Uri.https(
      'flutter-learn-554bd-default-rtdb.asia-southeast1.firebasedatabase.app',
      'shopping-list/${grocery.id}.json',
    );

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, grocery);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Failed to delete item.'),
          action: SnackBarAction(
            label: 'UNDO',
            onPressed: () {
              // Re-insert the item if deletion failed
              setState(() {
                _groceryItems.insert(index, grocery);
              });
            },
          ),
        ),
      );
    } else {
      // Successfully deleted from the server

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item deleted successfully.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No groceries added yet.', style: TextStyle(fontSize: 18)),
    );

    if (_isLoading) {
      content = const Center(child: CircularProgressIndicator());
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: (context, index) {
          final grocery = _groceryItems[index];
          return Dismissible(
            key: ValueKey(grocery.id),
            onDismissed: (dismissDirection) {
              _removeGroceryItem(grocery);
            },
            child: GroceryItem(grocery: grocery),
          );
        },
        itemCount: _groceryItems.length,
      );
    }

    if (_error != null) {
      content = Center(
        child: Text(
          _error!,
          style: const TextStyle(color: Colors.red, fontSize: 18),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _switchToFormGroceryScreen();
            },
          ),
        ],
      ),
      body: content,
    );
  }
}
