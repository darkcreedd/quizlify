class QuizQuestion {
  final int id;
  final String category;
  final String question;
  final List<String> options;
  final String correctAnswer;

  QuizQuestion({
    required this.id,
    required this.category,
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}
