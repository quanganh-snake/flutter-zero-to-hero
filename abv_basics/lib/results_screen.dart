import 'package:abv_basics/data/questions.dart';
import 'package:abv_basics/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestarted,
  });

  final List<String> chosenAnswers;
  final void Function() onRestarted;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  int getCorrectAnswerCount() {
    // int correctAnswerCount = 0;

    // final summaryData = getSummaryData();
    // for (var data in summaryData) {
    //   if (data['user_answer'] == data['correct_answer']) {
    //     correctAnswerCount++;
    //   }
    // }

    // return correctAnswerCount;
    return getSummaryData()
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'You answered ${getCorrectAnswerCount()} out of ${questions.length} questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(123, 255, 255, 255),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            QuestionsSummary(summaryData: getSummaryData()),
            SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestarted,
              icon: const Icon(Icons.replay),
              label: const Text('Restart Quiz!'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
