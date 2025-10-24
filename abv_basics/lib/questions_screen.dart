import 'package:abv_basics/answer_button.dart';
import 'package:abv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

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

  void answerQuestion(String selectedAnswer) {
    // Biến "widget" trong StatefulWidget đại diện cho instance hiện tại của widget đó = QuestionsScreen.
    // Nó cho phép bạn truy cập vào các thuộc tính và phương thức được định nghĩa trong lớp widget từ bên trong lớp State.
    // Ở đây, chúng ta sử dụng "widget.onSelectAnswer" để gọi hàm "onSelectAnswer" được truyền từ bên ngoài vào widget QuestionsScreen.
    // Điều này cho phép chúng ta truyền dữ liệu (câu trả lời đã chọn) từ lớp State trở lại lớp widget hoặc các thành phần bên ngoài khác.
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
      // if (questions.length - 1 > currentQuestionIndex) {
      // } else {
      //   currentQuestionIndex = 0;
      // }
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
              // style: TextStyle(
              //   color: Colors.white,
              //   fontSize: 16,
              //   fontWeight: FontWeight.bold,
              // ),
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onPressed: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
