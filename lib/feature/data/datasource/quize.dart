import 'package:quiz_app/feature/data/models/question_model.dart';

abstract class QuizeDataSource {
  Future<List<QuestionModel>> getQuize(String category, String difficulty);
}
