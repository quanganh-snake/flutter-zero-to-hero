import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final isCorrect = data['user_answer'] == data['correct_answer'];

            final borderColor = isCorrect
                ? const Color.fromARGB(255, 136, 255, 145)
                : const Color.fromARGB(255, 255, 0, 0);

            final bgColor = isCorrect
                ? const Color.fromARGB(92, 199, 247, 202)
                : const Color.fromARGB(118, 219, 79, 79);

            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Container(
                    width: 32,
                    height: 32,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: borderColor, width: 2),
                    ),
                    foregroundDecoration: BoxDecoration(
                      color: bgColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Your answer: ${data['user_answer']}',
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 240, 195, 195),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Correct answer: ${data['correct_answer']}',
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 136, 255, 145),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
