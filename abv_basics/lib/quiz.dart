import 'package:abv_basics/data/questions.dart';
import 'package:abv_basics/questions_screen.dart';
import 'package:abv_basics/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:abv_basics/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = <String>[];
  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    // ignore: avoid_print
    // print('>>> Answer chosen: $answer');
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      // ignore: avoid_print
      // selectedAnswers = [];
      setState(() {
        // activeScreen = const ResultsScreen();
        activeScreen = 'results-screen';
      });
    }
  }

  void hanleRestartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: (answer) => chooseAnswer(answer),
      );
    } else if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestarted: hanleRestartQuiz,
      );
    }

    return MaterialApp(
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
          child: screenWidget,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
