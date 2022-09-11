import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/feature/presentation/question_and_difficulty_page/controller/question_and_difficulty_state.dart';

import 'feature/presentation/question_and_difficulty_page/view/question_and_difficulty.dart';
import 'injection.container.dart' as di;
import 'injection.container.dart';

void main() async {
  await di.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<QuestionAndDifficultyCubit>(
        create: (context) => sl<QuestionAndDifficultyCubit>(),
      ),
    ],
    child: const MaterialApp(
      home: QuestionAndDiffcultyPage(),
    ),
  ));
}
