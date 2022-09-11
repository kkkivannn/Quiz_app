// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/feature/domain/usecases/get_questions.dart';
import 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  final GetQuestions getQuestions;

  QuestionsCubit({required this.getQuestions}) : super(QuestionsEmptyState());
  Future<void> fetchQuestions(String category, String difficulty) async {
    try {
      emit(QuestionsEmptyState());
      final loadedQuestionsOrFailure = await getQuestions.call(
          CategoryAndDifficultyParams(
              difficulty: difficulty, category: category));
      loadedQuestionsOrFailure.fold(
        (error) => emit(QuestionsErrorState(message: SERVER_FAILURE_MESSAGE)),
        (loadedData) => emit(QuestionsLoadedState(loadedData)),
      );
    } catch (_) {
      emit(QuestionsErrorState(message: SERVER_FAILURE_MESSAGE));
    }
  }
}
