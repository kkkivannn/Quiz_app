import 'package:quiz_app/feature/data/models/question_model.dart';

abstract class Quize {
  Future<QuestionModel> getQuize(String category, String difficulty);
}
