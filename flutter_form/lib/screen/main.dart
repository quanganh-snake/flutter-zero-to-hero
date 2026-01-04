import 'package:flutter/material.dart';
import 'package:flutter_form/screen/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
      surface: const Color.fromARGB(255, 71, 173, 134),
      tertiary: const Color.fromARGB(255, 29, 201, 145),
    );

    final baseTextTheme = ThemeData.dark(useMaterial3: true).textTheme;

    return MaterialApp(
      title: 'Flutter Form - Grocery List',
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        textTheme: GoogleFonts.interTextTheme(baseTextTheme).apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        colorScheme: colorScheme,
        primaryTextTheme: GoogleFonts.interTextTheme(baseTextTheme).apply(
          bodyColor: colorScheme.onPrimary,
          displayColor: colorScheme.onPrimary,
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
