import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/core/usecase/usecase.dart';
import 'package:quiz_app/feature/domain/entitis/question_entiti.dart';
import 'package:quiz_app/feature/domain/repositories/questions.dart';

class GetQuestions
    implements UseCase<List<QuestionEntiti>, CategoryAndDifficultyParams> {
  final QuestionsRepository questionsRepository;

  GetQuestions(this.questionsRepository);
  @override
  Future<Either<Failure, List<QuestionEntiti>>> call(
      CategoryAndDifficultyParams params) {
    return questionsRepository.getQuestions(params.category, params.difficulty);
  }
}

class CategoryAndDifficultyParams extends Equatable {
  final String category;
  final String difficulty;
  const CategoryAndDifficultyParams(
      {required this.difficulty, required this.category});
  @override
  List<Object?> get props => [difficulty, category];
}
