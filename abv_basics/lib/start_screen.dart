import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuestions, {super.key});

  final void Function() startQuestions;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity - Recommended way - Performance Good
          Image(
            image: AssetImage('assets/images/quiz-logo.png'),
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          // Opacity - Not Recommended way - Performance Issues
          // Opacity(
          //   opacity: 0.5,
          //   child: Image(
          //     image: AssetImage('assets/images/quiz-logo.png'),
          //     width: 300,
          //   ),
          // ),
          SizedBox(height: 30),
          Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 30),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: TextStyle(fontSize: 20),
            ),
            onPressed: startQuestions,
            icon: Icon(
              Icons.arrow_right_alt_rounded,
              color: Colors.white,
              size: 32,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
