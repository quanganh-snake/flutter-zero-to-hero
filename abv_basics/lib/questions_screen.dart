import 'package:abv_basics/answer_button.dart';
import 'package:abv_basics/data/questions.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  @override
  void initState() {
    currentQuestionIndex = 0;
    super.initState();
  }

  void answerQuestion() {
    setState(() {
      if (questions.length - 1 > currentQuestionIndex) {
        // There are more questions left
        currentQuestionIndex++;
      } else {
        // No more questions left
        currentQuestionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentQuestion.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onPressed: answerQuestion,
              );
            }),
          ],
        ),
      ),
    );
  }
}
