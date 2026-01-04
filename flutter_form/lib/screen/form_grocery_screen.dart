import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form/data/categories.dart';
import 'package:flutter_form/models/category.dart';
import 'package:flutter_form/models/grocery.dart';
import 'package:http/http.dart' as http;

class FormGroceryScreen extends StatefulWidget {
  const FormGroceryScreen({super.key, this.grocery});

  final Grocery? grocery;

  @override
  State<FormGroceryScreen> createState() => _FormGroceryScreenState();
}

class _FormGroceryScreenState extends State<FormGroceryScreen> {
  late final bool isEdit = widget.grocery != null;
  final _formKey = GlobalKey<FormState>();
  var _isSending = false;

  // entered data:
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories.values.first;

  Future<void> _saveForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isSending = true;
      });
      final url = Uri.https(
        'flutter-learn-554bd-default-rtdb.asia-southeast1.firebasedatabase.app',
        'shopping-list.json',
      );
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': _enteredName,
          'quantity': _enteredQuantity,
          'category': _selectedCategory.name,
        }),
      );

      final resData = json.decode(response.body);

      if (!context.mounted) return;

      Navigator.of(context).pop(
        Grocery(
          id: resData['name'],
          quantity: _enteredQuantity,
          color: _selectedCategory.color,
          category: _selectedCategory,
          name: _enteredName,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Grocery' : 'Add Grocery')),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              maxLength: 200,
              initialValue: isEdit ? widget.grocery!.name : '',
              decoration: const InputDecoration(
                labelText: 'Grocery Name',
                hintText: 'e.g. Apples',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                if (value.length > 200) {
                  return 'Name cannot be longer than 200 characters';
                }
                return null;
              },
              onSaved: (newValue) => {_enteredName = newValue!},
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: isEdit
                        ? widget.grocery!.quantity.toString()
                        : '1',
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      hintText: 'e.g. 2',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a quantity';
                      }
                      final quantity = int.tryParse(value);
                      if (quantity == null || quantity <= 0) {
                        return 'Please enter a valid quantity';
                      }
                      return null;
                    },
                    onSaved: (newValue) => {
                      _enteredQuantity = int.parse(newValue!),
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: DropdownButtonFormField<Category>(
                    initialValue: _selectedCategory,
                    items: [
                      for (final category in categories.entries)
                        DropdownMenuItem(
                          value: category.value,
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                margin: EdgeInsets.only(right: 6),
                                decoration: BoxDecoration(
                                  color: category.value.color,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              Text(category.value.name),
                            ],
                          ),
                        ),
                    ],
                    onChanged: (value) {
                      _selectedCategory = value!;
                    },
                    decoration: const InputDecoration(labelText: 'Unit'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _isSending
                      ? null
                      : () {
                          _formKey.currentState!.reset();
                        },
                  child: Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: _isSending ? null : _saveForm,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      isEdit ? Colors.orange : Colors.blue,
                    ),
                  ),
                  child: Text(
                    isEdit
                        ? _isSending
                              ? 'Updating...'
                              : 'Update Grocery'
                        : _isSending
                        ? 'Adding...'
                        : 'Add Grocery',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
