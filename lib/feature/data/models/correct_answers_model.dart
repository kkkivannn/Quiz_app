// Project imports:
import '../../domain/entitis/correct_answers_entiti.dart';

class CorrectAnswersModel extends CorrectAnswersEntiti {
  CorrectAnswersModel({
    required final String answerACorrect,
    required final String answerBCorrect,
    required final String answerCCorrect,
    required final String answerDCorrect,
    required final String answerECorrect,
    required final String answerFCorrect,
  }) : super(
          answerACorrect: answerACorrect,
          answerBCorrect: answerBCorrect,
          answerCCorrect: answerCCorrect,
          answerDCorrect: answerDCorrect,
          answerECorrect: answerECorrect,
          answerFCorrect: answerFCorrect,
        );
  factory CorrectAnswersModel.fromJson(Map<String, dynamic> json) =>
      CorrectAnswersModel(
        answerACorrect: json["answer_a_correct"] ?? "",
        answerBCorrect: json["answer_b_correct"] ?? "",
        answerCCorrect: json["answer_c_correct"] ?? "",
        answerDCorrect: json["answer_d_correct"] ?? "",
        answerECorrect: json["answer_e_correct"] ?? "",
        answerFCorrect: json["answer_f_correct"] ?? "",
      );
}
