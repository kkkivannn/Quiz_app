import 'package:quiz_app/constants.dart';
import 'package:quiz_app/feature/data/datasource/quize.dart';
import 'package:quiz_app/feature/data/models/question_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as https;

class QuizeImplement implements QuizeDataSource {
  @override
  Future<List<QuestionModel>> getQuize(
      String category, String difficulty) async {
    Uri url = Uri.parse(
        "$baseUrl&category=$category&difficulty=$difficulty&limit=10&");
    final response = await https.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> questions = jsonDecode(response.body);
      return questions.map((json) => QuestionModel.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
}
