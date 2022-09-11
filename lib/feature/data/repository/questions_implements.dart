// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/feature/data/datasource/quize.dart';
import 'package:quiz_app/feature/domain/entitis/question_entiti.dart';
import 'package:quiz_app/feature/domain/repositories/questions.dart';
import '../models/question_model.dart';

class QuestionsRepositoryImplements implements QuestionsRepository {
  final QuizeDataSource quizeDataSource;

  QuestionsRepositoryImplements(this.quizeDataSource);

  @override
  Future<Either<Failure, List<QuestionEntiti>>> getQuestions(
      String category, String difficulty) async {
    return await _getQuestion(
      () => quizeDataSource.getQuize(category, difficulty),
    );
  }

  Future<Either<Failure, List<QuestionModel>>> _getQuestion(
      Future<List<QuestionModel>> Function() quize) async {
    try {
      final quizeModel = await quize();
      return Right(quizeModel);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
