import 'package:flutter/material.dart';
import 'package:quiz_app/feature/presentation/right_answers/view/right_answers_page.dart';

import 'feature/presentation/question_and_difficulty_page/view/question_and_difficulty.dart';
import 'feature/presentation/quize_page/view/questions_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const QuestionAndDiffcultyPage(),
        );
      case '/QuestionsPage':
        var arguments = settings.arguments as Map<String, dynamic>;
        if (arguments["category"] is String &&
            arguments['difficulty'] is String) {
          return MaterialPageRoute(
            builder: (context) => QuestionsPage(
              category: arguments['category'] as String,
              difficulty: arguments['difficulty'] as String,
            ),
          );
        } else {
          return _errorRoute();
        }
      case '/RightAnswersPage':
        final arguments = settings.arguments as Map<String, int>;
        if (arguments["allCountAnswers"] is int &&
            arguments['countRightAnswers'] is int) {
          return MaterialPageRoute(
            builder: (context) => RightAnswersPage(
              allCountAnswers: arguments['allCountAnswers'] as int,
              countRightAnswers: arguments['countRightAnswers'] as int,
            ),
          );
        } else {
          return _errorRoute();
        }

      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return const Scaffold(
      body: Center(
        child: Text('Error!'),
      ),
    );
  });
}
