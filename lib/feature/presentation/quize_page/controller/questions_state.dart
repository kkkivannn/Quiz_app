import 'package:equatable/equatable.dart';
import 'package:quiz_app/feature/domain/entitis/question_entiti.dart';

abstract class QuestionsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuestionsStateEmptyState extends QuestionsState {
  @override
  List<Object?> get props => [];
}

class QuestionsStateLoadedState extends QuestionsState {
  final List<QuestionEntiti> questionEntiti;

  QuestionsStateLoadedState(this.questionEntiti);
  @override
  List<Object?> get props => [questionEntiti];
}

class QuestionsStateErrorState extends QuestionsState {
  final String message;

  QuestionsStateErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
