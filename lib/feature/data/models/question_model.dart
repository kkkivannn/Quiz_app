import 'package:quiz_app/feature/data/models/answers_model.dart';
import 'package:quiz_app/feature/data/models/correct_answers_model.dart';
import 'package:quiz_app/feature/domain/entitis/answers_entiti.dart';
import 'package:quiz_app/feature/domain/entitis/correct_answers_entiti.dart';
import 'package:quiz_app/feature/domain/entitis/question_entiti.dart';

class QuestionModel extends QuestionEntiti {
  QuestionModel({
    required final int id,
    required final String question,
    required final dynamic description,
    required final AnswersEntiti answers,
    required final String multipleCorrectAnswers,
    required final CorrectAnswersEntiti correctAnswers,
    required final String correctAnswer,
  }) : super(
          id: id,
          question: question,
          description: description,
          answers: answers,
          multipleCorrectAnswers: multipleCorrectAnswers,
          correctAnswers: correctAnswers,
          correctAnswer: correctAnswer,
        );
  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json["id"] as int,
        question: json["question"] as String,
        description: json["description"] ?? "",
        answers: AnswersModel.fromJson(json["answers"]),
        multipleCorrectAnswers: json["multiple_correct_answers"] as String,
        correctAnswers: CorrectAnswersModel.fromJson(json["correct_answers"]),
        correctAnswer: json["correct_answer"] ?? "",
      );
}
