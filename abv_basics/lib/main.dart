import 'package:abv_basics/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 69, 39, 160),
                Color.fromARGB(255, 179, 157, 219),
              ],
            ),
          ),
          child: const StartScreen(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
