class QuizQuestion {
  const QuizQuestion({required this.text, required this.answers});

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final List<String> shuffledAnswers = List<String>.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
