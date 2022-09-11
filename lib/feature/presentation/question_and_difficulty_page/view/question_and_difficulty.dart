import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/feature/presentation/question_and_difficulty_page/controller/question_and_difficulty_cubit.dart';
import 'package:quiz_app/feature/presentation/question_and_difficulty_page/controller/question_and_difficulty_state.dart';

class QuestionAndDiffcultyPage extends StatelessWidget {
  const QuestionAndDiffcultyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionAndDifficultyCubit, QuestionAndDifficultyState>(
      builder: (context, state) {
        if (state is QuestionAndDifficultyEmptyState) {
          context
              .read<QuestionAndDifficultyCubit>()
              .fetchQuestions('Linux', 'Easy');
        } else if (state is QuestionAndDifficultyErrorState) {
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[Text('Error!')],
                ),
              ),
            ),
          );
        } else if (state is QuestionAndDifficultyLoadedState) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text("data"),
                ),
              ),
            ),
          );
        }
        return const SafeArea(
          child: Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
