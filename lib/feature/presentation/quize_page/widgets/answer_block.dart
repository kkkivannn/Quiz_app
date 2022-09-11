// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:quiz_app/utils.dart';

class AnswerBlock extends StatefulWidget {
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
  const AnswerBlock(
      {Key? key,
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
      required this.length})
      : super(key: key);

  @override
  State<AnswerBlock> createState() => _AnswerBlockState();
}

class _AnswerBlockState extends State<AnswerBlock> {
  List<bool> selectrdAnswer = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> answers = [
      {
        "answersText": widget.answerA,
        "answerTrue": widget.answerAcorrect,
      },
      {
        "answersText": widget.answerB,
        "answerTrue": widget.answerBcorrect,
      },
      {
        "answersText": widget.answerC,
        "answerTrue": widget.answerCcorrect,
      },
      {
        "answersText": widget.answerD,
        "answerTrue": widget.answerDcorrect,
      },
      {
        "answersText": widget.answerE,
        "answerTrue": widget.answerEcorrect,
      },
      {
        "answersText": widget.answerF,
        "answerTrue": widget.answerFcorrect,
      }
    ];
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Column(
          children: [
            answers[index]['answersText'] == ''
                ? Container()
                : InkWell(
                    onTap: () {
                      setState(() {
                        if (selectrdAnswer[index] == false) {
                          for (var i = 0; i < selectrdAnswer.length; i++) {
                            if (selectrdAnswer[i] == true) {
                              selectrdAnswer[i] = false;
                            }
                          }
                          selectrdAnswer[index] = true;
                        } else {
                          selectrdAnswer[index] = false;
                        }
                        rightAnswers.add(answers[index]['answerTrue']);
                        print(rightAnswers);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              answers[index]['answersText'],
                              style: const TextStyle(
                                fontFamily: 'GeneralSans',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Spacer(),
                          selectrdAnswer[index]
                              ? const Icon(
                                  Icons.add_task_rounded,
                                  color: Colors.green,
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
