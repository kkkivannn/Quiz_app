// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/feature/domain/entitis/question_entiti.dart';

abstract class QuestionsRepository {
  Future<Either<Failure, List<QuestionEntiti>>> getQuestions(
      String category, String difficulty);
}
