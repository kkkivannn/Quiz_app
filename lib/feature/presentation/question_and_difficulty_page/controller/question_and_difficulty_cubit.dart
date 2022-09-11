import 'package:equatable/equatable.dart';
import 'package:quiz_app/feature/domain/entitis/question_entiti.dart';

abstract class QuestionAndDifficultyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuestionAndDifficultyEmptyState extends QuestionAndDifficultyState {
  @override
  List<Object?> get props => [];
}

class QuestionAndDifficultyLoadedState extends QuestionAndDifficultyState {
  final List<QuestionEntiti> questionEntiti;

  QuestionAndDifficultyLoadedState(this.questionEntiti);
  @override
  List<Object?> get props => [questionEntiti];
}

class QuestionAndDifficultyErrorState extends QuestionAndDifficultyState {
  final String message;

  QuestionAndDifficultyErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
