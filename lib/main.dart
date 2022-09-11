// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'feature/presentation/question_and_difficulty_page/view/question_and_difficulty.dart';
import 'feature/presentation/quize_page/controller/questions_cubit.dart';
import 'injection.container.dart' as di;
import 'injection.container.dart';

void main() async {
  await di.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<QuestionsCubit>(
        create: (context) => sl<QuestionsCubit>(),
      ),
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuestionAndDiffcultyPage(),
    ),
  ));
}
