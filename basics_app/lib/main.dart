import 'package:basics_app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'My Flutter App',
      home: Scaffold(
        // backgroundColor: Colors.orange[200],
        body: GradientContainer.purple(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
