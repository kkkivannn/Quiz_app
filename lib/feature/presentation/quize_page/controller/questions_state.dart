// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:quiz_app/feature/domain/entitis/question_entiti.dart';

abstract class QuestionsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuestionsEmptyState extends QuestionsState {
  @override
  List<Object?> get props => [];
}

class QuestionsLoadedState extends QuestionsState {
  final List<QuestionEntiti> questionEntiti;

  QuestionsLoadedState(this.questionEntiti);
  @override
  List<Object?> get props => [questionEntiti];
}

class QuestionsErrorState extends QuestionsState {
  final String message;

  QuestionsErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
