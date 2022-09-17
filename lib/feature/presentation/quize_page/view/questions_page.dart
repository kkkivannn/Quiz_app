// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:quiz_app/core/utils/utils.dart';
import 'package:quiz_app/feature/presentation/quize_page/controller/questions_cubit.dart';
import 'package:quiz_app/feature/presentation/quize_page/controller/questions_state.dart';
import '../widgets/question_and_answer.dart';

class QuestionsPage extends StatefulWidget {
  final String category;
  final String difficulty;
  const QuestionsPage(
      {Key? key, required this.category, required this.difficulty})
      : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int _numberQuestion = 1;
  int _numberRightQuestion = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
      if (state is QuestionsEmptyState) {
        context
            .read<QuestionsCubit>()
            .fetchQuestions(widget.category, widget.difficulty);
      } else if (state is QuestionsErrorState) {
        return const Scaffold(
          body: Center(
            child: Text('Error!'),
          ),
        );
      } else if (state is QuestionsLoadedState) {
        return Scaffold(
          backgroundColor: Colors.green[300],
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.green,
            title: Text(
              "Question $_numberQuestion/${state.questionEntiti.length}",
              style: const TextStyle(
                  fontFamily: 'GeneralSans',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.questionEntiti.length,
                  itemBuilder: (context, index) {
                    return QuestionAndAnswers(
                      pageIndex: index,
                      question: state.questionEntiti[index].question,
                      length: 6,
                      answerA: state.questionEntiti[index].answers.answerA,
                      answerB: state.questionEntiti[index].answers.answerB,
                      answerC: state.questionEntiti[index].answers.answerC,
                      answerD: state.questionEntiti[index].answers.answerD,
                      answerE: state.questionEntiti[index].answers.answerE,
                      answerF: state.questionEntiti[index].answers.answerF,
                      answerAcorrect: state
                          .questionEntiti[index].correctAnswers.answerACorrect,
                      answerBcorrect: state
                          .questionEntiti[index].correctAnswers.answerBCorrect,
                      answerCcorrect: state
                          .questionEntiti[index].correctAnswers.answerCCorrect,
                      answerDcorrect: state
                          .questionEntiti[index].correctAnswers.answerDCorrect,
                      answerEcorrect: state
                          .questionEntiti[index].correctAnswers.answerECorrect,
                      answerFcorrect: state
                          .questionEntiti[index].correctAnswers.answerFCorrect,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 50),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    minimumSize: MaterialStateProperty.all(const Size(200, 60)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_numberQuestion < state.questionEntiti.length) {
                      _pageController.nextPage(
                        duration: const Duration(microseconds: 500),
                        curve: Curves.easeInExpo,
                      );
                      setState(() {
                        _numberQuestion++;
                      });
                    } else {
                      for (var i = 0; i < answerUser.length; i++) {
                        if (answerUser[i]['answerUser'] == 'true') {
                          _numberRightQuestion++;
                        }
                      }
                      Navigator.of(context)
                          .pushNamed('/RightAnswersPage', arguments: {
                        "allCountAnswers": state.questionEntiti.length,
                        "countRightAnswers": _numberRightQuestion,
                      });
                    }
                  },
                  child: Text(
                    _numberQuestion < state.questionEntiti.length
                        ? 'Continue'
                        : 'Results',
                    style: const TextStyle(
                      fontFamily: 'GeneralSans',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
      return Scaffold(
        backgroundColor: Colors.green[300],
        body: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    });
  }
}
