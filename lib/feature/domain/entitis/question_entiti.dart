// Project imports:
import 'package:quiz_app/feature/domain/entitis/answers_entiti.dart';
import 'correct_answers_entiti.dart';

class QuestionEntiti {
  final int id;
  final String question;
  final dynamic description;
  final AnswersEntiti answers;
  final String multipleCorrectAnswers;
  final CorrectAnswersEntiti correctAnswers;
  final String correctAnswer;
  final dynamic explanation;
  final dynamic tip;

  QuestionEntiti({
    required this.id,
    required this.question,
    this.description,
    required this.answers,
    required this.multipleCorrectAnswers,
    required this.correctAnswers,
    required this.correctAnswer,
    this.explanation,
    this.tip,
  });
}
