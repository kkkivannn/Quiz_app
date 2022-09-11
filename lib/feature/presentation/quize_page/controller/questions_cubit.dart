import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/feature/domain/usecases/get_questions.dart';

import 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  final GetQuestions getQuestions;

  QuestionsCubit({required this.getQuestions})
      : super(QuestionsStateEmptyState());
  Future<void> fetchQuestions(String category, String difficulty) async {
    try {
      emit(QuestionsStateEmptyState());
      final loadedQuestionsOrFailure = await getQuestions.call(
          CategoryAndDifficultyParams(
              difficulty: difficulty, category: category));
      loadedQuestionsOrFailure.fold(
        (error) =>
            emit(QuestionsStateErrorState(message: SERVER_FAILURE_MESSAGE)),
        (loadedData) => emit(QuestionsStateLoadedState(loadedData)),
      );
    } catch (_) {
      emit(QuestionsStateErrorState(message: SERVER_FAILURE_MESSAGE));
    }
  }
}
