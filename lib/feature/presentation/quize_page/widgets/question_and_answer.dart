// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'answer_block.dart';

class QuestionAndAnswers extends StatelessWidget {
  final String question;
  final int pageIndex;
  final int length;
  final String answerA;
  final String answerB;
  final String answerC;
  final String answerD;
  final String answerE;
  final String answerF;
  final String answerAcorrect;
  final String answerBcorrect;
  final String answerCcorrect;
  final String answerDcorrect;
  final String answerEcorrect;
  final String answerFcorrect;

  const QuestionAndAnswers({
    Key? key,
    required this.question,
    required this.length,
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
    required this.answerE,
    required this.answerF,
    required this.answerAcorrect,
    required this.answerBcorrect,
    required this.answerCcorrect,
    required this.answerDcorrect,
    required this.answerEcorrect,
    required this.answerFcorrect,
    required this.pageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Text(
            question,
            style: const TextStyle(
              fontFamily: "GeneralSans",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: AnswerBlock(
            pageIndex: pageIndex,
            length: length,
            answerA: answerA,
            answerB: answerB,
            answerC: answerC,
            answerD: answerD,
            answerE: answerE,
            answerF: answerF,
            answerAcorrect: answerAcorrect,
            answerBcorrect: answerBcorrect,
            answerCcorrect: answerCcorrect,
            answerDcorrect: answerDcorrect,
            answerEcorrect: answerEcorrect,
            answerFcorrect: answerFcorrect,
          ),
        ),
      ],
    );
  }
}
