import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/feature/domain/usecases/get_questions.dart';
import 'package:quiz_app/feature/presentation/question_and_difficulty_page/controller/question_and_difficulty_cubit.dart';

class QuestionAndDifficultyCubit extends Cubit<QuestionAndDifficultyState> {
  final GetQuestions getQuestions;

  QuestionAndDifficultyCubit({required this.getQuestions})
      : super(QuestionAndDifficultyEmptyState());
  Future<void> fetchQuestions(String category, String difficulty) async {
    try {
      emit(QuestionAndDifficultyEmptyState());
      final loadedQuestionsOrFailure = await getQuestions.call(
          CategoryAndDifficultyParams(
              difficulty: difficulty, category: category));
      loadedQuestionsOrFailure.fold(
        (error) => emit(
            QuestionAndDifficultyErrorState(message: SERVER_FAILURE_MESSAGE)),
        (loadedData) => emit(QuestionAndDifficultyLoadedState(loadedData)),
      );
    } catch (_) {
      emit(QuestionAndDifficultyErrorState(message: SERVER_FAILURE_MESSAGE));
    }
  }
}
