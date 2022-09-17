// Dart imports:

// Package imports:
import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';

// Project imports:
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/feature/data/datasource/quize.dart';
import 'package:quiz_app/feature/data/models/question_model.dart';

class QuizeImplement implements QuizeDataSource {
  Dio _dio = Dio();
  QuizeImplement() {
    _dio = Dio(
      BaseOptions(baseUrl: baseUrl),
    );
    initializeInterceptor();
  }
  initializeInterceptor() {
    _dio.interceptors.add(
      dioLoggerInterceptor,
    );
  }

  @override
  Future<List<QuestionModel>> getQuize(
      String category, String difficulty) async {
    final response = await _dio
        .get("$baseUrl&category=$category&difficulty=$difficulty&limit=10&");
    if (response.statusCode == 200) {
      return (response.data as List<dynamic>)
          .map((json) => QuestionModel.fromJson(json))
          .toList();
    } else {
      throw Exception();
    }
  }
}
