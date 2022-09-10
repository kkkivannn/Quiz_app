import 'package:quiz_app/feature/domain/entitis/answers_entiti.dart';

class AnswersModel extends AnswersEntiti {
  AnswersModel({
    required final String answerA,
    required final String answerB,
    required final String answerC,
    required final String answerD,
    required final String answerE,
    required final String answerF,
  }) : super(
          answerA: answerA,
          answerB: answerB,
          answerC: answerC,
          answerD: answerD,
          answerE: answerE,
          answerF: answerF,
        );

  factory AnswersModel.fromJson(Map<String, dynamic> json) => AnswersModel(
        answerA: json["answer_a"] ?? "",
        answerB: json["answer_b"] ?? "",
        answerC: json["answer_c"] ?? "",
        answerD: json["answer_d"] ?? "",
        answerE: json["answer_e"] ?? "",
        answerF: json["answer_f"] ?? "",
      );
}
