import 'package:flutter/material.dart';
import 'package:quiz_app/feature/data/datasource/quize_implement.dart';

class QuestionAndDiffcultyPage extends StatelessWidget {
  const QuestionAndDiffcultyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: () {
              getQuize('Linux', 'Easy');
            },
            child: const Text("data"),
          ),
        ),
      ),
    );
  }
}
